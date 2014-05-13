@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.BT = type { }
%class.Tree = type { %class.Tree *, %class.Tree *, i32, i1, i1, %class.Tree * }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 0, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.BT*
  %tmp4 = call i32 (%class.BT *)* @__Start_BT(%class.BT * %tmp1)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define i32 @__Start_BT(%class.BT * %this) {
entry:
  %_root = alloca %class.Tree *
  %_ntb = alloca i1
  %_nti = alloca i32
  %tmp9 = mul i32 30, 1
  %tmp10 = call i8* @malloc ( i32 %tmp9)
  %tmp8 = bitcast i8* %tmp10 to %class.Tree*
  store %class.Tree * %tmp8, %class.Tree * * %_root
  %tmp11 = load %class.Tree * * %_root
  %tmp12 = call i1 (%class.Tree *, i32)* @__Init_Tree(%class.Tree * %tmp11, i32 16)
  store i1 %tmp12, i1 * %_ntb
  %tmp13 = load %class.Tree * * %_root
  %tmp14 = call i1 (%class.Tree *)* @__Print_Tree(%class.Tree * %tmp13)
  store i1 %tmp14, i1 * %_ntb
  %tmp15 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp16 = call i32 (i8 *, ...)* @printf(i8 * %tmp15, i32 100000000)
  %tmp17 = load %class.Tree * * %_root
  %tmp18 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp17, i32 8)
  store i1 %tmp18, i1 * %_ntb
  %tmp19 = load %class.Tree * * %_root
  %tmp20 = call i1 (%class.Tree *)* @__Print_Tree(%class.Tree * %tmp19)
  store i1 %tmp20, i1 * %_ntb
  %tmp21 = load %class.Tree * * %_root
  %tmp22 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp21, i32 24)
  store i1 %tmp22, i1 * %_ntb
  %tmp23 = load %class.Tree * * %_root
  %tmp24 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp23, i32 4)
  store i1 %tmp24, i1 * %_ntb
  %tmp25 = load %class.Tree * * %_root
  %tmp26 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp25, i32 12)
  store i1 %tmp26, i1 * %_ntb
  %tmp27 = load %class.Tree * * %_root
  %tmp28 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp27, i32 20)
  store i1 %tmp28, i1 * %_ntb
  %tmp29 = load %class.Tree * * %_root
  %tmp30 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp29, i32 28)
  store i1 %tmp30, i1 * %_ntb
  %tmp31 = load %class.Tree * * %_root
  %tmp32 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp31, i32 14)
  store i1 %tmp32, i1 * %_ntb
  %tmp33 = load %class.Tree * * %_root
  %tmp34 = call i1 (%class.Tree *)* @__Print_Tree(%class.Tree * %tmp33)
  store i1 %tmp34, i1 * %_ntb
  %tmp35 = load %class.Tree * * %_root
  %tmp36 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp35, i32 24)
  %tmp37 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp38 = call i32 (i8 *, ...)* @printf(i8 * %tmp37, i32 %tmp36)
  %tmp39 = load %class.Tree * * %_root
  %tmp40 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp39, i32 12)
  %tmp41 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp42 = call i32 (i8 *, ...)* @printf(i8 * %tmp41, i32 %tmp40)
  %tmp43 = load %class.Tree * * %_root
  %tmp44 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp43, i32 16)
  %tmp45 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp46 = call i32 (i8 *, ...)* @printf(i8 * %tmp45, i32 %tmp44)
  %tmp47 = load %class.Tree * * %_root
  %tmp48 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp47, i32 50)
  %tmp49 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp50 = call i32 (i8 *, ...)* @printf(i8 * %tmp49, i32 %tmp48)
  %tmp51 = load %class.Tree * * %_root
  %tmp52 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp51, i32 12)
  %tmp53 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp54 = call i32 (i8 *, ...)* @printf(i8 * %tmp53, i32 %tmp52)
  %tmp55 = load %class.Tree * * %_root
  %tmp56 = call i1 (%class.Tree *, i32)* @__Delete_Tree(%class.Tree * %tmp55, i32 12)
  store i1 %tmp56, i1 * %_ntb
  %tmp57 = load %class.Tree * * %_root
  %tmp58 = call i1 (%class.Tree *)* @__Print_Tree(%class.Tree * %tmp57)
  store i1 %tmp58, i1 * %_ntb
  %tmp59 = load %class.Tree * * %_root
  %tmp60 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp59, i32 12)
  %tmp61 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp62 = call i32 (i8 *, ...)* @printf(i8 * %tmp61, i32 %tmp60)
  ret i32 0
}
define i1 @__Init_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %_v_key = alloca i32
  store i32 %v_key, i32 * %_v_key
  %tmp63 = load i32 * %_v_key
  %tmp64 = getelementptr %class.Tree * %this, i32 0, i32 2
  store i32 %tmp63, i32 * %tmp64
  %tmp65 = getelementptr %class.Tree * %this, i32 0, i32 3
  store i1 false, i1 * %tmp65
  %tmp66 = getelementptr %class.Tree * %this, i32 0, i32 4
  store i1 false, i1 * %tmp66
  ret i1 true
}
define i1 @__SetRight_Tree(%class.Tree * %this, %class.Tree * %rn) {
entry:
  %_rn = alloca %class.Tree *
  store %class.Tree * %rn, %class.Tree * * %_rn
  %tmp67 = load %class.Tree * * %_rn
  %tmp68 = getelementptr %class.Tree * %this, i32 0, i32 1
  store %class.Tree * %tmp67, %class.Tree * * %tmp68
  ret i1 true
}
define i1 @__SetLeft_Tree(%class.Tree * %this, %class.Tree * %ln) {
entry:
  %_ln = alloca %class.Tree *
  store %class.Tree * %ln, %class.Tree * * %_ln
  %tmp69 = load %class.Tree * * %_ln
  %tmp70 = getelementptr %class.Tree * %this, i32 0, i32 0
  store %class.Tree * %tmp69, %class.Tree * * %tmp70
  ret i1 true
}
define %class.Tree * @__GetRight_Tree(%class.Tree * %this) {
entry:
  %tmp71 = getelementptr %class.Tree * %this, i32 0, i32 1
  %tmp72 = load %class.Tree * * %tmp71
  ret %class.Tree * %tmp72
}
define %class.Tree * @__GetLeft_Tree(%class.Tree * %this) {
entry:
  %tmp73 = getelementptr %class.Tree * %this, i32 0, i32 0
  %tmp74 = load %class.Tree * * %tmp73
  ret %class.Tree * %tmp74
}
define i32 @__GetKey_Tree(%class.Tree * %this) {
entry:
  %tmp75 = getelementptr %class.Tree * %this, i32 0, i32 2
  %tmp76 = load i32 * %tmp75
  ret i32 %tmp76
}
define i1 @__SetKey_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %_v_key = alloca i32
  store i32 %v_key, i32 * %_v_key
  %tmp77 = load i32 * %_v_key
  %tmp78 = getelementptr %class.Tree * %this, i32 0, i32 2
  store i32 %tmp77, i32 * %tmp78
  ret i1 true
}
define i1 @__GetHas_Right_Tree(%class.Tree * %this) {
entry:
  %tmp79 = getelementptr %class.Tree * %this, i32 0, i32 4
  %tmp80 = load i1 * %tmp79
  ret i1 %tmp80
}
define i1 @__GetHas_Left_Tree(%class.Tree * %this) {
entry:
  %tmp81 = getelementptr %class.Tree * %this, i32 0, i32 3
  %tmp82 = load i1 * %tmp81
  ret i1 %tmp82
}
define i1 @__SetHas_Left_Tree(%class.Tree * %this, i1 %val) {
entry:
  %_val = alloca i1
  store i1 %val, i1 * %_val
  %tmp83 = load i1 * %_val
  %tmp84 = getelementptr %class.Tree * %this, i32 0, i32 3
  store i1 %tmp83, i1 * %tmp84
  ret i1 true
}
define i1 @__SetHas_Right_Tree(%class.Tree * %this, i1 %val) {
entry:
  %_val = alloca i1
  store i1 %val, i1 * %_val
  %tmp85 = load i1 * %_val
  %tmp86 = getelementptr %class.Tree * %this, i32 0, i32 4
  store i1 %tmp85, i1 * %tmp86
  ret i1 true
}
define i1 @__Compare_Tree(%class.Tree * %this, i32 %num1, i32 %num2) {
entry:
  %_num1 = alloca i32
  store i32 %num1, i32 * %_num1
  %_num2 = alloca i32
  store i32 %num2, i32 * %_num2
  %_ntb = alloca i1
  %_nti = alloca i32
  store i1 false, i1 * %_ntb
  %tmp87 = load i32 * %_num2
  %tmp88 = add i32 %tmp87, 1
  store i32 %tmp88, i32 * %_nti
  %tmp89 = load i32 * %_num1
  %tmp90 = load i32 * %_num2
  %tmp91 = icmp slt i32 %tmp89, %tmp90
  br i1 %tmp91, label %label0, label %label1
label0:
  store i1 false, i1 * %_ntb
  br label %label2
label1:
  %tmp92 = load i32 * %_num1
  %tmp93 = load i32 * %_nti
  %tmp94 = icmp slt i32 %tmp92, %tmp93
  %tmp95 = xor i1 %tmp94, 1
  br i1 %tmp95, label %label3, label %label4
label3:
  store i1 false, i1 * %_ntb
  br label %label5
label4:
  store i1 true, i1 * %_ntb
  br label %label5
label5:
  br label %label2
label2:
  %tmp96 = load i1 * %_ntb
  ret i1 %tmp96
}
define i1 @__Insert_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %_v_key = alloca i32
  store i32 %v_key, i32 * %_v_key
  %_new_node = alloca %class.Tree *
  %_ntb = alloca i1
  %_cont = alloca i1
  %_key_aux = alloca i32
  %_current_node = alloca %class.Tree *
  %tmp98 = mul i32 30, 1
  %tmp99 = call i8* @malloc ( i32 %tmp98)
  %tmp97 = bitcast i8* %tmp99 to %class.Tree*
  store %class.Tree * %tmp97, %class.Tree * * %_new_node
  %tmp100 = load %class.Tree * * %_new_node
  %tmp101 = load i32 * %_v_key
  %tmp102 = call i1 (%class.Tree *, i32)* @__Init_Tree(%class.Tree * %tmp100, i32 %tmp101)
  store i1 %tmp102, i1 * %_ntb
  store %class.Tree * %this, %class.Tree * * %_current_node
  store i1 true, i1 * %_cont
  br label %label8
