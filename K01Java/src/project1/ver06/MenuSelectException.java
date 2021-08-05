package project1.ver06;
/*
 -예외처리1 : 메뉴를 입력할 때 1~5이외의 정수를 입력했을경우 MenuSelectException(개발자정의)
  예외를 발생시키고 이를 적절히 처리해보자.
  
  
  IOE?? 예외처리 교안 6번 개발자정의 참고


사용자정의 예외클래스
1.Exception클래스를 상속받는다. 
2. 생성자에서 예외발생시 출력할 메세지를 super()를 통해 입력한다.
3. 예외 발생지점에서 if문으로 감지한후 예외객체를 생성 및 throw 한다. 
4. catch문에서 예외객체를 받아 처리한다.
 */

public class MenuSelectException extends Exception 
{//개발자 정의

	public  MenuSelectException()
	{
		super("1~5이내의 숫자를 입력해주세요");

	}

	
	}


