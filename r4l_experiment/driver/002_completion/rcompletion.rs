// SPDX-License-Identifier: GPL-2.0

//! Rust for linux completion driver demo

#![allow(unused)]

use kernel::prelude::*;
use kernel::chrdev;
use kernel::file;
use kernel::task::Task;
use kernel::sync::{Mutex,CondVar};

use core::ops::Deref;

module! {
    type: RCompletion,
    name: "rcompletion",
    author: "Cubesugarcheese",
    description: "Rust for linux completion driver demo",
    license: "GPL",
}

kernel::init_static_sync! {
    static MUTEX: Mutex<bool> = false;
    static CONDVAR: CondVar;
}

struct ChrdevOps {}

#[vtable]
impl file::Operations for ChrdevOps {
    type Data = ();

    fn open(_shared: &(), _file: &file::File) -> Result<Self::Data> {
        Ok(())
    }


    fn read(_data: (),_file: &file::File,writer: &mut impl kernel::io_buffer::IoBufferWriter,offset:u64) -> Result<usize> {
        pr_info!("<ChrdevOps as Operations>::read() is invoked\n");
        if writer.is_empty() || offset != 0 {
            return Ok(0);
        }
        
        {
            let mut guard = MUTEX.lock();
            let pid = Task::current().pid();
            let comm = unsafe { CStr::from_char_ptr(Task::current().comm().as_ptr()) };
            pr_info!("process {pid}({comm}) is going to sleep\n");

            while *guard != true {
                if CONDVAR.wait(&mut guard) {
                    return Err(EINTR);
                }
            }

            *guard = false;
        }

        CONDVAR.notify_one();
        CONDVAR.notify_all();
        CONDVAR.free_waiters();

        let pid = Task::current().pid();
        let comm = unsafe { CStr::from_char_ptr(Task::current().comm().as_ptr()) };
        pr_info!("awoken {pid}({comm})\n");

        Ok(0)
    }

    
    fn write(_data: (),_file: &file::File,reader: &mut impl kernel::io_buffer::IoBufferReader,offset:u64) -> Result<usize> {
        pr_info!("<ChrdevOps as Operations>::write() is invoked\n");

        let mut guard = MUTEX.lock();
        *guard = true;

        CONDVAR.notify_one();
        CONDVAR.notify_all();
        CONDVAR.free_waiters();

        let pid = Task::current().pid();
        let comm = unsafe { CStr::from_char_ptr(Task::current().comm().as_ptr()) };
        pr_info!("process {pid}({comm}) awakening the readers...\n");


        Ok(reader.len())
    }
}

struct RCompletion {
    cdev: Pin<Box<chrdev::Registration<1>>>
}

impl kernel::Module for RCompletion {
    fn init(name: &'static CStr, module: &'static ThisModule) -> Result<Self> {
        pr_info!("rcompletion is loaded\n");
        let mut chrdev_reg = chrdev::Registration::new_pinned(name, 0, module)?;
        chrdev_reg.as_mut().register::<ChrdevOps>()?;

        Ok(RCompletion {
            cdev: chrdev_reg
        })
    }
}

impl Drop for RCompletion {
    fn drop(&mut self) {
        pr_info!("(exit)\n");
    }
}
