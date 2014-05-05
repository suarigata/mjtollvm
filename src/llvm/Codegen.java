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
import symbol.VarInfo;
import syntaxtree.*;
import llvmast.*;

import java.util.*;

public class Codegen extends VisitorAdapter{
	private List<LlvmInstruction> assembler;
	private Env env;
	private String currentClass;
	private HashMap<String, LlvmRegister> localVars;
	private HashMap<String, LlvmStructure>classes;
	private LlvmRegister thisReg;
	
	public Codegen(){
		assembler = new LinkedList<LlvmInstruction>();
		classes=new HashMap<String, LlvmStructure>();
	}
	
	// Método de entrada do Codegen
	public String translate(Program p, Env env){
		this.env=env;
		
		// Formato da String para o System.out.printlnijava "%d\n"
		this.assembler.add(new LlvmConstantDeclaration("@.formatting.string", "private constant [4 x i8] c\"%d\\0A\\00\""));	
		
		criaClasses();
		
		// NOTA: sempre que X.accept(Y), então Y.visit(X);
		// NOTA: Logo, o comando abaixo irá chamar codeGenerator.visit(Program), linha 75
		p.accept(this);
		
		// Link do printf
		List<LlvmType> pts = new LinkedList<LlvmType>();
		pts.add(new LlvmPointer(LlvmPrimitiveType.I8));
		pts.add(LlvmPrimitiveType.DOTDOTDOT);
		this.assembler.add(new LlvmExternalDeclaration("@printf", LlvmPrimitiveType.I32, pts)); 
		List<LlvmType> mallocpts = new LinkedList<LlvmType>();
		mallocpts.add(LlvmPrimitiveType.I32);
		this.assembler.add(new LlvmExternalDeclaration("@malloc", new LlvmPointer(LlvmPrimitiveType.I8),mallocpts)); 
		
		String r = new String();
		for(LlvmInstruction instr : this.assembler)
			r += instr+"\n";
		
		System.out.println(r); // TODO Exibição do programr gerado. Tirar quando pronto.
		
		return r;
	}
	
	private void criaClasses(){
		Enumeration<Symbol> keys=env.classes.keys();
		LlvmStructure classe;
		ClassInfo classInfo;
		LlvmType type;
		while(keys.hasMoreElements()){
			classInfo=env.classes.get((Symbol) keys.nextElement()); // pega cada classe
			
//			if(classInfo.base!=null)
//				System.out.println("base: "+classInfo.base.name); // TODO usar esses códigos para herança
//			System.out.println(classInfo.vtable); // aparece tudo null
//			System.out.println(classInfo.vtableIndex); // vtable? apareceu [ola] para o metodo ola
//			System.out.println(classInfo.name);
			
			ArrayList<LlvmType> typeList=new ArrayList<LlvmType>(); // TODO pode checar se é a MainClass para não gerar
			for (Symbol atributo : classInfo.attributesOrder){ // pega as variaveis ordenadas e preenche uma lista de tipos
				VarInfo varInfo=classInfo.attributes.get(atributo);
				type=(LlvmType)varInfo.type.accept(this);
//				if(type instanceof LlvmArray)
//					typeList.add(new LlvmPointer(LlvmPrimitiveType.VOID)); // TODO
//				else
					typeList.add(type);
//				System.out.println("access: "+varInfo.access);
//				System.out.println("name: "+varInfo.name);
			}
			
			classe=new LlvmStructure(typeList,classInfo.name.toString());
			classes.put(classInfo.name.toString(),classe);
			assembler.add(classe.getInstruction());
		}
		// System.out.println(this.env.classes.get(Symbol.symbol("d")).getAttributeOffset(Symbol.symbol("c2"))); TODO disperdício, mas funcina
		// System.out.println(this.env.classes.get(Symbol.symbol("c")).getMethodOffset(Symbol.symbol("a")));
	}
	
