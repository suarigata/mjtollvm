@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.b = type { i32, [0 x i32] }
%class.a = type { }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp1 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp2 = call i32 (i8 *, ...)* @printf(i8 * %tmp1, i32 0)
  %tmp3 = load i32 * %tmp0
  ret i32 %tmp3
}
define i32 @__soma_b(%class.b * %this, i32 %_a, i32 %_b) {
entry:
  %tmp4 = add i32 %_a, %_b
  ret i32 %tmp4
}
define i32 @__geral_b(%class.b * %this) {
entry:
  %tmp6 = mul i32 4, 1
  %tmp7 = call i8* @malloc ( i32 %tmp6)
  %tmp5 = bitcast i8* %tmp7 to %class.b*
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
