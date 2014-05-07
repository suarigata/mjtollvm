@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.a = type { }
%class.c = type { null *, i32 }
%class.b = type { i32, i32 }
%class.d = type { %class.b *, i32, i1, i32, %class.c *, i32, i32 }
define i32 @main() {
%entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp1 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp2 = call i32 (i8 *, ...)* @printf(i8 * %tmp1, i32 1)
  %tmp3 = load i32 * %tmp0
  ret i32 %tmp3
}
define i32 @__ola_c(%class.c * %this, i32 %_oi) {
%entry:
  %tmp4 = getelementptr %class.c * %this, i32 0, i32 1
  store i32 %_o, i32 * %tmp4
  %tmp5 = getelementptr %class.c * %this, i32 0, i32 1
  %tmp6 = load i32 * %tmp5
  ret i32 %tmp6
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