label8:
  %tmp103 = load i1 * %_cont
  br i1 %tmp103, label %label6, label %label7
label6:
  %tmp104 = load %class.Tree * * %_current_node
  %tmp105 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp104)
  store i32 %tmp105, i32 * %_key_aux
  %tmp106 = load i32 * %_v_key
  %tmp107 = load i32 * %_key_aux
  %tmp108 = icmp slt i32 %tmp106, %tmp107
  br i1 %tmp108, label %label9, label %label10
label9:
  %tmp109 = load %class.Tree * * %_current_node
  %tmp110 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp109)
  br i1 %tmp110, label %label12, label %label13
label12:
  %tmp111 = load %class.Tree * * %_current_node
  %tmp112 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp111)
  store %class.Tree * %tmp112, %class.Tree * * %_current_node
  br label %label14
label13:
  store i1 false, i1 * %_cont
  %tmp113 = load %class.Tree * * %_current_node
  %tmp114 = call i1 (%class.Tree *, i1)* @__SetHas_Left_Tree(%class.Tree * %tmp113, i1 true)
  store i1 %tmp114, i1 * %_ntb
  %tmp115 = load %class.Tree * * %_current_node
  %tmp116 = load %class.Tree * * %_new_node
  %tmp117 = call i1 (%class.Tree *, %class.Tree *)* @__SetLeft_Tree(%class.Tree * %tmp115, %class.Tree * %tmp116)
  store i1 %tmp117, i1 * %_ntb
  br label %label14
