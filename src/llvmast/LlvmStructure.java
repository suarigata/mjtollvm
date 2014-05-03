package llvmast;
import java.util.*;

import syntaxtree.VarDecl;
public class LlvmStructure extends LlvmInstruction{
	public int sizeByte;
	public List<LlvmType> typeList;
	public String className;
	
	public LlvmStructure(List<LlvmType> typeList,String className){
		this.typeList = typeList;
		this.className = "%class." + className;
		
		// Fazendo a contagem do tamanho da estrutura, caso precise de Malloc
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
		
		return this.className + " = type " + S;
	}
	
	public String typeName(){
			return className;
	}
}