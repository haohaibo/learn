	.text
	.hsa_code_object_version 2,1
	.hsa_code_object_isa 8,0,3,"AMD","AMDGPU"
	.globl	microbench              ; -- Begin function microbench
	.p2align	8
	.type	microbench,@function
	.amdgpu_hsa_kernel microbench
microbench:                             ; @microbench
	.amd_kernel_code_t
		amd_code_version_major = 1
		amd_code_version_minor = 1
		amd_machine_kind = 1
		amd_machine_version_major = 8
		amd_machine_version_minor = 0
		amd_machine_version_stepping = 3
		kernel_code_entry_byte_offset = 256
		kernel_code_prefetch_byte_size = 0
		max_scratch_backing_memory_byte_size = 0
		granulated_workitem_vgpr_count = 1
		granulated_wavefront_sgpr_count = 1
		priority = 0
		float_mode = 192
		priv = 0
		enable_dx10_clamp = 1
		debug_mode = 0
		enable_ieee_mode = 1
		enable_sgpr_private_segment_wave_byte_offset = 0
		user_sgpr_count = 8
		enable_trap_handler = 1
		enable_sgpr_workgroup_id_x = 1
		enable_sgpr_workgroup_id_y = 0
		enable_sgpr_workgroup_id_z = 0
		enable_sgpr_workgroup_info = 0
		enable_vgpr_workitem_id = 1
		enable_exception_msb = 0
		granulated_lds_size = 0
		enable_exception = 0
		enable_sgpr_private_segment_buffer = 1
		enable_sgpr_dispatch_ptr = 1
		enable_sgpr_queue_ptr = 0
		enable_sgpr_kernarg_segment_ptr = 1
		enable_sgpr_dispatch_id = 0
		enable_sgpr_flat_scratch_init = 0
		enable_sgpr_private_segment_size = 0
		enable_sgpr_grid_workgroup_count_x = 0
		enable_sgpr_grid_workgroup_count_y = 0
		enable_sgpr_grid_workgroup_count_z = 0
		enable_ordered_append_gds = 0
		private_element_size = 1
		is_ptr64 = 1
		is_dynamic_callstack = 0
		is_debug_enabled = 0
		is_xnack_enabled = 0
		workitem_private_segment_byte_size = 0
		workgroup_group_segment_byte_size = 24576
		gds_segment_byte_size = 0
		kernarg_segment_byte_size = 56
		workgroup_fbarrier_count = 0
		wavefront_sgpr_count = 11
		workitem_vgpr_count = 5
		reserved_vgpr_first = 0
		reserved_vgpr_count = 0
		reserved_sgpr_first = 0
		reserved_sgpr_count = 0
		debug_wavefront_private_segment_offset_sgpr = 0
		debug_private_segment_buffer_sgpr = 0
		kernarg_segment_alignment = 4
		group_segment_alignment = 4
		private_segment_alignment = 4
		wavefront_size = 6
		call_convention = -1
		runtime_loader_kernel_symbol = 0
	.end_amd_kernel_code_t
; BB#0:
	s_load_dword s2, s[4:5], 0x4
	s_load_dword s3, s[4:5], 0xc
	s_load_dwordx2 s[0:1], s[6:7], 0x8
	s_mov_b32 m0, -1
	s_waitcnt lgkmcnt(0)
	s_and_b32 s2, s2, 0xffff
	s_mul_i32 s8, s8, s2
	s_sub_i32 s3, s3, s8
	s_min_u32 s2, s3, s2
	v_mad_u32_u24 v0, s2, v1, v0
	v_lshlrev_b32_e32 v4, 2, v0
	ds_read2st64_b32 v[0:1], v4 offset1:2
	ds_read2st64_b32 v[2:3], v4 offset0:4 offset1:6
	;s_waitcnt lgkmcnt(1)
	;v_add_f32_e32 v0, 0, v0
	;v_add_f32_e32 v0, v0, v1
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v0, v2
	;v_add_f32_e32 v2, v0, v3
	ds_read2st64_b32 v[0:1], v4 offset0:8 offset1:10
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:12 offset1:14
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:16 offset1:18
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:20 offset1:22
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:24 offset1:26
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:28 offset1:30
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:32 offset1:34
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:36 offset1:38
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:40 offset1:42
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:44 offset1:46
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:48 offset1:50
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:52 offset1:54
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:56 offset1:58
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:60 offset1:62
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:64 offset1:66
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:68 offset1:70
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:72 offset1:74
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:76 offset1:78
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:80 offset1:82
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:84 offset1:86
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:88 offset1:90
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	ds_read2st64_b32 v[0:1], v4 offset0:92 offset1:94
	;s_waitcnt lgkmcnt(0)
	;v_add_f32_e32 v0, v2, v0
	;v_add_f32_e32 v2, v0, v1
	;v_mov_b32_e32 v1, s1
	;v_add_u32_e32 v0, vcc, s0, v4
	;v_addc_u32_e32 v1, vcc, 0, v1, vcc
	;flat_store_dword v[0:1], v2
	s_endpgm
.Lfunc_end0:
	.size	microbench, .Lfunc_end0-microbench
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 568
; NumSgprs: 11
; NumVgprs: 5
; ScratchSize: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 24576 bytes/workgroup (compile time only)
; SGPRBlocks: 1
; VGPRBlocks: 1
; NumSGPRsForWavesPerEU: 11
; NumVGPRsForWavesPerEU: 5
; ReservedVGPRFirst: 0
; ReservedVGPRCount: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 8
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 1
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 1

	.ident	"clang version 4.0 "
	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn-amd-amdhsa-amdgizcl-gfx803"
	.amd_amdgpu_hsa_metadata
---
Version:         [ 1, 0 ]
Kernels:         
  - Name:            microbench
    SymbolName:      'microbench@kd'
    Language:        OpenCL C
    LanguageVersion: [ 1, 2 ]
    Args:            
      - Name:            in
        TypeName:        'float*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Global
        AccQual:         Default
      - Name:            out
        TypeName:        'float*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Global
        AccQual:         Default
      - Name:            clock
        TypeName:        int
        Size:            4
        Align:           4
        ValueKind:       ByValue
        ValueType:       I32
        AccQual:         Default
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetX
        ValueType:       I64
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetY
        ValueType:       I64
      - Size:            8
        Align:           8
        ValueKind:       HiddenGlobalOffsetZ
        ValueType:       I64
    CodeProps:       
      KernargSegmentSize: 56
      GroupSegmentFixedSize: 24576
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign: 8
      WavefrontSize:   64
      NumSGPRs:        11
      NumVGPRs:        5
      MaxFlatWorkGroupSize: 256
...

	.end_amd_amdgpu_hsa_metadata
