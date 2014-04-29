/*****************************************************
Esta classe Codegen é a responsável por emitir LLVM-IR. 
Ela possui o mesmo método 'visit' sobrecarregado de
acordo com o tipo do parâmetro. Se o parâmentro for
do tipo 'While', o 'visit' emitirá código LLVM-IR que 
representa este comportamento. 
Alguns métodos 'visit' já estão prontos e, por isso,
a compilação do código abaixo já é possível.

class a{
    public static void main(String[] args){
    	System.out.println(1+2);
    }
}

O pacote 'llvmast' possui estruturas simples 
que auxiliam a geração de código em LLVM-IR. Quase todas 
as classes estão prontas; apenas as seguintes precisam ser 
implementadas: 

// llvmasm/LlvmBranch.java
// llvmasm/LlvmIcmp.java
// llvmasm/LlvmMinus.java
// llvmasm/LlvmTimes.java


Todas as assinaturas de métodos e construtores 
necessárias já estão lá. 


Observem todos os métodos e classes já implementados
e o manual do LLVM-IR (http://llvm.org/docs/LangRef.html) 
como guia no desenvolvimento deste projeto. 

 ****************************************************/
package llvm;

import semant.Env;
import symbol.ClassInfo;
import symbol.Symbol;
import syntaxtree.*;
import llvmast.*;

import java.util.*;

public class Codegen extends VisitorAdapter{
	private List<LlvmInstruction> assembler;
	private Codegen codeGenerator;

	private SymTab symTab;
	private ClassNode classEnv; 	// Aponta para a classe atualmente em uso em symTab
	private MethodNode methodEnv; 	// Aponta para a metodo atualmente em uso em symTab


	public Codegen(){
		assembler = new LinkedList<LlvmInstruction>();
	}

	// Método de entrada do Codegen
	public String translate(Program p, Env env){
		codeGenerator = new Codegen();
		
		
		/*
		Symbol symbol=Symbol.symbol("b");
		ClassInfo ci=env.classes.get(symbol);
		Hashtable<Symbol,symbol.VarInfo> o=ci.attributes;
		int i=1;
		System.out.println(o.keys());
		Enumeration<Symbol> s=o.keys();
		while (s.hasMoreElements()) {
			Symbol type = (Symbol) s.nextElement();
			System.out.println(type);
			System.out.println(o.get(type).type);
			if(i>5)
				break;
			i++;
		}
		//*/
//		
//		Enumeration<Symbol> keys=env.classes.keys();
//		while (keys.hasMoreElements()) {
//			symbol = (Symbol) keys.nextElement();
//			System.out.print(symbol);
//		}
		
		// Preenchendo a Tabela de Símbolos
		// Quem quiser usar 'env', apenas comente essa linha
		// codeGenerator.symTab.FillTabSymbol(p);

		// Formato da String para o System.out.printlnijava "%d\n"
		codeGenerator.assembler.add(new LlvmConstantDeclaration("@.formatting.string", "private constant [4 x i8] c\"%d\\0A\\00\""));	

		// NOTA: sempre que X.accept(Y), então Y.visit(X);
		// NOTA: Logo, o comando abaixo irá chamar codeGenerator.visit(Program), linha 75
		p.accept(codeGenerator);

		// Link do printf
		List<LlvmType> pts = new LinkedList<LlvmType>();
		pts.add(new LlvmPointer(LlvmPrimitiveType.I8));
		pts.add(LlvmPrimitiveType.DOTDOTDOT);
		codeGenerator.assembler.add(new LlvmExternalDeclaration("@printf", LlvmPrimitiveType.I32, pts)); 
		List<LlvmType> mallocpts = new LinkedList<LlvmType>();
		mallocpts.add(LlvmPrimitiveType.I32);
		codeGenerator.assembler.add(new LlvmExternalDeclaration("@malloc", new LlvmPointer(LlvmPrimitiveType.I8),mallocpts)); 


		String r = new String();
		for(LlvmInstruction instr : codeGenerator.assembler)
			r += instr+"\n";
		return r;
	}

	public LlvmValue visit(Program n){
		System.out.println("Program");
		
		n.mainClass.accept(this);

		for (util.List<ClassDecl> c = n.classList; c != null; c = c.tail)
			c.head.accept(this);

		return null;
	}

