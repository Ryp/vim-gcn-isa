" Vim syntax file
" Language:     AMD GCN3 ISA
" Version:      0.1
" Maintainer:   Thibault 'Ryp' Schueller <ryp.sqrt@gmail.com>
" File Types:   .gcn

if exists("b:current_syntax")
  finish
endif

syn match gcn3Comment "//.*$"

syn match gcn3Constant "\v[0-9]+"     " 42
syn match gcn3Constant "\v0[xX]\x+"   " 0xdeadc0de
syn match gcn3Constant "\v\d+\.\d+"   " 3.14

syn keyword gcn3SpecialRegister vcc

syn match gcn3VectorRegister "\vv\[\d+\:\d+\]"
syn match gcn3VectorRegister "\vv\d+"

syn match gcn3ScalarRegister "\vs\[\d+\:\d+\]"
syn match gcn3ScalarRegister "\vs\d+"

" Program Flow Control

""" Program Control
syn keyword gcn3ProgramFlowControl s_endpgm s_endpgm_saved
syn keyword gcn3ProgramFlowControl s_nop s_trap s_rfe
syn keyword gcn3ProgramFlowControl s_setprio s_sleep s_sendmsg

""" Branching
syn keyword gcn3ProgramFlowControl s_branch
syn keyword gcn3ProgramFlowControl s_cbranch_scc0 s_cbranch_scc1
syn keyword gcn3ProgramFlowControl s_cbranch_vccz s_cbranch_vccnz
syn keyword gcn3ProgramFlowControl s_cbranch_execz s_cbranch_execnz
syn keyword gcn3ProgramFlowControl s_cbranch_cdbguser s_cbranch_cdbgsys
syn keyword gcn3ProgramFlowControl s_cbranch_cdbgsys_or_user s_cbranch_cdbgsys_and_user
syn keyword gcn3ProgramFlowControl s_setpc s_swappc s_getpc
syn keyword gcn3ProgramFlowControl s_cbranch_fork s_cbranch_join
syn keyword gcn3ProgramFlowControl s_setvskip

""" Work-Groups
syn keyword gcn3ProgramFlowControl s_barrier

""" Data Dependency Resolution
syn keyword gcn3ProgramFlowControl s_waitcnt
syn keyword gcn3WaitCounter vmcnt lgkmcnt expcnt

""" Arbitrary Divergent Control Flow
syn keyword gcn3ProgramFlowControl s_cbranch_g_fork s_cbranch_i_fork

""" Other
syn keyword gcn3ProgramFlowControl s_sethalt


" Scalar ALU Operations

""" Integer Arithmetic Instructions
syn keyword gcn3ScalarALU s_add_i32 s_add_u32 s_addc_u32
syn keyword gcn3ScalarALU s_sub_i32 s_sub_u32 s_subb_u32
syn keyword gcn3ScalarALU s_absdiff_i32
syn keyword gcn3ScalarALU s_min_i32 s_min_u32 s_max_i32 s_max_u32
syn keyword gcn3ScalarALU s_mul_i32
syn keyword gcn3ScalarALU s_addk_i32
syn keyword gcn3ScalarALU s_mulk_i32
syn keyword gcn3ScalarALU s_abs_i32
syn keyword gcn3ScalarALU s_sext_i32_i8 s_sext_i32_i16

""" Conditional Instructions
syn keyword gcn3ScalarALU s_cselect_b32 s_cselect_b64
syn keyword gcn3ScalarALU s_cmovk_i32
syn keyword gcn3ScalarALU s_cmov_b32 s_cmov_b64