label14:
  br label %label11
label10:
  %tmp118 = load %class.Tree * * %_current_node
  %tmp119 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp118)
  br i1 %tmp119, label %label15, label %label16
label15:
  %tmp120 = load %class.Tree * * %_current_node
  %tmp121 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp120)
  store %class.Tree * %tmp121, %class.Tree * * %_current_node
  br label %label17
label16:
  store i1 false, i1 * %_cont
  %tmp122 = load %class.Tree * * %_current_node
  %tmp123 = call i1 (%class.Tree *, i1)* @__SetHas_Right_Tree(%class.Tree * %tmp122, i1 true)
  store i1 %tmp123, i1 * %_ntb
  %tmp124 = load %class.Tree * * %_current_node
  %tmp125 = load %class.Tree * * %_new_node
  %tmp126 = call i1 (%class.Tree *, %class.Tree *)* @__SetRight_Tree(%class.Tree * %tmp124, %class.Tree * %tmp125)
  store i1 %tmp126, i1 * %_ntb
  br label %label17
label17:
  br label %label11
label11:
  br label %label8
label7:
  ret i1 true
}
define i1 @__Delete_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %_v_key = alloca i32
  store i32 %v_key, i32 * %_v_key
  %_current_node = alloca %class.Tree *
  %_parent_node = alloca %class.Tree *
  %_cont = alloca i1
  %_found = alloca i1
  %_is_root = alloca i1
  %_key_aux = alloca i32
  %_ntb = alloca i1
  store %class.Tree * %this, %class.Tree * * %_current_node
  store %class.Tree * %this, %class.Tree * * %_parent_node
  store i1 true, i1 * %_cont
  store i1 false, i1 * %_found
  store i1 true, i1 * %_is_root
  br label %label20
