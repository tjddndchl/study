package com.future.my.commons.vo;

public class CodeVO {
	    private String commCd;

	    private String commNm;

	    private String commParent;
	    
	    public CodeVO() {}

		public CodeVO(String commCd, String commNm, String commParent) {
			super();
			this.commCd = commCd;
			this.commNm = commNm;
			this.commParent = commParent;
		}

		public String getCommCd() {
			return commCd;
		}

		public void setCommCd(String commCd) {
			this.commCd = commCd;
		}

		public String getCommNm() {
			return commNm;
		}

		public void setCommNm(String commNm) {
			this.commNm = commNm;
		}

		public String getCommParent() {
			return commParent;
		}

		public void setCommParent(String commParent) {
			this.commParent = commParent;
		}

		@Override
		public String toString() {
			return "CodeVO [commCd=" + commCd + ", commNm=" + commNm + ", commParent=" + commParent + "]";
		}
	    
	    
}
