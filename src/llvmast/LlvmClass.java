package llvmast;
public class LlvmClass extends LlvmType{
	public String name;

	public LlvmClass(String name){
		this.name = name;
		super.type = this;
	}

	public String toString(){
		return "%class." + this.name;
	}
}