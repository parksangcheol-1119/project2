package lombok.test;

public class MyUserTest {

	public static void main(String[] args) {
		
		UserDTO userDTO = new UserDTO();
		userDTO.setName("롬복");
		userDTO.setAge(20);
		userDTO.setHobbys("스킨스쿠버");
		System.out.println(userDTO);
	}

}
