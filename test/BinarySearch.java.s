@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.BS = type { i32 *, i32 }
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
define i32 @__Start_BS(%class.BS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %_aux01 = alloca i32
  %_aux02 = alloca i32
  %tmp8 = load i32 * %_sz
  %tmp9 = call i32 (%class.BS *, i32)* @__Init_BS(%class.BS * %this, i32 %tmp8)
  store i32 %tmp9, i32 * %_aux01
  %tmp10 = call i32 (%class.BS *)* @__Print_BS(%class.BS * %this)
  store i32 %tmp10, i32 * %_aux02
  %tmp11 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 8)
  br i1 %tmp11, label %label0, label %label1
label0:
  %tmp12 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp13 = call i32 (i8 *, ...)* @printf(i8 * %tmp12, i32 1)
  br label %label2
label1:
  %tmp14 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp15 = call i32 (i8 *, ...)* @printf(i8 * %tmp14, i32 0)
  br label %label2
label2:
  %tmp16 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 19)
  br i1 %tmp16, label %label3, label %label4
label3:
  %tmp17 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp18 = call i32 (i8 *, ...)* @printf(i8 * %tmp17, i32 1)
  br label %label5
label4:
  %tmp19 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp20 = call i32 (i8 *, ...)* @printf(i8 * %tmp19, i32 0)
  br label %label5
label5:
  %tmp21 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 20)
  br i1 %tmp21, label %label6, label %label7
label6:
  %tmp22 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp23 = call i32 (i8 *, ...)* @printf(i8 * %tmp22, i32 1)
  br label %label8
label7:
  %tmp24 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp25 = call i32 (i8 *, ...)* @printf(i8 * %tmp24, i32 0)
  br label %label8
label8:
  %tmp26 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 21)
  br i1 %tmp26, label %label9, label %label10
label9:
  %tmp27 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp28 = call i32 (i8 *, ...)* @printf(i8 * %tmp27, i32 1)
  br label %label11
label10:
  %tmp29 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp30 = call i32 (i8 *, ...)* @printf(i8 * %tmp29, i32 0)
  br label %label11
label11:
  %tmp31 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 37)
  br i1 %tmp31, label %label12, label %label13
label12:
  %tmp32 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp33 = call i32 (i8 *, ...)* @printf(i8 * %tmp32, i32 1)
  br label %label14
label13:
  %tmp34 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp35 = call i32 (i8 *, ...)* @printf(i8 * %tmp34, i32 0)
  br label %label14
label14:
  %tmp36 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 38)
  br i1 %tmp36, label %label15, label %label16
label15:
  %tmp37 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp38 = call i32 (i8 *, ...)* @printf(i8 * %tmp37, i32 1)
  br label %label17
label16:
  %tmp39 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp40 = call i32 (i8 *, ...)* @printf(i8 * %tmp39, i32 0)
  br label %label17
label17:
  %tmp41 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 39)
  br i1 %tmp41, label %label18, label %label19
label18:
  %tmp42 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp43 = call i32 (i8 *, ...)* @printf(i8 * %tmp42, i32 1)
  br label %label20
label19:
  %tmp44 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp45 = call i32 (i8 *, ...)* @printf(i8 * %tmp44, i32 0)
  br label %label20
label20:
  %tmp46 = call i1 (%class.BS *, i32)* @__Search_BS(%class.BS * %this, i32 50)
  br i1 %tmp46, label %label21, label %label22
label21:
  %tmp47 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp48 = call i32 (i8 *, ...)* @printf(i8 * %tmp47, i32 1)
  br label %label23
label22:
  %tmp49 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp50 = call i32 (i8 *, ...)* @printf(i8 * %tmp49, i32 0)
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
  %tmp51 = getelementptr %class.BS * %this, i32 0, i32 0
  %tmp52 = load i32 * * %tmp51
  %tmp54 = getelementptr i32 * %tmp52, i32 0
  %tmp53 = load i32 * %tmp54
  store i32 %tmp53, i32 * %_right
  %tmp55 = load i32 * %_right
  %tmp56 = sub i32 %tmp55, 1
  store i32 %tmp56, i32 * %_right
  store i32 0, i32 * %_left
  store i1 true, i1 * %_var_cont
  br label %label26
