" Vim syntax file
" Language:     AMD GCN3 ISA
" Version:      0.1
" Maintainer:   Thibault 'Ryp' Schueller <ryp.sqrt@gmail.com>
" File Types:   .gcn

if exists("b:current_syntax")
  finish
endif

syn match gcnComment "//.*$"

syn keyword gcnFlowControl s_endpgm s_nop s_sleep s_trap s_rfe s_setprio
syn keyword gcnFlowControl s_sethalt s_setvskip s_barrier s_waitcnt
syn keyword gcnFlowControl s_branch s_cbranch_scc0 s_cbranch_scc1 s_cbranch_vccz
syn keyword gcnFlowControl s_cbranch_vccnz s_cbranch_execz s_cbranch_execnz s_cbranch_cdbgsys
syn keyword gcnFlowControl s_cbranch_cdbguser s_cbranch_cdbgsys_or_user s_cbranch_cdbgsys_and_user
syn keyword gcnFlowControl s_cbranch_g_fork s_cbranch_i_fork s_cbranch_fork s_cbranch_join

syn keyword gcnVectorArithmetic v_add_f16 v_add_f32 v_add_f64 v_add_u16 v_add_u32
syn keyword gcnVectorArithmetic v_sub_f16 v_sub_f32 v_sub_u16 v_sub_u32
syn keyword gcnVectorArithmetic v_subrev_f16 v_subrev_f32 v_subrev_u16 v_subrevv_subrev_u32
syn keyword gcnVectorArithmetic v_addc_u32 v_subb_u32 v_subbrev_u32
syn keyword gcnVectorArithmetic v_exp_f16 v_exp_f32
syn keyword gcnVectorArithmetic v_exp_legacy_f32 v_log_legacy_f32 v_mac_legacy_f32
syn keyword gcnVectorArithmetic v_mad_legacy_f32 v_mul_legacy_f32
syn keyword gcnVectorArithmetic v_ceil_f16 v_ceil_f32 v_ceil_f64
syn keyword gcnVectorArithmetic v_floor_f16 v_floor_f32 v_floor_f64
syn keyword gcnVectorArithmetic v_fract_f16 v_fract_f32 v_fract_f64
syn keyword gcnVectorArithmetic v_trunc_f16 v_trunc_f32 v_trunc_f64
syn keyword gcnVectorArithmetic v_rndne_f16 v_rndne_f32 v_rndne_f64
syn keyword gcnVectorArithmetic v_fma_f16 v_fma_f32 v_fma_f64
syn keyword gcnVectorArithmetic v_log_f16 v_log_f32
syn keyword gcnVectorArithmetic v_mac_f16 v_mac_f32
syn keyword gcnVectorArithmetic v_mad_f16 v_mad_f32 v_mad_i16 v_mad_u16
syn keyword gcnVectorArithmetic v_mad_i32_i24 v_mad_i64_i32 v_mad_u32_u24 v_mad_u64_u32
syn keyword gcnVectorArithmetic v_madak_f16 v_madak_f32 v_madmk_f16 v_madmk_f32
syn keyword gcnVectorArithmetic v_min_f16 v_min_f32 v_min_f64
syn keyword gcnVectorArithmetic v_min_i16 v_min_i32 v_min_u16 v_min_u32
syn keyword gcnVectorArithmetic v_max_f16 v_max_f32 v_max_f64
syn keyword gcnVectorArithmetic v_max_i16 v_max_i32 v_max_u16 v_max_u32
syn keyword gcnVectorArithmetic v_lshrrev_b32 v_ashrrev_i32 v_lshlrev_b32
syn keyword gcnVectorArithmetic v_and_b32 v_or_b32 v_xor_b32
" incomplete

syn keyword gcnVectorMove v_cndmask_b32 v_mov_b32 v_movreld_b32 v_movrels_b32 v_movrelsd_b32
syn keyword gcnVectorMove v_readfirstlane_b32 v_readlane_b32 v_writelane_b32

syn keyword gcnScalarMemory s_load_dword s_load_dwordx2 s_load_dwordx4
syn keyword gcnScalarMemory s_load_dwordx8 s_load_dwordx16
" incomplete

syn keyword gcnFlatOp flat_load_ubyte       flat_store_byte
syn keyword gcnFlatOp flat_load_sbyte
syn keyword gcnFlatOp flat_load_ushort      flat_store_short
syn keyword gcnFlatOp flat_load_sshort
syn keyword gcnFlatOp flat_load_dword       flat_store_dword
syn keyword gcnFlatOp flat_load_dwordx2     flat_store_dwordx2
syn keyword gcnFlatOp flat_load_dwordx3     flat_store_dwordx3
syn keyword gcnFlatOp flat_load_dwordx4     flat_store_dwordx4
syn keyword gcnFlatOp flat_atomic_swap      flat_atomic_swap_x2
syn keyword gcnFlatOp flat_atomic_cmpswap   flat_atomic_cmpswap_x2
syn keyword gcnFlatOp flat_atomic_add       flat_atomic_add_x2
syn keyword gcnFlatOp flat_atomic_sub       flat_atomic_sub_x2
syn keyword gcnFlatOp flat_atomic_smin      flat_atomic_smin_x2
syn keyword gcnFlatOp flat_atomic_umin      flat_atomic_umin_x2
syn keyword gcnFlatOp flat_atomic_smax      flat_atomic_smax_x2
syn keyword gcnFlatOp flat_atomic_umax      flat_atomic_umax_x2
syn keyword gcnFlatOp flat_atomic_and       flat_atomic_and_x2
syn keyword gcnFlatOp flat_atomic_or        flat_atomic_or_x2
syn keyword gcnFlatOp flat_atomic_xor       flat_atomic_xor_x2
syn keyword gcnFlatOp flat_atomic_inc       flat_atomic_inc_x2
syn keyword gcnFlatOp flat_atomic_dec       flat_atomic_dec_x2

syn keyword gcnDataShareOp ds_add_u32 ds_sub_u32
syn keyword gcnDataShareOp ds_rsub_u32
syn keyword gcnDataShareOp ds_inc_u32 ds_dec_u32
syn keyword gcnDataShareOp ds_min_i32 ds_max_i32
syn keyword gcnDataShareOp ds_min_u32 ds_max_u32
syn keyword gcnDataShareOp ds_and_b32 ds_or_b32 ds_xor_b32
syn keyword gcnDataShareOp ds_mskor_b32
syn keyword gcnDataShareOp ds_write_b32 ds_write2_b32 ds_write2st64_b32
" incomplete
syn keyword gcnDataShareOp  ds_permute_b32 ds_bpermute_b32
" incomplete

syn keyword gcnWaitCnd vmcnt lgkmcnt expcnt

hi def link gcnComment              Comment
hi def link gcnFlowControl          Type
hi def link gcnVectorArithmetic     Type
hi def link gcnVectorMove           Type
hi def link gcnScalarMemory         Type
hi def link gcnFlatOp               Type
hi def link gcnDataShareOp          Type
hi def link gcnWaitCnd              Statement

let b:current_syntax = "gcn-isa"