label20:
  %tmp127 = load i1 * %_cont
  br i1 %tmp127, label %label18, label %label19
label18:
  %tmp128 = load %class.Tree * * %_current_node
  %tmp129 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp128)
  store i32 %tmp129, i32 * %_key_aux
  %tmp130 = load i32 * %_v_key
  %tmp131 = load i32 * %_key_aux
  %tmp132 = icmp slt i32 %tmp130, %tmp131
  br i1 %tmp132, label %label21, label %label22
label21:
  %tmp133 = load %class.Tree * * %_current_node
  %tmp134 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp133)
  br i1 %tmp134, label %label24, label %label25
label24:
  %tmp135 = load %class.Tree * * %_current_node
  store %class.Tree * %tmp135, %class.Tree * * %_parent_node
  %tmp136 = load %class.Tree * * %_current_node
  %tmp137 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp136)
  store %class.Tree * %tmp137, %class.Tree * * %_current_node
  br label %label26
label25:
  store i1 false, i1 * %_cont
  br label %label26
label26:
  br label %label23
label22:
  %tmp138 = load i32 * %_key_aux
  %tmp139 = load i32 * %_v_key
  %tmp140 = icmp slt i32 %tmp138, %tmp139
  br i1 %tmp140, label %label27, label %label28
label27:
  %tmp141 = load %class.Tree * * %_current_node
  %tmp142 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp141)
  br i1 %tmp142, label %label30, label %label31
label30:
  %tmp143 = load %class.Tree * * %_current_node
  store %class.Tree * %tmp143, %class.Tree * * %_parent_node
  %tmp144 = load %class.Tree * * %_current_node
  %tmp145 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp144)
  store %class.Tree * %tmp145, %class.Tree * * %_current_node
  br label %label32
label31:
  store i1 false, i1 * %_cont
  br label %label32
label32:
  br label %label29
label28:
  %tmp146 = load i1 * %_is_root
  br i1 %tmp146, label %label33, label %label34
label33:
  %tmp147 = load %class.Tree * * %_current_node
  %tmp148 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp147)
  %tmp149 = xor i1 %tmp148, 1
  %tmp150 = load %class.Tree * * %_current_node
  %tmp151 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp150)
  %tmp152 = xor i1 %tmp151, 1
  %tmp153 = and i1 %tmp149, %tmp152
  br i1 %tmp153, label %label36, label %label37
label36:
  store i1 true, i1 * %_ntb
  br label %label38
label37:
  %tmp154 = load %class.Tree * * %_parent_node
  %tmp155 = load %class.Tree * * %_current_node
  %tmp156 = call i1 (%class.Tree *, %class.Tree *, %class.Tree *)* @__Remove_Tree(%class.Tree * %this, %class.Tree * %tmp154, %class.Tree * %tmp155)
  store i1 %tmp156, i1 * %_ntb
  br label %label38