""" Comparison Instructions
syn keyword gcn3ScalarALU s_cmp_eq_u64 s_cmp_ne_u64
syn keyword gcn3ScalarALU s_cmp_eq_i32 s_cmp_eq_u32 s_cmpk_eq_i32 s_cmpk_eq_u32
syn keyword gcn3ScalarALU s_cmp_ne_i32 s_cmp_ne_u32 s_cmpk_ne_i32 s_cmpk_ne_u32
syn keyword gcn3ScalarALU s_cmp_gt_i32 s_cmp_gt_u32 s_cmpk_gt_i32 s_cmpk_gt_u32
syn keyword gcn3ScalarALU s_cmp_ge_i32 s_cmp_ge_u32 s_cmpk_ge_i32 s_cmpk_ge_u32
syn keyword gcn3ScalarALU s_cmp_le_i32 s_cmp_le_u32 s_cmpk_le_i32 s_cmpk_le_u32
syn keyword gcn3ScalarALU s_cmp_lt_i32 s_cmp_lt_u32 s_cmpk_lt_i32 s_cmpk_lt_u32
syn keyword gcn3ScalarALU s_bitcmp0_b32 s_bitcmp0_b64
syn keyword gcn3ScalarALU s_bitcmp1_b32 s_bitcmp1_b64

""" Bit-Wise Instructions
syn keyword gcn3ScalarALU s_mov_b32 s_mov_b64
syn keyword gcn3ScalarALU s_movk_i32
syn keyword gcn3ScalarALU s_and_b32 s_and_b64 s_or_b32 s_or_b64
syn keyword gcn3ScalarALU s_xor_b32 s_xor_b64
syn keyword gcn3ScalarALU s_andn2_b32 s_andn2_b64 s_orn2_b32 s_orn2_b64
syn keyword gcn3ScalarALU s_nand_b32 s_nand_b64 s_nor_b32 s_nor_b64
syn keyword gcn3ScalarALU s_xnor_b32 s_xnor_b64
syn keyword gcn3ScalarALU s_lshl_b32 s_lshl_b64
syn keyword gcn3ScalarALU s_lshr_b32 s_lshr_b64
syn keyword gcn3ScalarALU s_ashr_i32 s_ashr_i64
syn keyword gcn3ScalarALU s_bfm_b32 s_bfm_b64
syn keyword gcn3ScalarALU s_bfe_u32 s_bfe_u64 s_bfe_i32 s_bfe_i64
syn keyword gcn3ScalarALU s_not_b32 s_not_b64
" FIXME continue

syn keyword gcn3VectorArithmetic v_add_f16 v_add_f32 v_add_f64 v_add_u16 v_add_u32
syn keyword gcn3VectorArithmetic v_sub_f16 v_sub_f32 v_sub_u16 v_sub_u32
syn keyword gcn3VectorArithmetic v_subrev_f16 v_subrev_f32 v_subrev_u16 v_subrev_u32
syn keyword gcn3VectorArithmetic v_addc_u32 v_subb_u32 v_subbrev_u32
syn keyword gcn3VectorArithmetic v_exp_f16 v_exp_f32
syn keyword gcn3VectorArithmetic v_exp_legacy_f32 v_log_legacy_f32 v_mac_legacy_f32
syn keyword gcn3VectorArithmetic v_mad_legacy_f32 v_mul_legacy_f32
syn keyword gcn3VectorArithmetic v_ceil_f16 v_ceil_f32 v_ceil_f64
syn keyword gcn3VectorArithmetic v_floor_f16 v_floor_f32 v_floor_f64
syn keyword gcn3VectorArithmetic v_fract_f16 v_fract_f32 v_fract_f64
syn keyword gcn3VectorArithmetic v_trunc_f16 v_trunc_f32 v_trunc_f64
syn keyword gcn3VectorArithmetic v_rndne_f16 v_rndne_f32 v_rndne_f64
syn keyword gcn3VectorArithmetic v_fma_f16 v_fma_f32 v_fma_f64
syn keyword gcn3VectorArithmetic v_log_f16 v_log_f32
syn keyword gcn3VectorArithmetic v_mac_f16 v_mac_f32
syn keyword gcn3VectorArithmetic v_mad_f16 v_mad_f32 v_mad_i16 v_mad_u16
syn keyword gcn3VectorArithmetic v_mad_i32_i24 v_mad_i64_i32 v_mad_u32_u24 v_mad_u64_u32
syn keyword gcn3VectorArithmetic v_madak_f16 v_madak_f32 v_madmk_f16 v_madmk_f32
syn keyword gcn3VectorArithmetic v_min_f16 v_min_f32 v_min_f64
syn keyword gcn3VectorArithmetic v_min_i16 v_min_i32 v_min_u16 v_min_u32
syn keyword gcn3VectorArithmetic v_max_f16 v_max_f32 v_max_f64
syn keyword gcn3VectorArithmetic v_max_i16 v_max_i32 v_max_u16 v_max_u32
syn keyword gcn3VectorArithmetic v_lshrrev_b32 v_ashrrev_i32 v_lshlrev_b32
syn keyword gcn3VectorArithmetic v_and_b32 v_or_b32 v_xor_b32
" incomplete

