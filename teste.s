@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.a = type { }
%class.b = type { i32, [0 x i32] }
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
  %tmp4 = alloca i32
  store i32 %_a, i32 * %tmp4
  %tmp5 = alloca i32
  store i32 %_b, i32 * %tmp5
  %tmp6 = add i32 %_a, %_b
  ret i32 %tmp6
}
define i32 @__geral_b(%class.b * %this) {
entry:
  %tmp7 = alloca i1
  %tmp8 = alloca [3 x i32]
  %tmp9 = alloca i1
  %tmp11 = mul i32 1, 2
  %tmp12 = call i8* @malloc ( i32 %tmp11)
  %tmp10 = bitcast i8* %tmp12 to [2 x i32]*
  %tmp14 = mul i32 1, 3
  %tmp15 = call i8* @malloc ( i32 %tmp14)
  %tmp13 = bitcast i8* %tmp15 to [3 x i32]*
  %tmp17 = mul i32 1, 3
  %tmp18 = call i8* @malloc ( i32 %tmp17)
  %tmp16 = bitcast i8* %tmp18 to [3 x i32]*
  %tmp19 = getelementptr %class.b * %this, [3 x i32] 0, [3 x i32] 1
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
