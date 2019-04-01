public class BucketStyle {
	public static void main (String[] args) {
		final int HOW_MANY = 1000;

		int[] mults = new int[HOW_MANY + 1];

		// store them in a bucket
		for (int i=1; i<=HOW_MANY; i++) {
			if ( (i % 3 == 0 ) || (i % 5 == 0)) mults[i]=1;
		}
		


		// print out all the values

		System.out.println("All multiples of 3 or 5 from 1 to 1000");
		System.out.println();
		int x = 0;
		int i = 0;
		while ( i <= HOW_MANY ) {

			if ( mults[i] == 1 ) {
				System.out.printf("%5d", i);
				x++;
			}
			// print them out nice (32 to a line)
			if (x >= 32) {
				System.out.println();
				x = 0;
			}
			i++;
		}
		System.out.println();
	}
}
