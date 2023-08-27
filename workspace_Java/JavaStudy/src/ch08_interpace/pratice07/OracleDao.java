package ch08_interpace.pratice07;

public class OracleDao implements DataAccessObject{

	@Override
	public void insert() {
		// TODO Auto-generated method stub
		System.out.println("오라클에서 삽입");
	}

	@Override
	public void select() {
		// TODO Auto-generated method stub
		System.out.println("오라클에서 선택");
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub
		System.out.println("오라클에서 수정");
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		System.out.println("오라클에서 삭제");
	}
	
}
