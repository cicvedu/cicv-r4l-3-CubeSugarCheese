cmd_/home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/rcompletion.o := RUST_MODFILE=/home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/rcompletion rustc --edition=2021 -Zbinary_dep_depinfo=y -Dunsafe_op_in_unsafe_fn -Drust_2018_idioms -Dunreachable_pub -Dnon_ascii_idents -Wmissing_docs -Drustdoc::missing_crate_level_docs -Dclippy::correctness -Dclippy::style -Dclippy::suspicious -Dclippy::complexity -Dclippy::perf -Dclippy::let_unit_value -Dclippy::mut_mut -Dclippy::needless_bitwise_bool -Dclippy::needless_continue -Wclippy::dbg_macro --target=./rust/target.json -Cpanic=abort -Cembed-bitcode=n -Clto=n -Cforce-unwind-tables=n -Ccodegen-units=1 -Csymbol-mangling-version=v0 -Crelocation-model=static -Zfunction-sections=n -Dclippy::float_arithmetic -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2 -Ztune-cpu=generic -Cno-redzone=y -Ccode-model=kernel -Copt-level=2 -Cdebug-assertions=n -Coverflow-checks=y -Dwarnings  --cfg MODULE  @./include/generated/rustc_cfg -Zallow-features=allocator_api,bench_black_box,core_ffi_c,generic_associated_types,const_ptr_offset_from,const_refs_to_cell -Zcrate-attr=no_std -Zcrate-attr='feature(allocator_api,bench_black_box,core_ffi_c,generic_associated_types,const_ptr_offset_from,const_refs_to_cell)' --extern alloc --extern kernel --crate-type rlib --out-dir /home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build -L ./rust/ --crate-name rcompletion --emit=dep-info,obj /home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/rcompletion.rs; mv /home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/rcompletion.d /home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/.rcompletion.o.d; sed -i '/^$(pound)/d' /home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/.rcompletion.o.d

source_/home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/rcompletion.o := /home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/rcompletion.rs

deps_/home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/rcompletion.o := \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libcore.rmeta \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libcompiler_builtins.rmeta \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libkernel.rmeta \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libbindings.rmeta \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libmacros.so \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/liballoc.rmeta \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libbuild_error.rmeta \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libcore.rmeta \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libcompiler_builtins.rmeta \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libkernel.rmeta \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libbindings.rmeta \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libmacros.so \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/liballoc.rmeta \
  /home/cube/cicv-r4l-3-CubeSugarCheese/linux/rust/libbuild_error.rmeta \

/home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/rcompletion.o: $(deps_/home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/rcompletion.o)

$(deps_/home/cube/cicv-r4l-3-CubeSugarCheese/r4l_experiment/driver/002_completion/build/rcompletion.o):
