@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.c = type { i32, i32 }
%class.a = type { }
%class.b = type { i32, i32 }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp1 = mul i32 1, 2
  %tmp2 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp3 = call i32 (i8 *, ...)* @printf(i8 * %tmp2, i32 %tmp1)
  %tmp4 = load i32 * %tmp0
  ret i32 %tmp4
}
define i32 @__ola_c(%class.c * %this, i32 %_oi) {
entry:
  %tmp5 = alloca i32
  store i32 %_oi, i32 * %tmp5
  %tmp6 = alloca i32
  %tmp7 = getelementptr %class.c * %this, i32 0, i32 1
  store i32 1, i32 * %tmp7
  store i32 %_oi, i32 * %tmp6
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
