package domain_expansion;

public class infinite {
	
	public static void main(String[] args) {
		
	}
	
	static int m(String str, String str2, Integer... integers) {
		int sum = 0;
		for(Integer i : integers) {
			sum += i;
		}
	}
	return sum;
}