label26:
  %tmp57 = load i1 * %_var_cont
  br i1 %tmp57, label %label24, label %label25
label24:
  %tmp58 = load i32 * %_left
  %tmp59 = load i32 * %_right
  %tmp60 = add i32 %tmp58, %tmp59
  store i32 %tmp60, i32 * %_medium
  %tmp61 = load i32 * %_medium
  %tmp62 = call i32 (%class.BS *, i32)* @__Div_BS(%class.BS * %this, i32 %tmp61)
  store i32 %tmp62, i32 * %_medium
  %tmp63 = load i32 * %_medium
  %tmp64 = add i32 %tmp63, 1
  %tmp65 = getelementptr %class.BS * %this, i32 0, i32 0
  %tmp66 = load i32 * * %tmp65
  %tmp68 = getelementptr i32 * %tmp66, i32 %tmp64
  %tmp67 = load i32 * %tmp68
  store i32 %tmp67, i32 * %_aux01
  %tmp69 = load i32 * %_num
  %tmp70 = load i32 * %_aux01
  %tmp71 = icmp slt i32 %tmp69, %tmp70
  br i1 %tmp71, label %label27, label %label28
label27:
  %tmp72 = load i32 * %_medium
  %tmp73 = sub i32 %tmp72, 1
  store i32 %tmp73, i32 * %_right
  br label %label29
label28:
  %tmp74 = load i32 * %_medium
  %tmp75 = add i32 %tmp74, 1
  store i32 %tmp75, i32 * %_left
  br label %label29
label29:
  %tmp76 = load i32 * %_aux01
  %tmp77 = load i32 * %_num
  %tmp78 = call i1 (%class.BS *, i32, i32)* @__Compare_BS(%class.BS * %this, i32 %tmp76, i32 %tmp77)
  br i1 %tmp78, label %label30, label %label31
label30:
  store i1 false, i1 * %_var_cont
  br label %label32
label31:
  store i1 true, i1 * %_var_cont
  br label %label32
label32:
  %tmp79 = load i32 * %_right
  %tmp80 = load i32 * %_left
  %tmp81 = icmp slt i32 %tmp79, %tmp80
  br i1 %tmp81, label %label33, label %label34
label33:
  store i1 false, i1 * %_var_cont
  br label %label35
label34:
  store i32 0, i32 * %_nt
  br label %label35
label35:
  br label %label26
label25:
  %tmp82 = load i32 * %_aux01
  %tmp83 = load i32 * %_num
  %tmp84 = call i1 (%class.BS *, i32, i32)* @__Compare_BS(%class.BS * %this, i32 %tmp82, i32 %tmp83)
  br i1 %tmp84, label %label36, label %label37
label36:
  store i1 true, i1 * %_bs01
  br label %label38
label37:
  store i1 false, i1 * %_bs01
  br label %label38
label38:
  %tmp85 = load i1 * %_bs01
  ret i1 %tmp85
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
  %tmp86 = load i32 * %_num
  %tmp87 = sub i32 %tmp86, 1
  store i32 %tmp87, i32 * %_aux03
  br label %label41
label41:
  %tmp88 = load i32 * %_count02
  %tmp89 = load i32 * %_aux03
  %tmp90 = icmp slt i32 %tmp88, %tmp89
  br i1 %tmp90, label %label39, label %label40
label39:
  %tmp91 = load i32 * %_count01
  %tmp92 = add i32 %tmp91, 1
  store i32 %tmp92, i32 * %_count01
  %tmp93 = load i32 * %_count02
  %tmp94 = add i32 %tmp93, 2
  store i32 %tmp94, i32 * %_count02
  br label %label41
label40:
  %tmp95 = load i32 * %_count01
  ret i32 %tmp95
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
  %tmp96 = load i32 * %_num2
  %tmp97 = add i32 %tmp96, 1
  store i32 %tmp97, i32 * %_aux02
  %tmp98 = load i32 * %_num1
  %tmp99 = load i32 * %_num2
  %tmp100 = icmp slt i32 %tmp98, %tmp99
  br i1 %tmp100, label %label42, label %label43
