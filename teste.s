@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.c = type { i1, i32, %class.b *, i32 }
%class.b = type { i1, i32, %class.b *, i32, i32, i32, i32 }
%class.d = type { i1, i32 }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp1 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp2 = call i32 (i8 *, ...)* @printf(i8 * %tmp1, i32 1)
  %tmp3 = load i32 * %tmp0
  ret i32 %tmp3
}
define i32 @__oi_b(%class.b * %this) {
entry:
  ret i32 0
}
define i32 @__oi_c(%class.c * %this) {
entry:
  ret i32 0
}
define i32 @__oi_d(%class.d * %this) {
entry:
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
