@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.BS = type { [6 x i8 *], i32 *, i32 }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 12, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.BS*
  %tmp4 = call i32 (%class.BS *, i32)* @__Start_BS(%class.BS * %tmp1, i32 20)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define void @__BS_BS(%class.BS * %this) {
entry:
  %tmp8 = bitcast %class.BS * %this to [6 x i8 *] *
  %tmp9 = bitcast i32 (%class.BS *, i32)* @__Start_BS to i8 *
  %tmp10 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 0
  store i8 * %tmp9, i8 * * %tmp10
  %tmp11 = bitcast i1 (%class.BS *, i32)* @__Search_BS to i8 *
  %tmp12 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 1
  store i8 * %tmp11, i8 * * %tmp12
  %tmp13 = bitcast i32 (%class.BS *, i32)* @__Div_BS to i8 *
  %tmp14 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 2
  store i8 * %tmp13, i8 * * %tmp14
  %tmp15 = bitcast i1 (%class.BS *, i32, i32)* @__Compare_BS to i8 *
  %tmp16 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 3
  store i8 * %tmp15, i8 * * %tmp16
  %tmp17 = bitcast i32 (%class.BS *)* @__Print_BS to i8 *
  %tmp18 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 4
  store i8 * %tmp17, i8 * * %tmp18
  %tmp19 = bitcast i32 (%class.BS *, i32)* @__Init_BS to i8 *
  %tmp20 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 5
  store i8 * %tmp19, i8 * * %tmp20
  ret void 
}
define i32 @__Start_BS(%class.BS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %_aux01 = alloca i32
  %_aux02 = alloca i32
  %tmp21 = load i32 * %_sz
  %tmp22 = call i32 (%class.BS *, i32)* @__Init_BS(%class.BS * %this, i32 %tmp21)
  store i32 %tmp22, i32 * %_aux01
  %tmp23 = call i32 (%class.BS *)* @__Print_BS(%class.BS * %this)
  store i32 %tmp23, i32 * %_aux02
  %tmp24 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 8)
  br i1 %tmp24, label %label0, label %label1
label0:
  %tmp25 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp26 = call i32 (i8 *, ...)* @printf(i8 * %tmp25, i32 1)
  br label %label2
label1:
  %tmp27 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp28 = call i32 (i8 *, ...)* @printf(i8 * %tmp27, i32 0)
  br label %label2
label2:
  %tmp29 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 19)
  br i1 %tmp29, label %label3, label %label4
label3:
  %tmp30 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp31 = call i32 (i8 *, ...)* @printf(i8 * %tmp30, i32 1)
  br label %label5
label4:
  %tmp32 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp33 = call i32 (i8 *, ...)* @printf(i8 * %tmp32, i32 0)
  br label %label5
label5:
  %tmp34 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 20)
  br i1 %tmp34, label %label6, label %label7
label6:
  %tmp35 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp36 = call i32 (i8 *, ...)* @printf(i8 * %tmp35, i32 1)
  br label %label8
label7:
  %tmp37 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp38 = call i32 (i8 *, ...)* @printf(i8 * %tmp37, i32 0)
  br label %label8
label8:
  %tmp39 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 21)
  br i1 %tmp39, label %label9, label %label10
label9:
  %tmp40 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp41 = call i32 (i8 *, ...)* @printf(i8 * %tmp40, i32 1)
  br label %label11
label10:
  %tmp42 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp43 = call i32 (i8 *, ...)* @printf(i8 * %tmp42, i32 0)
  br label %label11
label11:
  %tmp44 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 37)
  br i1 %tmp44, label %label12, label %label13
label12:
  %tmp45 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp46 = call i32 (i8 *, ...)* @printf(i8 * %tmp45, i32 1)
  br label %label14
label13:
  %tmp47 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp48 = call i32 (i8 *, ...)* @printf(i8 * %tmp47, i32 0)
  br label %label14
label14:
  %tmp49 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 38)
  br i1 %tmp49, label %label15, label %label16
label15:
  %tmp50 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp51 = call i32 (i8 *, ...)* @printf(i8 * %tmp50, i32 1)
  br label %label17
label16:
  %tmp52 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp53 = call i32 (i8 *, ...)* @printf(i8 * %tmp52, i32 0)
  br label %label17
label17:
  %tmp54 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 39)
  br i1 %tmp54, label %label18, label %label19
label18:
  %tmp55 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp56 = call i32 (i8 *, ...)* @printf(i8 * %tmp55, i32 1)
  br label %label20
label19:
  %tmp57 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp58 = call i32 (i8 *, ...)* @printf(i8 * %tmp57, i32 0)
  br label %label20
label20:
  %tmp59 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 50)
  br i1 %tmp59, label %label21, label %label22
label21:
  %tmp60 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp61 = call i32 (i8 *, ...)* @printf(i8 * %tmp60, i32 1)
  br label %label23
label22:
  %tmp62 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp63 = call i32 (i8 *, ...)* @printf(i8 * %tmp62, i32 0)
  br label %label23
