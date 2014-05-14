@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.Tree = type { [20 x i8 *], %class.Tree *, %class.Tree *, i32, i1, i1, %class.Tree * }
%class.BT = type { [1 x i8 *] }
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
define void @__BT_BT(%class.BT * %this) {
entry:
  %tmp8 = bitcast %class.BT * %this to [1 x i8 *] *
  %tmp9 = bitcast i32 (%class.BT *)* @__Start_BT to i8 *
  %tmp10 = getelementptr [1 x i8 *] * %tmp8, i32 0, i32 0
  store i8 * %tmp9, i8 * * %tmp10
  ret void 
}
define i32 @__Start_BT(%class.BT * %this) {
entry:
  %_root = alloca %class.Tree *
  %_ntb = alloca i1
  %_nti = alloca i32
  %tmp12 = mul i32 30, 1
  %tmp13 = call i8* @malloc ( i32 %tmp12)
  %tmp11 = bitcast i8* %tmp13 to %class.Tree*
  store %class.Tree * %tmp11, %class.Tree * * %_root
  %tmp14 = load %class.Tree * * %_root
  %tmp15 = call i1 (%class.Tree *, i32)* @__Init_Tree(%class.Tree * %tmp14, i32 16)
  store i1 %tmp15, i1 * %_ntb
  %tmp16 = load %class.Tree * * %_root
  %tmp17 = call i1 (%class.Tree *)* @__Print_Tree(%class.Tree * %tmp16)
  store i1 %tmp17, i1 * %_ntb
  %tmp18 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp19 = call i32 (i8 *, ...)* @printf(i8 * %tmp18, i32 100000000)
  %tmp20 = load %class.Tree * * %_root
  %tmp21 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp20, i32 8)
  store i1 %tmp21, i1 * %_ntb
  %tmp22 = load %class.Tree * * %_root
  %tmp23 = call i1 (%class.Tree *)* @__Print_Tree(%class.Tree * %tmp22)
  store i1 %tmp23, i1 * %_ntb
  %tmp24 = load %class.Tree * * %_root
  %tmp25 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp24, i32 24)
  store i1 %tmp25, i1 * %_ntb
  %tmp26 = load %class.Tree * * %_root
  %tmp27 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp26, i32 4)
  store i1 %tmp27, i1 * %_ntb
  %tmp28 = load %class.Tree * * %_root
  %tmp29 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp28, i32 12)
  store i1 %tmp29, i1 * %_ntb
  %tmp30 = load %class.Tree * * %_root
  %tmp31 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp30, i32 20)
  store i1 %tmp31, i1 * %_ntb
  %tmp32 = load %class.Tree * * %_root
  %tmp33 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp32, i32 28)
  store i1 %tmp33, i1 * %_ntb
  %tmp34 = load %class.Tree * * %_root
  %tmp35 = call i1 (%class.Tree *, i32)* @__Insert_Tree(%class.Tree * %tmp34, i32 14)
  store i1 %tmp35, i1 * %_ntb
  %tmp36 = load %class.Tree * * %_root
  %tmp37 = call i1 (%class.Tree *)* @__Print_Tree(%class.Tree * %tmp36)
  store i1 %tmp37, i1 * %_ntb
  %tmp38 = load %class.Tree * * %_root
  %tmp39 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp38, i32 24)
  %tmp40 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp41 = call i32 (i8 *, ...)* @printf(i8 * %tmp40, i32 %tmp39)
  %tmp42 = load %class.Tree * * %_root
  %tmp43 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp42, i32 12)
  %tmp44 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp45 = call i32 (i8 *, ...)* @printf(i8 * %tmp44, i32 %tmp43)
  %tmp46 = load %class.Tree * * %_root
  %tmp47 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp46, i32 16)
  %tmp48 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp49 = call i32 (i8 *, ...)* @printf(i8 * %tmp48, i32 %tmp47)
  %tmp50 = load %class.Tree * * %_root
  %tmp51 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp50, i32 50)
  %tmp52 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp53 = call i32 (i8 *, ...)* @printf(i8 * %tmp52, i32 %tmp51)
  %tmp54 = load %class.Tree * * %_root
  %tmp55 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp54, i32 12)
  %tmp56 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp57 = call i32 (i8 *, ...)* @printf(i8 * %tmp56, i32 %tmp55)
  %tmp58 = load %class.Tree * * %_root
  %tmp59 = call i1 (%class.Tree *, i32)* @__Delete_Tree(%class.Tree * %tmp58, i32 12)
  store i1 %tmp59, i1 * %_ntb
  %tmp60 = load %class.Tree * * %_root
  %tmp61 = call i1 (%class.Tree *)* @__Print_Tree(%class.Tree * %tmp60)
  store i1 %tmp61, i1 * %_ntb
  %tmp62 = load %class.Tree * * %_root
  %tmp63 = call i32 (%class.Tree *, i32)* @__Search_Tree(%class.Tree * %tmp62, i32 12)
  %tmp64 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp65 = call i32 (i8 *, ...)* @printf(i8 * %tmp64, i32 %tmp63)
  ret i32 0
}
define void @__Tree_Tree(%class.Tree * %this) {
entry:
  %tmp66 = bitcast %class.Tree * %this to [20 x i8 *] *
  %tmp67 = bitcast i1 (%class.Tree *, i32)* @__Init_Tree to i8 *
  %tmp68 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 0
  store i8 * %tmp67, i8 * * %tmp68
  %tmp69 = bitcast i1 (%class.Tree *, %class.Tree *)* @__SetRight_Tree to i8 *
  %tmp70 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 1
  store i8 * %tmp69, i8 * * %tmp70
  %tmp71 = bitcast i1 (%class.Tree *, %class.Tree *)* @__SetLeft_Tree to i8 *
  %tmp72 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 2
  store i8 * %tmp71, i8 * * %tmp72
  %tmp73 = bitcast %class.Tree * (%class.Tree *)* @__GetRight_Tree to i8 *
  %tmp74 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 3
  store i8 * %tmp73, i8 * * %tmp74
  %tmp75 = bitcast %class.Tree * (%class.Tree *)* @__GetLeft_Tree to i8 *
  %tmp76 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 4
  store i8 * %tmp75, i8 * * %tmp76
  %tmp77 = bitcast i32 (%class.Tree *)* @__GetKey_Tree to i8 *
  %tmp78 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 5
  store i8 * %tmp77, i8 * * %tmp78
  %tmp79 = bitcast i1 (%class.Tree *, i32)* @__SetKey_Tree to i8 *
  %tmp80 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 6
  store i8 * %tmp79, i8 * * %tmp80
  %tmp81 = bitcast i1 (%class.Tree *)* @__GetHas_Right_Tree to i8 *
  %tmp82 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 7
  store i8 * %tmp81, i8 * * %tmp82
  %tmp83 = bitcast i1 (%class.Tree *)* @__GetHas_Left_Tree to i8 *
  %tmp84 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 8
  store i8 * %tmp83, i8 * * %tmp84
  %tmp85 = bitcast i1 (%class.Tree *, i1)* @__SetHas_Left_Tree to i8 *
  %tmp86 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 9
  store i8 * %tmp85, i8 * * %tmp86
  %tmp87 = bitcast i1 (%class.Tree *, i1)* @__SetHas_Right_Tree to i8 *
  %tmp88 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 10
  store i8 * %tmp87, i8 * * %tmp88
  %tmp89 = bitcast i1 (%class.Tree *, i32, i32)* @__Compare_Tree to i8 *
  %tmp90 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 11
  store i8 * %tmp89, i8 * * %tmp90
  %tmp91 = bitcast i1 (%class.Tree *, i32)* @__Insert_Tree to i8 *
  %tmp92 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 12
  store i8 * %tmp91, i8 * * %tmp92
  %tmp93 = bitcast i1 (%class.Tree *, i32)* @__Delete_Tree to i8 *
  %tmp94 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 13
  store i8 * %tmp93, i8 * * %tmp94
  %tmp95 = bitcast i1 (%class.Tree *, %class.Tree *, %class.Tree *)* @__Remove_Tree to i8 *
  %tmp96 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 14
  store i8 * %tmp95, i8 * * %tmp96
  %tmp97 = bitcast i1 (%class.Tree *, %class.Tree *, %class.Tree *)* @__RemoveRight_Tree to i8 *
  %tmp98 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 15
  store i8 * %tmp97, i8 * * %tmp98
  %tmp99 = bitcast i1 (%class.Tree *, %class.Tree *, %class.Tree *)* @__RemoveLeft_Tree to i8 *
  %tmp100 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 16
  store i8 * %tmp99, i8 * * %tmp100
  %tmp101 = bitcast i32 (%class.Tree *, i32)* @__Search_Tree to i8 *
  %tmp102 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 17
  store i8 * %tmp101, i8 * * %tmp102
  %tmp103 = bitcast i1 (%class.Tree *)* @__Print_Tree to i8 *
  %tmp104 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 18
  store i8 * %tmp103, i8 * * %tmp104
  %tmp105 = bitcast i1 (%class.Tree *, %class.Tree *)* @__RecPrint_Tree to i8 *
  %tmp106 = getelementptr [20 x i8 *] * %tmp66, i32 0, i32 19
  store i8 * %tmp105, i8 * * %tmp106
  ret void 
}
define i1 @__Init_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %_v_key = alloca i32
  store i32 %v_key, i32 * %_v_key
  %tmp107 = load i32 * %_v_key
  %tmp108 = getelementptr %class.Tree * %this, i32 0, i32 3
  store i32 %tmp107, i32 * %tmp108
  %tmp109 = getelementptr %class.Tree * %this, i32 0, i32 4
  store i1 false, i1 * %tmp109
  %tmp110 = getelementptr %class.Tree * %this, i32 0, i32 5
  store i1 false, i1 * %tmp110
  ret i1 true
}
define i1 @__SetRight_Tree(%class.Tree * %this, %class.Tree * %rn) {
entry:
  %_rn = alloca %class.Tree *
  store %class.Tree * %rn, %class.Tree * * %_rn
  %tmp111 = load %class.Tree * * %_rn
  %tmp112 = getelementptr %class.Tree * %this, i32 0, i32 2
  store %class.Tree * %tmp111, %class.Tree * * %tmp112
  ret i1 true
}
define i1 @__SetLeft_Tree(%class.Tree * %this, %class.Tree * %ln) {
entry:
  %_ln = alloca %class.Tree *
  store %class.Tree * %ln, %class.Tree * * %_ln
  %tmp113 = load %class.Tree * * %_ln
  %tmp114 = getelementptr %class.Tree * %this, i32 0, i32 1
  store %class.Tree * %tmp113, %class.Tree * * %tmp114
  ret i1 true
}
define %class.Tree * @__GetRight_Tree(%class.Tree * %this) {
entry:
  %tmp115 = getelementptr %class.Tree * %this, i32 0, i32 2
  %tmp116 = load %class.Tree * * %tmp115
  ret %class.Tree * %tmp116
}
define %class.Tree * @__GetLeft_Tree(%class.Tree * %this) {
entry:
  %tmp117 = getelementptr %class.Tree * %this, i32 0, i32 1
  %tmp118 = load %class.Tree * * %tmp117
  ret %class.Tree * %tmp118
}
define i32 @__GetKey_Tree(%class.Tree * %this) {
entry:
  %tmp119 = getelementptr %class.Tree * %this, i32 0, i32 3
  %tmp120 = load i32 * %tmp119
  ret i32 %tmp120
}
define i1 @__SetKey_Tree(%class.Tree * %this, i32 %v_key) {
entry:
  %_v_key = alloca i32
  store i32 %v_key, i32 * %_v_key
  %tmp121 = load i32 * %_v_key
  %tmp122 = getelementptr %class.Tree * %this, i32 0, i32 3
  store i32 %tmp121, i32 * %tmp122
  ret i1 true
}
define i1 @__GetHas_Right_Tree(%class.Tree * %this) {
entry:
  %tmp123 = getelementptr %class.Tree * %this, i32 0, i32 5
  %tmp124 = load i1 * %tmp123
  ret i1 %tmp124
}
define i1 @__GetHas_Left_Tree(%class.Tree * %this) {
entry:
  %tmp125 = getelementptr %class.Tree * %this, i32 0, i32 4
  %tmp126 = load i1 * %tmp125
  ret i1 %tmp126
}
define i1 @__SetHas_Left_Tree(%class.Tree * %this, i1 %val) {
entry:
  %_val = alloca i1
  store i1 %val, i1 * %_val
  %tmp127 = load i1 * %_val
  %tmp128 = getelementptr %class.Tree * %this, i32 0, i32 4
  store i1 %tmp127, i1 * %tmp128
  ret i1 true
}
define i1 @__SetHas_Right_Tree(%class.Tree * %this, i1 %val) {
entry:
  %_val = alloca i1
  store i1 %val, i1 * %_val
  %tmp129 = load i1 * %_val
  %tmp130 = getelementptr %class.Tree * %this, i32 0, i32 5
  store i1 %tmp129, i1 * %tmp130
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
  %tmp131 = load i32 * %_num2
  %tmp132 = add i32 %tmp131, 1
  store i32 %tmp132, i32 * %_nti
  %tmp133 = load i32 * %_num1
  %tmp134 = load i32 * %_num2
  %tmp135 = icmp slt i32 %tmp133, %tmp134
  br i1 %tmp135, label %label0, label %label1
label0:
  store i1 false, i1 * %_ntb
  br label %label2
label1:
  %tmp136 = load i32 * %_num1
  %tmp137 = load i32 * %_nti
  %tmp138 = icmp slt i32 %tmp136, %tmp137
  %tmp139 = xor i1 %tmp138, -1
  br i1 %tmp139, label %label3, label %label4
label3:
  store i1 false, i1 * %_ntb
  br label %label5
label4:
  store i1 true, i1 * %_ntb
  br label %label5
label5:
  br label %label2
label2:
  %tmp140 = load i1 * %_ntb
  ret i1 %tmp140
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
  %tmp142 = mul i32 30, 1
  %tmp143 = call i8* @malloc ( i32 %tmp142)
  %tmp141 = bitcast i8* %tmp143 to %class.Tree*
  store %class.Tree * %tmp141, %class.Tree * * %_new_node
  %tmp144 = load %class.Tree * * %_new_node
  %tmp145 = load i32 * %_v_key
  %tmp146 = call i1 (%class.Tree *, i32)* @__Init_Tree(%class.Tree * %tmp144, i32 %tmp145)
  store i1 %tmp146, i1 * %_ntb
  store %class.Tree * %this, %class.Tree * * %_current_node
  store i1 true, i1 * %_cont
  br label %label8
label8:
  %tmp147 = load i1 * %_cont
  br i1 %tmp147, label %label6, label %label7
label6:
  %tmp148 = load %class.Tree * * %_current_node
  %tmp149 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp148)
  store i32 %tmp149, i32 * %_key_aux
  %tmp150 = load i32 * %_v_key
  %tmp151 = load i32 * %_key_aux
  %tmp152 = icmp slt i32 %tmp150, %tmp151
  br i1 %tmp152, label %label9, label %label10
