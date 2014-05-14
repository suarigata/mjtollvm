@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.QS = type { i32 *, i32 }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 12, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.QS*
  %tmp4 = call i32 (%class.QS *, i32)* @__Start_QS(%class.QS * %tmp1, i32 10)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define i32 @__Start_QS(%class.QS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %_aux01 = alloca i32
  %tmp8 = load i32 * %_sz
  %tmp9 = call i32 (%class.QS *, i32)* @__Init_QS(%class.QS * %this, i32 %tmp8)
  store i32 %tmp9, i32 * %_aux01
  %tmp10 = call i32 (%class.QS *)* @__Print_QS(%class.QS * %this)
  store i32 %tmp10, i32 * %_aux01
  %tmp11 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp12 = call i32 (i8 *, ...)* @printf(i8 * %tmp11, i32 9999)
  %tmp13 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp14 = load i32 * %tmp13
  %tmp15 = sub i32 %tmp14, 1
  store i32 %tmp15, i32 * %_aux01
  %tmp16 = load i32 * %_aux01
  %tmp17 = call i32 (%class.QS *, i32, i32)* @__Sort_QS(%class.QS * %this, i32 0, i32 %tmp16)
  store i32 %tmp17, i32 * %_aux01
  %tmp18 = call i32 (%class.QS *)* @__Print_QS(%class.QS * %this)
  store i32 %tmp18, i32 * %_aux01
  ret i32 0
}
define i32 @__Sort_QS(%class.QS * %this, i32 %left, i32 %right) {
entry:
  %_left = alloca i32
  store i32 %left, i32 * %_left
  %_right = alloca i32
  store i32 %right, i32 * %_right
  %_v = alloca i32
  %_i = alloca i32
  %_j = alloca i32
  %_nt = alloca i32
  %_t = alloca i32
  %_cont01 = alloca i1
  %_cont02 = alloca i1
  %_aux03 = alloca i32
  store i32 0, i32 * %_t
  %tmp19 = load i32 * %_left
  %tmp20 = load i32 * %_right
  %tmp21 = icmp slt i32 %tmp19, %tmp20
  br i1 %tmp21, label %label0, label %label1
label0:
  %tmp22 = load i32 * %_right
  %tmp23 = add i32 %tmp22, 1
  %tmp24 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp25 = load i32 * * %tmp24
  %tmp27 = getelementptr i32 * %tmp25, i32 %tmp23
  %tmp26 = load i32 * %tmp27
  store i32 %tmp26, i32 * %_v
  %tmp28 = load i32 * %_left
  %tmp29 = sub i32 %tmp28, 1
  store i32 %tmp29, i32 * %_i
  %tmp30 = load i32 * %_right
  store i32 %tmp30, i32 * %_j
  store i1 true, i1 * %_cont01
  br label %label5
label5:
  %tmp31 = load i1 * %_cont01
  br i1 %tmp31, label %label3, label %label4
label3:
  store i1 true, i1 * %_cont02
  br label %label8
label8:
  %tmp32 = load i1 * %_cont02
  br i1 %tmp32, label %label6, label %label7
label6:
  %tmp33 = load i32 * %_i
  %tmp34 = add i32 %tmp33, 1
  store i32 %tmp34, i32 * %_i
  %tmp35 = load i32 * %_i
  %tmp36 = add i32 %tmp35, 1
  %tmp37 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp38 = load i32 * * %tmp37
  %tmp40 = getelementptr i32 * %tmp38, i32 %tmp36
  %tmp39 = load i32 * %tmp40
  store i32 %tmp39, i32 * %_aux03
  %tmp41 = load i32 * %_aux03
  %tmp42 = load i32 * %_v
  %tmp43 = icmp slt i32 %tmp41, %tmp42
  %tmp44 = xor i1 %tmp43, -1
  br i1 %tmp44, label %label9, label %label10
label9:
  store i1 false, i1 * %_cont02
  br label %label11
label10:
  store i1 true, i1 * %_cont02
  br label %label11
label11:
  br label %label8
label7:
  store i1 true, i1 * %_cont02
  br label %label14
label14:
  %tmp45 = load i1 * %_cont02
  br i1 %tmp45, label %label12, label %label13
label12:
  %tmp46 = load i32 * %_j
  %tmp47 = sub i32 %tmp46, 1
  store i32 %tmp47, i32 * %_j
  %tmp48 = load i32 * %_j
  %tmp49 = add i32 %tmp48, 1
  %tmp50 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp51 = load i32 * * %tmp50
  %tmp53 = getelementptr i32 * %tmp51, i32 %tmp49
  %tmp52 = load i32 * %tmp53
  store i32 %tmp52, i32 * %_aux03
  %tmp54 = load i32 * %_v
  %tmp55 = load i32 * %_aux03
  %tmp56 = icmp slt i32 %tmp54, %tmp55
  %tmp57 = xor i1 %tmp56, -1
  br i1 %tmp57, label %label15, label %label16
label15:
  store i1 false, i1 * %_cont02
  br label %label17
label16:
  store i1 true, i1 * %_cont02
  br label %label17
label17:
  br label %label14
label13:
  %tmp58 = load i32 * %_i
  %tmp59 = add i32 %tmp58, 1
  %tmp60 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp61 = load i32 * * %tmp60
  %tmp63 = getelementptr i32 * %tmp61, i32 %tmp59
  %tmp62 = load i32 * %tmp63
  store i32 %tmp62, i32 * %_t
  %tmp64 = load i32 * %_i
  %tmp65 = add i32 %tmp64, 1
  %tmp68 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp67 = load i32 * * %tmp68
  %tmp66 = getelementptr i32 * %tmp67, i32 %tmp65
  %tmp69 = load i32 * %_j
  %tmp70 = add i32 %tmp69, 1
  %tmp71 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp72 = load i32 * * %tmp71
  %tmp74 = getelementptr i32 * %tmp72, i32 %tmp70
  %tmp73 = load i32 * %tmp74
  store i32 %tmp73, i32 * %tmp66
  %tmp75 = load i32 * %_j
  %tmp76 = add i32 %tmp75, 1
  %tmp79 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp78 = load i32 * * %tmp79
  %tmp77 = getelementptr i32 * %tmp78, i32 %tmp76
  %tmp80 = load i32 * %_t
  store i32 %tmp80, i32 * %tmp77
  %tmp81 = load i32 * %_j
  %tmp82 = load i32 * %_i
  %tmp83 = add i32 %tmp82, 1
  %tmp84 = icmp slt i32 %tmp81, %tmp83
  br i1 %tmp84, label %label18, label %label19
label18:
  store i1 false, i1 * %_cont01
  br label %label20
label19:
  store i1 true, i1 * %_cont01
  br label %label20
label20:
  br label %label5
label4:
  %tmp85 = load i32 * %_j
  %tmp86 = add i32 %tmp85, 1
  %tmp89 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp88 = load i32 * * %tmp89
  %tmp87 = getelementptr i32 * %tmp88, i32 %tmp86
  %tmp90 = load i32 * %_i
  %tmp91 = add i32 %tmp90, 1
  %tmp92 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp93 = load i32 * * %tmp92
  %tmp95 = getelementptr i32 * %tmp93, i32 %tmp91
  %tmp94 = load i32 * %tmp95
  store i32 %tmp94, i32 * %tmp87
  %tmp96 = load i32 * %_i
  %tmp97 = add i32 %tmp96, 1
  %tmp100 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp99 = load i32 * * %tmp100
  %tmp98 = getelementptr i32 * %tmp99, i32 %tmp97
  %tmp101 = load i32 * %_right
  %tmp102 = add i32 %tmp101, 1
  %tmp103 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp104 = load i32 * * %tmp103
  %tmp106 = getelementptr i32 * %tmp104, i32 %tmp102
  %tmp105 = load i32 * %tmp106
  store i32 %tmp105, i32 * %tmp98
  %tmp107 = load i32 * %_right
  %tmp108 = add i32 %tmp107, 1
  %tmp111 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp110 = load i32 * * %tmp111
  %tmp109 = getelementptr i32 * %tmp110, i32 %tmp108
  %tmp112 = load i32 * %_t
  store i32 %tmp112, i32 * %tmp109
  %tmp113 = load i32 * %_left
  %tmp114 = load i32 * %_i
  %tmp115 = sub i32 %tmp114, 1
  %tmp116 = call i32 (%class.QS *, i32, i32)* @__Sort_QS(%class.QS * %this, i32 %tmp113, i32 %tmp115)
  store i32 %tmp116, i32 * %_nt
  %tmp117 = load i32 * %_i
  %tmp118 = add i32 %tmp117, 1
  %tmp119 = load i32 * %_right
  %tmp120 = call i32 (%class.QS *, i32, i32)* @__Sort_QS(%class.QS * %this, i32 %tmp118, i32 %tmp119)
  store i32 %tmp120, i32 * %_nt
  br label %label2
label1:
  store i32 0, i32 * %_nt
  br label %label2
label2:
  ret i32 0
}
define i32 @__Print_QS(%class.QS * %this) {
entry:
  %_j = alloca i32
  store i32 0, i32 * %_j
  br label %label23
label23:
  %tmp121 = load i32 * %_j
  %tmp122 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp123 = load i32 * %tmp122
  %tmp124 = icmp slt i32 %tmp121, %tmp123
  br i1 %tmp124, label %label21, label %label22
label21:
  %tmp125 = load i32 * %_j
  %tmp126 = add i32 %tmp125, 1
  %tmp127 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp128 = load i32 * * %tmp127
  %tmp130 = getelementptr i32 * %tmp128, i32 %tmp126
  %tmp129 = load i32 * %tmp130
  %tmp131 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp132 = call i32 (i8 *, ...)* @printf(i8 * %tmp131, i32 %tmp129)
  %tmp133 = load i32 * %_j
  %tmp134 = add i32 %tmp133, 1
  store i32 %tmp134, i32 * %_j
  br label %label23
label22:
  ret i32 0
}
define i32 @__Init_QS(%class.QS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %tmp135 = load i32 * %_sz
  %tmp136 = getelementptr %class.QS * %this, i32 0, i32 1
  store i32 %tmp135, i32 * %tmp136
  %tmp137 = load i32 * %_sz
  %tmp138 = add i32 %tmp137, 1
  %tmp140 = mul i32 4, %tmp138
  %tmp141 = call i8* @malloc ( i32 %tmp140)
  %tmp139 = bitcast i8* %tmp141 to i32*
  store i32 %tmp138, i32 * %tmp139
  %tmp142 = getelementptr %class.QS * %this, i32 0, i32 0
  store i32 * %tmp139, i32 * * %tmp142
  %tmp145 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp144 = load i32 * * %tmp145
  %tmp143 = getelementptr i32 * %tmp144, i32 1
  store i32 20, i32 * %tmp143
  %tmp148 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp147 = load i32 * * %tmp148
  %tmp146 = getelementptr i32 * %tmp147, i32 2
  store i32 7, i32 * %tmp146
  %tmp151 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp150 = load i32 * * %tmp151
  %tmp149 = getelementptr i32 * %tmp150, i32 3
  store i32 12, i32 * %tmp149
  %tmp154 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp153 = load i32 * * %tmp154
  %tmp152 = getelementptr i32 * %tmp153, i32 4
  store i32 18, i32 * %tmp152
  %tmp157 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp156 = load i32 * * %tmp157
  %tmp155 = getelementptr i32 * %tmp156, i32 5
  store i32 2, i32 * %tmp155
  %tmp160 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp159 = load i32 * * %tmp160
  %tmp158 = getelementptr i32 * %tmp159, i32 6
  store i32 11, i32 * %tmp158
  %tmp163 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp162 = load i32 * * %tmp163
  %tmp161 = getelementptr i32 * %tmp162, i32 7
  store i32 6, i32 * %tmp161
  %tmp166 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp165 = load i32 * * %tmp166
  %tmp164 = getelementptr i32 * %tmp165, i32 8
  store i32 9, i32 * %tmp164
  %tmp169 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp168 = load i32 * * %tmp169
  %tmp167 = getelementptr i32 * %tmp168, i32 9
  store i32 19, i32 * %tmp167
  %tmp172 = getelementptr %class.QS * %this, i32 0, i32 0
  %tmp171 = load i32 * * %tmp172
  %tmp170 = getelementptr i32 * %tmp171, i32 10
  store i32 5, i32 * %tmp170
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
