package llvmast;
public class LlvmLabelValue extends LlvmValue{
	
	public static int index=0;
	
	public String value;
	public LlvmLabelValue(String value){
		type = LlvmPrimitiveType.LABEL;
		this.value = value;
	}
	
	public static LlvmLabelValue create(){
		return new LlvmLabelValue("label"+LlvmLabelValue.index++);
	}
	
	public String toString(){
		return ""+ value;
	}
}