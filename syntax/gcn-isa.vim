" Vim syntax file
" Language:     AMD GCN3 ISA

if exists("b:current_syntax")
  finish
endif

syn match gcn3Comment "//.*$"

syn match gcn3Constant "\v<[0-9]+>"     " 42
syn match gcn3Constant "\v<0[xX]\x+>"   " 0xdeadc0de
syn match gcn3Constant "\v<\d+\.\d+>"   " 3.14

" label_F1337
" NOTE: This only matches labels generated by amdspv
syn match gcn3Label "\v<label_\x+>"

" v33 or v[0:3]
syn match gcn3VectorRegister "\v<v(\d+|\[\d+\:\d+\])"

" s99 or s[6:8]
syn match gcn3ScalarRegister "\v<s(\d+|\[\d+\:\d+\])"

syn keyword gcn3Special vcc exec
syn keyword gcn3Special dmask unorm da r128 glc slc tfe lwe
syn keyword gcn3Special done vm off idxen format
syn keyword gcn3Special m0 clamp div abs lds
syn keyword gcn3Special row_shr row_bcast row_mask

" offset, offset0 and offset1
syn match gcn3Special "\v<offset[0-1]?>"
" FIXME null might be used here too
syn match gcn3Special "\v<mrt[z0-8]>"
" pos0-15
syn match gcn3Special "\v<pos1?\d>"
" param0 to param4294967295
syn match gcn3Special "\v<param\d+>"
" attr0-31
syn match gcn3Special "\v<attr[1-3]?\d>"

" attr.x
" FIXME Find possible permutations
syn match gcn3SwizzleOp "\v>\.(x|y|z|w)>"

" BUF_DATA_FORMAT_32_32
syn match gcn3DataFormat "\v<BUF_DATA_FORMAT_(8|8_8|8_8_8_8|16|16_16|16_16_16_16|32|32_32|32_32_32|32_32_32_32|10_11_11|11_11_10|10_10_10_2|2_10_10_10)>"

" BUF_NUM_FORMAT_FLOAT
" FIXME Find possible formats
syn match gcn3NumFormat "\v<BUF_NUM_FORMAT_\w+>"

" Program Flow Control

""" Program Control
syn keyword gcn3ProgramFlowControl s_endpgm s_endpgm_saved
syn keyword gcn3ProgramFlowControl s_nop s_trap s_rfe
syn keyword gcn3ProgramFlowControl s_setprio s_sleep s_sendmsg s_sendmsghalt
syn keyword gcn3ProgramFlowControl s_decperflevel s_incperflevel
syn match gcn3ProgramFlowControl  "\v<s_atc_probe(_buffer)?>"

""" Branching
syn keyword gcn3ProgramFlowControl s_branch
syn keyword gcn3ProgramFlowControl s_cbranch_scc0 s_cbranch_scc1
syn keyword gcn3ProgramFlowControl s_cbranch_vccz s_cbranch_vccnz
syn keyword gcn3ProgramFlowControl s_cbranch_execz s_cbranch_execnz
syn keyword gcn3ProgramFlowControl s_cbranch_cdbguser s_cbranch_cdbgsys
syn keyword gcn3ProgramFlowControl s_cbranch_cdbgsys_or_user s_cbranch_cdbgsys_and_user
syn keyword gcn3ProgramFlowControl s_setpc_b64 s_swappc_b64 s_getpc_b64
syn keyword gcn3ProgramFlowControl s_cbranch_fork s_cbranch_join
syn keyword gcn3ProgramFlowControl s_setvskip
syn keyword gcn3ProgramFlowControl s_ttracedata

""" Work-Groups
syn keyword gcn3ProgramFlowControl s_barrier

""" Data Dependency Resolution
syn keyword gcn3ProgramFlowControl s_waitcnt
syn keyword gcn3WaitCounter vmcnt lgkmcnt expcnt