label38:
  br label %label35
label34:
  %tmp157 = load %class.Tree * * %_parent_node
  %tmp158 = load %class.Tree * * %_current_node
  %tmp159 = call i1 (%class.Tree *, %class.Tree *, %class.Tree *)* @__Remove_Tree(%class.Tree * %this, %class.Tree * %tmp157, %class.Tree * %tmp158)
  store i1 %tmp159, i1 * %_ntb
  br label %label35
label35:
  store i1 true, i1 * %_found
  store i1 false, i1 * %_cont
  br label %label29
label29:
  br label %label23
label23:
  store i1 false, i1 * %_is_root
  br label %label20
label19:
  %tmp160 = load i1 * %_found
  ret i1 %tmp160
}
define i1 @__Remove_Tree(%class.Tree * %this, %class.Tree * %p_node, %class.Tree * %c_node) {
entry:
  %_p_node = alloca %class.Tree *
  store %class.Tree * %p_node, %class.Tree * * %_p_node
  %_c_node = alloca %class.Tree *
  store %class.Tree * %c_node, %class.Tree * * %_c_node
  %_ntb = alloca i1
  %_auxkey1 = alloca i32
  %_auxkey2 = alloca i32
  %tmp161 = load %class.Tree * * %_c_node
  %tmp162 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp161)
  br i1 %tmp162, label %label39, label %label40
label39:
  %tmp163 = load %class.Tree * * %_p_node
  %tmp164 = load %class.Tree * * %_c_node
  %tmp165 = call i1 (%class.Tree *, %class.Tree *, %class.Tree *)* @__RemoveLeft_Tree(%class.Tree * %this, %class.Tree * %tmp163, %class.Tree * %tmp164)
  store i1 %tmp165, i1 * %_ntb
  br label %label41
label40:
  %tmp166 = load %class.Tree * * %_c_node
  %tmp167 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp166)
  br i1 %tmp167, label %label42, label %label43
label42:
  %tmp168 = load %class.Tree * * %_p_node
  %tmp169 = load %class.Tree * * %_c_node
  %tmp170 = call i1 (%class.Tree *, %class.Tree *, %class.Tree *)* @__RemoveRight_Tree(%class.Tree * %this, %class.Tree * %tmp168, %class.Tree * %tmp169)
  store i1 %tmp170, i1 * %_ntb
  br label %label44
label43:
  %tmp171 = load %class.Tree * * %_c_node
  %tmp172 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp171)
  store i32 %tmp172, i32 * %_auxkey1
  %tmp173 = load %class.Tree * * %_p_node
  %tmp174 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp173)
  %tmp175 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp174)
  store i32 %tmp175, i32 * %_auxkey2
  %tmp176 = load i32 * %_auxkey1
  %tmp177 = load i32 * %_auxkey2
  %tmp178 = call i1 (%class.Tree *, i32, i32)* @__Compare_Tree(%class.Tree * %this, i32 %tmp176, i32 %tmp177)
  br i1 %tmp178, label %label45, label %label46
label45:
  %tmp179 = load %class.Tree * * %_p_node
  %tmp180 = getelementptr %class.Tree * %this, i32 0, i32 5
  %tmp181 = load %class.Tree * * %tmp180
  %tmp182 = call i1 (%class.Tree *, %class.Tree *)* @__SetLeft_Tree(%class.Tree * %tmp179, %class.Tree * %tmp181)
  store i1 %tmp182, i1 * %_ntb
  %tmp183 = load %class.Tree * * %_p_node
  %tmp184 = call i1 (%class.Tree *, i1)* @__SetHas_Left_Tree(%class.Tree * %tmp183, i1 false)
  store i1 %tmp184, i1 * %_ntb
  br label %label47
label46:
  %tmp185 = load %class.Tree * * %_p_node
  %tmp186 = getelementptr %class.Tree * %this, i32 0, i32 5
  %tmp187 = load %class.Tree * * %tmp186
  %tmp188 = call i1 (%class.Tree *, %class.Tree *)* @__SetRight_Tree(%class.Tree * %tmp185, %class.Tree * %tmp187)
  store i1 %tmp188, i1 * %_ntb
  %tmp189 = load %class.Tree * * %_p_node
  %tmp190 = call i1 (%class.Tree *, i1)* @__SetHas_Right_Tree(%class.Tree * %tmp189, i1 false)
  store i1 %tmp190, i1 * %_ntb
  br label %label47