syn keyword gcn3VectorMove v_cndmask_b32 v_mov_b32 v_movreld_b32 v_movrels_b32 v_movrelsd_b32
syn keyword gcn3VectorMove v_readfirstlane_b32 v_readlane_b32 v_writelane_b32

syn keyword gcn3ScalarMemory s_load_dword s_load_dwordx2 s_load_dwordx4
syn keyword gcn3ScalarMemory s_load_dwordx8 s_load_dwordx16
" incomplete

syn keyword gcn3FlatOp flat_load_ubyte       flat_store_byte
syn keyword gcn3FlatOp flat_load_sbyte
syn keyword gcn3FlatOp flat_load_ushort      flat_store_short
syn keyword gcn3FlatOp flat_load_sshort
syn keyword gcn3FlatOp flat_load_dword       flat_store_dword
syn keyword gcn3FlatOp flat_load_dwordx2     flat_store_dwordx2
syn keyword gcn3FlatOp flat_load_dwordx3     flat_store_dwordx3
syn keyword gcn3FlatOp flat_load_dwordx4     flat_store_dwordx4
syn keyword gcn3FlatOp flat_atomic_swap      flat_atomic_swap_x2
syn keyword gcn3FlatOp flat_atomic_cmpswap   flat_atomic_cmpswap_x2
syn keyword gcn3FlatOp flat_atomic_add       flat_atomic_add_x2
syn keyword gcn3FlatOp flat_atomic_sub       flat_atomic_sub_x2
syn keyword gcn3FlatOp flat_atomic_smin      flat_atomic_smin_x2
syn keyword gcn3FlatOp flat_atomic_umin      flat_atomic_umin_x2
syn keyword gcn3FlatOp flat_atomic_smax      flat_atomic_smax_x2
syn keyword gcn3FlatOp flat_atomic_umax      flat_atomic_umax_x2
syn keyword gcn3FlatOp flat_atomic_and       flat_atomic_and_x2
syn keyword gcn3FlatOp flat_atomic_or        flat_atomic_or_x2
syn keyword gcn3FlatOp flat_atomic_xor       flat_atomic_xor_x2
syn keyword gcn3FlatOp flat_atomic_inc       flat_atomic_inc_x2
syn keyword gcn3FlatOp flat_atomic_dec       flat_atomic_dec_x2

syn keyword gcn3DataShareOp ds_add_u32 ds_sub_u32
syn keyword gcn3DataShareOp ds_rsub_u32
syn keyword gcn3DataShareOp ds_inc_u32 ds_dec_u32
syn keyword gcn3DataShareOp ds_min_i32 ds_max_i32
syn keyword gcn3DataShareOp ds_min_u32 ds_max_u32
syn keyword gcn3DataShareOp ds_and_b32 ds_or_b32 ds_xor_b32
syn keyword gcn3DataShareOp ds_mskor_b32
syn keyword gcn3DataShareOp ds_write_b32 ds_write2_b32 ds_write2st64_b32
" incomplete
syn keyword gcn3DataShareOp ds_permute_b32 ds_bpermute_b32
" incomplete

hi def link gcn3Constant            Constant
hi def link gcn3Comment             Comment
hi def link gcn3ProgramFlowControl  Identifier
hi def link gcn3WaitCounter         Statement
hi def link gcn3ScalarALU           Identifier
hi def link gcn3VectorArithmetic    Identifier
hi def link gcn3VectorMove          Identifier
hi def link gcn3ScalarMemory        Identifier
hi def link gcn3FlatOp              Identifier
hi def link gcn3DataShareOp         Identifier
hi def link gcn3ScalarRegister      Identifier
hi def link gcn3VectorRegister      Identifier
hi def link gcn3SpecialRegister     Type

let b:current_syntax = "gcn-isa"