	public LlvmValue visit(MainClass n){
		System.out.println("MainClass");
		
		// definicao do main 
		assembler.add(new LlvmDefine("@main", LlvmPrimitiveType.I32, new LinkedList<LlvmValue>()));
		assembler.add(new LlvmLabel(new LlvmLabelValue("entry")));
		LlvmRegister R1 = new LlvmRegister(new LlvmPointer(LlvmPrimitiveType.I32));
		assembler.add(new LlvmAlloca(R1, LlvmPrimitiveType.I32, new LinkedList<LlvmValue>()));
		assembler.add(new LlvmStore(new LlvmIntegerLiteral(0), R1));

		// Statement é uma classe abstrata
		// Portanto, o accept chamado é da classe que implementa Statement, por exemplo,  a classe "Print". 
		n.stm.accept(this);

		// Final do Main
		LlvmRegister R2 = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmLoad(R2,R1));
		assembler.add(new LlvmRet(R2));
		assembler.add(new LlvmCloseDefinition());
		return null;
	}

	public LlvmValue visit(Plus n){
		System.out.println("Plus");
		
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmPlus(lhs,LlvmPrimitiveType.I32,v1,v2));
		return lhs;
	}

	public LlvmValue visit(Print n){
		System.out.println("Print");
		
		LlvmValue v =  n.exp.accept(this);
		
		// getelementptr:
		LlvmRegister lhs = new LlvmRegister(new LlvmPointer(LlvmPrimitiveType.I8));
		LlvmRegister src = new LlvmNamedValue("@.formatting.string",new LlvmPointer(new LlvmArray(4,LlvmPrimitiveType.I8)));
		List<LlvmValue> offsets = new LinkedList<LlvmValue>();
		offsets.add(new LlvmIntegerLiteral(0));
		offsets.add(new LlvmIntegerLiteral(0));
		List<LlvmType> pts = new LinkedList<LlvmType>();
		pts.add(new LlvmPointer(LlvmPrimitiveType.I8));
		List<LlvmValue> args = new LinkedList<LlvmValue>();
		args.add(lhs);
		args.add(v);
		assembler.add(new LlvmGetElementPointer(lhs,src,offsets));

		pts = new LinkedList<LlvmType>();
		pts.add(new LlvmPointer(LlvmPrimitiveType.I8));
		pts.add(LlvmPrimitiveType.DOTDOTDOT);

		// printf:
		assembler.add(new LlvmCall(new LlvmRegister(LlvmPrimitiveType.I32),
				LlvmPrimitiveType.I32,
				pts,				 
				"@printf",
				args
				));
		return null;
	}
	
	public LlvmValue visit(IntegerLiteral n){
		System.out.println("IntegerLiteral");
		
		return new LlvmIntegerLiteral(n.value);
	};
	
	// Todos os visit's que devem ser implementados	
	public LlvmValue visit(ClassDeclSimple n){
		System.out.println("ClassDeclSimple");
		
		ArrayList<LlvmType> atributos=new ArrayList<>();
		
		util.List<VarDecl> a=n.varList;
		while(a!=null){
			System.out.println("|"+a.head.type +"| ");
			if(a.head.type.toString().trim().equals("int"))
				atributos.add(LlvmPrimitiveType.I32);
			else
				atributos.add(new LlvmStructure(atributos,n.name.s));
			a=a.tail;
		}
		System.out.println(new LlvmStructure(atributos,n.name.s).createInstruction());
		
		return null;
	}
	
	public LlvmValue visit(ClassDeclExtends n){
		System.out.println("ClassDeclExtends");
		return null;
	}
	
	public LlvmValue visit(VarDecl n){
		System.out.println("VarDecl");
		return null;
	}
	
	public LlvmValue visit(MethodDecl n){
		System.out.println("MethodDecl");
		return null;
	}
	
	public LlvmValue visit(Formal n){
		System.out.println("Formal");
		return null;
	}
	
	public LlvmValue visit(IntArrayType n){
		System.out.println("IntArrayType");
		return null;
	}
	
	public LlvmValue visit(BooleanType n){
		System.out.println("BooleanType");
		return null;
	}
	
	public LlvmValue visit(IntegerType n){
		System.out.println("IntegerType");
		return null;
	}
	
	public LlvmValue visit(IdentifierType n){
		System.out.println("IdentifierType");
		return null;
	}
	
	public LlvmValue visit(Block n){
		System.out.println("Block");
		return null;
	}
	
	public LlvmValue visit(If n){
		System.out.println("If");
		return null;
	}
	
	public LlvmValue visit(While n){
		System.out.println("While");
		return null;
	}
	
	public LlvmValue visit(Assign n){
		System.out.println("Assign");
		return null;
	}
	
	public LlvmValue visit(ArrayAssign n){
		System.out.println("ArrayAssign");
		return null;
	}
	
	public LlvmValue visit(And n){
		System.out.println("And");
		return null;
	}
	
	public LlvmValue visit(LessThan n){ // TODO
		System.out.println("LessThan");
		
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		
		
		
		return null;
	}
	
	public LlvmValue visit(Equal n){
		System.out.println("Equal");
		return null;
	}
	
	public LlvmValue visit(Minus n){
		System.out.println("Minus");
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmMinus(lhs,LlvmPrimitiveType.I32,v1,v2));
		return lhs;
	}
	
	public LlvmValue visit(Times n){
		System.out.println("Times");
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmTimes(lhs,LlvmPrimitiveType.I32,v1,v2));
		return lhs;
	}
	
	public LlvmValue visit(ArrayLookup n){
		System.out.println("ArrayLookup");
		return null;
	}
	
	public LlvmValue visit(ArrayLength n){
		System.out.println("ArrayLength");
		return null;
	}
	
	public LlvmValue visit(Call n){
		System.out.println("Call");
		
		
		
		
		
		return null;
	}
	
	public LlvmValue visit(True n){
		System.out.println("True");
		return null;
	}
	
	public LlvmValue visit(False n){
		System.out.println("False");
		return null;
	}
	
	public LlvmValue visit(IdentifierExp n){
		System.out.println("IdentifierExp");
		return null;
	}
	
	public LlvmValue visit(This n){
		System.out.println("This");
		return null;
	}
	
	public LlvmValue visit(NewArray n){
		System.out.println("NewArray");
		return null;
	}
	
	public LlvmValue visit(NewObject n){
		System.out.println("NewObject");
		return null;
	}
	
	public LlvmValue visit(Not n){
		System.out.println("Not");
		return null;
	}
	
	public LlvmValue visit(Identifier n){
		System.out.println("Identifier");
		return null;
	}
}


