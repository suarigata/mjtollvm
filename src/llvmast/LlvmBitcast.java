package llvmast;
import  java.util.*;
public class LlvmBitcast extends LlvmInstruction{
	public LlvmValue lhs;
	public LlvmValue source;
	public LlvmType toType;
	public String methodName;
	public List<LlvmValue> fnTypeList;

	public LlvmBitcast(LlvmValue lhs, LlvmValue source, LlvmType toType){
		this.lhs = lhs;
		this.source = source;
		this.toType = toType;
		this.methodName=null;
	}
	
	public LlvmBitcast(LlvmValue lhs, LlvmValue source, LlvmType toType,String methodName, List<LlvmValue> fnTypeList){
		this.lhs = lhs;
		this.source = source;
		this.toType = toType;
		this.methodName=methodName;
		this.fnTypeList=fnTypeList;
	}
	
	public String toString(){
		
		String fnTypeResult = "";
		if (fnTypeList != null)
		{
			fnTypeResult += "(";
			for(int i = 0; i<fnTypeList.size(); i++){
				fnTypeResult = fnTypeResult + fnTypeList.get(i);
				if(i+1<fnTypeList.size()) 
					fnTypeResult = fnTypeResult + ", ";
			}
			fnTypeResult += ")*";
		}
		
		String ret=null;
		if(this.methodName==null)
			ret="  " + lhs + " = bitcast " + source.type + " " + source + " to " + toType;
		else
			ret="  " + lhs + " = bitcast " + source + " " + fnTypeResult +" " + methodName + " to " + toType;
		return ret;
	}

}