""" Arbitrary Divergent Control Flow
syn keyword gcn3ProgramFlowControl s_cbranch_g_fork s_cbranch_i_fork

""" Other
syn keyword gcn3ProgramFlowControl s_sethalt s_setkill

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
syn match gcn3ScalarALU  "\v<s_(cmp|cmpk)_(eq|ne|gt|ge|le|lg|lt)_([ui]32)>"
syn keyword gcn3ScalarALU s_cmp_eq_u64 s_cmp_ne_u64 s_cmp_lg_u64
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
syn keyword gcn3ScalarALU s_rfe_b64 s_rfe_restore_b64
syn keyword gcn3ScalarALU s_not_b32 s_not_b64
syn keyword gcn3ScalarALU s_wqm_b32 s_wqm_b64
syn keyword gcn3ScalarALU s_quadmask_b32 s_quadmask_b64
syn keyword gcn3ScalarALU s_brev_b32 s_brev_b64
syn keyword gcn3ScalarALU s_bcnt0_i32_b32 s_bcnt0_i32_b64
syn keyword gcn3ScalarALU s_bcnt1_i32_b32 s_bcnt1_i32_b64
syn keyword gcn3ScalarALU s_ff0_i32_b32 s_ff0_i32_b64
syn keyword gcn3ScalarALU s_ff1_i32_b32 s_ff1_i32_b64
syn keyword gcn3ScalarALU s_flbit_i32_b32 s_flbit_i32_b64
syn keyword gcn3ScalarALU s_flbit_i32 s_flbit_i32_i64
syn keyword gcn3ScalarALU s_bitset0_b32 s_bitset0_b64
syn keyword gcn3ScalarALU s_bitset1_b32 s_bitset1_b64
syn keyword gcn3ScalarALU s_and_saveexec_b64 s_or_saveexec_b64
syn keyword gcn3ScalarALU s_xor_saveexec_b64 s_andn2_saveexec_b64
syn keyword gcn3ScalarALU s_orn2_saveexec_b64 s_nand_saveexec_b64
syn keyword gcn3ScalarALU s_nor_saveexec_b64 s_xnor_saveexec_b64
syn keyword gcn3ScalarALU s_movrels_b32 s_movrels_b64
syn keyword gcn3ScalarALU s_movreld_b32 s_movreld_b64

""" Special Instructions
syn keyword gcn3ScalarALU s_getreg_b32 s_setreg_b32
syn keyword gcn3ScalarALU s_setreg_imm32_b32

""" VGPR Indexing Instructions
syn match gcn3ScalarALU "\v<s_set_gpr_idx_(off|on|idx|mode)>"

" Vector ALU Operations

