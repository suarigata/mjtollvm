@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.a = type { }
%class.b = type { i32, [0 x i32] }
define i32 @main() {
%entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp1 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp2 = call i32 (i8 *, ...)* @printf(i8 * %tmp1, i32 0)
  %tmp3 = load i32 * %tmp0
  ret i32 %tmp3
}
define i32 @__soma_b(%class.b * %this, i32 %_a, i32 %_b) {
%entry:
  %tmp4 = add i32 %_a, %_b
  %tmp5 = add i32 1, 0
  %tmp6 = add i32 %tmp5, %_b
  ret i32 %tmp6
}
define i32 @__geral_b(%class.b * %this) {
%entry:
  %tmp8 = mul i32 4, 1
  %tmp9 = call i8* @malloc ( i32 %tmp8)
  %tmp7 = bitcast i8* %tmp9 to %class.b*
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