label9:
  %tmp153 = load %class.Tree * * %_current_node
  %tmp154 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp153)
  br i1 %tmp154, label %label12, label %label13
label12:
  %tmp155 = load %class.Tree * * %_current_node
  %tmp156 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp155)
  store %class.Tree * %tmp156, %class.Tree * * %_current_node
  br label %label14
label13:
  store i1 false, i1 * %_cont
  %tmp157 = load %class.Tree * * %_current_node
  %tmp158 = call i1 (%class.Tree *, i1)* @__SetHas_Left_Tree(%class.Tree * %tmp157, i1 true)
  store i1 %tmp158, i1 * %_ntb
  %tmp159 = load %class.Tree * * %_current_node
  %tmp160 = load %class.Tree * * %_new_node
  %tmp161 = call i1 (%class.Tree *, %class.Tree *)* @__SetLeft_Tree(%class.Tree * %tmp159, %class.Tree * %tmp160)
  store i1 %tmp161, i1 * %_ntb
  br label %label14
label14:
  br label %label11
label10:
  %tmp162 = load %class.Tree * * %_current_node
  %tmp163 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp162)
  br i1 %tmp163, label %label15, label %label16
label15:
  %tmp164 = load %class.Tree * * %_current_node
  %tmp165 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp164)
  store %class.Tree * %tmp165, %class.Tree * * %_current_node
  br label %label17
