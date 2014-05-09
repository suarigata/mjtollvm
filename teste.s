@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.b = type { i32, i32 }
%class.a = type { }
%class.d = type { %class.b *, i32, i1, i32, null *, i32, i32 }
%class.c = type { %class.b *, i32 }
define i32 @main() {
%entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp1 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp2 = call i32 (i8 *, ...)* @printf(i8 * %tmp1, i32 1)
  %tmp3 = load i32 * %tmp0
  ret i32 %tmp3
}
define i32 @__ola_c(%class.c * %this, i32 oi) {
%entry:
  %_oi = alloca i32
  store i32 %_oi, i32 %_oi
  %_ola = alloca i1
  %_o = alloca i32
  %tmp4 = load i32 %_o
  %tmp5 = getelementptr %class.c * %this, i32 0, i32 1
  store i32 %tmp4, i32 * %tmp5
  %tmp6 = getelementptr %class.c * %this, i32 0, i32 1
  %tmp7 = load i32 * %tmp6
  ret i32 %tmp7
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
