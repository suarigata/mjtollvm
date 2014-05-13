@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.BBS = type { i32 *, i32 }
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
define i32 @__Start_BBS(%class.BBS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %_aux01 = alloca i32
  %tmp8 = load i32 * %_sz
  %tmp9 = call i32 (%class.BBS *, i32)* @__Init_BBS(%class.BBS * %this, i32 %tmp8)
  store i32 %tmp9, i32 * %_aux01
  %tmp10 = call i32 (%class.BBS *)* @__Print_BBS(%class.BBS * %this)
  store i32 %tmp10, i32 * %_aux01
  %tmp11 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp12 = call i32 (i8 *, ...)* @printf(i8 * %tmp11, i32 99999)
  %tmp13 = call i32 (%class.BBS *)* @__Sort_BBS(%class.BBS * %this)
  store i32 %tmp13, i32 * %_aux01
  %tmp14 = call i32 (%class.BBS *)* @__Print_BBS(%class.BBS * %this)
  store i32 %tmp14, i32 * %_aux01
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
  %tmp15 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp16 = load i32 * %tmp15
  %tmp17 = sub i32 %tmp16, 1
  store i32 %tmp17, i32 * %_i
  %tmp18 = sub i32 0, 1
  store i32 %tmp18, i32 * %_aux02
  br label %label2
label2:
  %tmp19 = load i32 * %_aux02
  %tmp20 = load i32 * %_i
  %tmp21 = icmp slt i32 %tmp19, %tmp20
  br i1 %tmp21, label %label0, label %label1
label0:
  store i32 1, i32 * %_j
  br label %label5
label5:
  %tmp22 = load i32 * %_j
  %tmp23 = load i32 * %_i
  %tmp24 = add i32 %tmp23, 1
  %tmp25 = icmp slt i32 %tmp22, %tmp24
  br i1 %tmp25, label %label3, label %label4
label3:
  %tmp26 = load i32 * %_j
  %tmp27 = sub i32 %tmp26, 1
  store i32 %tmp27, i32 * %_aux07
  %tmp28 = load i32 * %_aux07
  %tmp29 = add i32 %tmp28, 1
  %tmp30 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp31 = load i32 * * %tmp30
  %tmp33 = getelementptr i32 * %tmp31, i32 %tmp29
  %tmp32 = load i32 * %tmp33
  store i32 %tmp32, i32 * %_aux04
  %tmp34 = load i32 * %_j
  %tmp35 = add i32 %tmp34, 1
  %tmp36 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp37 = load i32 * * %tmp36
  %tmp39 = getelementptr i32 * %tmp37, i32 %tmp35
  %tmp38 = load i32 * %tmp39
  store i32 %tmp38, i32 * %_aux05
  %tmp40 = load i32 * %_aux05
  %tmp41 = load i32 * %_aux04
  %tmp42 = icmp slt i32 %tmp40, %tmp41
  br i1 %tmp42, label %label6, label %label7
label6:
  %tmp43 = load i32 * %_j
  %tmp44 = sub i32 %tmp43, 1
  store i32 %tmp44, i32 * %_aux06
  %tmp45 = load i32 * %_aux06
  %tmp46 = add i32 %tmp45, 1
  %tmp47 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp48 = load i32 * * %tmp47
  %tmp50 = getelementptr i32 * %tmp48, i32 %tmp46
  %tmp49 = load i32 * %tmp50
  store i32 %tmp49, i32 * %_t
  %tmp51 = load i32 * %_aux06
  %tmp52 = add i32 %tmp51, 1
  %tmp55 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp54 = load i32 * * %tmp55
  %tmp53 = getelementptr i32 * %tmp54, i32 %tmp52
  %tmp56 = load i32 * %_j
  %tmp57 = add i32 %tmp56, 1
  %tmp58 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp59 = load i32 * * %tmp58
  %tmp61 = getelementptr i32 * %tmp59, i32 %tmp57
  %tmp60 = load i32 * %tmp61
  store i32 %tmp60, i32 * %tmp53
  %tmp62 = load i32 * %_j
  %tmp63 = add i32 %tmp62, 1
  %tmp66 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp65 = load i32 * * %tmp66
  %tmp64 = getelementptr i32 * %tmp65, i32 %tmp63
  %tmp67 = load i32 * %_t
  store i32 %tmp67, i32 * %tmp64
  br label %label8
label7:
  store i32 0, i32 * %_nt
  br label %label8
label8:
  %tmp68 = load i32 * %_j
  %tmp69 = add i32 %tmp68, 1
  store i32 %tmp69, i32 * %_j
  br label %label5
label4:
  %tmp70 = load i32 * %_i
  %tmp71 = sub i32 %tmp70, 1
  store i32 %tmp71, i32 * %_i
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
  %tmp72 = load i32 * %_j
  %tmp73 = getelementptr %class.BBS * %this, i32 0, i32 1
  %tmp74 = load i32 * %tmp73
  %tmp75 = icmp slt i32 %tmp72, %tmp74
  br i1 %tmp75, label %label9, label %label10
label9:
  %tmp76 = load i32 * %_j
  %tmp77 = add i32 %tmp76, 1
  %tmp78 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp79 = load i32 * * %tmp78
  %tmp81 = getelementptr i32 * %tmp79, i32 %tmp77
  %tmp80 = load i32 * %tmp81
  %tmp82 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp83 = call i32 (i8 *, ...)* @printf(i8 * %tmp82, i32 %tmp80)
  %tmp84 = load i32 * %_j
  %tmp85 = add i32 %tmp84, 1
  store i32 %tmp85, i32 * %_j
  br label %label11
label10:
  ret i32 0
}
define i32 @__Init_BBS(%class.BBS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %tmp86 = load i32 * %_sz
  %tmp87 = getelementptr %class.BBS * %this, i32 0, i32 1
  store i32 %tmp86, i32 * %tmp87
  %tmp88 = load i32 * %_sz
  %tmp89 = add i32 %tmp88, 1
  %tmp91 = mul i32 4, %tmp89
  %tmp92 = call i8* @malloc ( i32 %tmp91)
  %tmp90 = bitcast i8* %tmp92 to i32*
  store i32 %tmp89, i32 * %tmp90
  %tmp93 = getelementptr %class.BBS * %this, i32 0, i32 0
  store i32 * %tmp90, i32 * * %tmp93
  %tmp96 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp95 = load i32 * * %tmp96
  %tmp94 = getelementptr i32 * %tmp95, i32 1
  store i32 20, i32 * %tmp94
  %tmp99 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp98 = load i32 * * %tmp99
  %tmp97 = getelementptr i32 * %tmp98, i32 2
  store i32 7, i32 * %tmp97
  %tmp102 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp101 = load i32 * * %tmp102
  %tmp100 = getelementptr i32 * %tmp101, i32 3
  store i32 12, i32 * %tmp100
  %tmp105 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp104 = load i32 * * %tmp105
  %tmp103 = getelementptr i32 * %tmp104, i32 4
  store i32 18, i32 * %tmp103
  %tmp108 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp107 = load i32 * * %tmp108
  %tmp106 = getelementptr i32 * %tmp107, i32 5
  store i32 2, i32 * %tmp106
  %tmp111 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp110 = load i32 * * %tmp111
  %tmp109 = getelementptr i32 * %tmp110, i32 6
  store i32 11, i32 * %tmp109
  %tmp114 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp113 = load i32 * * %tmp114
  %tmp112 = getelementptr i32 * %tmp113, i32 7
  store i32 6, i32 * %tmp112
  %tmp117 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp116 = load i32 * * %tmp117
  %tmp115 = getelementptr i32 * %tmp116, i32 8
  store i32 9, i32 * %tmp115
  %tmp120 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp119 = load i32 * * %tmp120
  %tmp118 = getelementptr i32 * %tmp119, i32 9
  store i32 19, i32 * %tmp118
  %tmp123 = getelementptr %class.BBS * %this, i32 0, i32 0
  %tmp122 = load i32 * * %tmp123
  %tmp121 = getelementptr i32 * %tmp122, i32 10
  store i32 5, i32 * %tmp121
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