label16:
  store i1 false, i1 * %_cont
  %tmp166 = load %class.Tree * * %_current_node
  %tmp167 = call i1 (%class.Tree *, i1)* @__SetHas_Right_Tree(%class.Tree * %tmp166, i1 true)
  store i1 %tmp167, i1 * %_ntb
  %tmp168 = load %class.Tree * * %_current_node
  %tmp169 = load %class.Tree * * %_new_node
  %tmp170 = call i1 (%class.Tree *, %class.Tree *)* @__SetRight_Tree(%class.Tree * %tmp168, %class.Tree * %tmp169)
  store i1 %tmp170, i1 * %_ntb
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
  %tmp171 = load i1 * %_cont
  br i1 %tmp171, label %label18, label %label19
label18:
  %tmp172 = load %class.Tree * * %_current_node
  %tmp173 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp172)
  store i32 %tmp173, i32 * %_key_aux
  %tmp174 = load i32 * %_v_key
  %tmp175 = load i32 * %_key_aux
  %tmp176 = icmp slt i32 %tmp174, %tmp175
  br i1 %tmp176, label %label21, label %label22
label21:
  %tmp177 = load %class.Tree * * %_current_node
  %tmp178 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp177)
  br i1 %tmp178, label %label24, label %label25
label24:
  %tmp179 = load %class.Tree * * %_current_node
  store %class.Tree * %tmp179, %class.Tree * * %_parent_node
  %tmp180 = load %class.Tree * * %_current_node
  %tmp181 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp180)
  store %class.Tree * %tmp181, %class.Tree * * %_current_node
  br label %label26
