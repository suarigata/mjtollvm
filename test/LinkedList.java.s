@.formatting.string = private constant [4 x i8] c"%d\0A\00"
%class.LL = type { }
%class.List = type { %class.Element *, %class.List *, i1 }
%class.Element = type { i32, i32, i1 }
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
define i1 @__Init_Element(%class.Element * %this, i32 %v_Age, i32 %v_Salary, i1 %v_Married) {
entry:
  %_v_Age = alloca i32
  store i32 %v_Age, i32 * %_v_Age
  %_v_Salary = alloca i32
  store i32 %v_Salary, i32 * %_v_Salary
  %_v_Married = alloca i1
  store i1 %v_Married, i1 * %_v_Married
  %tmp8 = load i32 * %_v_Age
  %tmp9 = getelementptr %class.Element * %this, i32 0, i32 0
  store i32 %tmp8, i32 * %tmp9
  %tmp10 = load i32 * %_v_Salary
  %tmp11 = getelementptr %class.Element * %this, i32 0, i32 1
  store i32 %tmp10, i32 * %tmp11
  %tmp12 = load i1 * %_v_Married
  %tmp13 = getelementptr %class.Element * %this, i32 0, i32 2
  store i1 %tmp12, i1 * %tmp13
  ret i1 true
}
define i32 @__GetAge_Element(%class.Element * %this) {
entry:
  %tmp14 = getelementptr %class.Element * %this, i32 0, i32 0
  %tmp15 = load i32 * %tmp14
  ret i32 %tmp15
}
define i32 @__GetSalary_Element(%class.Element * %this) {
entry:
  %tmp16 = getelementptr %class.Element * %this, i32 0, i32 1
  %tmp17 = load i32 * %tmp16
  ret i32 %tmp17
}
define i1 @__GetMarried_Element(%class.Element * %this) {
entry:
  %tmp18 = getelementptr %class.Element * %this, i32 0, i32 2
  %tmp19 = load i1 * %tmp18
  ret i1 %tmp19
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
  %tmp20 = load %class.Element * * %_other
  %tmp21 = call i32 (%class.Element *)* @__GetAge_Element(%class.Element * %tmp20)
  store i32 %tmp21, i32 * %_aux01
  %tmp22 = load i32 * %_aux01
  %tmp23 = getelementptr %class.Element * %this, i32 0, i32 0
  %tmp24 = load i32 * %tmp23
  %tmp25 = call i1 (%class.Element *, i32, i32)* @__Compare_Element(%class.Element * %this, i32 %tmp22, i32 %tmp24)
  %tmp26 = xor i1 %tmp25, 1
  br i1 %tmp26, label %label0, label %label1
label0:
  store i1 false, i1 * %_ret_val
  br label %label2
label1:
  %tmp27 = load %class.Element * * %_other
  %tmp28 = call i32 (%class.Element *)* @__GetSalary_Element(%class.Element * %tmp27)
  store i32 %tmp28, i32 * %_aux02
  %tmp29 = load i32 * %_aux02
  %tmp30 = getelementptr %class.Element * %this, i32 0, i32 1
  %tmp31 = load i32 * %tmp30
  %tmp32 = call i1 (%class.Element *, i32, i32)* @__Compare_Element(%class.Element * %this, i32 %tmp29, i32 %tmp31)
  %tmp33 = xor i1 %tmp32, 1
  br i1 %tmp33, label %label3, label %label4
label3:
  store i1 false, i1 * %_ret_val
  br label %label5
label4:
  %tmp34 = getelementptr %class.Element * %this, i32 0, i32 2
  %tmp35 = load i1 * %tmp34
  br i1 %tmp35, label %label6, label %label7
label6:
  %tmp36 = load %class.Element * * %_other
  %tmp37 = call i1 (%class.Element *)* @__GetMarried_Element(%class.Element * %tmp36)
  %tmp38 = xor i1 %tmp37, 1
  br i1 %tmp38, label %label9, label %label10
label9:
  store i1 false, i1 * %_ret_val
  br label %label11
label10:
  store i32 0, i32 * %_nt
  br label %label11
label11:
  br label %label8
label7:
  %tmp39 = load %class.Element * * %_other
  %tmp40 = call i1 (%class.Element *)* @__GetMarried_Element(%class.Element * %tmp39)
  br i1 %tmp40, label %label12, label %label13
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
  %tmp41 = load i1 * %_ret_val
  ret i1 %tmp41
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
  %tmp42 = load i32 * %_num2
  %tmp43 = add i32 %tmp42, 1
  store i32 %tmp43, i32 * %_aux02
  %tmp44 = load i32 * %_num1
  %tmp45 = load i32 * %_num2
  %tmp46 = icmp slt i32 %tmp44, %tmp45
  br i1 %tmp46, label %label15, label %label16
label15:
  store i1 false, i1 * %_retval
  br label %label17
label16:
  %tmp47 = load i32 * %_num1
  %tmp48 = load i32 * %_aux02
  %tmp49 = icmp slt i32 %tmp47, %tmp48
  %tmp50 = xor i1 %tmp49, 1
  br i1 %tmp50, label %label18, label %label19
label18:
  store i1 false, i1 * %_retval
  br label %label20
label19:
  store i1 true, i1 * %_retval
  br label %label20
label20:
  br label %label17
label17:
  %tmp51 = load i1 * %_retval
  ret i1 %tmp51
}
define i1 @__Init_List(%class.List * %this) {
entry:
  %tmp52 = getelementptr %class.List * %this, i32 0, i32 2
  store i1 true, i1 * %tmp52
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
  %tmp53 = load i1 * %_v_end
  %tmp54 = getelementptr %class.List * %this, i32 0, i32 2
  store i1 %tmp53, i1 * %tmp54
  %tmp55 = load %class.Element * * %_v_elem
  %tmp56 = getelementptr %class.List * %this, i32 0, i32 0
  store %class.Element * %tmp55, %class.Element * * %tmp56
  %tmp57 = load %class.List * * %_v_next
  %tmp58 = getelementptr %class.List * %this, i32 0, i32 1
  store %class.List * %tmp57, %class.List * * %tmp58
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
  %tmp60 = mul i32 17, 1
  %tmp61 = call i8* @malloc ( i32 %tmp60)
  %tmp59 = bitcast i8* %tmp61 to %class.List*
  store %class.List * %tmp59, %class.List * * %_aux02
  %tmp62 = load %class.List * * %_aux02
  %tmp63 = load %class.Element * * %_new_elem
  %tmp64 = load %class.List * * %_aux03
  %tmp65 = call i1 (%class.List *, %class.Element *, %class.List *, i1)* @__InitNew_List(%class.List * %tmp62, %class.Element * %tmp63, %class.List * %tmp64, i1 false)
  store i1 %tmp65, i1 * %_ret_val
  %tmp66 = load %class.List * * %_aux02
  ret %class.List * %tmp66
}
define i1 @__SetNext_List(%class.List * %this, %class.List * %v_next) {
entry:
  %_v_next = alloca %class.List *
  store %class.List * %v_next, %class.List * * %_v_next
  %tmp67 = load %class.List * * %_v_next
  %tmp68 = getelementptr %class.List * %this, i32 0, i32 1
  store %class.List * %tmp67, %class.List * * %tmp68
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
  %tmp69 = sub i32 0, 1
  store i32 %tmp69, i32 * %_aux04
  store %class.List * %this, %class.List * * %_aux01
  store %class.List * %this, %class.List * * %_prev
  %tmp70 = getelementptr %class.List * %this, i32 0, i32 2
  %tmp71 = load i1 * %tmp70
  store i1 %tmp71, i1 * %_var_end
  %tmp72 = getelementptr %class.List * %this, i32 0, i32 0
  %tmp73 = load %class.Element * * %tmp72
  store %class.Element * %tmp73, %class.Element * * %_var_elem
  br label %label23
label23:
  %tmp74 = load i1 * %_var_end
  %tmp75 = xor i1 %tmp74, 1
  %tmp76 = load i1 * %_var_end
  %tmp77 = xor i1 %tmp76, 1
  %tmp78 = and i1 %tmp75, %tmp77
  br i1 %tmp78, label %label21, label %label22
label21:
  %tmp79 = load %class.Element * * %_e
  %tmp80 = load %class.Element * * %_var_elem
  %tmp81 = call i1 (%class.Element *, %class.Element *)* @__Equal_Element(%class.Element * %tmp79, %class.Element * %tmp80)
  br i1 %tmp81, label %label24, label %label25
label24:
  store i1 true, i1 * %_ret_val
  %tmp82 = load i32 * %_aux04
  %tmp83 = icmp slt i32 %tmp82, 0
  br i1 %tmp83, label %label27, label %label28
label27:
  %tmp84 = load %class.List * * %_aux01
  %tmp85 = call %class.List * (%class.List *)* @__GetNext_List(%class.List * %tmp84)
  store %class.List * %tmp85, %class.List * * %_my_head
  br label %label29
label28:
  %tmp86 = sub i32 0, 555
  %tmp87 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp88 = call i32 (i8 *, ...)* @printf(i8 * %tmp87, i32 %tmp86)
  %tmp89 = load %class.List * * %_prev
  %tmp90 = load %class.List * * %_aux01
  %tmp91 = call %class.List * (%class.List *)* @__GetNext_List(%class.List * %tmp90)
  %tmp92 = call i1 (%class.List *, %class.List *)* @__SetNext_List(%class.List * %tmp89, %class.List * %tmp91)
  store i1 %tmp92, i1 * %_aux05
  %tmp93 = sub i32 0, 555
  %tmp94 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp95 = call i32 (i8 *, ...)* @printf(i8 * %tmp94, i32 %tmp93)
  br label %label29
label29:
  br label %label26
label25:
  store i32 0, i32 * %_nt
  br label %label26
label26:
  %tmp96 = load i1 * %_ret_val
  %tmp97 = xor i1 %tmp96, 1
  br i1 %tmp97, label %label30, label %label31
label30:
  %tmp98 = load %class.List * * %_aux01
  store %class.List * %tmp98, %class.List * * %_prev
  %tmp99 = load %class.List * * %_aux01
  %tmp100 = call %class.List * (%class.List *)* @__GetNext_List(%class.List * %tmp99)
  store %class.List * %tmp100, %class.List * * %_aux01
  %tmp101 = load %class.List * * %_aux01
  %tmp102 = call i1 (%class.List *)* @__GetEnd_List(%class.List * %tmp101)
  store i1 %tmp102, i1 * %_var_end
  %tmp103 = load %class.List * * %_aux01
  %tmp104 = call %class.Element * (%class.List *)* @__GetElem_List(%class.List * %tmp103)
  store %class.Element * %tmp104, %class.Element * * %_var_elem
  store i32 1, i32 * %_aux04
  br label %label32
label31:
  store i32 0, i32 * %_nt
  br label %label32
label32:
  br label %label23
label22:
  %tmp105 = load %class.List * * %_my_head
  ret %class.List * %tmp105
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
  %tmp106 = getelementptr %class.List * %this, i32 0, i32 2
  %tmp107 = load i1 * %tmp106
  store i1 %tmp107, i1 * %_var_end
  %tmp108 = getelementptr %class.List * %this, i32 0, i32 0
  %tmp109 = load %class.Element * * %tmp108
  store %class.Element * %tmp109, %class.Element * * %_var_elem
  br label %label35
label35:
  %tmp110 = load i1 * %_var_end
  %tmp111 = xor i1 %tmp110, 1
  br i1 %tmp111, label %label33, label %label34
label33:
  %tmp112 = load %class.Element * * %_e
  %tmp113 = load %class.Element * * %_var_elem
  %tmp114 = call i1 (%class.Element *, %class.Element *)* @__Equal_Element(%class.Element * %tmp112, %class.Element * %tmp113)
  br i1 %tmp114, label %label36, label %label37
label36:
  store i32 1, i32 * %_int_ret_val
  br label %label38
label37:
  store i32 0, i32 * %_nt
  br label %label38
label38:
  %tmp115 = load %class.List * * %_aux01
  %tmp116 = call %class.List * (%class.List *)* @__GetNext_List(%class.List * %tmp115)
  store %class.List * %tmp116, %class.List * * %_aux01
  %tmp117 = load %class.List * * %_aux01
  %tmp118 = call i1 (%class.List *)* @__GetEnd_List(%class.List * %tmp117)
  store i1 %tmp118, i1 * %_var_end
  %tmp119 = load %class.List * * %_aux01
  %tmp120 = call %class.Element * (%class.List *)* @__GetElem_List(%class.List * %tmp119)
  store %class.Element * %tmp120, %class.Element * * %_var_elem
  br label %label35
label34:
  %tmp121 = load i32 * %_int_ret_val
  ret i32 %tmp121
}
define i1 @__GetEnd_List(%class.List * %this) {
entry:
  %tmp122 = getelementptr %class.List * %this, i32 0, i32 2
  %tmp123 = load i1 * %tmp122
  ret i1 %tmp123
}
define %class.Element * @__GetElem_List(%class.List * %this) {
entry:
  %tmp124 = getelementptr %class.List * %this, i32 0, i32 0
  %tmp125 = load %class.Element * * %tmp124
  ret %class.Element * %tmp125
}
define %class.List * @__GetNext_List(%class.List * %this) {
entry:
  %tmp126 = getelementptr %class.List * %this, i32 0, i32 1
  %tmp127 = load %class.List * * %tmp126
  ret %class.List * %tmp127
}
define i1 @__Print_List(%class.List * %this) {
entry:
  %_aux01 = alloca %class.List *
  %_var_end = alloca i1
  %_var_elem = alloca %class.Element *
  store %class.List * %this, %class.List * * %_aux01
  %tmp128 = getelementptr %class.List * %this, i32 0, i32 2
  %tmp129 = load i1 * %tmp128
  store i1 %tmp129, i1 * %_var_end
  %tmp130 = getelementptr %class.List * %this, i32 0, i32 0
  %tmp131 = load %class.Element * * %tmp130
  store %class.Element * %tmp131, %class.Element * * %_var_elem
  br label %label41
label41:
  %tmp132 = load i1 * %_var_end
  %tmp133 = xor i1 %tmp132, 1
  br i1 %tmp133, label %label39, label %label40
label39:
  %tmp134 = load %class.Element * * %_var_elem
  %tmp135 = call i32 (%class.Element *)* @__GetAge_Element(%class.Element * %tmp134)
  %tmp136 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp137 = call i32 (i8 *, ...)* @printf(i8 * %tmp136, i32 %tmp135)
  %tmp138 = load %class.List * * %_aux01
  %tmp139 = call %class.List * (%class.List *)* @__GetNext_List(%class.List * %tmp138)
  store %class.List * %tmp139, %class.List * * %_aux01
  %tmp140 = load %class.List * * %_aux01
  %tmp141 = call i1 (%class.List *)* @__GetEnd_List(%class.List * %tmp140)
  store i1 %tmp141, i1 * %_var_end
  %tmp142 = load %class.List * * %_aux01
  %tmp143 = call %class.Element * (%class.List *)* @__GetElem_List(%class.List * %tmp142)
  store %class.Element * %tmp143, %class.Element * * %_var_elem
  br label %label41
label40:
  ret i1 true
}
define i32 @__Start_LL(%class.LL * %this) {
entry:
  %_head = alloca %class.List *
  %_last_elem = alloca %class.List *
  %_aux01 = alloca i1
  %_el01 = alloca %class.Element *
  %_el02 = alloca %class.Element *
  %_el03 = alloca %class.Element *
  %tmp145 = mul i32 17, 1
  %tmp146 = call i8* @malloc ( i32 %tmp145)
  %tmp144 = bitcast i8* %tmp146 to %class.List*
  store %class.List * %tmp144, %class.List * * %_last_elem
  %tmp147 = load %class.List * * %_last_elem
  %tmp148 = call i1 (%class.List *)* @__Init_List(%class.List * %tmp147)
  store i1 %tmp148, i1 * %_aux01
  %tmp149 = load %class.List * * %_last_elem
  store %class.List * %tmp149, %class.List * * %_head
  %tmp150 = load %class.List * * %_head
  %tmp151 = call i1 (%class.List *)* @__Init_List(%class.List * %tmp150)
  store i1 %tmp151, i1 * %_aux01
  %tmp152 = load %class.List * * %_head
  %tmp153 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp152)
  store i1 %tmp153, i1 * %_aux01
  %tmp155 = mul i32 9, 1
  %tmp156 = call i8* @malloc ( i32 %tmp155)
  %tmp154 = bitcast i8* %tmp156 to %class.Element*
  store %class.Element * %tmp154, %class.Element * * %_el01
  %tmp157 = load %class.Element * * %_el01
  %tmp158 = call i1 (%class.Element *, i32, i32, i1)* @__Init_Element(%class.Element * %tmp157, i32 25, i32 37000, i1 false)
  store i1 %tmp158, i1 * %_aux01
  %tmp159 = load %class.List * * %_head
  %tmp160 = load %class.Element * * %_el01
  %tmp161 = call %class.List * (%class.List *, %class.Element *)* @__Insert_List(%class.List * %tmp159, %class.Element * %tmp160)
  store %class.List * %tmp161, %class.List * * %_head
  %tmp162 = load %class.List * * %_head
  %tmp163 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp162)
  store i1 %tmp163, i1 * %_aux01
  %tmp164 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp165 = call i32 (i8 *, ...)* @printf(i8 * %tmp164, i32 10000000)
  %tmp167 = mul i32 9, 1
  %tmp168 = call i8* @malloc ( i32 %tmp167)
  %tmp166 = bitcast i8* %tmp168 to %class.Element*
  store %class.Element * %tmp166, %class.Element * * %_el01
  %tmp169 = load %class.Element * * %_el01
  %tmp170 = call i1 (%class.Element *, i32, i32, i1)* @__Init_Element(%class.Element * %tmp169, i32 39, i32 42000, i1 true)
  store i1 %tmp170, i1 * %_aux01
  %tmp171 = load %class.Element * * %_el01
  store %class.Element * %tmp171, %class.Element * * %_el02
  %tmp172 = load %class.List * * %_head
  %tmp173 = load %class.Element * * %_el01
  %tmp174 = call %class.List * (%class.List *, %class.Element *)* @__Insert_List(%class.List * %tmp172, %class.Element * %tmp173)
  store %class.List * %tmp174, %class.List * * %_head
  %tmp175 = load %class.List * * %_head
  %tmp176 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp175)
  store i1 %tmp176, i1 * %_aux01
  %tmp177 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp178 = call i32 (i8 *, ...)* @printf(i8 * %tmp177, i32 10000000)
  %tmp180 = mul i32 9, 1
  %tmp181 = call i8* @malloc ( i32 %tmp180)
  %tmp179 = bitcast i8* %tmp181 to %class.Element*
  store %class.Element * %tmp179, %class.Element * * %_el01
  %tmp182 = load %class.Element * * %_el01
  %tmp183 = call i1 (%class.Element *, i32, i32, i1)* @__Init_Element(%class.Element * %tmp182, i32 22, i32 34000, i1 false)
  store i1 %tmp183, i1 * %_aux01
  %tmp184 = load %class.List * * %_head
  %tmp185 = load %class.Element * * %_el01
  %tmp186 = call %class.List * (%class.List *, %class.Element *)* @__Insert_List(%class.List * %tmp184, %class.Element * %tmp185)
  store %class.List * %tmp186, %class.List * * %_head
  %tmp187 = load %class.List * * %_head
  %tmp188 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp187)
  store i1 %tmp188, i1 * %_aux01
  %tmp190 = mul i32 9, 1
  %tmp191 = call i8* @malloc ( i32 %tmp190)
  %tmp189 = bitcast i8* %tmp191 to %class.Element*
  store %class.Element * %tmp189, %class.Element * * %_el03
  %tmp192 = load %class.Element * * %_el03
  %tmp193 = call i1 (%class.Element *, i32, i32, i1)* @__Init_Element(%class.Element * %tmp192, i32 27, i32 34000, i1 false)
  store i1 %tmp193, i1 * %_aux01
  %tmp194 = load %class.List * * %_head
  %tmp195 = load %class.Element * * %_el02
  %tmp196 = call i32 (%class.List *, %class.Element *)* @__Search_List(%class.List * %tmp194, %class.Element * %tmp195)
  %tmp197 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp198 = call i32 (i8 *, ...)* @printf(i8 * %tmp197, i32 %tmp196)
  %tmp199 = load %class.List * * %_head
  %tmp200 = load %class.Element * * %_el03
  %tmp201 = call i32 (%class.List *, %class.Element *)* @__Search_List(%class.List * %tmp199, %class.Element * %tmp200)
  %tmp202 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp203 = call i32 (i8 *, ...)* @printf(i8 * %tmp202, i32 %tmp201)
  %tmp204 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp205 = call i32 (i8 *, ...)* @printf(i8 * %tmp204, i32 10000000)
  %tmp207 = mul i32 9, 1
  %tmp208 = call i8* @malloc ( i32 %tmp207)
  %tmp206 = bitcast i8* %tmp208 to %class.Element*
  store %class.Element * %tmp206, %class.Element * * %_el01
  %tmp209 = load %class.Element * * %_el01
  %tmp210 = call i1 (%class.Element *, i32, i32, i1)* @__Init_Element(%class.Element * %tmp209, i32 28, i32 35000, i1 false)
  store i1 %tmp210, i1 * %_aux01
  %tmp211 = load %class.List * * %_head
  %tmp212 = load %class.Element * * %_el01
  %tmp213 = call %class.List * (%class.List *, %class.Element *)* @__Insert_List(%class.List * %tmp211, %class.Element * %tmp212)
  store %class.List * %tmp213, %class.List * * %_head
  %tmp214 = load %class.List * * %_head
  %tmp215 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp214)
  store i1 %tmp215, i1 * %_aux01
  %tmp216 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp217 = call i32 (i8 *, ...)* @printf(i8 * %tmp216, i32 2220000)
  %tmp218 = load %class.List * * %_head
  %tmp219 = load %class.Element * * %_el02
  %tmp220 = call %class.List * (%class.List *, %class.Element *)* @__Delete_List(%class.List * %tmp218, %class.Element * %tmp219)
  store %class.List * %tmp220, %class.List * * %_head
  %tmp221 = load %class.List * * %_head
  %tmp222 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp221)
  store i1 %tmp222, i1 * %_aux01
  %tmp223 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp224 = call i32 (i8 *, ...)* @printf(i8 * %tmp223, i32 33300000)
  %tmp225 = load %class.List * * %_head
  %tmp226 = load %class.Element * * %_el01
  %tmp227 = call %class.List * (%class.List *, %class.Element *)* @__Delete_List(%class.List * %tmp225, %class.Element * %tmp226)
  store %class.List * %tmp227, %class.List * * %_head
  %tmp228 = load %class.List * * %_head
  %tmp229 = call i1 (%class.List *)* @__Print_List(%class.List * %tmp228)
  store i1 %tmp229, i1 * %_aux01
  %tmp230 = getelementptr [4 x i8] * @.formatting.string, i32 0, i32 0
  %tmp231 = call i32 (i8 *, ...)* @printf(i8 * %tmp230, i32 44440000)
  ret i32 0
}
declare i32 @printf (i8 *, ...)
declare i8 * @malloc (i32)
