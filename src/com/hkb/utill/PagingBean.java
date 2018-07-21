package com.hkb.utill;

public class PagingBean {

		private int nowPage; //현재페이지
		private int totCount; //총 페이지 수
		private int record; //페이지 당 레코드 수
		private int blockCount; // 페이지 블럭 수
		private int firRecord; // 첫번 째 게시물 
		private int lasRecord; // 마지막 게시물
		private int firBlock; // 첫번 째 블럭
		private int lasBlock; //마지막 블럭
		public int getNowPage() {
			return nowPage;
		}
		public void setNowPage(int nowPage) {
			this.nowPage = nowPage;
		}
		public int getTotCount() {
			return totCount;
		}
		public void setTotCount(int totCount) {
			this.totCount = totCount;
		}
		public int getRecord() {
			return record;
		}
		public void setRecord(int record) {
			this.record = record;
		}
		public int getBlockCount() {
			return blockCount;
		}
		public void setBlockCount(int blockCount) {
			this.blockCount = blockCount;
		}
		public int getFirRecord() {
			return firRecord;
		}
		public void setFirRecord(int firRecord) {
			this.firRecord = firRecord;
		}
		public int getLasRecord() {
			return lasRecord;
		}
		public void setLasRecord(int lasRecord) {
			this.lasRecord = lasRecord;
		}
		public int getFirBlock() {
			return firBlock;
		}
		public void setFirBlock(int firBlock) {
			this.firBlock = firBlock;
		}
		public int getLasBlock() {
			return lasBlock;
		}
		public void setLasBlock(int lasBlock) {
			this.lasBlock = lasBlock;
		}
		
}
