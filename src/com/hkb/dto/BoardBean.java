package com.hkb.dto;

public class BoardBean {

		private Integer idx;
		private String title;
		private String content;
		private String userid;
		private String writedate;
		private Integer bno;
		
		private String totcmt;
		private String keyword;
		private String option;

		private String filename;
		
		private String tabletype;
		private String tablename;
		
		
		public String getKeyword() {
			return keyword;
		}
		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		public String getOption() {
			return option;
		}
		public void setOption(String option) {
			this.option = option;
		}
		public Integer getIdx() {
			return idx;
		}
		public void setIdx(Integer idx) {
			this.idx = idx;
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
		public String getUserid() {
			return userid;
		}
		public void setUserid(String userid) {
			this.userid = userid;
		}
		public String getWritedate() {
			return writedate;
		}
		public void setWritedate(String writedate) {
			this.writedate = writedate;
		}
		public Integer getBno() {
			return bno;
		}
		public void setBno(Integer bno) {
			this.bno = bno;
		}
		public String getTotcmt() {
			return totcmt;
		}
		public void setTotcmt(String totcmt) {
			this.totcmt = totcmt;
		}
		public String getFilename() {
			return filename;
		}
		public void setFilename(String filename) {
			this.filename = filename;
		}
		public String gettabletype() {
			return tabletype;
		}
		public void settabletype(String tabletype) {
			this.tabletype = tabletype;
		}
		
		
		
}
