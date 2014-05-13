@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.LS = type { i32 *, i32 }
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
define i32 @__Start_LS(%class.LS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %_aux01 = alloca i32
  %_aux02 = alloca i32
  %tmp8 = load i32 * %_sz
  %tmp9 = call i32 (%class.LS *, i32)* @__Init_LS(%class.LS * %this, i32 %tmp8)
  store i32 %tmp9, i32 * %_aux01
  %tmp10 = call i32 (%class.LS *)* @__Print_LS(%class.LS * %this)
  store i32 %tmp10, i32 * %_aux02
  %tmp11 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp12 = call i32 (i8 *, ...)* @printf(i8 * %tmp11, i32 9999)
  %tmp13 = call i32 (%class.LS *, i32)* @__Search_LS(%class.LS * %this, i32 8)
  %tmp14 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp15 = call i32 (i8 *, ...)* @printf(i8 * %tmp14, i32 %tmp13)
  %tmp16 = call i32 (%class.LS *, i32)* @__Search_LS(%class.LS * %this, i32 12)
  %tmp17 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp18 = call i32 (i8 *, ...)* @printf(i8 * %tmp17, i32 %tmp16)
  %tmp19 = call i32 (%class.LS *, i32)* @__Search_LS(%class.LS * %this, i32 17)
  %tmp20 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp21 = call i32 (i8 *, ...)* @printf(i8 * %tmp20, i32 %tmp19)
  %tmp22 = call i32 (%class.LS *, i32)* @__Search_LS(%class.LS * %this, i32 50)
  %tmp23 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp24 = call i32 (i8 *, ...)* @printf(i8 * %tmp23, i32 %tmp22)
  ret i32 55
}
define i32 @__Print_LS(%class.LS * %this) {
entry:
  %_j = alloca i32
  store i32 1, i32 * %_j
  br label %label2
label2:
  %tmp25 = load i32 * %_j
  %tmp26 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp27 = load i32 * %tmp26
  %tmp28 = icmp slt i32 %tmp25, %tmp27
  br i1 %tmp28, label %label0, label %label1
label0:
  %tmp29 = load i32 * %_j
  %tmp30 = add i32 %tmp29, 1
  %tmp31 = getelementptr %class.LS * %this, i32 0, i32 0
  %tmp32 = load i32 * * %tmp31
  %tmp34 = getelementptr i32 * %tmp32, i32 %tmp30
  %tmp33 = load i32 * %tmp34
  %tmp35 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp36 = call i32 (i8 *, ...)* @printf(i8 * %tmp35, i32 %tmp33)
  %tmp37 = load i32 * %_j
  %tmp38 = add i32 %tmp37, 1
  store i32 %tmp38, i32 * %_j
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
  %tmp39 = load i32 * %_j
  %tmp40 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp41 = load i32 * %tmp40
  %tmp42 = icmp slt i32 %tmp39, %tmp41
  br i1 %tmp42, label %label3, label %label4
label3:
  %tmp43 = load i32 * %_j
  %tmp44 = add i32 %tmp43, 1
  %tmp45 = getelementptr %class.LS * %this, i32 0, i32 0
  %tmp46 = load i32 * * %tmp45
  %tmp48 = getelementptr i32 * %tmp46, i32 %tmp44
  %tmp47 = load i32 * %tmp48
  store i32 %tmp47, i32 * %_aux01
  %tmp49 = load i32 * %_num
  %tmp50 = add i32 %tmp49, 1
  store i32 %tmp50, i32 * %_aux02
  %tmp51 = load i32 * %_aux01
  %tmp52 = load i32 * %_num
  %tmp53 = icmp slt i32 %tmp51, %tmp52
  br i1 %tmp53, label %label6, label %label7
label6:
  store i32 0, i32 * %_nt
  br label %label8
label7:
  %tmp54 = load i32 * %_aux01
  %tmp55 = load i32 * %_aux02
  %tmp56 = icmp slt i32 %tmp54, %tmp55
  %tmp57 = xor i1 %tmp56, 1
  br i1 %tmp57, label %label9, label %label10
label9:
  store i32 0, i32 * %_nt
  br label %label11
label10:
  store i1 true, i1 * %_ls01
  store i32 1, i32 * %_ifound
  %tmp58 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp59 = load i32 * %tmp58
  store i32 %tmp59, i32 * %_j
  br label %label11
label11:
  br label %label8
label8:
  %tmp60 = load i32 * %_j
  %tmp61 = add i32 %tmp60, 1
  store i32 %tmp61, i32 * %_j
  br label %label5
label4:
  %tmp62 = load i32 * %_ifound
  ret i32 %tmp62
}
define i32 @__Init_LS(%class.LS * %this, i32 %sz) {
entry:
  %_sz = alloca i32
  store i32 %sz, i32 * %_sz
  %_j = alloca i32
  %_k = alloca i32
  %_aux01 = alloca i32
  %_aux02 = alloca i32
  %tmp63 = load i32 * %_sz
  %tmp64 = getelementptr %class.LS * %this, i32 0, i32 1
  store i32 %tmp63, i32 * %tmp64
  %tmp65 = load i32 * %_sz
  %tmp66 = add i32 %tmp65, 1
  %tmp68 = mul i32 4, %tmp66
  %tmp69 = call i8* @malloc ( i32 %tmp68)
  %tmp67 = bitcast i8* %tmp69 to i32*
  store i32 %tmp66, i32 * %tmp67
  %tmp70 = getelementptr %class.LS * %this, i32 0, i32 0
  store i32 * %tmp67, i32 * * %tmp70
  store i32 1, i32 * %_j
  %tmp71 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp72 = load i32 * %tmp71
  %tmp73 = add i32 %tmp72, 1
  store i32 %tmp73, i32 * %_k
  br label %label14
label14:
  %tmp74 = load i32 * %_j
  %tmp75 = getelementptr %class.LS * %this, i32 0, i32 1
  %tmp76 = load i32 * %tmp75
  %tmp77 = icmp slt i32 %tmp74, %tmp76
  br i1 %tmp77, label %label12, label %label13
label12:
  %tmp78 = load i32 * %_j
  %tmp79 = mul i32 2, %tmp78
  store i32 %tmp79, i32 * %_aux01
  %tmp80 = load i32 * %_k
  %tmp81 = sub i32 %tmp80, 3
  store i32 %tmp81, i32 * %_aux02
  %tmp82 = load i32 * %_j
  %tmp83 = add i32 %tmp82, 1
  %tmp86 = getelementptr %class.LS * %this, i32 0, i32 0
  %tmp85 = load i32 * * %tmp86
  %tmp84 = getelementptr i32 * %tmp85, i32 %tmp83
  %tmp87 = load i32 * %_aux01
  %tmp88 = load i32 * %_aux02
  %tmp89 = add i32 %tmp87, %tmp88
  store i32 %tmp89, i32 * %tmp84
  %tmp90 = load i32 * %_j
  %tmp91 = add i32 %tmp90, 1
  store i32 %tmp91, i32 * %_j
  %tmp92 = load i32 * %_k
  %tmp93 = sub i32 %tmp92, 1
  store i32 %tmp93, i32 * %_k
  br label %label14
label13:
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
