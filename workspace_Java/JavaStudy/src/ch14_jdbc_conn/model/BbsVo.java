package ch14_jdbc_conn.model;

public class BbsVo {
	
private int rnum;
private int allCnt;
private int bbsNo;
private int parentNo;
private String bbsTitle;
private String bbsContent;
private String authorId;
private String createDt;
private String updateDt;

public BbsVo() {}


@Override
public String toString() {
	return "BbsVo [rnum=" + rnum + ", allCnt=" + allCnt + ", bbsNo=" + bbsNo + ", parentNo=" + parentNo + ", bbsTitle="
			+ bbsTitle + ", bbsContent=" + bbsContent + ", authorId=" + authorId + ", createDt=" + createDt
			+ ", updateDt=" + updateDt + "]";
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


public int getRnum() {
	return rnum;
}


public void setRnum(int rnum) {
	this.rnum = rnum;
}


public int getAllCnt() {
	return allCnt;
}


public void setAllCnt(int allCnt) {
	this.allCnt = allCnt;
}









}
