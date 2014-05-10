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
		
		criaClasses(p);
		
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
		for(LlvmInstruction instr : this.assembler){
			System.out.println(instr); // TODO coments esse debug lindo
			r += instr+"\n";
		}
		
		return r;
	}
	
	private void criaClasses(Program p){
		
		Enumeration<Symbol> keys=env.classes.keys();
		LlvmStructure classe;
		ClassInfo classInfo;
		LlvmType type;
		while(keys.hasMoreElements()){
			classInfo=env.classes.get((Symbol) keys.nextElement()); // pega cada classe
			if(classInfo.name.toString().equals(p.mainClass.className.toString())) // Nao cria estrutura da classe principal
				continue;
			
//			if(classInfo.base!=null)
//				System.out.println("base: "+classInfo.base.name); // TODO usar esses códigos para herança
//			System.out.println(classInfo.vtable); // aparece tudo null
//			System.out.println(classInfo.vtableIndex); // vtable? apareceu [ola] para o metodo ola
//			System.out.println(classInfo.name);
			
			ArrayList<LlvmType> typeList=new ArrayList<LlvmType>();
			for (Symbol atributo : classInfo.attributesOrder){ // pega as variaveis ordenadas e preenche uma lista de tipos
				VarInfo varInfo=classInfo.attributes.get(atributo);
				type=(LlvmType)varInfo.type.accept(this);
				typeList.add(type);
			}
			
			classe=new LlvmStructure(typeList,classInfo.name.toString());
			classes.put(classInfo.name.toString(),classe);
			assembler.add(classe.getInstruction());
		}
	}
	
	private LlvmRegister getVar(String name,String className){ // TODO ---------------------------------------------------------
		LlvmRegister lhs=null;
		
		if(localVars.containsKey(name))
			lhs=localVars.get(name);
		else
			if(this.env.classes.get(Symbol.symbol(className)).attributes.containsKey(Symbol.symbol(name))){
				ClassInfo classe=this.env.classes.get(Symbol.symbol(className));
				int offset=classe.getAttributeOffset(Symbol.symbol(name))-1;
				LlvmType type=classes.get(className).typeList.get(offset);
				System.out.println("_---------"+type);
				lhs=new LlvmRegister(type);
				List<LlvmValue> offsets=new ArrayList<LlvmValue>();
				offsets.add(new LlvmIntegerLiteral(0));
				offsets.add(new LlvmIntegerLiteral(offset));
//				System.out.println(new LlvmGetElementPointer(lhs,this.thisReg,offsets));
//				System.out.println(new LlvmGetElementPointer(lhs,this.thisReg,offsets));
				assembler.add(new LlvmGetElementPointer(lhs,this.thisReg,offsets));
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
		
		System.out.println("-----------------------------------------------"+args);
		
		// printf:
		assembler.add(new LlvmCall(new LlvmRegister(LlvmPrimitiveType.I32),
				LlvmPrimitiveType.I32,
				pts,
				"@printf",
				args
				));
		return null;
	}
	
	// Todos os visit's que devem ser implementados ---------------------------------------------------------------------------------------
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
	
	public LlvmValue visit(Formal n){
		System.out.println("Formal"); // ok
		return new LlvmRegister(n.name.accept(this).toString(),(LlvmType)n.type.accept(this));
	}
	
	public LlvmValue visit(VarDecl n){
		System.out.println("VarDecl"); // ok
		return new LlvmRegister(n.name.accept(this).toString(),(LlvmType)n.type.accept(this));
	}
	
	public LlvmValue visit(MethodDecl n){
		System.out.println("MethodDecl"); // ok
		localVars=new HashMap<>();
		System.out.println("----------------------------- method init ----------------------------");
		
		LlvmType returnType=(LlvmType)n.returnType.accept(this); // assinatura
		ArrayList<LlvmValue> args=new ArrayList<LlvmValue>();
		args.add(thisReg);
		util.List<Formal> f=n.formals;
		while(f!=null){
			args.add(new LlvmRegister("%"+f.head.name.toString(),(LlvmType)f.head.type.accept(this)));
			f=f.tail;
		}
		assembler.add(new LlvmDefine("@__"+n.name+"_"+this.currentClass, returnType, args));
		assembler.add(new LlvmLabel(new LlvmLabelValue("entry")));
		
		f=n.formals; // formals
		LlvmRegister var=null;
		String name=null;
		while(f!=null){
			var=(LlvmRegister)f.head.accept(this);
			name=f.head.name.toString();
			assembler.add(new LlvmAlloca(var,var.type));
			assembler.add(new LlvmStore(new LlvmNamedValue("%"+name,var.type),new LlvmNamedValue(var.name, new LlvmPointer(var.type))));
			localVars.put(name,var);
			f=f.tail;
		}
		
		util.List<VarDecl> l=n.locals; // locals
		while(l!=null){
			var=(LlvmRegister)l.head.accept(this);
			//if(!(var.type instanceof LlvmArray)){ // TODO aqui acho que é pra barrar o alloca quando for intArrayType
				assembler.add(new LlvmAlloca(var, var.type));
				localVars.put(l.head.name.toString(),var);
			//}
			l=l.tail;
		}
		
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
		
		assembler.add(new LlvmRet(n.returnExp.accept(this)));
		assembler.add(new LlvmCloseDefinition());
		System.out.println("----------------------------- method end ----------------------------");
		localVars=null;
		return null;
	}
	
	public LlvmValue visit(Call n){
		System.out.println("Call"); // ok
		
		String name=n.method.toString();
		
		LlvmValue obj=n.object.accept(this);
		
		String objClassName=(obj.type instanceof LlvmPointer)? // TODO talvez desnecessario checar
				((LlvmPointer)obj.type).content.toString():
				obj.type.toString();
		objClassName=objClassName.substring(7);
		
		name="@__"+name+"_"+objClassName;
		
		System.out.println("method: "+name);
		System.out.println("objleitor: --------------------- "+obj);
		
		ArrayList<LlvmValue> params=new ArrayList<LlvmValue>();
		List<LlvmType> pts = new LinkedList<LlvmType>();
		util.List<Exp> actuals=n.actuals;
		params.add(obj);
		pts.add(obj.type); // TODO checar isso
		LlvmValue actual;
		while(actuals!=null){
			actual=actuals.head.accept(this);
			params.add(actual);
			pts.add(actual.type);
			actuals=actuals.tail;
		}
		
		LlvmType type=(LlvmType)n.type.accept(this);
		LlvmRegister lhs=new LlvmRegister(type);
		
		assembler.add(new LlvmCall(lhs,type,pts,name,params));
		
		return lhs;
	}
	
	public LlvmValue visit(IdentifierExp n){
		System.out.println("IdentifierExp " + n.toString()); // ok
		LlvmValue ptr=getVar(n.name.toString(), currentClass);
		ptr = new LlvmRegister(ptr.toString(), new LlvmPointer(ptr.type));
		LlvmRegister lhs=new LlvmRegister((LlvmType)n.type.accept(this));
		assembler.add(new LlvmLoad(lhs, ptr));
		System.out.println(lhs); // TODO tirar isso
		return lhs;
	}
	
	public LlvmValue visit(Identifier n){
		System.out.println("Identifier "+n.s); // ok
		return new LlvmNamedValue("%_"+n.toString(), null);
	}
	
	public LlvmValue visit(Assign n){
		System.out.println("Assign"); // ok
		
		LlvmValue exp=n.exp.accept(this);
		String name=n.var.toString();
		
		LlvmValue var=getVar(name, currentClass);
		LlvmRegister lhs=new LlvmRegister(var.toString(), new LlvmPointer(var.type));
		System.out.println("Var ----------------------------------- "+var);
		assembler.add(new LlvmStore(exp, lhs));
		
//		if(localVars.containsKey(name.toString())){
//			if(exp.type instanceof LlvmPointer){
//				LlvmRegister ptr=localVars.get(name.toString());
//				assembler.add(new LlvmStore(exp, ptr));
//			}
//			else{
//				if(!(exp instanceof LlvmRegister)){
//					LlvmRegister reg=new LlvmRegister(exp.type);
//					assembler.add(new LlvmPlus(reg, exp.type, exp, new LlvmIntegerLiteral(0)));
//					exp=reg;
//				}
//				localVars.put(name.toString(),(LlvmRegister)exp);
//			}
//		}
//		else
//			if(this.env.classes.get(Symbol.symbol(currentClass)).attributes.containsKey(Symbol.symbol(name.toString()))){
//				ClassInfo classe=this.env.classes.get(Symbol.symbol(currentClass));  // TODO ver se eh melhor trocar esse currentClass
//				int offset=classe.getAttributeOffset(Symbol.symbol(name.toString()))-1;
//				LlvmType type=classes.get(currentClass).typeList.get(offset);
//				LlvmRegister ptr=new LlvmRegister(new LlvmPointer(type));
//				List<LlvmValue> offsets=new ArrayList<LlvmValue>();
//				offsets.add(new LlvmRegister(0+"", type));
//				offsets.add(new LlvmRegister(offset+"", type));
//				assembler.add(new LlvmGetElementPointer(ptr,this.thisReg,offsets));
//				assembler.add(new LlvmStore(exp, ptr));
//			}
		return null;
	}
	
	public LlvmValue visit(ArrayAssign n){
		System.out.println("ArrayAssign"); // ok
		int index = Integer.parseInt(n.index.accept(this).toString())+1; // primeira posicao eh o tamanho
		List<LlvmValue> offsets = new LinkedList<LlvmValue>();
		offsets.add(new LlvmIntegerLiteral(index));
		
		LlvmRegister lhs = new LlvmRegister(new LlvmPointer(LlvmPrimitiveType.I32));
		LlvmRegister ptr = new LlvmRegister(new LlvmPointer(LlvmPrimitiveType.I32));
		LlvmRegister array=getVar(n.var.toString(),currentClass);
		LlvmRegister arrayPtr=new LlvmRegister(array.name, new LlvmPointer(array.type));
		assembler.add(new LlvmLoad(ptr, arrayPtr));
		assembler.add(new LlvmGetElementPointer(lhs, ptr, offsets));
		assembler.add(new LlvmStore(n.value.accept(this), lhs));
		return null;
	}
	
	private LlvmRegister arrayLookupPointer(LlvmValue array,int i){
		List<LlvmValue> offsets = new LinkedList<LlvmValue>();
		offsets.add(new LlvmIntegerLiteral(i));
		LlvmRegister ptr = new LlvmRegister(new LlvmPointer(LlvmPrimitiveType.I32));
		assembler.add(new LlvmGetElementPointer(ptr, array , offsets));
		return ptr;
	}
	
	public LlvmValue visit(ArrayLookup n){
		System.out.println("ArrayLookup"); // ok
		int index = Integer.parseInt(n.index.accept(this).toString())+1; // primeira posicao eh o tamanho
		LlvmValue array=n.array.accept(this);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmLoad(lhs, arrayLookupPointer(array, index)));
		return lhs;
	}
	
	public LlvmValue visit(ArrayLength n){
		System.out.println("ArrayLength"); // ok
		LlvmValue array=n.array.accept(this);
		LlvmRegister lhs = new LlvmRegister(LlvmPrimitiveType.I32);
		assembler.add(new LlvmLoad(lhs, arrayLookupPointer(array, 0)));
		return lhs;
	}
	
	public LlvmValue visit(This n){
		System.out.println("This"); // ok
		return this.thisReg;
	}
	
	// ------------------------------------------------------------------------------------------ News
	public LlvmValue visit(NewArray n){
		System.out.println("NewArray"); // ok
		LlvmValue size=n.size.accept(this);
		LlvmRegister lhs=new LlvmRegister((LlvmType)n.type.accept(this));
		assembler.add(new LlvmMalloc(lhs,LlvmPrimitiveType.I32,new LlvmIntegerLiteral(Integer.parseInt(size.toString())+1)));
		assembler.add(new LlvmStore(size, lhs));
		return lhs;
	}
	
	public LlvmValue visit(NewObject n){
		System.out.println("NewObject"); // ok
		LlvmStructure classe=classes.get(n.className.toString());
		LlvmRegister lhs=new LlvmRegister(new LlvmPointer(classe));
		assembler.add(new LlvmMalloc(lhs, classe, classe.className));
		return lhs;
	}
	// ------------------------------------------------------------------------------------------ Fluxos
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
		assembler.add(new LlvmBranch(null, null, exit));
		assembler.add(new LlvmLabel(exit));
		return null;
	}
	
	public LlvmValue visit(While n){
		System.out.println("While"); // ok
		LlvmLabelValue brTrue=LlvmLabelValue.create();
		LlvmLabelValue brFalse=LlvmLabelValue.create();
		LlvmLabelValue topo=LlvmLabelValue.create();
		assembler.add(new LlvmBranch(null, null, topo));
		assembler.add(new LlvmLabel(topo));
		LlvmValue cond=n.condition.accept(this);
		assembler.add(new LlvmBranch(cond, brTrue, brFalse));
		assembler.add(new LlvmLabel(brTrue));
		n.body.accept(this);
		assembler.add(new LlvmBranch(null, null, topo));
		assembler.add(new LlvmLabel(brFalse));
		return null;
	}
	// ------------------------------------------------------------------------------------------ Operacoes
	public LlvmValue visit(Not n){
		System.out.println("Not"); // ok
		LlvmValue exp=n.exp.accept(this);
		LlvmType tipo=(LlvmType)n.type.accept(this);
		LlvmRegister lhs=new LlvmRegister(tipo);
		LlvmIntegerLiteral um=new LlvmIntegerLiteral(1);
		assembler.add(new LlvmXor(lhs, tipo, exp, um));
		return lhs;
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
		LlvmType tipo=op1.type; //(LlvmType)n.type.accept(this);
		LlvmRegister tmp=new LlvmRegister(tipo);
		assembler.add(new LlvmIcmp(tmp, LlvmIcmp.SLT, tipo, op1, op2));
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
	
	public LlvmValue visit(Plus n){
		System.out.println("Plus"); // ok
		LlvmValue v1 = n.lhs.accept(this);
		LlvmValue v2 = n.rhs.accept(this);
		LlvmType tipo = (LlvmType)n.type.accept(this);
		LlvmRegister lhs = new LlvmRegister(tipo);
		assembler.add(new LlvmPlus(lhs,tipo,v1,v2));
		return lhs;
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
	// ------------------------------------------------------------------------------------------ Constantes
	public LlvmValue visit(True n){
		System.out.println("True"); // ok
		return new LlvmBool(LlvmBool.TRUE);
	}
	
	public LlvmValue visit(False n){
		System.out.println("False"); // ok
		return new LlvmBool(LlvmBool.FALSE);
	}
	
	public LlvmValue visit(IntegerLiteral n){
		System.out.println("IntegerLiteral"); // ok
		return new LlvmIntegerLiteral(n.value);
	};
	// ------------------------------------------------------------------------------------------ Tipos
	public LlvmValue visit(IntArrayType n){
		System.out.println("IntArrayType"); // ok
		return new LlvmPointer(LlvmPrimitiveType.I32);
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
		return new LlvmPointer(new LlvmStructure(new ArrayList<LlvmType>(), n.name));
	}
}