label25:
  store i1 false, i1 * %_cont
  br label %label26
label26:
  br label %label23
label22:
  %tmp182 = load i32 * %_key_aux
  %tmp183 = load i32 * %_v_key
  %tmp184 = icmp slt i32 %tmp182, %tmp183
  br i1 %tmp184, label %label27, label %label28
label27:
  %tmp185 = load %class.Tree * * %_current_node
  %tmp186 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp185)
  br i1 %tmp186, label %label30, label %label31
label30:
  %tmp187 = load %class.Tree * * %_current_node
  store %class.Tree * %tmp187, %class.Tree * * %_parent_node
  %tmp188 = load %class.Tree * * %_current_node
  %tmp189 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp188)
  store %class.Tree * %tmp189, %class.Tree * * %_current_node
  br label %label32
label31:
  store i1 false, i1 * %_cont
  br label %label32
label32:
  br label %label29
label28:
  %tmp190 = load i1 * %_is_root
  br i1 %tmp190, label %label33, label %label34
label33:
  %tmp191 = load %class.Tree * * %_current_node
  %tmp192 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp191)
  %tmp193 = xor i1 %tmp192, -1
  %tmp194 = load %class.Tree * * %_current_node
  %tmp195 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp194)
  %tmp196 = xor i1 %tmp195, -1
  %tmp197 = and i1 %tmp193, %tmp196
  br i1 %tmp197, label %label36, label %label37
