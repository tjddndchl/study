package ch08_interpace.pratice07;

public class MySqlDao implements DataAccessObject{

	@Override

	public void select() {
		System.out.println("mysql에서 검색");
	}
	
	public void insert() {
		System.out.println("mysql에서 삽입");
	}
	
	
	public void update() {
		System.out.println("mysql에서 수정");
	}
	public void delete() {
		System.out.println("mysql에서 삭제");
	}
}
