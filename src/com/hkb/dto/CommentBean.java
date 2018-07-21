package com.hkb.dto;

import java.util.Date;

public class CommentBean {
	
		private Integer idx;
		private String userid;
		private String content;
		private Date writedate;
		private Integer bno;
		
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
		public Date getWritedate() {
			return writedate;
		}
		public void setWritedate(Date writedate) {
			this.writedate = writedate;
		}
		
		

}