label36:
  store i1 true, i1 * %_ntb
  br label %label38
label37:
  %tmp198 = load %class.Tree * * %_parent_node
  %tmp199 = load %class.Tree * * %_current_node
  %tmp200 = call i1 (%class.Tree *, %class.Tree *, %class.Tree *)* @__Remove_Tree(%class.Tree * %this, %class.Tree * %tmp198, %class.Tree * %tmp199)
  store i1 %tmp200, i1 * %_ntb
  br label %label38
label38:
  br label %label35
label34:
  %tmp201 = load %class.Tree * * %_parent_node
  %tmp202 = load %class.Tree * * %_current_node
  %tmp203 = call i1 (%class.Tree *, %class.Tree *, %class.Tree *)* @__Remove_Tree(%class.Tree * %this, %class.Tree * %tmp201, %class.Tree * %tmp202)
  store i1 %tmp203, i1 * %_ntb
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
  %tmp204 = load i1 * %_found
  ret i1 %tmp204
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
  %tmp205 = load %class.Tree * * %_c_node
  %tmp206 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp205)
  br i1 %tmp206, label %label39, label %label40
label39:
  %tmp207 = load %class.Tree * * %_p_node
  %tmp208 = load %class.Tree * * %_c_node
  %tmp209 = call i1 (%class.Tree *, %class.Tree *, %class.Tree *)* @__RemoveLeft_Tree(%class.Tree * %this, %class.Tree * %tmp207, %class.Tree * %tmp208)
  store i1 %tmp209, i1 * %_ntb
  br label %label41