label47:
  br label %label44
label44:
  br label %label41
label41:
  ret i1 true
}
define i1 @__RemoveRight_Tree(%class.Tree * %this, %class.Tree * %p_node, %class.Tree * %c_node) {
entry:
  %_p_node = alloca %class.Tree *
  store %class.Tree * %p_node, %class.Tree * * %_p_node
  %_c_node = alloca %class.Tree *
  store %class.Tree * %c_node, %class.Tree * * %_c_node
  %_ntb = alloca i1
  br label %label50
label50:
  %tmp191 = load %class.Tree * * %_c_node
  %tmp192 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp191)
  br i1 %tmp192, label %label48, label %label49
label48:
  %tmp193 = load %class.Tree * * %_c_node
  %tmp194 = load %class.Tree * * %_c_node
  %tmp195 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp194)
  %tmp196 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp195)
  %tmp197 = call i1 (%class.Tree *, i32)* @__SetKey_Tree(%class.Tree * %tmp193, i32 %tmp196)
  store i1 %tmp197, i1 * %_ntb
  %tmp198 = load %class.Tree * * %_c_node
  store %class.Tree * %tmp198, %class.Tree * * %_p_node
  %tmp199 = load %class.Tree * * %_c_node
  %tmp200 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp199)
  store %class.Tree * %tmp200, %class.Tree * * %_c_node
  br label %label50
label49:
  %tmp201 = load %class.Tree * * %_p_node
  %tmp202 = getelementptr %class.Tree * %this, i32 0, i32 5
  %tmp203 = load %class.Tree * * %tmp202
  %tmp204 = call i1 (%class.Tree *, %class.Tree *)* @__SetRight_Tree(%class.Tree * %tmp201, %class.Tree * %tmp203)
  store i1 %tmp204, i1 * %_ntb
  %tmp205 = load %class.Tree * * %_p_node
  %tmp206 = call i1 (%class.Tree *, i1)* @__SetHas_Right_Tree(%class.Tree * %tmp205, i1 false)
  store i1 %tmp206, i1 * %_ntb
  ret i1 true
}
define i1 @__RemoveLeft_Tree(%class.Tree * %this, %class.Tree * %p_node, %class.Tree * %c_node) {
entry:
  %_p_node = alloca %class.Tree *
  store %class.Tree * %p_node, %class.Tree * * %_p_node
  %_c_node = alloca %class.Tree *
  store %class.Tree * %c_node, %class.Tree * * %_c_node
  %_ntb = alloca i1
  br label %label53
label53:
  %tmp207 = load %class.Tree * * %_c_node
  %tmp208 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp207)
  br i1 %tmp208, label %label51, label %label52
label51:
  %tmp209 = load %class.Tree * * %_c_node
  %tmp210 = load %class.Tree * * %_c_node
  %tmp211 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp210)
  %tmp212 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp211)
  %tmp213 = call i1 (%class.Tree *, i32)* @__SetKey_Tree(%class.Tree * %tmp209, i32 %tmp212)
  store i1 %tmp213, i1 * %_ntb
  %tmp214 = load %class.Tree * * %_c_node
  store %class.Tree * %tmp214, %class.Tree * * %_p_node
  %tmp215 = load %class.Tree * * %_c_node
  %tmp216 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp215)
  store %class.Tree * %tmp216, %class.Tree * * %_c_node
  br label %label53
label52:
  %tmp217 = load %class.Tree * * %_p_node
  %tmp218 = getelementptr %class.Tree * %this, i32 0, i32 5
  %tmp219 = load %class.Tree * * %tmp218
  %tmp220 = call i1 (%class.Tree *, %class.Tree *)* @__SetLeft_Tree(%class.Tree * %tmp217, %class.Tree * %tmp219)
  store i1 %tmp220, i1 * %_ntb
  %tmp221 = load %class.Tree * * %_p_node
  %tmp222 = call i1 (%class.Tree *, i1)* @__SetHas_Left_Tree(%class.Tree * %tmp221, i1 false)
  store i1 %tmp222, i1 * %_ntb
  ret i1 true
}
define i32 @__Search_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %_v_key = alloca i32
  store i32 %v_key, i32 * %_v_key
  %_cont = alloca i1
  %_ifound = alloca i32
  %_current_node = alloca %class.Tree *
  %_key_aux = alloca i32
  store %class.Tree * %this, %class.Tree * * %_current_node
  store i1 true, i1 * %_cont
  store i32 0, i32 * %_ifound
  br label %label56