""" Instructions
syn keyword gcn3VectorALU v_mad_f16 v_mad_i16 v_mad_u16 v_mad_f32
syn keyword gcn3VectorALU v_mad_i32_i24
syn keyword gcn3VectorALU v_mad_u32_u24
syn keyword gcn3VectorALU v_cubeid_f32 v_cubesc_f32 v_cubetc_f32 v_cubema_f32
syn keyword gcn3VectorALU v_bfe_u32 v_bfe_i32
syn keyword gcn3VectorALU v_fma_f16 v_fma_f32 v_fma_f64
syn keyword gcn3VectorALU v_bfi_b32
syn keyword gcn3VectorALU v_lerp_u8
syn keyword gcn3VectorALU v_alignbit_b32 v_alignbyte_b32
syn keyword gcn3VectorALU v_min3_f32 v_min3_i32 v_min3_u32
syn keyword gcn3VectorALU v_max3_f32 v_max3_i32 v_max3_u32
syn keyword gcn3VectorALU v_med3_f32 v_med3_i32 v_med3_u32
syn keyword gcn3VectorALU v_sad_u8 v_sad_hi_u8 v_sad_u16 v_sad_u32
syn keyword gcn3VectorALU v_cvt_pk_u8_f32
syn keyword gcn3VectorALU v_div_fixup_f16 v_div_fixup_f32 v_div_fixup_f64
syn keyword gcn3VectorALU v_div_scale_f32 v_div_scale_f64
syn keyword gcn3VectorALU v_div_fmas_f32 v_div_fmas_f64
syn keyword gcn3VectorALU v_msad_u8 v_qsad_pk_u16_u8
syn keyword gcn3VectorALU v_mqsad_pk_u16_u8 v_mqsad_pk_u32_u8
syn keyword gcn3VectorALU v_mqsad_u32_u8
syn keyword gcn3VectorALU v_trig_preop_f64
syn keyword gcn3VectorALU v_mad_u64_u32 v_mad_i64_i32
syn keyword gcn3VectorALU v_add_f64 v_mul_f64
syn keyword gcn3VectorALU v_min_f64 v_max_f64
syn keyword gcn3VectorALU v_ldexp_f64
syn keyword gcn3VectorALU v_mul_lo_u32 v_mul_lo_i32
syn keyword gcn3VectorALU v_mul_hi_u32 v_mul_hi_i32
syn keyword gcn3VectorALU v_mullit_f32
syn keyword gcn3VectorALU v_lshlrev_b64 v_lshrrev_b64
syn keyword gcn3VectorALU v_ldexp_f32
syn keyword gcn3VectorALU v_readlane_b32 v_writelane_b32
syn keyword gcn3VectorALU v_bcnt_u32_b32
syn keyword gcn3VectorALU v_mbcnt_lo_u32_b32 v_mbcnt_hi_u32_b32
syn keyword gcn3VectorALU v_cvt_pkaccum_u8_f32
syn keyword gcn3VectorALU v_cvt_pknorm_i16_f32 v_cvt_pknorm_u16_f32
syn keyword gcn3VectorALU v_cvt_pkrtz_f16_f32
syn keyword gcn3VectorALU v_cvt_pk_u16_u32 v_cvt_pk_i16_i32
syn keyword gcn3VectorALU v_bfm_b32
syn keyword gcn3VectorALU v_interp_p1_f32 v_interp_p2_f32 v_interp_mov_f32
syn keyword gcn3VectorALU v_interp
syn keyword gcn3VectorALU v_interp_p1ll_f16 v_interp_p1lv_f16
syn keyword gcn3VectorALU v_interp_p2_f16
syn keyword gcn3VectorALU v_add_f16 v_add_f32 v_add_u16 v_add_u32
syn keyword gcn3VectorALU v_sub_f16 v_sub_f32 v_sub_u16 v_sub_u32
syn keyword gcn3VectorALU v_subrev_f16 v_subrev_f32 v_subrev_u16 v_subrev_u32
syn keyword gcn3VectorALU v_addc_u32
syn keyword gcn3VectorALU v_subb_u32
syn keyword gcn3VectorALU v_subbrev_u32
syn keyword gcn3VectorALU v_mul_f16 v_mul_f32
syn keyword gcn3VectorALU v_mul_i32_i24 v_mul_u32_u24
syn keyword gcn3VectorALU v_mul_hi_i32_i24 v_mul_hi_u32_u24
syn keyword gcn3VectorALU v_min_f16 v_min_u16 v_min_i16 v_min_f32 v_min_i32 v_min_u32
syn keyword gcn3VectorALU v_max_f16 v_max_u16 v_max_i16 v_max_f32 v_max_i32 v_max_u32
syn keyword gcn3VectorALU v_lshrrev_b16 v_lshrrev_b32
syn keyword gcn3VectorALU v_ashrrev_i16 v_ashrrev_i32 v_ashrrev_i64
syn keyword gcn3VectorALU v_lshlrev_b16 v_lshlrev_b32
syn keyword gcn3VectorALU v_and_b32
syn keyword gcn3VectorALU v_or_b32
syn keyword gcn3VectorALU v_xor_b32
syn keyword gcn3VectorALU v_mac_f16 v_mac_f32
syn keyword gcn3VectorALU v_madmk_f16 v_madmk_f32
syn keyword gcn3VectorALU v_madak_f16 v_madak_f32
syn keyword gcn3VectorALU v_cndmask_b32
syn keyword gcn3VectorALU v_ldexp_f16
syn keyword gcn3VectorALU v_mul_lo_u16
syn keyword gcn3VectorALU v_nop
syn keyword gcn3VectorALU v_mov_b32
syn keyword gcn3VectorALU v_readfirstlane_b32
syn keyword gcn3VectorALU v_cvt_u16_f16 v_cvt_i16_f16
syn keyword gcn3VectorALU v_cvt_f32_i32 v_cvt_f32_u32 v_cvt_f32_f16 v_cvt_f32_f64
syn keyword gcn3VectorALU v_cvt_i32_f32 v_cvt_u32_f32 v_cvt_f16_f32 v_cvt_f64_f32
syn keyword gcn3VectorALU v_cvt_i32_f64 v_cvt_u32_f64
syn keyword gcn3VectorALU v_cvt_f64_i32 v_cvt_f64_u32
syn keyword gcn3VectorALU v_cvt_f32_ubyte0 v_cvt_f32_ubyte1 v_cvt_f32_ubyte2 v_cvt_f32_ubyte3
syn keyword gcn3VectorALU v_cvt_f16_u16 v_cvt_f16_i16
syn keyword gcn3VectorALU v_cvt_rpi_i32_f32
syn keyword gcn3VectorALU v_cvt_flr_i32_f32
syn keyword gcn3VectorALU v_cvt_off_f32_i4
syn keyword gcn3VectorALU v_fract_f16 v_fract_f32 v_fract_f64
syn keyword gcn3VectorALU v_trunc_f16 v_trunc_f32 v_trunc_f64
syn keyword gcn3VectorALU v_ceil_f16 v_ceil_f32 v_ceil_f64
syn keyword gcn3VectorALU v_rndne_f16 v_rndne_f32 v_rndne_f64
syn keyword gcn3VectorALU v_floor_f16 v_floor_f32 v_floor_f64
syn keyword gcn3VectorALU v_exp_f16 v_exp_f32
syn keyword gcn3VectorALU v_log_f16 v_log_f32
syn keyword gcn3VectorALU v_rcp_f16 v_rcp_f32 v_rcp_f64
syn keyword gcn3VectorALU v_rcp_iflag_f32
syn keyword gcn3VectorALU v_rsq_f16 v_rsq_f32 v_rsq_f64
syn keyword gcn3VectorALU v_sqrt_f16 v_sqrt_f32 v_sqrt_f64
syn keyword gcn3VectorALU v_sin_f16 v_sin_f32
syn keyword gcn3VectorALU v_cos_f16 v_cos_f32
syn keyword gcn3VectorALU v_not_b32
syn keyword gcn3VectorALU v_bfrev_b32
syn keyword gcn3VectorALU v_ffbh_u32 v_ffbl_b32 v_ffbh_i32
syn keyword gcn3VectorALU v_frexp_exp_i32_f64
syn keyword gcn3VectorALU v_frexp_mant_f16 v_frexp_mant_f32 v_frexp_mant_f64
syn keyword gcn3VectorALU v_frexp_exp_i32_f32 v_frexp_exp_i16_f16
syn keyword gcn3VectorALU v_clrexcp
syn keyword gcn3VectorALU v_mul_legacy_f32
syn keyword gcn3VectorALU v_mad_legacy_f32
syn keyword gcn3VectorALU v_exp_legacy_f32
syn keyword gcn3VectorALU v_log_legacy_f32
syn keyword gcn3VectorALU v_mac_legacy_f32
syn keyword gcn3VectorALU v_movrels_b32 v_movreld_b32 v_movrelsd_b32
syn keyword gcn3VectorALU v_perm_b32

""" Compare Operations
syn match gcn3VectorALU "\v<v_(cmp|cmpx)_(f|lt|eq|le|gt|lg|ge|t|ne)_[ui](16|32|64)>"
syn match gcn3VectorALU "\v<v_cmpx?_(f|lt|eq|le|gt|lg|ge|t|o|u|nge|nlg|ngt|tru|nle|neq|nlt)_f(16|32|64)>"
syn match gcn3VectorALU "\v<v_cmpsx?_(f|lt|eq|le|gt|lg|ge|t|o|u|nge|nlg|ngt|tru|nle|neq|nlt)_f(32|64)>"
syn match gcn3VectorALU "\v<v_(cmp|cmpx)_class_(f(16|32|64))>"

