@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.QS = type { [4 x i8 *], i32 *, i32 }
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
define void @__QS_QS(%class.QS * %this) {
entry:
  %tmp8 = bitcast %class.QS * %this to [4 x i8 *] *
  %tmp9 = bitcast i32 (%class.QS *, i32)* @__Start_QS to i8 *
  %tmp10 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 0
  store i8 * %tmp9, i8 * * %tmp10
  %tmp11 = bitcast i32 (%class.QS *, i32, i32)* @__Sort_QS to i8 *
  %tmp12 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 1
  store i8 * %tmp11, i8 * * %tmp12
  %tmp13 = bitcast i32 (%class.QS *)* @__Print_QS to i8 *
  %tmp14 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 2
  store i8 * %tmp13, i8 * * %tmp14
  %tmp15 = bitcast i32 (%class.QS *, i32)* @__Init_QS to i8 *
  %tmp16 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 3
  store i8 * %tmp15, i8 * * %tmp16
  ret void 
}
define i32 @__Start_QS(%class.QS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %_aux01 = alloca i32
  %tmp17 = load i32 * %_sz
  %tmp18 = call i32 (%class.QS *, i32)* @__Init_QS(%class.QS * %this, i32 %tmp17)
  store i32 %tmp18, i32 * %_aux01
  %tmp19 = call i32 (%class.QS *)* @__Print_QS(%class.QS * %this)
  store i32 %tmp19, i32 * %_aux01
  %tmp20 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp21 = call i32 (i8 *, ...)* @printf(i8 * %tmp20, i32 9999)
  %tmp22 = getelementptr %class.QS * %this, i32 0, i32 2
  %tmp23 = load i32 * %tmp22
  %tmp24 = sub i32 %tmp23, 1
  store i32 %tmp24, i32 * %_aux01
  %tmp25 = load i32 * %_aux01
  %tmp26 = call i32 (%class.QS *, i32, i32)* @__Sort_QS(%class.QS * %this, i32 0, i32 %tmp25)
  store i32 %tmp26, i32 * %_aux01
  %tmp27 = call i32 (%class.QS *)* @__Print_QS(%class.QS * %this)
  store i32 %tmp27, i32 * %_aux01
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
  %tmp28 = load i32 * %_left
  %tmp29 = load i32 * %_right
  %tmp30 = icmp slt i32 %tmp28, %tmp29
  br i1 %tmp30, label %label0, label %label1
label0:
  %tmp31 = load i32 * %_right
  %tmp32 = add i32 %tmp31, 1
  %tmp33 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp34 = load i32 * * %tmp33
  %tmp36 = getelementptr i32 * %tmp34, i32 %tmp32
  %tmp35 = load i32 * %tmp36
  store i32 %tmp35, i32 * %_v
  %tmp37 = load i32 * %_left
  %tmp38 = sub i32 %tmp37, 1
  store i32 %tmp38, i32 * %_i
  %tmp39 = load i32 * %_right
  store i32 %tmp39, i32 * %_j
  store i1 true, i1 * %_cont01
  br label %label5
label5:
  %tmp40 = load i1 * %_cont01
  br i1 %tmp40, label %label3, label %label4
label3:
  store i1 true, i1 * %_cont02
  br label %label8
label8:
  %tmp41 = load i1 * %_cont02
  br i1 %tmp41, label %label6, label %label7
label6:
  %tmp42 = load i32 * %_i
  %tmp43 = add i32 %tmp42, 1
  store i32 %tmp43, i32 * %_i
  %tmp44 = load i32 * %_i
  %tmp45 = add i32 %tmp44, 1
  %tmp46 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp47 = load i32 * * %tmp46
  %tmp49 = getelementptr i32 * %tmp47, i32 %tmp45
  %tmp48 = load i32 * %tmp49
  store i32 %tmp48, i32 * %_aux03
  %tmp50 = load i32 * %_aux03
  %tmp51 = load i32 * %_v
  %tmp52 = icmp slt i32 %tmp50, %tmp51
  %tmp53 = xor i1 %tmp52, -1
  br i1 %tmp53, label %label9, label %label10
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
  %tmp54 = load i1 * %_cont02
  br i1 %tmp54, label %label12, label %label13
label12:
  %tmp55 = load i32 * %_j
  %tmp56 = sub i32 %tmp55, 1
  store i32 %tmp56, i32 * %_j
  %tmp57 = load i32 * %_j
  %tmp58 = add i32 %tmp57, 1
  %tmp59 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp60 = load i32 * * %tmp59
  %tmp62 = getelementptr i32 * %tmp60, i32 %tmp58
  %tmp61 = load i32 * %tmp62
  store i32 %tmp61, i32 * %_aux03
  %tmp63 = load i32 * %_v
  %tmp64 = load i32 * %_aux03
  %tmp65 = icmp slt i32 %tmp63, %tmp64
  %tmp66 = xor i1 %tmp65, -1
  br i1 %tmp66, label %label15, label %label16
label15:
  store i1 false, i1 * %_cont02
  br label %label17
label16:
  store i1 true, i1 * %_cont02
  br label %label17
label17:
  br label %label14
label13:
  %tmp67 = load i32 * %_i
  %tmp68 = add i32 %tmp67, 1
  %tmp69 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp70 = load i32 * * %tmp69
  %tmp72 = getelementptr i32 * %tmp70, i32 %tmp68
  %tmp71 = load i32 * %tmp72
  store i32 %tmp71, i32 * %_t
  %tmp73 = load i32 * %_i
  %tmp74 = add i32 %tmp73, 1
  %tmp77 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp76 = load i32 * * %tmp77
  %tmp75 = getelementptr i32 * %tmp76, i32 %tmp74
  %tmp78 = load i32 * %_j
  %tmp79 = add i32 %tmp78, 1
  %tmp80 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp81 = load i32 * * %tmp80
  %tmp83 = getelementptr i32 * %tmp81, i32 %tmp79
  %tmp82 = load i32 * %tmp83
  store i32 %tmp82, i32 * %tmp75
  %tmp84 = load i32 * %_j
  %tmp85 = add i32 %tmp84, 1
  %tmp88 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp87 = load i32 * * %tmp88
  %tmp86 = getelementptr i32 * %tmp87, i32 %tmp85
  %tmp89 = load i32 * %_t
  store i32 %tmp89, i32 * %tmp86
  %tmp90 = load i32 * %_j
  %tmp91 = load i32 * %_i
  %tmp92 = add i32 %tmp91, 1
  %tmp93 = icmp slt i32 %tmp90, %tmp92
  br i1 %tmp93, label %label18, label %label19
label18:
  store i1 false, i1 * %_cont01
  br label %label20
label19:
  store i1 true, i1 * %_cont01
  br label %label20
label20:
  br label %label5
label4:
  %tmp94 = load i32 * %_j
  %tmp95 = add i32 %tmp94, 1
  %tmp98 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp97 = load i32 * * %tmp98
  %tmp96 = getelementptr i32 * %tmp97, i32 %tmp95
  %tmp99 = load i32 * %_i
  %tmp100 = add i32 %tmp99, 1
  %tmp101 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp102 = load i32 * * %tmp101
  %tmp104 = getelementptr i32 * %tmp102, i32 %tmp100
  %tmp103 = load i32 * %tmp104
  store i32 %tmp103, i32 * %tmp96
  %tmp105 = load i32 * %_i
  %tmp106 = add i32 %tmp105, 1
  %tmp109 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp108 = load i32 * * %tmp109
  %tmp107 = getelementptr i32 * %tmp108, i32 %tmp106
  %tmp110 = load i32 * %_right
  %tmp111 = add i32 %tmp110, 1
  %tmp112 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp113 = load i32 * * %tmp112
  %tmp115 = getelementptr i32 * %tmp113, i32 %tmp111
  %tmp114 = load i32 * %tmp115
  store i32 %tmp114, i32 * %tmp107
  %tmp116 = load i32 * %_right
  %tmp117 = add i32 %tmp116, 1
  %tmp120 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp119 = load i32 * * %tmp120
  %tmp118 = getelementptr i32 * %tmp119, i32 %tmp117
  %tmp121 = load i32 * %_t
  store i32 %tmp121, i32 * %tmp118
  %tmp122 = load i32 * %_left
  %tmp123 = load i32 * %_i
  %tmp124 = sub i32 %tmp123, 1
  %tmp125 = call i32 (%class.QS *, i32, i32)* @__Sort_QS(%class.QS * %this, i32 %tmp122, i32 %tmp124)
  store i32 %tmp125, i32 * %_nt
  %tmp126 = load i32 * %_i
  %tmp127 = add i32 %tmp126, 1
  %tmp128 = load i32 * %_right
  %tmp129 = call i32 (%class.QS *, i32, i32)* @__Sort_QS(%class.QS * %this, i32 %tmp127, i32 %tmp128)
  store i32 %tmp129, i32 * %_nt
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
  %tmp130 = load i32 * %_j
  %tmp131 = getelementptr %class.QS * %this, i32 0, i32 2
  %tmp132 = load i32 * %tmp131
  %tmp133 = icmp slt i32 %tmp130, %tmp132
  br i1 %tmp133, label %label21, label %label22
label21:
  %tmp134 = load i32 * %_j
  %tmp135 = add i32 %tmp134, 1
  %tmp136 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp137 = load i32 * * %tmp136
  %tmp139 = getelementptr i32 * %tmp137, i32 %tmp135
  %tmp138 = load i32 * %tmp139
  %tmp140 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp141 = call i32 (i8 *, ...)* @printf(i8 * %tmp140, i32 %tmp138)
  %tmp142 = load i32 * %_j
  %tmp143 = add i32 %tmp142, 1
  store i32 %tmp143, i32 * %_j
  br label %label23
label22:
  ret i32 0
}
define i32 @__Init_QS(%class.QS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %tmp144 = load i32 * %_sz
  %tmp145 = getelementptr %class.QS * %this, i32 0, i32 2
  store i32 %tmp144, i32 * %tmp145
  %tmp146 = load i32 * %_sz
  %tmp147 = add i32 %tmp146, 1
  %tmp149 = mul i32 4, %tmp147
  %tmp150 = call i8* @malloc ( i32 %tmp149)
  %tmp148 = bitcast i8* %tmp150 to i32*
  store i32 %tmp147, i32 * %tmp148
  %tmp151 = getelementptr %class.QS * %this, i32 0, i32 1
  store i32 * %tmp148, i32 * * %tmp151
  %tmp154 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp153 = load i32 * * %tmp154
  %tmp152 = getelementptr i32 * %tmp153, i32 1
  store i32 20, i32 * %tmp152
  %tmp157 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp156 = load i32 * * %tmp157
  %tmp155 = getelementptr i32 * %tmp156, i32 2
  store i32 7, i32 * %tmp155
  %tmp160 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp159 = load i32 * * %tmp160
  %tmp158 = getelementptr i32 * %tmp159, i32 3
  store i32 12, i32 * %tmp158
  %tmp163 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp162 = load i32 * * %tmp163
  %tmp161 = getelementptr i32 * %tmp162, i32 4
  store i32 18, i32 * %tmp161
  %tmp166 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp165 = load i32 * * %tmp166
  %tmp164 = getelementptr i32 * %tmp165, i32 5
  store i32 2, i32 * %tmp164
  %tmp169 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp168 = load i32 * * %tmp169
  %tmp167 = getelementptr i32 * %tmp168, i32 6
  store i32 11, i32 * %tmp167
  %tmp172 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp171 = load i32 * * %tmp172
  %tmp170 = getelementptr i32 * %tmp171, i32 7
  store i32 6, i32 * %tmp170
  %tmp175 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp174 = load i32 * * %tmp175
  %tmp173 = getelementptr i32 * %tmp174, i32 8
  store i32 9, i32 * %tmp173
  %tmp178 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp177 = load i32 * * %tmp178
  %tmp176 = getelementptr i32 * %tmp177, i32 9
  store i32 19, i32 * %tmp176
  %tmp181 = getelementptr %class.QS * %this, i32 0, i32 1
  %tmp180 = load i32 * * %tmp181
  %tmp179 = getelementptr i32 * %tmp180, i32 10
  store i32 5, i32 * %tmp179
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