label40:
  %tmp210 = load %class.Tree * * %_c_node
  %tmp211 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp210)
  br i1 %tmp211, label %label42, label %label43
label42:
  %tmp212 = load %class.Tree * * %_p_node
  %tmp213 = load %class.Tree * * %_c_node
  %tmp214 = call i1 (%class.Tree *, %class.Tree *, %class.Tree *)* @__RemoveRight_Tree(%class.Tree * %this, %class.Tree * %tmp212, %class.Tree * %tmp213)
  store i1 %tmp214, i1 * %_ntb
  br label %label44
label43:
  %tmp215 = load %class.Tree * * %_c_node
  %tmp216 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp215)
  store i32 %tmp216, i32 * %_auxkey1
  %tmp217 = load %class.Tree * * %_p_node
  %tmp218 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp217)
  %tmp219 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp218)
  store i32 %tmp219, i32 * %_auxkey2
  %tmp220 = load i32 * %_auxkey1
  %tmp221 = load i32 * %_auxkey2
  %tmp222 = call i1 (%class.Tree *, i32, i32)* @__Compare_Tree(%class.Tree * %this, i32 %tmp220, i32 %tmp221)
  br i1 %tmp222, label %label45, label %label46
label45:
  %tmp223 = load %class.Tree * * %_p_node
  %tmp224 = getelementptr %class.Tree * %this, i32 0, i32 6
  %tmp225 = load %class.Tree * * %tmp224
  %tmp226 = call i1 (%class.Tree *, %class.Tree *)* @__SetLeft_Tree(%class.Tree * %tmp223, %class.Tree * %tmp225)
  store i1 %tmp226, i1 * %_ntb
  %tmp227 = load %class.Tree * * %_p_node
  %tmp228 = call i1 (%class.Tree *, i1)* @__SetHas_Left_Tree(%class.Tree * %tmp227, i1 false)
  store i1 %tmp228, i1 * %_ntb
  br label %label47