label42:
  store i1 false, i1 * %_retval
  br label %label44
label43:
  %tmp101 = load i32 * %_num1
  %tmp102 = load i32 * %_aux02
  %tmp103 = icmp slt i32 %tmp101, %tmp102
  %tmp104 = xor i1 %tmp103, 1
  br i1 %tmp104, label %label45, label %label46
label45:
  store i1 false, i1 * %_retval
  br label %label47
label46:
  store i1 true, i1 * %_retval
  br label %label47
label47:
  br label %label44
label44:
  %tmp105 = load i1 * %_retval
  ret i1 %tmp105
}
define i32 @__Print_BS(%class.BS * %this) {
entry:
  %_j = alloca i32
  store i32 1, i32 * %_j
  br label %label50
label50:
  %tmp106 = load i32 * %_j
  %tmp107 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp108 = load i32 * %tmp107
  %tmp109 = icmp slt i32 %tmp106, %tmp108
  br i1 %tmp109, label %label48, label %label49
label48:
  %tmp110 = load i32 * %_j
  %tmp111 = add i32 %tmp110, 1
  %tmp112 = getelementptr %class.BS * %this, i32 0, i32 0
  %tmp113 = load i32 * * %tmp112
  %tmp115 = getelementptr i32 * %tmp113, i32 %tmp111
  %tmp114 = load i32 * %tmp115
  %tmp116 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp117 = call i32 (i8 *, ...)* @printf(i8 * %tmp116, i32 %tmp114)
  %tmp118 = load i32 * %_j
  %tmp119 = add i32 %tmp118, 1
  store i32 %tmp119, i32 * %_j
  br label %label50
label49:
  %tmp120 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp121 = call i32 (i8 *, ...)* @printf(i8 * %tmp120, i32 99999)
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
  %tmp122 = load i32 * %_sz
  %tmp123 = getelementptr %class.BS * %this, i32 0, i32 1
  store i32 %tmp122, i32 * %tmp123
  %tmp124 = load i32 * %_sz
  %tmp125 = add i32 %tmp124, 1
  %tmp127 = mul i32 4, %tmp125
  %tmp128 = call i8* @malloc ( i32 %tmp127)
  %tmp126 = bitcast i8* %tmp128 to i32*
  store i32 %tmp125, i32 * %tmp126
  %tmp129 = getelementptr %class.BS * %this, i32 0, i32 0
  store i32 * %tmp126, i32 * * %tmp129
  store i32 1, i32 * %_j
  %tmp130 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp131 = load i32 * %tmp130
  %tmp132 = add i32 %tmp131, 1
  store i32 %tmp132, i32 * %_k
  br label %label53
label53:
  %tmp133 = load i32 * %_j
  %tmp134 = getelementptr %class.BS * %this, i32 0, i32 1
  %tmp135 = load i32 * %tmp134
  %tmp136 = icmp slt i32 %tmp133, %tmp135
  br i1 %tmp136, label %label51, label %label52
label51:
  %tmp137 = load i32 * %_j
  %tmp138 = mul i32 2, %tmp137
  store i32 %tmp138, i32 * %_aux01
  %tmp139 = load i32 * %_k
  %tmp140 = sub i32 %tmp139, 3
  store i32 %tmp140, i32 * %_aux02
  %tmp141 = load i32 * %_j
  %tmp142 = add i32 %tmp141, 1
  %tmp145 = getelementptr %class.BS * %this, i32 0, i32 0
  %tmp144 = load i32 * * %tmp145
  %tmp143 = getelementptr i32 * %tmp144, i32 %tmp142
  %tmp146 = load i32 * %_aux01
  %tmp147 = load i32 * %_aux02
  %tmp148 = add i32 %tmp146, %tmp147
  store i32 %tmp148, i32 * %tmp143
  %tmp149 = load i32 * %_j
  %tmp150 = add i32 %tmp149, 1
  store i32 %tmp150, i32 * %_j
  %tmp151 = load i32 * %_k
  %tmp152 = sub i32 %tmp151, 1
  store i32 %tmp152, i32 * %_k
  br label %label53
label52:
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
