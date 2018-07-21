package com.hkb.dto;

public class CmtFormatDateBean {
	
		private Integer idx;
		private String userid;
		private String content;
		private String writedate;
		private Integer bno;
		
		public CmtFormatDateBean(Integer idx, String userid, String content, String writedate, Integer bno) {
			super();
	      this.idx = idx;
	      this.userid = userid;
	      this.content = content;
	      this.writedate = writedate;
	      this.bno = bno;
		}
		
		public CmtFormatDateBean(){
			super();
		}
		public Integer getBno() {
			return bno;
		}
		public void setBno(Integer bno) {
			this.bno = bno;
		}
		public Integer getIdx() {
			return idx;
		}
		public void setIdx(Integer idx) {
			this.idx = idx;
		}
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getWritedate() {
			return writedate;
		}
		public void setWritedate(String writedate) {
			this.writedate = writedate;
		}
		
		

}