/**********************************************************************************/
/* === Tabela de Símbolos ==== 
 * 
 * 
 */
/**********************************************************************************/

class SymTab extends VisitorAdapter{
	public Map<String, ClassNode> classes;     
	private ClassNode classEnv;    //aponta para a classe em uso

	public LlvmValue FillTabSymbol(Program n){
		n.accept(this);
		return null;
	}
	public LlvmValue visit(Program n){
		n.mainClass.accept(this);

		for (util.List<ClassDecl> c = n.classList; c != null; c = c.tail)
			c.head.accept(this);

		return null;
	}

	public LlvmValue visit(MainClass n){
		classes.put(n.className.s, new ClassNode(n.className.s, null, null));
		return null;
	}

	public LlvmValue visit(ClassDeclSimple n){
		List<LlvmType> typeList = null;
		// Constroi TypeList com os tipos das variáveis da Classe (vai formar a Struct da classe)

		List<LlvmValue> varList = null;
		// Constroi VarList com as Variáveis da Classe

		classes.put(n.name.s, new ClassNode(n.name.s, 
				new LlvmStructure(typeList,""), 
				varList)
				);
		// Percorre n.methodList visitando cada método
		return null;
	}

	public LlvmValue visit(ClassDeclExtends n){return null;}
	public LlvmValue visit(VarDecl n){return null;}
	public LlvmValue visit(Formal n){return null;}
	public LlvmValue visit(MethodDecl n){return null;}
	public LlvmValue visit(IdentifierType n){return null;}
	public LlvmValue visit(IntArrayType n){return null;}
	public LlvmValue visit(BooleanType n){return null;}
	public LlvmValue visit(IntegerType n){return null;}
}

class ClassNode extends LlvmType{
	ClassNode(String nameClass, LlvmStructure classType, List<LlvmValue> varList){
	}
}

class MethodNode{
}