label46:
  %tmp229 = load %class.Tree * * %_p_node
  %tmp230 = getelementptr %class.Tree * %this, i32 0, i32 6
  %tmp231 = load %class.Tree * * %tmp230
  %tmp232 = call i1 (%class.Tree *, %class.Tree *)* @__SetRight_Tree(%class.Tree * %tmp229, %class.Tree * %tmp231)
  store i1 %tmp232, i1 * %_ntb
  %tmp233 = load %class.Tree * * %_p_node
  %tmp234 = call i1 (%class.Tree *, i1)* @__SetHas_Right_Tree(%class.Tree * %tmp233, i1 false)
  store i1 %tmp234, i1 * %_ntb
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
  %tmp235 = load %class.Tree * * %_c_node
  %tmp236 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp235)
  br i1 %tmp236, label %label48, label %label49
label48:
  %tmp237 = load %class.Tree * * %_c_node
  %tmp238 = load %class.Tree * * %_c_node
  %tmp239 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp238)
  %tmp240 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp239)
  %tmp241 = call i1 (%class.Tree *, i32)* @__SetKey_Tree(%class.Tree * %tmp237, i32 %tmp240)
  store i1 %tmp241, i1 * %_ntb
  %tmp242 = load %class.Tree * * %_c_node
  store %class.Tree * %tmp242, %class.Tree * * %_p_node
  %tmp243 = load %class.Tree * * %_c_node
  %tmp244 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp243)
  store %class.Tree * %tmp244, %class.Tree * * %_c_node
  br label %label50
label49:
  %tmp245 = load %class.Tree * * %_p_node
  %tmp246 = getelementptr %class.Tree * %this, i32 0, i32 6
  %tmp247 = load %class.Tree * * %tmp246
  %tmp248 = call i1 (%class.Tree *, %class.Tree *)* @__SetRight_Tree(%class.Tree * %tmp245, %class.Tree * %tmp247)
  store i1 %tmp248, i1 * %_ntb
  %tmp249 = load %class.Tree * * %_p_node
  %tmp250 = call i1 (%class.Tree *, i1)* @__SetHas_Right_Tree(%class.Tree * %tmp249, i1 false)
  store i1 %tmp250, i1 * %_ntb
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
  %tmp251 = load %class.Tree * * %_c_node
  %tmp252 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp251)
  br i1 %tmp252, label %label51, label %label52
label51:
  %tmp253 = load %class.Tree * * %_c_node
  %tmp254 = load %class.Tree * * %_c_node
  %tmp255 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp254)
  %tmp256 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp255)
  %tmp257 = call i1 (%class.Tree *, i32)* @__SetKey_Tree(%class.Tree * %tmp253, i32 %tmp256)
  store i1 %tmp257, i1 * %_ntb
  %tmp258 = load %class.Tree * * %_c_node
  store %class.Tree * %tmp258, %class.Tree * * %_p_node
  %tmp259 = load %class.Tree * * %_c_node
  %tmp260 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp259)
  store %class.Tree * %tmp260, %class.Tree * * %_c_node
  br label %label53
label52:
  %tmp261 = load %class.Tree * * %_p_node
  %tmp262 = getelementptr %class.Tree * %this, i32 0, i32 6
  %tmp263 = load %class.Tree * * %tmp262
  %tmp264 = call i1 (%class.Tree *, %class.Tree *)* @__SetLeft_Tree(%class.Tree * %tmp261, %class.Tree * %tmp263)
  store i1 %tmp264, i1 * %_ntb
  %tmp265 = load %class.Tree * * %_p_node
  %tmp266 = call i1 (%class.Tree *, i1)* @__SetHas_Left_Tree(%class.Tree * %tmp265, i1 false)
  store i1 %tmp266, i1 * %_ntb
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
  %tmp267 = load i1 * %_cont
  br i1 %tmp267, label %label54, label %label55
