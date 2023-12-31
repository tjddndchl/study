package ch09_class.homepage;
//게시물 VO
public class Board {
	private int no;//글번호
	private String title;//글제목
	private String content;//글내용
	private String author;//작성자
	//기본 생성자, setter getter, tostring생성
	public Board(int no, String title, String content, String author) {
		
		this.no = no;
		this.title = title;
		this.content = content;
		this.author = author;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	@Override
	public String toString() {
		return "Board [no=" + no + ", title=" + title + ",  author=" + author + "]";
	}
	
	
}
