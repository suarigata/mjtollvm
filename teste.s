@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.Fac = type { }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 0, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.Fac*
  %tmp4 = call i32 (%class.Fac *, i32)* @__ComputeFac_Fac(%class.Fac * %tmp1, i32 10)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define i32 @__ComputeFac_Fac(%class.Fac * %this, i32 %num) {
entry:
  %_num = alloca i32
  store i32 %num, i32 * %_num
  %_num_aux = alloca i32 *
  %tmp8 = load i32 * * * %_num
  %tmp9 = icmp slt i32 %tmp8, 1
  br i1 %tmp9, label %label0, label %label1
label0:
  store i32 1, i32 * * %_num_aux
  br label %label2
label1:
  %tmp10 = load i32 * * * %_num
  %tmp11 = load i32 * * * %_num
  %tmp12 = sub i32 %tmp11, 1
  %tmp13 = call i32 (%class.Fac *, i32)* @__ComputeFac_Fac(%class.Fac * %this, i32 %tmp12)
  %tmp14 = mul i32 %tmp10, %tmp13
  store i32 %tmp14, i32 * * %_num_aux
label2:
  %tmp15 = load i32 * * %_num_aux
  ret i32 %tmp15
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
