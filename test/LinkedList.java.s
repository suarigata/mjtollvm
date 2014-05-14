@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.List = type { [10 x i8 *], %class.Element *, %class.List *, i1 }
%class.LL = type { [1 x i8 *] }
%class.Element = type { [6 x i8 *], i32, i32, i1 }
define i32 @main() {
entry:
  %tmp0 = alloca i32
  store i32 0, i32 * %tmp0
  %tmp2 = mul i32 0, 1
  %tmp3 = call i8* @malloc ( i32 %tmp2)
  %tmp1 = bitcast i8* %tmp3 to %class.LL*
  %tmp4 = call i32 (%class.LL *)* @__Start_LL(%class.LL * %tmp1)
  %tmp5 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp6 = call i32 (i8 *, ...)* @printf(i8 * %tmp5, i32 %tmp4)
  %tmp7 = load i32 * %tmp0
  ret i32 %tmp7
}
define void @__Element_Element(%class.Element * %this) {
entry:
  %tmp8 = bitcast %class.Element * %this to [6 x i8 *] *
  %tmp9 = bitcast i1 (%class.Element *, i32, i32, i1)* @__Init_Element to i8 *
  %tmp10 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 0
  store i8 * %tmp9, i8 * * %tmp10
  %tmp11 = bitcast i32 (%class.Element *)* @__GetAge_Element to i8 *
  %tmp12 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 1
  store i8 * %tmp11, i8 * * %tmp12
  %tmp13 = bitcast i32 (%class.Element *)* @__GetSalary_Element to i8 *
  %tmp14 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 2
  store i8 * %tmp13, i8 * * %tmp14
  %tmp15 = bitcast i1 (%class.Element *)* @__GetMarried_Element to i8 *
  %tmp16 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 3
  store i8 * %tmp15, i8 * * %tmp16
  %tmp17 = bitcast i1 (%class.Element *, %class.Element *)* @__Equal_Element to i8 *
  %tmp18 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 4
  store i8 * %tmp17, i8 * * %tmp18
  %tmp19 = bitcast i1 (%class.Element *, i32, i32)* @__Compare_Element to i8 *
  %tmp20 = getelementptr [6 x i8 *] * %tmp8, i32 0, i32 5
  store i8 * %tmp19, i8 * * %tmp20
  ret void 
}
define i1 @__Init_Element(%class.Element * %this, i32 %v_Age, i32 %v_Salary, i1 %v_Married) {
entry:
  %_v_Age = alloca i32
  store i32 %v_Age, i32 * %_v_Age
  %_v_Salary = alloca i32
  store i32 %v_Salary, i32 * %_v_Salary
  %_v_Married = alloca i1
  store i1 %v_Married, i1 * %_v_Married
  %tmp21 = load i32 * %_v_Age
  %tmp22 = getelementptr %class.Element * %this, i32 0, i32 1
  store i32 %tmp21, i32 * %tmp22
  %tmp23 = load i32 * %_v_Salary
  %tmp24 = getelementptr %class.Element * %this, i32 0, i32 2
  store i32 %tmp23, i32 * %tmp24
  %tmp25 = load i1 * %_v_Married
  %tmp26 = getelementptr %class.Element * %this, i32 0, i32 3
  store i1 %tmp25, i1 * %tmp26
  ret i1 true
}
define i32 @__GetAge_Element(%class.Element * %this) {
entry:
  %tmp27 = getelementptr %class.Element * %this, i32 0, i32 1
  %tmp28 = load i32 * %tmp27
  ret i32 %tmp28
}
define i32 @__GetSalary_Element(%class.Element * %this) {
entry:
  %tmp29 = getelementptr %class.Element * %this, i32 0, i32 2
  %tmp30 = load i32 * %tmp29
  ret i32 %tmp30
}
define i1 @__GetMarried_Element(%class.Element * %this) {
entry:
  %tmp31 = getelementptr %class.Element * %this, i32 0, i32 3
  %tmp32 = load i1 * %tmp31
  ret i1 %tmp32
}
define i1 @__Equal_Element(%class.Element * %this, %class.Element * %other) {
entry:
  %_other = alloca %class.Element *
  store %class.Element * %other, %class.Element * * %_other
  %_ret_val = alloca i1
  %_aux01 = alloca i32
  %_aux02 = alloca i32
  %_nt = alloca i32
  store i1 true, i1 * %_ret_val
  %tmp33 = load %class.Element * * %_other
  %tmp34 = call i32 (%class.Element *)* @__GetAge_Element(%class.Element * %tmp33)
  store i32 %tmp34, i32 * %_aux01
  %tmp35 = load i32 * %_aux01
  %tmp36 = getelementptr %class.Element * %this, i32 0, i32 1
  %tmp37 = load i32 * %tmp36
  %tmp38 = call i1 (%class.Element *, i32, i32)* @__Compare_Element(%class.Element * %this, i32 %tmp35, i32 %tmp37)
  %tmp39 = xor i1 %tmp38, -1
  br i1 %tmp39, label %label0, label %label1
label0:
  store i1 false, i1 * %_ret_val
  br label %label2
label1:
  %tmp40 = load %class.Element * * %_other
  %tmp41 = call i32 (%class.Element *)* @__GetSalary_Element(%class.Element * %tmp40)
  store i32 %tmp41, i32 * %_aux02
  %tmp42 = load i32 * %_aux02
  %tmp43 = getelementptr %class.Element * %this, i32 0, i32 2
  %tmp44 = load i32 * %tmp43
  %tmp45 = call i1 (%class.Element *, i32, i32)* @__Compare_Element(%class.Element * %this, i32 %tmp42, i32 %tmp44)
  %tmp46 = xor i1 %tmp45, -1
  br i1 %tmp46, label %label3, label %label4
label3:
  store i1 false, i1 * %_ret_val
  br label %label5
label4:
  %tmp47 = getelementptr %class.Element * %this, i32 0, i32 3
  %tmp48 = load i1 * %tmp47
  br i1 %tmp48, label %label6, label %label7
label6:
  %tmp49 = load %class.Element * * %_other
  %tmp50 = call i1 (%class.Element *)* @__GetMarried_Element(%class.Element * %tmp49)
  %tmp51 = xor i1 %tmp50, -1
  br i1 %tmp51, label %label9, label %label10
label9:
  store i1 false, i1 * %_ret_val
  br label %label11
label10:
  store i32 0, i32 * %_nt
  br label %label11
label11:
  br label %label8
label7:
  %tmp52 = load %class.Element * * %_other
  %tmp53 = call i1 (%class.Element *)* @__GetMarried_Element(%class.Element * %tmp52)
  br i1 %tmp53, label %label12, label %label13
label12:
  store i1 false, i1 * %_ret_val
  br label %label14
label13:
  store i32 0, i32 * %_nt
  br label %label14
label14:
  br label %label8
label8:
  br label %label5
label5:
  br label %label2
label2:
  %tmp54 = load i1 * %_ret_val
  ret i1 %tmp54
}
define i1 @__Compare_Element(%class.Element * %this, i32 %num1, i32 %num2) {
entry:
  %_num1 = alloca i32
  store i32 %num1, i32 * %_num1
  %_num2 = alloca i32
  store i32 %num2, i32 * %_num2
  %_retval = alloca i1
  %_aux02 = alloca i32
  store i1 false, i1 * %_retval
  %tmp55 = load i32 * %_num2
  %tmp56 = add i32 %tmp55, 1
  store i32 %tmp56, i32 * %_aux02
  %tmp57 = load i32 * %_num1
  %tmp58 = load i32 * %_num2
  %tmp59 = icmp slt i32 %tmp57, %tmp58
  br i1 %tmp59, label %label15, label %label16
label15:
  store i1 false, i1 * %_retval
  br label %label17
label16:
  %tmp60 = load i32 * %_num1
  %tmp61 = load i32 * %_aux02
  %tmp62 = icmp slt i32 %tmp60, %tmp61
  %tmp63 = xor i1 %tmp62, -1
  br i1 %tmp63, label %label18, label %label19
label18:
  store i1 false, i1 * %_retval
  br label %label20
label19:
  store i1 true, i1 * %_retval
  br label %label20
label20:
  br label %label17
label17:
  %tmp64 = load i1 * %_retval
  ret i1 %tmp64
}
define void @__List_List(%class.List * %this) {
entry:
  %tmp65 = bitcast %class.List * %this to [10 x i8 *] *
  %tmp66 = bitcast i1 (%class.List *)* @__Init_List to i8 *
  %tmp67 = getelementptr [10 x i8 *] * %tmp65, i32 0, i32 0
  store i8 * %tmp66, i8 * * %tmp67
  %tmp68 = bitcast i1 (%class.List *, %class.Element *, %class.List *, i1)* @__InitNew_List to i8 *
  %tmp69 = getelementptr [10 x i8 *] * %tmp65, i32 0, i32 1
  store i8 * %tmp68, i8 * * %tmp69
  %tmp70 = bitcast %class.List * (%class.List *, %class.Element *)* @__Insert_List to i8 *
  %tmp71 = getelementptr [10 x i8 *] * %tmp65, i32 0, i32 2
  store i8 * %tmp70, i8 * * %tmp71
  %tmp72 = bitcast i1 (%class.List *, %class.List *)* @__SetNext_List to i8 *
  %tmp73 = getelementptr [10 x i8 *] * %tmp65, i32 0, i32 3
  store i8 * %tmp72, i8 * * %tmp73
  %tmp74 = bitcast %class.List * (%class.List *, %class.Element *)* @__Delete_List to i8 *
  %tmp75 = getelementptr [10 x i8 *] * %tmp65, i32 0, i32 4
  store i8 * %tmp74, i8 * * %tmp75
  %tmp76 = bitcast i32 (%class.List *, %class.Element *)* @__Search_List to i8 *
  %tmp77 = getelementptr [10 x i8 *] * %tmp65, i32 0, i32 5
  store i8 * %tmp76, i8 * * %tmp77
  %tmp78 = bitcast i1 (%class.List *)* @__GetEnd_List to i8 *
  %tmp79 = getelementptr [10 x i8 *] * %tmp65, i32 0, i32 6
  store i8 * %tmp78, i8 * * %tmp79
  %tmp80 = bitcast %class.Element * (%class.List *)* @__GetElem_List to i8 *
  %tmp81 = getelementptr [10 x i8 *] * %tmp65, i32 0, i32 7
  store i8 * %tmp80, i8 * * %tmp81
  %tmp82 = bitcast %class.List * (%class.List *)* @__GetNext_List to i8 *
  %tmp83 = getelementptr [10 x i8 *] * %tmp65, i32 0, i32 8
  store i8 * %tmp82, i8 * * %tmp83
  %tmp84 = bitcast i1 (%class.List *)* @__Print_List to i8 *
  %tmp85 = getelementptr [10 x i8 *] * %tmp65, i32 0, i32 9
  store i8 * %tmp84, i8 * * %tmp85
  ret void 
}
define i1 @__Init_List(%class.List * %this) {
entry:
  %tmp86 = getelementptr %class.List * %this, i32 0, i32 3
  store i1 true, i1 * %tmp86
  ret i1 true
}
define i1 @__InitNew_List(%class.List * %this, %class.Element * %v_elem, %class.List * %v_next, i1 %v_end) {
entry:
  %_v_elem = alloca %class.Element *
  store %class.Element * %v_elem, %class.Element * * %_v_elem
  %_v_next = alloca %class.List *
  store %class.List * %v_next, %class.List * * %_v_next
  %_v_end = alloca i1
  store i1 %v_end, i1 * %_v_end
  %tmp87 = load i1 * %_v_end
  %tmp88 = getelementptr %class.List * %this, i32 0, i32 3
  store i1 %tmp87, i1 * %tmp88
  %tmp89 = load %class.Element * * %_v_elem
  %tmp90 = getelementptr %class.List * %this, i32 0, i32 1
  store %class.Element * %tmp89, %class.Element * * %tmp90
  %tmp91 = load %class.List * * %_v_next
  %tmp92 = getelementptr %class.List * %this, i32 0, i32 2
  store %class.List * %tmp91, %class.List * * %tmp92
  ret i1 true
}
define %class.List * @__Insert_List(%class.List * %this, %class.Element * %new_elem) {
entry:
  %_new_elem = alloca %class.Element *
  store %class.Element * %new_elem, %class.Element * * %_new_elem
  %_ret_val = alloca i1
  %_aux03 = alloca %class.List *
  %_aux02 = alloca %class.List *
  store %class.List * %this, %class.List * * %_aux03
  %tmp94 = mul i32 17, 1
  %tmp95 = call i8* @malloc ( i32 %tmp94)
  %tmp93 = bitcast i8* %tmp95 to %class.List*
  store %class.List * %tmp93, %class.List * * %_aux02
  %tmp96 = load %class.List * * %_aux02
  %tmp97 = load %class.Element * * %_new_elem
  %tmp98 = load %class.List * * %_aux03
  %tmp99 = call i1 (%class.List *, %class.Element *, %class.List *, i1)* @__InitNew_List(%class.List * %tmp96, %class.Element * %tmp97, %class.List * %tmp98, i1 false)
  store i1 %tmp99, i1 * %_ret_val
  %tmp100 = load %class.List * * %_aux02
  ret %class.List * %tmp100
}
define i1 @__SetNext_List(%class.List * %this, %class.List * %v_next) {
entry:
  %_v_next = alloca %class.List *
  store %class.List * %v_next, %class.List * * %_v_next
  %tmp101 = load %class.List * * %_v_next
  %tmp102 = getelementptr %class.List * %this, i32 0, i32 2
  store %class.List * %tmp101, %class.List * * %tmp102
  ret i1 true
}
define %class.List * @__Delete_List(%class.List * %this, %class.Element * %e) {
entry:
  %_e = alloca %class.Element *
  store %class.Element * %e, %class.Element * * %_e
  %_my_head = alloca %class.List *
  %_ret_val = alloca i1
  %_aux05 = alloca i1
  %_aux01 = alloca %class.List *
  %_prev = alloca %class.List *
  %_var_end = alloca i1
  %_var_elem = alloca %class.Element *
  %_aux04 = alloca i32
  %_nt = alloca i32
  store %class.List * %this, %class.List * * %_my_head
  store i1 false, i1 * %_ret_val
  %tmp103 = sub i32 0, 1
  store i32 %tmp103, i32 * %_aux04
  store %class.List * %this, %class.List * * %_aux01
  store %class.List * %this, %class.List * * %_prev
  %tmp104 = getelementptr %class.List * %this, i32 0, i32 3
  %tmp105 = load i1 * %tmp104
  store i1 %tmp105, i1 * %_var_end
  %tmp106 = getelementptr %class.List * %this, i32 0, i32 1
  %tmp107 = load %class.Element * * %tmp106
  store %class.Element * %tmp107, %class.Element * * %_var_elem
  br label %label23
label23:
  %tmp108 = load i1 * %_var_end
  %tmp109 = xor i1 %tmp108, -1
  %tmp110 = load i1 * %_ret_val
  %tmp111 = xor i1 %tmp110, -1
  %tmp112 = and i1 %tmp109, %tmp111
  br i1 %tmp112, label %label21, label %label22
label21:
  %tmp113 = load %class.Element * * %_e
  %tmp114 = load %class.Element * * %_var_elem
  %tmp115 = call i1 (%class.Element *, %class.Element *)* @__Equal_Element(%class.Element * %tmp113, %class.Element * %tmp114)
  br i1 %tmp115, label %label24, label %label25
label24:
  store i1 true, i1 * %_ret_val
  %tmp116 = load i32 * %_aux04
  %tmp117 = icmp slt i32 %tmp116, 0
  br i1 %tmp117, label %label27, label %label28
label27:
  %tmp118 = load %class.List * * %_aux01
  %tmp119 = call %class.List * (%class.List *)* @__GetNext_List(%class.List * %tmp118)
  store %class.List * %tmp119, %class.List * * %_my_head
  br label %label29
label28:
  %tmp120 = sub i32 0, 555
  %tmp121 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp122 = call i32 (i8 *, ...)* @printf(i8 * %tmp121, i32 %tmp120)
  %tmp123 = load %class.List * * %_prev
  %tmp124 = load %class.List * * %_aux01
  %tmp125 = call %class.List * (%class.List *)* @__GetNext_List(%class.List * %tmp124)
  %tmp126 = call i1 (%class.List *, %class.List *)* @__SetNext_List(%class.List * %tmp123, %class.List * %tmp125)
  store i1 %tmp126, i1 * %_aux05
  %tmp127 = sub i32 0, 555
  %tmp128 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp129 = call i32 (i8 *, ...)* @printf(i8 * %tmp128, i32 %tmp127)
  br label %label29
label29:
  br label %label26
label25:
  store i32 0, i32 * %_nt
  br label %label26
label26:
  %tmp130 = load i1 * %_ret_val
  %tmp131 = xor i1 %tmp130, -1
  br i1 %tmp131, label %label30, label %label31
label30:
  %tmp132 = load %class.List * * %_aux01
  store %class.List * %tmp132, %class.List * * %_prev
  %tmp133 = load %class.List * * %_aux01
  %tmp134 = call %class.List * (%class.List *)* @__GetNext_List(%class.List * %tmp133)
  store %class.List * %tmp134, %class.List * * %_aux01
  %tmp135 = load %class.List * * %_aux01
  %tmp136 = call i1 (%class.List *)* @__GetEnd_List(%class.List * %tmp135)
  store i1 %tmp136, i1 * %_var_end
  %tmp137 = load %class.List * * %_aux01
  %tmp138 = call %class.Element * (%class.List *)* @__GetElem_List(%class.List * %tmp137)
  store %class.Element * %tmp138, %class.Element * * %_var_elem
  store i32 1, i32 * %_aux04
  br label %label32
label31:
  store i32 0, i32 * %_nt
  br label %label32
label32:
  br label %label23
label22:
  %tmp139 = load %class.List * * %_my_head
  ret %class.List * %tmp139
}
define i32 @__Search_List(%class.List * %this, %class.Element * %e) {
entry:
  %_e = alloca %class.Element *
  store %class.Element * %e, %class.Element * * %_e
  %_int_ret_val = alloca i32
  %_aux01 = alloca %class.List *
  %_var_elem = alloca %class.Element *
  %_var_end = alloca i1
  %_nt = alloca i32
  store i32 0, i32 * %_int_ret_val
  store %class.List * %this, %class.List * * %_aux01
  %tmp140 = getelementptr %class.List * %this, i32 0, i32 3
  %tmp141 = load i1 * %tmp140
  store i1 %tmp141, i1 * %_var_end
  %tmp142 = getelementptr %class.List * %this, i32 0, i32 1
  %tmp143 = load %class.Element * * %tmp142
  store %class.Element * %tmp143, %class.Element * * %_var_elem
  br label %label35
label35:
  %tmp144 = load i1 * %_var_end
  %tmp145 = xor i1 %tmp144, -1
  br i1 %tmp145, label %label33, label %label34
label33:
  %tmp146 = load %class.Element * * %_e
  %tmp147 = load %class.Element * * %_var_elem
  %tmp148 = call i1 (%class.Element *, %class.Element *)* @__Equal_Element(%class.Element * %tmp146, %class.Element * %tmp147)
  br i1 %tmp148, label %label36, label %label37
label36:
  store i32 1, i32 * %_int_ret_val
  br label %label38
label37:
  store i32 0, i32 * %_nt
  br label %label38
label38:
  %tmp149 = load %class.List * * %_aux01
  %tmp150 = call %class.List * (%class.List *)* @__GetNext_List(%class.List * %tmp149)
  store %class.List * %tmp150, %class.List * * %_aux01
  %tmp151 = load %class.List * * %_aux01
  %tmp152 = call i1 (%class.List *)* @__GetEnd_List(%class.List * %tmp151)
  store i1 %tmp152, i1 * %_var_end
  %tmp153 = load %class.List * * %_aux01
  %tmp154 = call %class.Element * (%class.List *)* @__GetElem_List(%class.List * %tmp153)
  store %class.Element * %tmp154, %class.Element * * %_var_elem
  br label %label35
label34:
  %tmp155 = load i32 * %_int_ret_val
  ret i32 %tmp155
}
define i1 @__GetEnd_List(%class.List * %this) {
entry:
  %tmp156 = getelementptr %class.List * %this, i32 0, i32 3
  %tmp157 = load i1 * %tmp156
  ret i1 %tmp157
}
define %class.Element * @__GetElem_List(%class.List * %this) {
entry:
  %tmp158 = getelementptr %class.List * %this, i32 0, i32 1
  %tmp159 = load %class.Element * * %tmp158
  ret %class.Element * %tmp159
}
define %class.List * @__GetNext_List(%class.List * %this) {
entry:
  %tmp160 = getelementptr %class.List * %this, i32 0, i32 2
  %tmp161 = load %class.List * * %tmp160
  ret %class.List * %tmp161
}
define i1 @__Print_List(%class.List * %this) {
entry:
  %_aux01 = alloca %class.List *
  %_var_end = alloca i1
  %_var_elem = alloca %class.Element *
  store %class.List * %this, %class.List * * %_aux01
  %tmp162 = getelementptr %class.List * %this, i32 0, i32 3
  %tmp163 = load i1 * %tmp162
  store i1 %tmp163, i1 * %_var_end
  %tmp164 = getelementptr %class.List * %this, i32 0, i32 1
  %tmp165 = load %class.Element * * %tmp164
  store %class.Element * %tmp165, %class.Element * * %_var_elem
  br label %label41
label41:
  %tmp166 = load i1 * %_var_end
  %tmp167 = xor i1 %tmp166, -1
  br i1 %tmp167, label %label39, label %label40
label39:
  %tmp168 = load %class.Element * * %_var_elem
  %tmp169 = call i32 (%class.Element *)* @__GetAge_Element(%class.Element * %tmp168)
  %tmp170 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp171 = call i32 (i8 *, ...)* @printf(i8 * %tmp170, i32 %tmp169)
  %tmp172 = load %class.List * * %_aux01
  %tmp173 = call %class.List * (%class.List *)* @__GetNext_List(%class.List * %tmp172)
  store %class.List * %tmp173, %class.List * * %_aux01
  %tmp174 = load %class.List * * %_aux01
  %tmp175 = call i1 (%class.List *)* @__GetEnd_List(%class.List * %tmp174)
  store i1 %tmp175, i1 * %_var_end
  %tmp176 = load %class.List * * %_aux01
  %tmp177 = call %class.Element * (%class.List *)* @__GetElem_List(%class.List * %tmp176)
  store %class.Element * %tmp177, %class.Element * * %_var_elem
  br label %label41
label40:
  ret i1 true
}
define void @__LL_LL(%class.LL * %this) {
entry:
  %tmp178 = bitcast %class.LL * %this to [1 x i8 *] *
  %tmp179 = bitcast i32 (%class.LL *)* @__Start_LL to i8 *
  %tmp180 = getelementptr [1 x i8 *] * %tmp178, i32 0, i32 0
  store i8 * %tmp179, i8 * * %tmp180
  ret void 
}
define i32 @__Start_LL(%class.LL * %this) {
entry:
  %_head = alloca %class.List *
  %_last_elem = alloca %class.List *
  %_aux01 = alloca i1
  %_el01 = alloca %class.Element *
  %_el02 = alloca %class.Element *
  %_el03 = alloca %class.Element *
  %tmp182 = mul i32 17, 1
  %tmp183 = call i8* @malloc ( i32 %tmp182)
  %tmp181 = bitcast i8* %tmp183 to %class.List*
  store %class.List * %tmp181, %class.List * * %_last_elem
  %tmp184 = load %class.List * * %_last_elem
  %tmp185 = call i1 (%class.List *)* @__Init_List(%class.List * %tmp184)
  store i1 %tmp185, i1 * %_aux01
  %tmp186 = load %class.List * * %_last_elem
  store %class.List * %tmp186, %class.List * * %_head
  %tmp187 = load %class.List * * %_head
  %tmp188 = call i1 (%class.List *)* @__Init_List(%class.List * %tmp187)
  store i1 %tmp188, i1 * %_aux01
  %tmp189 = load %class.List * * %_head
  %tmp190 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp189)
  store i1 %tmp190, i1 * %_aux01
  %tmp192 = mul i32 9, 1
  %tmp193 = call i8* @malloc ( i32 %tmp192)
  %tmp191 = bitcast i8* %tmp193 to %class.Element*
  store %class.Element * %tmp191, %class.Element * * %_el01
  %tmp194 = load %class.Element * * %_el01
  %tmp195 = call i1 (%class.Element *, i32, i32, i1)* @__Init_Element(%class.Element * %tmp194, i32 25, i32 37000, i1 false)
  store i1 %tmp195, i1 * %_aux01
  %tmp196 = load %class.List * * %_head
  %tmp197 = load %class.Element * * %_el01
  %tmp198 = call %class.List * (%class.List *, %class.Element *)* @__Insert_List(%class.List * %tmp196, %class.Element * %tmp197)
  store %class.List * %tmp198, %class.List * * %_head
  %tmp199 = load %class.List * * %_head
  %tmp200 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp199)
  store i1 %tmp200, i1 * %_aux01
  %tmp201 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp202 = call i32 (i8 *, ...)* @printf(i8 * %tmp201, i32 10000000)
  %tmp204 = mul i32 9, 1
  %tmp205 = call i8* @malloc ( i32 %tmp204)
  %tmp203 = bitcast i8* %tmp205 to %class.Element*
  store %class.Element * %tmp203, %class.Element * * %_el01
  %tmp206 = load %class.Element * * %_el01
  %tmp207 = call i1 (%class.Element *, i32, i32, i1)* @__Init_Element(%class.Element * %tmp206, i32 39, i32 42000, i1 true)
  store i1 %tmp207, i1 * %_aux01
  %tmp208 = load %class.Element * * %_el01
  store %class.Element * %tmp208, %class.Element * * %_el02
  %tmp209 = load %class.List * * %_head
  %tmp210 = load %class.Element * * %_el01
  %tmp211 = call %class.List * (%class.List *, %class.Element *)* @__Insert_List(%class.List * %tmp209, %class.Element * %tmp210)
  store %class.List * %tmp211, %class.List * * %_head
  %tmp212 = load %class.List * * %_head
  %tmp213 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp212)
  store i1 %tmp213, i1 * %_aux01
  %tmp214 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp215 = call i32 (i8 *, ...)* @printf(i8 * %tmp214, i32 10000000)
  %tmp217 = mul i32 9, 1
  %tmp218 = call i8* @malloc ( i32 %tmp217)
  %tmp216 = bitcast i8* %tmp218 to %class.Element*
  store %class.Element * %tmp216, %class.Element * * %_el01
  %tmp219 = load %class.Element * * %_el01
  %tmp220 = call i1 (%class.Element *, i32, i32, i1)* @__Init_Element(%class.Element * %tmp219, i32 22, i32 34000, i1 false)
  store i1 %tmp220, i1 * %_aux01
  %tmp221 = load %class.List * * %_head
  %tmp222 = load %class.Element * * %_el01
  %tmp223 = call %class.List * (%class.List *, %class.Element *)* @__Insert_List(%class.List * %tmp221, %class.Element * %tmp222)
  store %class.List * %tmp223, %class.List * * %_head
  %tmp224 = load %class.List * * %_head
  %tmp225 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp224)
  store i1 %tmp225, i1 * %_aux01
  %tmp227 = mul i32 9, 1
  %tmp228 = call i8* @malloc ( i32 %tmp227)
  %tmp226 = bitcast i8* %tmp228 to %class.Element*
  store %class.Element * %tmp226, %class.Element * * %_el03
  %tmp229 = load %class.Element * * %_el03
  %tmp230 = call i1 (%class.Element *, i32, i32, i1)* @__Init_Element(%class.Element * %tmp229, i32 27, i32 34000, i1 false)
  store i1 %tmp230, i1 * %_aux01
  %tmp231 = load %class.List * * %_head
  %tmp232 = load %class.Element * * %_el02
  %tmp233 = call i32 (%class.List *, %class.Element *)* @__Search_List(%class.List * %tmp231, %class.Element * %tmp232)
  %tmp234 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp235 = call i32 (i8 *, ...)* @printf(i8 * %tmp234, i32 %tmp233)
  %tmp236 = load %class.List * * %_head
  %tmp237 = load %class.Element * * %_el03
  %tmp238 = call i32 (%class.List *, %class.Element *)* @__Search_List(%class.List * %tmp236, %class.Element * %tmp237)
  %tmp239 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp240 = call i32 (i8 *, ...)* @printf(i8 * %tmp239, i32 %tmp238)
  %tmp241 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp242 = call i32 (i8 *, ...)* @printf(i8 * %tmp241, i32 10000000)
  %tmp244 = mul i32 9, 1
  %tmp245 = call i8* @malloc ( i32 %tmp244)
  %tmp243 = bitcast i8* %tmp245 to %class.Element*
  store %class.Element * %tmp243, %class.Element * * %_el01
  %tmp246 = load %class.Element * * %_el01
  %tmp247 = call i1 (%class.Element *, i32, i32, i1)* @__Init_Element(%class.Element * %tmp246, i32 28, i32 35000, i1 false)
  store i1 %tmp247, i1 * %_aux01
  %tmp248 = load %class.List * * %_head
  %tmp249 = load %class.Element * * %_el01
  %tmp250 = call %class.List * (%class.List *, %class.Element *)* @__Insert_List(%class.List * %tmp248, %class.Element * %tmp249)
  store %class.List * %tmp250, %class.List * * %_head
  %tmp251 = load %class.List * * %_head
  %tmp252 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp251)
  store i1 %tmp252, i1 * %_aux01
  %tmp253 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp254 = call i32 (i8 *, ...)* @printf(i8 * %tmp253, i32 2220000)
  %tmp255 = load %class.List * * %_head
  %tmp256 = load %class.Element * * %_el02
  %tmp257 = call %class.List * (%class.List *, %class.Element *)* @__Delete_List(%class.List * %tmp255, %class.Element * %tmp256)
  store %class.List * %tmp257, %class.List * * %_head
  %tmp258 = load %class.List * * %_head
  %tmp259 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp258)
  store i1 %tmp259, i1 * %_aux01
  %tmp260 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp261 = call i32 (i8 *, ...)* @printf(i8 * %tmp260, i32 33300000)
  %tmp262 = load %class.List * * %_head
  %tmp263 = load %class.Element * * %_el01
  %tmp264 = call %class.List * (%class.List *, %class.Element *)* @__Delete_List(%class.List * %tmp262, %class.Element * %tmp263)
  store %class.List * %tmp264, %class.List * * %_head
  %tmp265 = load %class.List * * %_head
  %tmp266 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp265)
  store i1 %tmp266, i1 * %_aux01
  %tmp267 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp268 = call i32 (i8 *, ...)* @printf(i8 * %tmp267, i32 44440000)
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