	private LlvmRegister getVar(String name,String className){
		LlvmRegister lhs=null;
		
//		Iterator<String> hash=localVars.keySet().iterator(); // teste para ver o que está nas variáveis locais
//		while (hash.hasNext()){
//			String string = (String) hash.next();
//			System.out.println(string +": "+ localVars.get(string).type +" "+ localVars.get(string));
//		}
//		
//		System.out.println("nome: "+name+" classe: "+className+" localVar: "+localVars.get(name));
		
		if(localVars.containsKey(name))
			lhs=localVars.get(name);
		else{
			name=name.substring(2); // tirando prefixo
			if(this.env.classes.get(Symbol.symbol(className)).attributes.containsKey(Symbol.symbol(name))){
				ClassInfo classe=this.env.classes.get(Symbol.symbol(className));
				int offset=classe.getAttributeOffset(Symbol.symbol(name))-1;
				LlvmType type=classes.get(className).typeList.get(offset);
				lhs=new LlvmRegister(new LlvmPointer(type));
				// offset=this.classes.get(classe).getOffset(offset); TODO acho que não precisa acessar por bytes o offset
				((LlvmArray)type).length=4;
				List<LlvmValue> offsets=new ArrayList<LlvmValue>();
				offsets.add(new LlvmRegister(0+"", type));
				offsets.add(new LlvmRegister(offset+"", type));
				assembler.add(new LlvmGetElementPointer(lhs,this.thisReg,offsets));
			}
		}
		return lhs;
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
	
	// Todos os visit's que devem ser implementados TODO	
	public LlvmValue visit(ClassDeclSimple n){
		System.out.println("ClassDeclSimple"); // ok
		
		currentClass=n.name.toString();
		thisReg=new LlvmRegister("%this",new LlvmPointer(classes.get(currentClass)));
		
		util.List<MethodDecl> m=n.methodList;
		while(m!=null){
			m.head.accept(this);
			m=m.tail;
		}
		return null;
	}
	
	public LlvmValue visit(ClassDeclExtends n){
		System.out.println("ClassDeclExtends");
		
		currentClass=n.name.toString();
		thisReg=new LlvmRegister("%this",new LlvmPointer(classes.get(currentClass)));
		
		util.List<MethodDecl> m=n.methodList;
		while(m!=null){
			m.head.accept(this);
			m=m.tail;
		}
		return null;
	}
	
	public LlvmValue visit(VarDecl n){
		System.out.println("VarDecl"); // ok
		
		LlvmType type=(LlvmType)n.type.accept(this);
		
		return new LlvmNamedValue(
				n.name.accept(this).toString(),type);
	}
	
	public LlvmValue visit(MethodDecl n){
		System.out.println("MethodDecl");
		localVars=new HashMap<>();
		
		System.out.println("----------------------------- method init ----------------------------");
		
		LlvmType returnType=(LlvmType)n.returnType.accept(this); // assinatura
		ArrayList<LlvmValue> args=new ArrayList<LlvmValue>();
		
		args.add(thisReg);
		util.List<Formal> f=n.formals;
		while(f!=null){
			args.add(f.head.accept(this));
			f=f.tail;
		}
		assembler.add(new LlvmDefine("@__"+n.name+"_"+this.currentClass, returnType, args));
		assembler.add(new LlvmLabel(new LlvmLabelValue("entry"))); // TODO entry0 ?
		
//		System.out.println("----------------------------- locais inicio ----------------------------");
		
		f=n.formals; // formals
		LlvmRegister regVar=null;
		LlvmNamedValue var=null;
		while(f!=null){
			var=(LlvmNamedValue)f.head.accept(this);
			regVar=new LlvmRegister(new LlvmPointer(var.type)); // TODO pode ser que receba vetores. Aí tem que ver.
			assembler.add(new LlvmAlloca(regVar, var.type));
			assembler.add(new LlvmStore(var, regVar));
			localVars.put(var.name,regVar);
			f=f.tail;
		}
		
		util.List<VarDecl> l=n.locals; // locals
		while(l!=null){
			var=(LlvmNamedValue)l.head.accept(this);
			//if(!(var.type instanceof LlvmArray)){ // TODO aqui acho que é pra barrar o alloca quando for intArrayType ------------ aqui
				regVar=new LlvmRegister(new LlvmPointer(var.type));
				assembler.add(new LlvmAlloca(regVar, var.type));
				localVars.put(var.name,regVar);
			//}
			l=l.tail;
		}
		
//		System.out.println("----------------------------- locais lidas ----------------------------");
		
//		Iterator<String> hash=localVars.keySet().iterator(); // teste para ver o que está nas variáveis locais
//		while (hash.hasNext()){
//			String string = (String) hash.next();
//			System.out.println(string +": "+ localVars.get(string).type +" "+ localVars.get(string));
//		}
		
		util.List<Statement> b=n.body;
		while(b!=null){
			b.head.accept(this);
			b=b.tail;
		}
		
//		Recuperar dados de variavel local
//		LlvmRegister R2 = new LlvmRegister(LlvmPrimitiveType.I32);
//		assembler.add(new LlvmLoad(R2,R1));
//		assembler.add(new LlvmRet(R2));
		LlvmValue retorno=n.returnExp.accept(this); // TODO se for var, tem que buscar conteudo parei aqui -------------------------------
		// ver se não pode pegar o valor já nuns métodos pra dentro, mas pode ser que não de e tenha que decidir em cada ocasião
		
		// Só retorne int, boolean e classes
		assembler.add(new LlvmRet(retorno));
		assembler.add(new LlvmCloseDefinition()); // TODO criar função que ve se a expressão é bool, int ou registrador?
		
		System.out.println("----------------------------- method end ----------------------------");
		return null;
	}
	
	public LlvmValue visit(Formal n){
		System.out.println("Formal"); // ok
		return new LlvmNamedValue(
				n.name.accept(this).toString(),(LlvmType)n.type.accept(this));
	}
	
	public LlvmValue visit(IntArrayType n){
		System.out.println("IntArrayType");
		return new LlvmArray(0, LlvmPrimitiveType.I32); // TODO tratar o tamanho
	}
	
	public LlvmValue visit(BooleanType n){
		System.out.println("BooleanType"); // ok
		return LlvmPrimitiveType.I1;
	}
	
	public LlvmValue visit(IntegerType n){
		System.out.println("IntegerType"); // ok
		return LlvmPrimitiveType.I32;
	}
	
	public LlvmType visit(IdentifierType n){
		System.out.println("IdentifierType"); // ok
		return new LlvmPointer(new LlvmStructure(new ArrayList<LlvmType>(),n.name)); // TODO pegar a structure do pool?
	}
	
	public LlvmValue visit(Block n){
		System.out.println("Block"); // ok
		util.List<Statement> b=n.body;
		while(b!=null){
			b.head.accept(this);
			b=b.tail;
		}
		return null;
	}
	
	public LlvmValue visit(If n){
		System.out.println("If"); // ok
		LlvmLabelValue brTrue=LlvmLabelValue.create();
		LlvmLabelValue brFalse=LlvmLabelValue.create();
		LlvmLabelValue exit=LlvmLabelValue.create();
		LlvmValue cond=n.condition.accept(this);
		assembler.add(new LlvmBranch(cond, brTrue, brFalse));
		assembler.add(new LlvmLabel(brTrue));
		n.thenClause.accept(this);
		assembler.add(new LlvmBranch(null, null, exit));
		assembler.add(new LlvmLabel(brFalse));
		if(n.elseClause!=null)
			n.elseClause.accept(this);
		assembler.add(new LlvmLabel(exit));
		return null;
	}
	
	public LlvmValue visit(While n){
		System.out.println("While"); // ok
		LlvmLabelValue brTrue=LlvmLabelValue.create();
		LlvmLabelValue brFalse=LlvmLabelValue.create();
		LlvmLabelValue topo=LlvmLabelValue.create();
		assembler.add(new LlvmLabel(topo));
		LlvmValue cond=n.condition.accept(this);
		assembler.add(new LlvmBranch(cond, brTrue, brFalse));
		assembler.add(new LlvmLabel(brTrue));
		n.body.accept(this);
		assembler.add(new LlvmBranch(null, null, topo));
		assembler.add(new LlvmLabel(brFalse));
		return null;
	}
	
	public LlvmValue visit(Assign n){
		System.out.println("Assign"); // ok
		
		LlvmValue exp=n.exp.accept(this);
		LlvmValue name=n.var.accept(this);
		if(exp.type instanceof LlvmPointer && ((LlvmPointer)(exp.type)).content instanceof LlvmArray){
			
			//System.out.println("tamanho alocado: "+((LlvmArray)((LlvmPointer)(exp.type)).content).length);
			
			LlvmRegister var=getVar(name.toString(), this.currentClass);
			
			//System.out.println("tamanho pego: "+((LlvmArray)((LlvmPointer)(var.type)).content).length);
			
			((LlvmArray)((LlvmPointer)(var.type)).content).length=((LlvmArray)((LlvmPointer)(exp.type)).content).length;
			
			System.out.println("tamanho gravado: "+((LlvmArray)((LlvmPointer)(var.type)).content).length);
			
			ClassInfo classe=this.env.classes.get(Symbol.symbol(currentClass));
			int offset=classe.getAttributeOffset(Symbol.symbol("erro"))-1;
			LlvmType type=classes.get(currentClass).typeList.get(offset);
			System.out.println("tipo que peguei depois de tentar mudar: "+type);
			
			System.out.println(exp.type);
		}
		else{
			LlvmRegister var=getVar(name.toString(), this.currentClass);
			assembler.add(new LlvmStore(exp, var));
		}
		return null;
	}
	
	public LlvmValue visit(ArrayAssign n){
		System.out.println("ArrayAssign");
		
		
		
		LlvmValue i=n.index.accept(this);
		LlvmValue vetorName=n.var.accept(this);
		LlvmValue valor=n.value.accept(this);
		LlvmRegister vetor=getVar(vetorName.toString(), currentClass);
		LlvmRegister lhs=new LlvmRegister(vetor.type);
		List<LlvmValue> offsets=new ArrayList<LlvmValue>();
		offsets.add(new LlvmRegister(i+"", ((LlvmArray)(((LlvmPointer)(vetor.type)).content)).content )); // TODO ver l� no getVar se muda o tipo que pega
		// offsets.add(new LlvmRegister(0+"", ((LlvmArray)(vetor.type)).content));
		assembler.add(new LlvmGetElementPointer(lhs, vetor, offsets));
		assembler.add(new LlvmStore(valor, lhs));
		
		return null;
	}
	
	public LlvmValue visit(And n){
		System.out.println("And"); // ok
		LlvmValue op1=n.lhs.accept(this);
		LlvmValue op2=n.lhs.accept(this);
		LlvmType tipo=(LlvmType)n.type.accept(this);
		LlvmRegister lhs=new LlvmRegister(tipo);
		assembler.add(new LlvmAnd(lhs, tipo, op1, op2));
		return lhs;
	}
	
	public LlvmValue visit(LessThan n){
		System.out.println("LessThan"); // ok
		LlvmValue op1 = n.lhs.accept(this);
		LlvmValue op2 = n.rhs.accept(this);
		LlvmType tipo=(LlvmType)n.type.accept(this);
		LlvmRegister tmp=new LlvmRegister(tipo);
		assembler.add(new LlvmIcmp(tmp, LlvmIcmp.ULT, tipo, op1, op2));
		return tmp;
	}
	
	public LlvmValue visit(Equal n){
		System.out.println("Equal"); // ok
		LlvmValue op1 = n.lhs.accept(this);
		LlvmValue op2 = n.rhs.accept(this);
		LlvmType tipo=(LlvmType)n.type.accept(this);
		LlvmRegister tmp=new LlvmRegister(tipo);
		assembler.add(new LlvmIcmp(tmp, LlvmIcmp.EQ, tipo, op1, op2));
		return tmp;
	}
	
	public LlvmValue visit(Minus n){
		System.out.println("Minus"); // ok
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmType tipo = (LlvmType)n.type.accept(this);
		LlvmRegister lhs = new LlvmRegister(tipo);
		assembler.add(new LlvmMinus(lhs,tipo,v1,v2));
		return lhs;
	}
	
	public LlvmValue visit(Times n){
		System.out.println("Times"); // ok
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmType tipo=(LlvmType)n.type.accept(this);
		LlvmRegister lhs = new LlvmRegister(tipo);
		assembler.add(new LlvmTimes(lhs,tipo,v1,v2));
		return lhs;
	}
	
	public LlvmValue visit(ArrayLookup n){
		System.out.println("ArrayLookup");
		
		return null;
	}
	
	public LlvmValue visit(ArrayLength n){
		System.out.println("ArrayLength");
		
		return n.array.accept(this);
	}
	
	public LlvmValue visit(Call n){
		System.out.println("Call");
		
		
		// n.actuals; // TODO o que é?
		
		
		return null;
	}
	
	public LlvmValue visit(True n){
		System.out.println("True"); // ok
		System.out.println("Tipo do True: "+n.type.accept(this));
		return new LlvmBool(LlvmBool.TRUE);
	}
	
	public LlvmValue visit(False n){
		System.out.println("False"); // ok
		System.out.println("Tipo do False: "+n.type.accept(this));
		return new LlvmBool(LlvmBool.FALSE);
	}
	
	public LlvmValue visit(IdentifierExp n){ // TODO retorno só? acho que tem que tratar fora vars
		System.out.println("IdentifierExp"); // ok
		return new LlvmRegister(n.name.accept(this).toString(),(LlvmType)n.type.accept(this));
	}
	
	public LlvmValue visit(This n){
		System.out.println("This");
		return null;
	}
	
	public LlvmValue visit(NewArray n){
		System.out.println("NewArray"); // ok
		
		LlvmValue size=n.size.accept(this);
		LlvmType type=(LlvmType)n.type.accept(this);
		((LlvmArray)type).length=Integer.parseInt(size.toString());
		
		LlvmRegister lhs=new LlvmRegister(new LlvmPointer(type));
		assembler.add(new LlvmMalloc(lhs,type,size));
		
		return lhs;
	}
	
	public LlvmValue visit(NewObject n){
		System.out.println("NewObject"); // ok
		
		LlvmStructure classe=classes.get(n.className.toString());
		LlvmRegister lhs=new LlvmRegister(classe);
		assembler.add(new LlvmMalloc(lhs, classe, classe.className));
		return lhs;
	}
	
	public LlvmValue visit(Not n){
		System.out.println("Not"); // ok
		LlvmValue exp=n.exp.accept(this);
		LlvmType tipo=(LlvmType)n.type.accept(this);
		LlvmRegister lhs=new LlvmRegister(tipo);
		LlvmIntegerLiteral um=new LlvmIntegerLiteral(1);
		assembler.add(new LlvmXor(lhs, tipo, exp, um));
		return lhs;
	}
	
	public LlvmValue visit(Identifier n){
		System.out.println("Identifier "+n.s); // ok
		return new LlvmLabelValue("%_"+n.s);
	}
}