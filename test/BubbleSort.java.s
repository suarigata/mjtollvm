@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.BBS = type { [4 x i8 *], i32 *, i32 }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 12, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.BBS*
  %tmp4 = call i32 (%class.BBS *, i32)* @__Start_BBS(%class.BBS * %tmp1, i32 10)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define void @__BBS_BBS(%class.BBS * %this) {
entry:
  %tmp8 = bitcast %class.BBS * %this to [4 x i8 *] *
  %tmp9 = bitcast i32 (%class.BBS *, i32)* @__Start_BBS to i8 *
  %tmp10 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 0
  store i8 * %tmp9, i8 * * %tmp10
  %tmp11 = bitcast i32 (%class.BBS *)* @__Sort_BBS to i8 *
  %tmp12 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 1
  store i8 * %tmp11, i8 * * %tmp12
  %tmp13 = bitcast i32 (%class.BBS *)* @__Print_BBS to i8 *
  %tmp14 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 2
  store i8 * %tmp13, i8 * * %tmp14
  %tmp15 = bitcast i32 (%class.BBS *, i32)* @__Init_BBS to i8 *
  %tmp16 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 3
  store i8 * %tmp15, i8 * * %tmp16
  ret void 
}
define i32 @__Start_BBS(%class.BBS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %_aux01 = alloca i32
  %tmp17 = load i32 * %_sz
  %tmp18 = call i32 (%class.BBS *, i32)* @__Init_BBS(%class.BBS * %this, i32 %tmp17)
  store i32 %tmp18, i32 * %_aux01
  %tmp19 = call i32 (%class.BBS *)* @__Print_BBS(%class.BBS * %this)
  store i32 %tmp19, i32 * %_aux01
  %tmp20 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp21 = call i32 (i8 *, ...)* @printf(i8 * %tmp20, i32 99999)
  %tmp22 = call i32 (%class.BBS *)* @__Sort_BBS(%class.BBS * %this)
  store i32 %tmp22, i32 * %_aux01
  %tmp23 = call i32 (%class.BBS *)* @__Print_BBS(%class.BBS * %this)
  store i32 %tmp23, i32 * %_aux01
  ret i32 0
}
define i32 @__Sort_BBS(%class.BBS * %this) {
entry:
  %_nt = alloca i32
  %_i = alloca i32
  %_aux02 = alloca i32
  %_aux04 = alloca i32
  %_aux05 = alloca i32
  %_aux06 = alloca i32
  %_aux07 = alloca i32
  %_j = alloca i32
  %_t = alloca i32
  %tmp24 = getelementptr %class.BBS * %this, i32 0, i32 2
  %tmp25 = load i32 * %tmp24
  %tmp26 = sub i32 %tmp25, 1
  store i32 %tmp26, i32 * %_i
  %tmp27 = sub i32 0, 1
  store i32 %tmp27, i32 * %_aux02
  br label %label2
label2:
  %tmp28 = load i32 * %_aux02
  %tmp29 = load i32 * %_i
  %tmp30 = icmp slt i32 %tmp28, %tmp29
  br i1 %tmp30, label %label0, label %label1
label0:
  store i32 1, i32 * %_j
  br label %label5
label5:
  %tmp31 = load i32 * %_j
  %tmp32 = load i32 * %_i
  %tmp33 = add i32 %tmp32, 1
  %tmp34 = icmp slt i32 %tmp31, %tmp33
  br i1 %tmp34, label %label3, label %label4
label3:
  %tmp35 = load i32 * %_j
  %tmp36 = sub i32 %tmp35, 1
  store i32 %tmp36, i32 * %_aux07
  %tmp37 = load i32 * %_aux07
  %tmp38 = add i32 %tmp37, 1
  %tmp39 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp40 = load i32 * * %tmp39
  %tmp42 = getelementptr i32 * %tmp40, i32 %tmp38
  %tmp41 = load i32 * %tmp42
  store i32 %tmp41, i32 * %_aux04
  %tmp43 = load i32 * %_j
  %tmp44 = add i32 %tmp43, 1
  %tmp45 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp46 = load i32 * * %tmp45
  %tmp48 = getelementptr i32 * %tmp46, i32 %tmp44
  %tmp47 = load i32 * %tmp48
  store i32 %tmp47, i32 * %_aux05
  %tmp49 = load i32 * %_aux05
  %tmp50 = load i32 * %_aux04
  %tmp51 = icmp slt i32 %tmp49, %tmp50
  br i1 %tmp51, label %label6, label %label7
label6:
  %tmp52 = load i32 * %_j
  %tmp53 = sub i32 %tmp52, 1
  store i32 %tmp53, i32 * %_aux06
  %tmp54 = load i32 * %_aux06
  %tmp55 = add i32 %tmp54, 1
  %tmp56 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp57 = load i32 * * %tmp56
  %tmp59 = getelementptr i32 * %tmp57, i32 %tmp55
  %tmp58 = load i32 * %tmp59
  store i32 %tmp58, i32 * %_t
  %tmp60 = load i32 * %_aux06
  %tmp61 = add i32 %tmp60, 1
  %tmp64 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp63 = load i32 * * %tmp64
  %tmp62 = getelementptr i32 * %tmp63, i32 %tmp61
  %tmp65 = load i32 * %_j
  %tmp66 = add i32 %tmp65, 1
  %tmp67 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp68 = load i32 * * %tmp67
  %tmp70 = getelementptr i32 * %tmp68, i32 %tmp66
  %tmp69 = load i32 * %tmp70
  store i32 %tmp69, i32 * %tmp62
  %tmp71 = load i32 * %_j
  %tmp72 = add i32 %tmp71, 1
  %tmp75 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp74 = load i32 * * %tmp75
  %tmp73 = getelementptr i32 * %tmp74, i32 %tmp72
  %tmp76 = load i32 * %_t
  store i32 %tmp76, i32 * %tmp73
  br label %label8
label7:
  store i32 0, i32 * %_nt
  br label %label8
label8:
  %tmp77 = load i32 * %_j
  %tmp78 = add i32 %tmp77, 1
  store i32 %tmp78, i32 * %_j
  br label %label5
label4:
  %tmp79 = load i32 * %_i
  %tmp80 = sub i32 %tmp79, 1
  store i32 %tmp80, i32 * %_i
  br label %label2
label1:
  ret i32 0
}
define i32 @__Print_BBS(%class.BBS * %this) {
entry:
  %_j = alloca i32
  store i32 0, i32 * %_j
  br label %label11
label11:
  %tmp81 = load i32 * %_j
  %tmp82 = getelementptr %class.BBS * %this, i32 0, i32 2
  %tmp83 = load i32 * %tmp82
  %tmp84 = icmp slt i32 %tmp81, %tmp83
  br i1 %tmp84, label %label9, label %label10
label9:
  %tmp85 = load i32 * %_j
  %tmp86 = add i32 %tmp85, 1
  %tmp87 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp88 = load i32 * * %tmp87
  %tmp90 = getelementptr i32 * %tmp88, i32 %tmp86
  %tmp89 = load i32 * %tmp90
  %tmp91 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp92 = call i32 (i8 *, ...)* @printf(i8 * %tmp91, i32 %tmp89)
  %tmp93 = load i32 * %_j
  %tmp94 = add i32 %tmp93, 1
  store i32 %tmp94, i32 * %_j
  br label %label11
label10:
  ret i32 0
}
define i32 @__Init_BBS(%class.BBS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %tmp95 = load i32 * %_sz
  %tmp96 = getelementptr %class.BBS * %this, i32 0, i32 2
  store i32 %tmp95, i32 * %tmp96
  %tmp97 = load i32 * %_sz
  %tmp98 = add i32 %tmp97, 1
  %tmp100 = mul i32 4, %tmp98
  %tmp101 = call i8* @malloc ( i32 %tmp100)
  %tmp99 = bitcast i8* %tmp101 to i32*
  store i32 %tmp98, i32 * %tmp99
  %tmp102 = getelementptr %class.BBS * %this, i32 0, i32 1
  store i32 * %tmp99, i32 * * %tmp102
  %tmp105 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp104 = load i32 * * %tmp105
  %tmp103 = getelementptr i32 * %tmp104, i32 1
  store i32 20, i32 * %tmp103
  %tmp108 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp107 = load i32 * * %tmp108
  %tmp106 = getelementptr i32 * %tmp107, i32 2
  store i32 7, i32 * %tmp106
  %tmp111 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp110 = load i32 * * %tmp111
  %tmp109 = getelementptr i32 * %tmp110, i32 3
  store i32 12, i32 * %tmp109
  %tmp114 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp113 = load i32 * * %tmp114
  %tmp112 = getelementptr i32 * %tmp113, i32 4
  store i32 18, i32 * %tmp112
  %tmp117 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp116 = load i32 * * %tmp117
  %tmp115 = getelementptr i32 * %tmp116, i32 5
  store i32 2, i32 * %tmp115
  %tmp120 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp119 = load i32 * * %tmp120
  %tmp118 = getelementptr i32 * %tmp119, i32 6
  store i32 11, i32 * %tmp118
  %tmp123 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp122 = load i32 * * %tmp123
  %tmp121 = getelementptr i32 * %tmp122, i32 7
  store i32 6, i32 * %tmp121
  %tmp126 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp125 = load i32 * * %tmp126
  %tmp124 = getelementptr i32 * %tmp125, i32 8
  store i32 9, i32 * %tmp124
  %tmp129 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp128 = load i32 * * %tmp129
  %tmp127 = getelementptr i32 * %tmp128, i32 9
  store i32 19, i32 * %tmp127
  %tmp132 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp131 = load i32 * * %tmp132
  %tmp130 = getelementptr i32 * %tmp131, i32 10
  store i32 5, i32 * %tmp130
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
