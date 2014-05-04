package llvmast;
import java.util.*;

import syntaxtree.VarDecl;
public class LlvmStructure extends LlvmType{
	public int sizeByte;
	public List<LlvmType> typeList;
	public String className;
	
	public LlvmStructure(List<LlvmType> typeList,String className){
		this.typeList = typeList;
		this.className = "%class." + className; // TODO talvez so armazenar o nome
		
		// Fazendo a contagem do tamanho da estrutura, caso precise de Malloc
		// if(typeList!=null)
		for (LlvmType T : typeList){
			if ( T instanceof LlvmPointer ){ 
				sizeByte += 8;
			} else {
				if ( T instanceof LlvmPrimitiveType){
					if (T.toString().equals("i32")){
						sizeByte += 4;
					} else {
						sizeByte += 1;
					}
				}
			}
		}
	}
	
	public String toString(){
		return this.className;
	}
	
	public LlvmClass getInstruction(){
		String S;
		
		if (typeList.isEmpty())
			S = "{ }";
		else{
			S = "{ " + typeList.get(0);
			for (int i = 1; i < typeList.size(); i++){
				S += ", "+typeList.get(i).toString();
			}
			S += " }";
		}
		return new LlvmClass(this.className + " = type " + S);
	}
	
	public int getOffset(int offset){
		int memOffset=0;
		for(LlvmType T: typeList)
			if(--offset>0){
				if ( T instanceof LlvmPointer ){ 
					memOffset += 8;
				} else {
					if ( T instanceof LlvmPrimitiveType){
						if (T.toString().equals("i32")){
							memOffset += 4;
						} else {
							memOffset += 1;
						}
					}
				}
			}
			else
				break;
		return memOffset;
	}
	
	class LlvmClass extends LlvmInstruction{
		public String definition;
		public LlvmClass(String definition){
			this.definition=definition;
		}
		public String toString(){
			return this.definition;
		}
	}
}