" Scalar Memory Operations
syn match gcn3SMEM "\v<s_load_dword(x(2|4|8|16))?>"
syn match gcn3SMEM "\v<s_store_dword(x[24])?>"
syn match gcn3SMEM "\v<s_buffer_load_dword(x(2|4|8|16))?>"
syn match gcn3SMEM "\v<s_buffer_store_dword(x[24])?>"
syn keyword gcn3SMEM s_icache_inv
syn keyword gcn3SMEM s_dcache_inv s_dcache_inv_vol
syn keyword gcn3SMEM s_dcache_wb s_dcache_wb_vol
syn keyword gcn3SMEM s_memtime s_memrealtime

" Vector Memory Operations

""" Vector Memory Buffer Operations
syn match gcn3VMEM "\v<tbuffer_(load|store)_format(_d16)?_(x|xy|xyz|xyzw)>"
syn match gcn3VMEM "\v<buffer_(load|store)_format(_d16)?_(x|xy|xyz|xyzw)>"
syn match gcn3VMEM "\v<buffer_(load|store)_(sbyte|ubyte|sshort|ushort|dword(x[234])?)>"
syn match gcn3VMEM "\v<buffer_atomic_(swap|cmpswap|add|sub|([us](min|max))|and|or|xor|inc|dec)(_x2)?>"
syn keyword gcn3VMEM buffer_store_lds_dword
syn keyword gcn3VMEM buffer_wbinvl1 buffer_wbinvl1_vol

""" Vector Memory Image Operations
syn match gcn3VMEM "\v<image_load(_(mip|pck|pck_sgn|mip_pck|mip_pck_sgn))?>"
syn match gcn3VMEM "\v<image_store(_(mip|pck|mip_pck))?>"
syn match gcn3VMEM "\v<image_atomic_(swap|cmpswap|add|sub|([us](min|max))|and|or|xor|inc|dec)>"
syn match gcn3VMEM "\v<image_gather4(_c)?(_o)?>"
syn match gcn3VMEM "\v<image_gather4(_c)?_b(_cl)?(_o)?>"
syn match gcn3VMEM "\v<image_gather4(_c)?_(cl|l|lz)(_o)?>"
syn match gcn3VMEM "\v<image_sample(_c)?(_o)?>"
syn match gcn3VMEM "\v<image_sample(_c)?_(b|cd|d)(_cl)?(_o)?>"
syn match gcn3VMEM "\v<image_sample(_c)?_(cl|l|lz)(_o)?>"
syn match gcn3VMEM "\v<image_get_(resinfo|lod)>"

