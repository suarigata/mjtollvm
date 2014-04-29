package llvmast;
public  class LlvmBranch extends LlvmInstruction{
	public LlvmValue cond;
	public LlvmLabelValue l1,l2;

	public LlvmBranch(LlvmLabelValue label){
		this.cond = this.l1 = null;
		this.l2 = label;
	}

	public LlvmBranch(LlvmValue cond,  LlvmLabelValue brTrue, LlvmLabelValue brFalse){
		this.cond = cond;
		this.l1 = brTrue;
		this.l2 = brFalse;
	}

	public String toString(){
		return "  br " + (cond != null ? "i1 " + cond + ", label " + l1 + ", ":"") + "label " + l2;
	}
}
