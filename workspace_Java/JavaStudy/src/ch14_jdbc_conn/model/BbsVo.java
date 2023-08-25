package ch14_jdbc_conn.model;

public class BbsVo {
	
private int bbsNo;
private int parentNo;
private String bbsTitle;
private String bbsContent;
private String authorId;
private String createDt;
private String updateDt;

public BbsVo() {}



public BbsVo(int bbsNo, int parentNo, String bbsTitle, String bbsContent, String authorId, String createDt,
		String updateDt) {
	this.bbsNo = bbsNo;
	this.parentNo = parentNo;
	this.bbsTitle = bbsTitle;
	this.bbsContent = bbsContent;
	this.authorId = authorId;
	this.createDt = createDt;
	this.updateDt = updateDt;
}
public int getBbsNo() {
	return bbsNo;
}
public void setBbsNo(int bbsNo) {
	this.bbsNo = bbsNo;
}
public int getParentNo() {
	return parentNo;
}
public void setParentNo(int parentNo) {
	this.parentNo = parentNo;
}
public String getBbsTitle() {
	return bbsTitle;
}
public void setBbsTitle(String bbsTitle) {
	this.bbsTitle = bbsTitle;
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
public String getCreateDt() {
	return createDt;
}
public void setCreateDt(String createDt) {
	this.createDt = createDt;
}
public String getUpdateDt() {
	return updateDt;
}
public void setUpdateDt(String updateDt) {
	this.updateDt = updateDt;
}
@Override
public String toString() {
	return "BbsVo [bbsNo=" + bbsNo + ", parentNo=" + parentNo + ", bbsTitle=" + bbsTitle + ", bbsContent=" + bbsContent
			+ ", authorId=" + authorId + ", createDt=" + createDt + ", updateDt=" + updateDt + "]";
}





}
