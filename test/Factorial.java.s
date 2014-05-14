@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.Fac = type { [1 x i8 *] }
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
define void @__Fac_Fac(%class.Fac * %this) {
entry:
  %tmp8 = bitcast %class.Fac * %this to [1 x i8 *] *
  %tmp9 = bitcast i32 (%class.Fac *, i32)* @__ComputeFac_Fac to i8 *
  %tmp10 = getelementptr [1 x i8 *] * %tmp8, i32 0, i32 0
  store i8 * %tmp9, i8 * * %tmp10
  ret void 
}
define i32 @__ComputeFac_Fac(%class.Fac * %this, i32 %num) {
entry:
  %_num = alloca i32
  store i32 %num, i32 * %_num
  %_num_aux = alloca i32
  %tmp11 = load i32 * %_num
  %tmp12 = icmp slt i32 %tmp11, 1
  br i1 %tmp12, label %label0, label %label1
label0:
  store i32 1, i32 * %_num_aux
  br label %label2
label1:
  %tmp13 = load i32 * %_num
  %tmp14 = load i32 * %_num
  %tmp15 = sub i32 %tmp14, 1
  %tmp16 = call i32 (%class.Fac *, i32)* @__ComputeFac_Fac(%class.Fac * %this, i32 %tmp15)
  %tmp17 = mul i32 %tmp13, %tmp16
  store i32 %tmp17, i32 * %_num_aux
  br label %label2
label2:
  %tmp18 = load i32 * %_num_aux
  ret i32 %tmp18
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
