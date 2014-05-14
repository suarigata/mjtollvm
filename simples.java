class a{
	public static void main(String[] args){
		System.out.println(new c().geral(3));
	}
}

class c extends b{
}

class b{
	int oi;
	int[] erro;

	public int geral(int c){
		int[] ara;
		erro=new int[4];
		erro[1]=4;
		erro[2]=3;
		erro[3]=2;
		erro[4]=1;
		return erro[4];
	}
}
