@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.b = type { i32, i32 * }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 12, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.b*
  %tmp4 = call i32 (%class.b *, i32)* @__geral_b(%class.b * %tmp1, i32 3)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define i32 @__geral_b(%class.b * %this, i32 %c) {
entry:
  %_c = alloca i32
  store i32 %c, i32 * %_c
  %_ara = alloca i32 *
  %tmp9 = mul i32 4, 5
  %tmp10 = call i8* @malloc ( i32 %tmp9)
  %tmp8 = bitcast i8* %tmp10 to i32*
  store i32 4, i32 * %tmp8
  %tmp11 = getelementptr %class.b * %this, i32 0, i32 1
  store i32 * %tmp8, i32 * * %tmp11
  %tmp14 = getelementptr %class.b * %this, i32 0, i32 1
  %tmp13 = load i32 * * %tmp14
  %tmp12 = getelementptr i32 * %tmp13, i32 2
  store i32 4, i32 * %tmp12
  %tmp17 = getelementptr %class.b * %this, i32 0, i32 1
  %tmp16 = load i32 * * %tmp17
  %tmp15 = getelementptr i32 * %tmp16, i32 3
  store i32 3, i32 * %tmp15
  %tmp20 = getelementptr %class.b * %this, i32 0, i32 1
  %tmp19 = load i32 * * %tmp20
  %tmp18 = getelementptr i32 * %tmp19, i32 4
  store i32 2, i32 * %tmp18
  %tmp23 = getelementptr %class.b * %this, i32 0, i32 1
  %tmp22 = load i32 * * %tmp23
  %tmp21 = getelementptr i32 * %tmp22, i32 5
  store i32 1, i32 * %tmp21
  %tmp24 = getelementptr %class.b * %this, i32 0, i32 1
  %tmp25 = load i32 * * %tmp24
  %tmp27 = getelementptr i32 * %tmp25, i32 5
  %tmp26 = load i32 * %tmp27
  ret i32 %tmp26
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
