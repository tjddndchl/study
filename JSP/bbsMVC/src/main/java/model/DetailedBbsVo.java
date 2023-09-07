package model;

public class DetailedBbsVo {

	
	private int bbsNo;
	private String bbsContent;
	private String authorId;
	private String updateDt;
	public int getBbsNo() {
		return bbsNo;
	}
	public void setBbsNo(int bbsNo) {
		this.bbsNo = bbsNo;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public String getAuthorId() {
		return authorId;
	}
	public void setAuthorId(String authorId) {
		this.authorId = authorId;
	}
	public String getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}
	@Override
	public String toString() {
		return "DetailedBbsVo [bbsNo=" + bbsNo + ", bbsContent=" + bbsContent + ", authorId=" + authorId + ", updateDt="
				+ updateDt + "]";
	}
	
	
}
