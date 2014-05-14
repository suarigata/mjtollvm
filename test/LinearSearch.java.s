@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.LS = type { [4 x i8 *], i32 *, i32 }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 12, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.LS*
  %tmp4 = call i32 (%class.LS *, i32)* @__Start_LS(%class.LS * %tmp1, i32 10)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define void @__LS_LS(%class.LS * %this) {
entry:
  %tmp8 = bitcast %class.LS * %this to [4 x i8 *] *
  %tmp9 = bitcast i32 (%class.LS *, i32)* @__Start_LS to i8 *
  %tmp10 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 0
  store i8 * %tmp9, i8 * * %tmp10
  %tmp11 = bitcast i32 (%class.LS *)* @__Print_LS to i8 *
  %tmp12 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 1
  store i8 * %tmp11, i8 * * %tmp12
  %tmp13 = bitcast i32 (%class.LS *, i32)* @__Search_LS to i8 *
  %tmp14 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 2
  store i8 * %tmp13, i8 * * %tmp14
  %tmp15 = bitcast i32 (%class.LS *, i32)* @__Init_LS to i8 *
  %tmp16 = getelementptr [4 x i8 *] * %tmp8, i32 0, i32 3
  store i8 * %tmp15, i8 * * %tmp16
  ret void 
}
define i32 @__Start_LS(%class.LS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %_aux01 = alloca i32
  %_aux02 = alloca i32
  %tmp17 = load i32 * %_sz
  %tmp18 = call i32 (%class.LS *, i32)* @__Init_LS(%class.LS * %this, i32 %tmp17)
  store i32 %tmp18, i32 * %_aux01
  %tmp19 = call i32 (%class.LS *)* @__Print_LS(%class.LS * %this)
  store i32 %tmp19, i32 * %_aux02
  %tmp20 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp21 = call i32 (i8 *, ...)* @printf(i8 * %tmp20, i32 9999)
  %tmp22 = call i32 (%class.LS *, i32)* @__Search_LS(%class.LS * %this, i32 8)
  %tmp23 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp24 = call i32 (i8 *, ...)* @printf(i8 * %tmp23, i32 %tmp22)
  %tmp25 = call i32 (%class.LS *, i32)* @__Search_LS(%class.LS * %this, i32 12)
  %tmp26 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp27 = call i32 (i8 *, ...)* @printf(i8 * %tmp26, i32 %tmp25)
  %tmp28 = call i32 (%class.LS *, i32)* @__Search_LS(%class.LS * %this, i32 17)
  %tmp29 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp30 = call i32 (i8 *, ...)* @printf(i8 * %tmp29, i32 %tmp28)
  %tmp31 = call i32 (%class.LS *, i32)* @__Search_LS(%class.LS * %this, i32 50)
  %tmp32 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp33 = call i32 (i8 *, ...)* @printf(i8 * %tmp32, i32 %tmp31)
  ret i32 55
}
define i32 @__Print_LS(%class.LS * %this) {
entry:
  %_j = alloca i32
  store i32 1, i32 * %_j
  br label %label2
label2:
  %tmp34 = load i32 * %_j
  %tmp35 = getelementptr %class.LS * %this, i32 0, i32 2
  %tmp36 = load i32 * %tmp35
  %tmp37 = icmp slt i32 %tmp34, %tmp36
  br i1 %tmp37, label %label0, label %label1
label0:
  %tmp38 = load i32 * %_j
  %tmp39 = add i32 %tmp38, 1
  %tmp40 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp41 = load i32 * * %tmp40
  %tmp43 = getelementptr i32 * %tmp41, i32 %tmp39
  %tmp42 = load i32 * %tmp43
  %tmp44 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp45 = call i32 (i8 *, ...)* @printf(i8 * %tmp44, i32 %tmp42)
  %tmp46 = load i32 * %_j
  %tmp47 = add i32 %tmp46, 1
  store i32 %tmp47, i32 * %_j
  br label %label2
label1:
  ret i32 0
}
define i32 @__Search_LS(%class.LS * %this, i32 %num) {
entry:
  %_num = alloca i32
  store i32 %num, i32 * %_num
  %_j = alloca i32
  %_ls01 = alloca i1
  %_ifound = alloca i32
  %_aux01 = alloca i32
  %_aux02 = alloca i32
  %_nt = alloca i32
  store i32 1, i32 * %_j
  store i1 false, i1 * %_ls01
  store i32 0, i32 * %_ifound
  br label %label5
label5:
  %tmp48 = load i32 * %_j
  %tmp49 = getelementptr %class.LS * %this, i32 0, i32 2
  %tmp50 = load i32 * %tmp49
  %tmp51 = icmp slt i32 %tmp48, %tmp50
  br i1 %tmp51, label %label3, label %label4
label3:
  %tmp52 = load i32 * %_j
  %tmp53 = add i32 %tmp52, 1
  %tmp54 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp55 = load i32 * * %tmp54
  %tmp57 = getelementptr i32 * %tmp55, i32 %tmp53
  %tmp56 = load i32 * %tmp57
  store i32 %tmp56, i32 * %_aux01
  %tmp58 = load i32 * %_num
  %tmp59 = add i32 %tmp58, 1
  store i32 %tmp59, i32 * %_aux02
  %tmp60 = load i32 * %_aux01
  %tmp61 = load i32 * %_num
  %tmp62 = icmp slt i32 %tmp60, %tmp61
  br i1 %tmp62, label %label6, label %label7
label6:
  store i32 0, i32 * %_nt
  br label %label8
label7:
  %tmp63 = load i32 * %_aux01
  %tmp64 = load i32 * %_aux02
  %tmp65 = icmp slt i32 %tmp63, %tmp64
  %tmp66 = xor i1 %tmp65, -1
  br i1 %tmp66, label %label9, label %label10
label9:
  store i32 0, i32 * %_nt
  br label %label11
label10:
  store i1 true, i1 * %_ls01
  store i32 1, i32 * %_ifound
  %tmp67 = getelementptr %class.LS * %this, i32 0, i32 2
  %tmp68 = load i32 * %tmp67
  store i32 %tmp68, i32 * %_j
  br label %label11
label11:
  br label %label8
label8:
  %tmp69 = load i32 * %_j
  %tmp70 = add i32 %tmp69, 1
  store i32 %tmp70, i32 * %_j
  br label %label5
label4:
  %tmp71 = load i32 * %_ifound
  ret i32 %tmp71
}
define i32 @__Init_LS(%class.LS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %_j = alloca i32
  %_k = alloca i32
  %_aux01 = alloca i32
  %_aux02 = alloca i32
  %tmp72 = load i32 * %_sz
  %tmp73 = getelementptr %class.LS * %this, i32 0, i32 2
  store i32 %tmp72, i32 * %tmp73
  %tmp74 = load i32 * %_sz
  %tmp75 = add i32 %tmp74, 1
  %tmp77 = mul i32 4, %tmp75
  %tmp78 = call i8* @malloc ( i32 %tmp77)
  %tmp76 = bitcast i8* %tmp78 to i32*
  store i32 %tmp75, i32 * %tmp76
  %tmp79 = getelementptr %class.LS * %this, i32 0, i32 1
  store i32 * %tmp76, i32 * * %tmp79
  store i32 1, i32 * %_j
  %tmp80 = getelementptr %class.LS * %this, i32 0, i32 2
  %tmp81 = load i32 * %tmp80
  %tmp82 = add i32 %tmp81, 1
  store i32 %tmp82, i32 * %_k
  br label %label14
label14:
  %tmp83 = load i32 * %_j
  %tmp84 = getelementptr %class.LS * %this, i32 0, i32 2
  %tmp85 = load i32 * %tmp84
  %tmp86 = icmp slt i32 %tmp83, %tmp85
  br i1 %tmp86, label %label12, label %label13
label12:
  %tmp87 = load i32 * %_j
  %tmp88 = mul i32 2, %tmp87
  store i32 %tmp88, i32 * %_aux01
  %tmp89 = load i32 * %_k
  %tmp90 = sub i32 %tmp89, 3
  store i32 %tmp90, i32 * %_aux02
  %tmp91 = load i32 * %_j
  %tmp92 = add i32 %tmp91, 1
  %tmp95 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp94 = load i32 * * %tmp95
  %tmp93 = getelementptr i32 * %tmp94, i32 %tmp92
  %tmp96 = load i32 * %_aux01
  %tmp97 = load i32 * %_aux02
  %tmp98 = add i32 %tmp96, %tmp97
  store i32 %tmp98, i32 * %tmp93
  %tmp99 = load i32 * %_j
  %tmp100 = add i32 %tmp99, 1
  store i32 %tmp100, i32 * %_j
  %tmp101 = load i32 * %_k
  %tmp102 = sub i32 %tmp101, 1
  store i32 %tmp102, i32 * %_k
  br label %label14
label13:
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