" Flat Memory Instructions
syn match gcn3FlatMEM "\v<flat_load_(((u|s)(byte|short))|(dword(x[234])?))>"
syn match gcn3FlatMEM "\v<flat_store_(byte|short|(dword(x[234])?))>"
syn match gcn3FlatMEM "\v<flat_atomic_(swap|cmpswap|add|sub|((s|u)(min|max))|and|or|xor|inc|dec)(_x2)?>"

" Data Share Operations
syn match gcn3DataShareOp "\v<ds_read_((b(32|64|96|128))|([ui](8|16)))>"
syn match gcn3DataShareOp "\v<ds_read2(st64)?_b(32|64)>"
syn match gcn3DataShareOp "\v<ds_write_b(8|16|32|64|96|128)>"
syn match gcn3DataShareOp "\v<ds_write2(st64)?_b(32|64)>"
syn match gcn3DataShareOp "\v<ds_write_src2_b(32|64)>"
syn match gcn3DataShareOp "\v<ds_(add|sub|rsub|inc|dec)(_rtn)?_u(32|64)>"
syn match gcn3DataShareOp "\v<ds_(add|sub|rsub|inc|dec)_src2_u(32|64)>"
syn match gcn3DataShareOp "\v<ds_(min|max)(_rtn)?_[iuf](32|64)>"
syn match gcn3DataShareOp "\v<ds_(min|max)_src2_[iuf](32|64)>"
syn match gcn3DataShareOp "\v<ds_(and|or|xor|mskor)(_rtn)?_b(32|64)>"
syn match gcn3DataShareOp "\v<ds_(and|or|xor)_src2_b(32|64)>"
syn match gcn3DataShareOp "\v<ds_cmpst(_rtn)?_[bf](32|64)>"
syn match gcn3DataShareOp "\v<ds_wrxchg2(st64)?_rtn_b(32|64)>"
syn match gcn3DataShareOp "\v<ds_condxchg32_rtn_b(64|128)>"
syn match gcn3DataShareOp "\v<ds_b?permute_b(32|64)>"
syn match gcn3DataShareOp "\v<ds_gws_sema_(v|p|br|release_all)>"
syn keyword gcn3DataShareOp ds_gws_init
syn keyword gcn3DataShareOp ds_gws_barrier
syn keyword gcn3DataShareOp ds_add_f32
syn keyword gcn3DataShareOp ds_wrap_rtn_b32
syn keyword gcn3DataShareOp ds_swizzle_b32
syn keyword gcn3DataShareOp ds_consume
syn keyword gcn3DataShareOp ds_append
syn keyword gcn3DataShareOp ds_ordered_count
syn keyword gcn3DataShareOp ds_nop

" Export Instruction
syn keyword gcn3GraphicsOp exp

" Common
hi def link gcn3Constant            Constant
hi def link gcn3Comment             Comment

" GCN Specific syntax
hi def link gcn3WaitCounter         Statement
hi def link gcn3ScalarRegister      Identifier
hi def link gcn3VectorRegister      Identifier
hi def link gcn3Label               Special
hi def link gcn3Special             Type
hi def link gcn3SwizzleOp           Special
hi def link gcn3DataFormat          Statement
hi def link gcn3NumFormat           Statement

" GCN Instructions
hi def link gcn3ProgramFlowControl  Identifier
hi def link gcn3ScalarALU           Identifier
hi def link gcn3VectorALU           Identifier
hi def link gcn3SMEM                Identifier
hi def link gcn3VMEM                Identifier
hi def link gcn3FlatMEM             Identifier
hi def link gcn3DataShareOp         Identifier
hi def link gcn3GraphicsOp          Identifier

let b:current_syntax = "gcn-isa"

