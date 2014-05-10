@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.b = type { i32 }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 4, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.b*
  %tmp4 = call i32 (%class.b *)* @__Start_b(%class.b * %tmp1)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define i32 @__Start_b(%class.b * %this) {
entry:
  %tmp8 = getelementptr %class.b * %this, i32 0, i32 0
  store i32 2, i32 * * %tmp8
  %tmp9 = getelementptr %class.b * %this, i32 0, i32 0
  %tmp10 = load i32 * * %tmp9
  ret i32 %tmp10
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
