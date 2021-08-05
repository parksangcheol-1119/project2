import java.util.Random;

class iThread extends Thread {
	int[] choice;
	String[] kosmo;

	public iThread(int[] choice, String[] kosmo) {
		this.choice = choice;
		this.kosmo = kosmo;
	}

	@Override
	public void run() {
		try {
			for (int i = 1; i <= Lunch.STUDENT_COUNT; i++) {
				Lunch.maxFind(choice, kosmo, i);
				if(Lunch.STUDENT_COUNT==i)
					System.out.println("=========당첨 끄~~~읏=========");
				sleep(2000);
			}
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}

public class Lunch extends Thread {

	static final int RANDOM_COUNT = 10000;// 난수생성횟수
	static final int STUDENT_COUNT = 3;// 당첨명수

	public static void main(String[] args) {

		String[] kosmo = { 
				"순대국","김치찌개","청국장","일식돈까스","중국집",
				"쌀국수","제육볶음","경양식돈까스","샐러드","갈비탕",
				"굶는다","일본가정식","초밥","오징어덮밥","설렁탕",
				"샌드위치","양평해장국","팟타이","김치볶음밥","김치찜",
				"수육국밥","콩나물국밥","김밥","떡볶이","분식집",
				"알밥","알탕","명태찜","연탄구이정식","백반"
			};
		// 난수를 누적해서 저장할 배열
		int[] choice = new int[kosmo.length];

		// 난수생성을 위한 객체생성 및 씨드설정
		Random random = new Random();
		random.setSeed(System.currentTimeMillis());

		// 일정횟수 반복하면서 난수생성
		for (int i = 0; i < RANDOM_COUNT; i++) {
			int rndNumber = random.nextInt(RANDOM_COUNT);
			// 학생수 만큼의 난수생성
			int stuNumber = rndNumber % kosmo.length;
			// System.out.println("comNumber="+stuNumber);
			// 생성된 난수를 배열의 인덱스로 사용하여 +1증가
			choice[stuNumber]++;
		}

		for (int i = 0; i < kosmo.length; i++) {
			System.out.printf("%s = %d\n", kosmo[i], choice[i]);
			// System.out.printf("%s[%d] = %d\n", kosmo[i], i, choice[i]);
		}
		iThread tr = new iThread(choice, kosmo);
		tr.start();
//      for (int i=0; i<STUDENT_COUNT; i++) {
//         maxFind(choice, kosmo);
//      }      
	}

	public static String maxFind(int[] choice, String[] kosmo, int cnt) {

		int max = 0;
		int maxIndex = -1;
		// 배열에서 가장 큰값 찾기
		for (int i = 0; i < choice.length; i++) {
			if (max < choice[i]) {
				max = choice[i];
				maxIndex = i;
			}
		}
		// 최대값을 찾은후 이름을 출력하고 0으로 리셋한다.
	//	System.out.println("당첨" + cnt + ":" + kosmo[maxIndex]);
		System.out.println(kosmo[maxIndex]);
		choice[maxIndex] = 0;
		return kosmo[maxIndex];
	}
}
