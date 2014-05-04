package llvmast;
import java.util.*;
public  class LlvmAlloca extends LlvmInstruction{
	public LlvmValue lhs;
	public LlvmType type;
	public List<LlvmValue> numbers;
	public static final ArrayList<LlvmValue> EMPTY=new ArrayList<>();
	
	public LlvmAlloca(LlvmValue lhs, LlvmType type){
		this.lhs = lhs;
		this.type = type;
		this.numbers = LlvmAlloca.EMPTY;
	}
	
	public LlvmAlloca(LlvmValue lhs, LlvmType type, List<LlvmValue> numbers){
		this.lhs = lhs;
		this.type = type;
		this.numbers = numbers;
	}

	public String toString(){
		String nrs = "";
		for(LlvmValue v : numbers)
			nrs = nrs + ", " + v.type + " " + v;
		return "  " + lhs + " = alloca " + type + nrs;
	}
}