label54:
  %tmp268 = load %class.Tree * * %_current_node
  %tmp269 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp268)
  store i32 %tmp269, i32 * %_key_aux
  %tmp270 = load i32 * %_v_key
  %tmp271 = load i32 * %_key_aux
  %tmp272 = icmp slt i32 %tmp270, %tmp271
  br i1 %tmp272, label %label57, label %label58
label57:
  %tmp273 = load %class.Tree * * %_current_node
  %tmp274 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp273)
  br i1 %tmp274, label %label60, label %label61
label60:
  %tmp275 = load %class.Tree * * %_current_node
  %tmp276 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp275)
  store %class.Tree * %tmp276, %class.Tree * * %_current_node
  br label %label62
label61:
  store i1 false, i1 * %_cont
  br label %label62
label62:
  br label %label59
label58:
  %tmp277 = load i32 * %_key_aux
  %tmp278 = load i32 * %_v_key
  %tmp279 = icmp slt i32 %tmp277, %tmp278
  br i1 %tmp279, label %label63, label %label64
label63:
  %tmp280 = load %class.Tree * * %_current_node
  %tmp281 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp280)
  br i1 %tmp281, label %label66, label %label67
label66:
  %tmp282 = load %class.Tree * * %_current_node
  %tmp283 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp282)
  store %class.Tree * %tmp283, %class.Tree * * %_current_node
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
  %tmp284 = load i32 * %_ifound
  ret i32 %tmp284
}
define i1 @__Print_Tree(%class.Tree * %this) {
entry:
  %_current_node = alloca %class.Tree *
  %_ntb = alloca i1
  store %class.Tree * %this, %class.Tree * * %_current_node
  %tmp285 = load %class.Tree * * %_current_node
  %tmp286 = call i1 (%class.Tree *, %class.Tree *)* @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %tmp285)
  store i1 %tmp286, i1 * %_ntb
  ret i1 true
}
define i1 @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %node) {
entry:
  %_node = alloca %class.Tree *
  store %class.Tree * %node, %class.Tree * * %_node
  %_ntb = alloca i1
  %tmp287 = load %class.Tree * * %_node
  %tmp288 = call i1 (%class.Tree *)* @__GetHas_Left_Tree(%class.Tree * %tmp287)
  br i1 %tmp288, label %label69, label %label70
label69:
  %tmp289 = load %class.Tree * * %_node
  %tmp290 = call %class.Tree * (%class.Tree *)* @__GetLeft_Tree(%class.Tree * %tmp289)
  %tmp291 = call i1 (%class.Tree *, %class.Tree *)* @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %tmp290)
  store i1 %tmp291, i1 * %_ntb
  br label %label71
label70:
  store i1 true, i1 * %_ntb
  br label %label71
label71:
  %tmp292 = load %class.Tree * * %_node
  %tmp293 = call i32 (%class.Tree *)* @__GetKey_Tree(%class.Tree * %tmp292)
  %tmp294 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp295 = call i32 (i8 *, ...)* @printf(i8 * %tmp294, i32 %tmp293)
  %tmp296 = load %class.Tree * * %_node
  %tmp297 = call i1 (%class.Tree *)* @__GetHas_Right_Tree(%class.Tree * %tmp296)
  br i1 %tmp297, label %label72, label %label73
label72:
  %tmp298 = load %class.Tree * * %_node
  %tmp299 = call %class.Tree * (%class.Tree *)* @__GetRight_Tree(%class.Tree * %tmp298)
  %tmp300 = call i1 (%class.Tree *, %class.Tree *)* @__RecPrint_Tree(%class.Tree * %this, %class.Tree * %tmp299)
  store i1 %tmp300, i1 * %_ntb
  br label %label74
label73:
  store i1 true, i1 * %_ntb
  br label %label74
label74:
  ret i1 true
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
