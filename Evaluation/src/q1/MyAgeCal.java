package q1;

import java.util.Calendar;

public class MyAgeCal {

   public static void main(String[] args) {
      
      Calendar cal = Calendar.getInstance();
      
      int birthYear = 1994;//1994
      int nowYear = Calendar.YEAR;//캘린더클래스 사용
      int myAge = nowYear-birthYear;//27살이 출력되어야함
      System.out.println("내 나이는"+myAge+"살 입니다.");//내 나이는 27살 입니다 출력
      }
   }