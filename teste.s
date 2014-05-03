@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.c = type { i32 }
%class.a = type { }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp1 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp2 = call i32 (i8 *, ...)* @printf(i8 * %tmp1, i32 1)
  %tmp3 = load i32 * %tmp0
  ret i32 %tmp3
}
define i1 @__ola_c(i32 %_oi) {
entry:
  %tmp4 = alloca i32
  store i32 %_oi, i32 * %tmp4
  %tmp5 = alloca i1
  %tmp6 = icmp eq i1 %_oi, 0
  br i1 %tmp6, label label0, label label1
label0:
  br label label2
label1:
label2:
  ret i1 %_ola
}
define i32 @__retVar_c(i32 %_oi) {
entry:
  %tmp7 = alloca i32
  store i32 %_oi, i32 * %tmp7
  ret i32 %_oi
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