label23:
  ret i32 999
}
define i1 @__Search_BS(%class.BS * %this, i32 %num) {
entry:
  %_num = alloca i32
  store i32 %num, i32 * %_num
  %_bs01 = alloca i1
  %_right = alloca i32
  %_left = alloca i32
  %_var_cont = alloca i1
  %_medium = alloca i32
  %_aux01 = alloca i32
  %_nt = alloca i32
  store i32 0, i32 * %_aux01
  store i1 false, i1 * %_bs01
  %tmp64 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp65 = load i32 * * %tmp64
  %tmp67 = getelementptr i32 * %tmp65, i32 0
  %tmp66 = load i32 * %tmp67
  store i32 %tmp66, i32 * %_right
  %tmp68 = load i32 * %_right
  %tmp69 = sub i32 %tmp68, 1
  store i32 %tmp69, i32 * %_right
  store i32 0, i32 * %_left
  store i1 true, i1 * %_var_cont
  br label %label26
label26:
  %tmp70 = load i1 * %_var_cont
  br i1 %tmp70, label %label24, label %label25
label24:
  %tmp71 = load i32 * %_left
  %tmp72 = load i32 * %_right
  %tmp73 = add i32 %tmp71, %tmp72
  store i32 %tmp73, i32 * %_medium
  %tmp74 = load i32 * %_medium
  %tmp75 = call i32 (%class.BS *, i32)* @__Div_BS(%class.BS * %this, i32 %tmp74)
  store i32 %tmp75, i32 * %_medium
  %tmp76 = load i32 * %_medium
  %tmp77 = add i32 %tmp76, 1
  %tmp78 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp79 = load i32 * * %tmp78
  %tmp81 = getelementptr i32 * %tmp79, i32 %tmp77
  %tmp80 = load i32 * %tmp81
  store i32 %tmp80, i32 * %_aux01
  %tmp82 = load i32 * %_num
  %tmp83 = load i32 * %_aux01
  %tmp84 = icmp slt i32 %tmp82, %tmp83
  br i1 %tmp84, label %label27, label %label28
label27:
  %tmp85 = load i32 * %_medium
  %tmp86 = sub i32 %tmp85, 1
  store i32 %tmp86, i32 * %_right
  br label %label29
label28:
  %tmp87 = load i32 * %_medium
  %tmp88 = add i32 %tmp87, 1
  store i32 %tmp88, i32 * %_left
  br label %label29
label29:
  %tmp89 = load i32 * %_aux01
  %tmp90 = load i32 * %_num
  %tmp91 = call i1 (%class.BS *, i32, i32)* @__Compare_BS(%class.BS * %this, i32 %tmp89, i32 %tmp90)
  br i1 %tmp91, label %label30, label %label31
label30:
  store i1 false, i1 * %_var_cont
  br label %label32
label31:
  store i1 true, i1 * %_var_cont
  br label %label32
label32:
  %tmp92 = load i32 * %_right
  %tmp93 = load i32 * %_left
  %tmp94 = icmp slt i32 %tmp92, %tmp93
  br i1 %tmp94, label %label33, label %label34
label33:
  store i1 false, i1 * %_var_cont
  br label %label35
label34:
  store i32 0, i32 * %_nt
  br label %label35
label35:
  br label %label26
label25:
  %tmp95 = load i32 * %_aux01
  %tmp96 = load i32 * %_num
  %tmp97 = call i1 (%class.BS *, i32, i32)* @__Compare_BS(%class.BS * %this, i32 %tmp95, i32 %tmp96)
  br i1 %tmp97, label %label36, label %label37
label36:
  store i1 true, i1 * %_bs01
  br label %label38
label37:
  store i1 false, i1 * %_bs01
  br label %label38
label38:
  %tmp98 = load i1 * %_bs01
  ret i1 %tmp98
}
define i32 @__Div_BS(%class.BS * %this, i32 %num) {
entry:
  %_num = alloca i32
  store i32 %num, i32 * %_num
  %_count01 = alloca i32
  %_count02 = alloca i32
  %_aux03 = alloca i32
  store i32 0, i32 * %_count01
  store i32 0, i32 * %_count02
  %tmp99 = load i32 * %_num
  %tmp100 = sub i32 %tmp99, 1
  store i32 %tmp100, i32 * %_aux03
  br label %label41
label41:
  %tmp101 = load i32 * %_count02
  %tmp102 = load i32 * %_aux03
  %tmp103 = icmp slt i32 %tmp101, %tmp102
  br i1 %tmp103, label %label39, label %label40
label39:
  %tmp104 = load i32 * %_count01
  %tmp105 = add i32 %tmp104, 1
  store i32 %tmp105, i32 * %_count01
  %tmp106 = load i32 * %_count02
  %tmp107 = add i32 %tmp106, 2
  store i32 %tmp107, i32 * %_count02
  br label %label41
label40:
  %tmp108 = load i32 * %_count01
  ret i32 %tmp108
}
define i1 @__Compare_BS(%class.BS * %this, i32 %num1, i32 %num2) {
entry:
  %_num1 = alloca i32
  store i32 %num1, i32 * %_num1
  %_num2 = alloca i32
  store i32 %num2, i32 * %_num2
  %_retval = alloca i1
  %_aux02 = alloca i32
  store i1 false, i1 * %_retval
  %tmp109 = load i32 * %_num2
  %tmp110 = add i32 %tmp109, 1
  store i32 %tmp110, i32 * %_aux02
  %tmp111 = load i32 * %_num1
  %tmp112 = load i32 * %_num2
  %tmp113 = icmp slt i32 %tmp111, %tmp112
  br i1 %tmp113, label %label42, label %label43
label42:
  store i1 false, i1 * %_retval
  br label %label44
label43:
  %tmp114 = load i32 * %_num1
  %tmp115 = load i32 * %_aux02
  %tmp116 = icmp slt i32 %tmp114, %tmp115
  %tmp117 = xor i1 %tmp116, -1
  br i1 %tmp117, label %label45, label %label46
label45:
  store i1 false, i1 * %_retval
  br label %label47
label46:
  store i1 true, i1 * %_retval
  br label %label47
label47:
  br label %label44
label44:
  %tmp118 = load i1 * %_retval
  ret i1 %tmp118
}
define i32 @__Print_BS(%class.BS * %this) {
entry:
  %_j = alloca i32
  store i32 1, i32 * %_j
  br label %label50
label50:
  %tmp119 = load i32 * %_j
  %tmp120 = getelementptr %class.BS * %this, i32 0, i32 2
  %tmp121 = load i32 * %tmp120
  %tmp122 = icmp slt i32 %tmp119, %tmp121
  br i1 %tmp122, label %label48, label %label49
label48:
  %tmp123 = load i32 * %_j
  %tmp124 = add i32 %tmp123, 1
  %tmp125 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp126 = load i32 * * %tmp125
  %tmp128 = getelementptr i32 * %tmp126, i32 %tmp124
  %tmp127 = load i32 * %tmp128
  %tmp129 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp130 = call i32 (i8 *, ...)* @printf(i8 * %tmp129, i32 %tmp127)
  %tmp131 = load i32 * %_j
  %tmp132 = add i32 %tmp131, 1
  store i32 %tmp132, i32 * %_j
  br label %label50
label49:
  %tmp133 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp134 = call i32 (i8 *, ...)* @printf(i8 * %tmp133, i32 99999)
  ret i32 0
}
define i32 @__Init_BS(%class.BS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %_j = alloca i32
  %_k = alloca i32
  %_aux02 = alloca i32
  %_aux01 = alloca i32
  %tmp135 = load i32 * %_sz
  %tmp136 = getelementptr %class.BS * %this, i32 0, i32 2
  store i32 %tmp135, i32 * %tmp136
  %tmp137 = load i32 * %_sz
  %tmp138 = add i32 %tmp137, 1
  %tmp140 = mul i32 4, %tmp138
  %tmp141 = call i8* @malloc ( i32 %tmp140)
  %tmp139 = bitcast i8* %tmp141 to i32*
  store i32 %tmp138, i32 * %tmp139
  %tmp142 = getelementptr %class.BS * %this, i32 0, i32 1
  store i32 * %tmp139, i32 * * %tmp142
  store i32 1, i32 * %_j
  %tmp143 = getelementptr %class.BS * %this, i32 0, i32 2
  %tmp144 = load i32 * %tmp143
  %tmp145 = add i32 %tmp144, 1
  store i32 %tmp145, i32 * %_k
  br label %label53
label53:
  %tmp146 = load i32 * %_j
  %tmp147 = getelementptr %class.BS * %this, i32 0, i32 2
  %tmp148 = load i32 * %tmp147
  %tmp149 = icmp slt i32 %tmp146, %tmp148
  br i1 %tmp149, label %label51, label %label52
label51:
  %tmp150 = load i32 * %_j
  %tmp151 = mul i32 2, %tmp150
  store i32 %tmp151, i32 * %_aux01
  %tmp152 = load i32 * %_k
  %tmp153 = sub i32 %tmp152, 3
  store i32 %tmp153, i32 * %_aux02
  %tmp154 = load i32 * %_j
  %tmp155 = add i32 %tmp154, 1
  %tmp158 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp157 = load i32 * * %tmp158
  %tmp156 = getelementptr i32 * %tmp157, i32 %tmp155
  %tmp159 = load i32 * %_aux01
  %tmp160 = load i32 * %_aux02
  %tmp161 = add i32 %tmp159, %tmp160
  store i32 %tmp161, i32 * %tmp156
  %tmp162 = load i32 * %_j
  %tmp163 = add i32 %tmp162, 1
  store i32 %tmp163, i32 * %_j
  %tmp164 = load i32 * %_k
  %tmp165 = sub i32 %tmp164, 1
  store i32 %tmp165, i32 * %_k
  br label %label53
label52:
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