label56:
  %tmp223 = load i1 * %_cont
  br i1 %tmp223, label %label54, label %label55
label54:
  %tmp224 = load %class.Tree * * %_current_node
  %tmp225 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp224)
  store i32 %tmp225, i32 * %_key_aux
  %tmp226 = load i32 * %_v_key
  %tmp227 = load i32 * %_key_aux
  %tmp228 = icmp slt i32 %tmp226, %tmp227
  br i1 %tmp228, label %label57, label %label58
label57:
  %tmp229 = load %class.Tree * * %_current_node
  %tmp230 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp229)
  br i1 %tmp230, label %label60, label %label61
label60:
  %tmp231 = load %class.Tree * * %_current_node
  %tmp232 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp231)
  store %class.Tree * %tmp232, %class.Tree * * %_current_node
  br label %label62
label61:
  store i1 false, i1 * %_cont
  br label %label62
label62:
  br label %label59
label58:
  %tmp233 = load i32 * %_key_aux
  %tmp234 = load i32 * %_v_key
  %tmp235 = icmp slt i32 %tmp233, %tmp234
  br i1 %tmp235, label %label63, label %label64
label63:
  %tmp236 = load %class.Tree * * %_current_node
  %tmp237 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp236)
  br i1 %tmp237, label %label66, label %label67
label66:
  %tmp238 = load %class.Tree * * %_current_node
  %tmp239 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp238)
  store %class.Tree * %tmp239, %class.Tree * * %_current_node
  br label %label68
label67:
  store i1 false, i1 * %_cont
  br label %label68
label68:
  br label %label65
label64:
  store i32 1, i32 * %_ifound
  store i1 false, i1 * %_cont
  br label %label65
label65:
  br label %label59
label59:
  br label %label56
label55:
  %tmp240 = load i32 * %_ifound
  ret i32 %tmp240
}
define i1 @__Print_Tree(%class.Tree * %this) {
entry:
  %_current_node = alloca %class.Tree *
  %_ntb = alloca i1
  store %class.Tree * %this, %class.Tree * * %_current_node
  %tmp241 = load %class.Tree * * %_current_node
  %tmp242 = call i1 (%class.Tree *, %class.Tree *)* @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %tmp241)
  store i1 %tmp242, i1 * %_ntb
  ret i1 true
}
define i1 @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %node) {
entry:
  %_node = alloca %class.Tree *
  store %class.Tree * %node, %class.Tree * * %_node
  %_ntb = alloca i1
  %tmp243 = load %class.Tree * * %_node
  %tmp244 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp243)
  br i1 %tmp244, label %label69, label %label70
label69:
  %tmp245 = load %class.Tree * * %_node
  %tmp246 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp245)
  %tmp247 = call i1 (%class.Tree *, %class.Tree *)* @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %tmp246)
  store i1 %tmp247, i1 * %_ntb
  br label %label71
label70:
  store i1 true, i1 * %_ntb
  br label %label71
label71:
  %tmp248 = load %class.Tree * * %_node
  %tmp249 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp248)
  %tmp250 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp251 = call i32 (i8 *, ...)* @printf(i8 * %tmp250, i32 %tmp249)
  %tmp252 = load %class.Tree * * %_node
  %tmp253 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp252)
  br i1 %tmp253, label %label72, label %label73
label72:
  %tmp254 = load %class.Tree * * %_node
  %tmp255 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp254)
  %tmp256 = call i1 (%class.Tree *, %class.Tree *)* @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %tmp255)
  store i1 %tmp256, i1 * %_ntb
  br label %label74
label73:
  store i1 true, i1 * %_ntb
  br label %label74
label74:
  ret i1 true
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
