public class MultsOfThreeAndFive {
	public static void main (String[] args) {
		java.util.ArrayList<Integer> mults = new java.util.ArrayList<>();

		// store all correct values in an ArrayList
		for (int i=1; i<=1000; i++) {
			if ( (i % 3 == 0 ) || (i % 5 == 0)) mults.add(i);
		}

		// print out all the values

		System.out.println("All multiples of 3 or 5 from 1 to 1000\n");
		int x = 0;
		for (Integer i : mults) {
			System.out.printf("%4d", i);
			// and make them look nice
			if (i != mults.get(mults.size() - 1)) System.out.print(", ");
			if (x < 32) x++;
			else {
				System.out.println();
				x = 0;
			}
		}
		System.out.println();
	}
}
