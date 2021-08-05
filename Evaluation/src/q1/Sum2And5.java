package q1;

public class Sum2And5 {

	public static void main(String[] args) {
		
		int sum = 0;
		for(int i=1 ; i<=1000 ; i++) {
			if(i%2==0 || i%5==0) {
				if(i%(2*5)!=0) {
					sum += i;
					System.out.print(i+"+");
				}
			}			
		}
		System.out.println("\n결과:"+ sum);
	}
}
