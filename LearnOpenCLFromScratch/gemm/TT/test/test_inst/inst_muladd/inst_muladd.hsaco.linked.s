	.text
	.hsa_code_object_version 2,1
	.hsa_code_object_isa 8,0,3,"AMD","AMDGPU"
	.globl	gemm                    ; -- Begin function gemm
	.p2align	8
	.type	gemm,@function
	.amdgpu_hsa_kernel gemm
gemm:                                   ; @gemm
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
		granulated_workitem_vgpr_count = 2
		granulated_wavefront_sgpr_count = 0
		priority = 0
		float_mode = 192
		priv = 0
		enable_dx10_clamp = 1
		debug_mode = 0
		enable_ieee_mode = 1
		enable_sgpr_private_segment_wave_byte_offset = 0
		user_sgpr_count = 6
		enable_trap_handler = 1
		enable_sgpr_workgroup_id_x = 1
		enable_sgpr_workgroup_id_y = 0
		enable_sgpr_workgroup_id_z = 0
		enable_sgpr_workgroup_info = 0
		enable_vgpr_workitem_id = 0
		enable_exception_msb = 0
		granulated_lds_size = 0
		enable_exception = 0
		enable_sgpr_private_segment_buffer = 1
		enable_sgpr_dispatch_ptr = 0
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
		workgroup_group_segment_byte_size = 0
		gds_segment_byte_size = 0
		kernarg_segment_byte_size = 56
		workgroup_fbarrier_count = 0
		wavefront_sgpr_count = 6
		workitem_vgpr_count = 12
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
	s_barrier
	s_barrier
	s_barrier
	s_barrier
	s_barrier
	s_barrier
	s_barrier
	s_barrier
	s_barrier
	s_barrier

    ; 读 A,B,C地址
    ; s[0]保存低32位，s[1]保存高32位
	s_load_dwordx2 s[0:1], s[4:5], 0x0
	s_load_dwordx2 s[2:3], s[4:5], 0x8
	s_load_dwordx2 s[4:5], s[4:5], 0x10
	s_waitcnt lgkmcnt(0)

    ; 将A,B,C地址保存到向量寄存器
	v_mov_b32_e32 v0, s0
	v_mov_b32_e32 v2, s2
	v_mov_b32_e32 v4, s4
	v_mov_b32_e32 v1, s1
	v_mov_b32_e32 v3, s3
	v_mov_b32_e32 v5, s5

    ; 读数据
    ; A[0]
	flat_load_dword v10, v[0:1]
    ; B[0]
	flat_load_dword v11, v[2:3]

    ; v[0]<-C[0] v[1]<-C[1] 
	flat_load_dwordx2 v[0:1], v[4:5]

    ; A[1]的地址 
	s_add_u32 s0, s0, 4
	s_addc_u32 s1, s1, 0

    ; B[1]的地址
	s_add_u32 s2, s2, 4
	s_addc_u32 s3, s3, 0

    ; A[1] 的地址 v[2:3]
    ; B[1] 的地址 v[6:7]
	v_mov_b32_e32 v3, s1
	v_mov_b32_e32 v7, s3
	v_mov_b32_e32 v2, s0
	v_mov_b32_e32 v6, s2

    ; C[1]的地址
	s_add_u32 s0, s4, 4
	s_addc_u32 s1, s5, 0

    ; C[1]的地址
	v_mov_b32_e32 v9, s1
	v_mov_b32_e32 v8, s0
	s_waitcnt vmcnt(0) lgkmcnt(0)

    ; C[0] = A[0]*B[0] + C[0]
	v_mad_f32 v0, v10, v11, v0

    ; 写回结果到C[0]
	flat_store_dword v[4:5], v0

    ; A[1]
	flat_load_dword v0, v[2:3]
    ; B[1] 
	flat_load_dword v2, v[6:7]
	s_waitcnt vmcnt(0) lgkmcnt(0)

    ;
	v_mac_f32_e32 v1, v0, v2
	flat_store_dword v[8:9], v1
	s_endpgm
.Lfunc_end0:
	.size	gemm, .Lfunc_end0-gemm
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 220
; NumSgprs: 6
; NumVgprs: 12
; ScratchSize: 0
; FloatMode: 192
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 0
; VGPRBlocks: 2
; NumSGPRsForWavesPerEU: 6
; NumVGPRsForWavesPerEU: 12
; ReservedVGPRFirst: 0
; ReservedVGPRCount: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 6
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 1
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0

	.ident	"clang version 4.0 "
	.section	".note.GNU-stack"
	.amd_amdgpu_isa "amdgcn-amd-amdhsa-amdgizcl-gfx803"
	.amd_amdgpu_hsa_metadata
---
Version:         [ 1, 0 ]
Kernels:         
  - Name:            gemm
    SymbolName:      'gemm@kd'
    Language:        OpenCL C
    LanguageVersion: [ 1, 2 ]
    Args:            
      - Name:            A
        TypeName:        'float*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Global
        AccQual:         Default
        IsConst:         true
      - Name:            B
        TypeName:        'float*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Global
        AccQual:         Default
        IsConst:         true
      - Name:            C
        TypeName:        'float*'
        Size:            8
        Align:           8
        ValueKind:       GlobalBuffer
        ValueType:       F32
        AddrSpaceQual:   Global
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
      GroupSegmentFixedSize: 0
      PrivateSegmentFixedSize: 0
      KernargSegmentAlign: 8
      WavefrontSize:   64
      NumSGPRs:        6
      NumVGPRs:        12
      MaxFlatWorkGroupSize: 256
...

	.end_amd_amdgpu_hsa_metadata
