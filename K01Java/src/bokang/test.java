package bokang;

import bokang.sub.CheckCard3;

public class test {
/*
  뭔 마이너스통장이여 계속출금이가능해 왜안고쳐져 
  이왕 부자될거 내이름넣자
 */
	public static void main(String[] args) {

		CheckCard3 cc3 = new CheckCard3();
		cc3.initMembers(9876_5432_1098_7654L, "박상철", 
				2100000000, 0);
		
		CheckCard3 cc4 = new CheckCard3(1111_2222_3333_4444L,
				"부자되겠네", 15000, 0);
		
		
		cc3.charge(7000);
		cc3.payment(9000);
		cc3.showState();
		
		cc4.charge(5000);
		cc4.payment(19000);
		cc4.showState();

		
	}

}
