package llvmast;
public  class LlvmIcmp extends LlvmInstruction{
	public LlvmRegister lhs;
	public LlvmType type;
	public LlvmValue op1, op2;
	public int conditionCode;
	
	public static final int EQ=0;
	public static final int SLT=8;
	public static final String[] cond = {"eq","ne","ugt","uge","ult","ule","sgt","sge","slt","sle"};
	
	public LlvmIcmp(LlvmRegister lhs,  int conditionCode, LlvmType type, LlvmValue op1, LlvmValue op2){
		this.lhs = lhs;
		this.type = type;
		this.op1 = op1;
		this.op2 = op2;
		this.conditionCode = conditionCode;
	}

	public String toString(){
		return "  " + lhs + " = icmp " + cond[conditionCode] + " " + type + " " + op1 + ", " + op2;
	}
}