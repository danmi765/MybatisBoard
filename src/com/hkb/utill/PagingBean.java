package com.hkb.utill;

public class PagingBean {

		private int nowPage; //����������
		private int totCount; //�� ������ ��
		private int record; //������ �� ���ڵ� ��
		private int blockCount; // ������ �� ��
		private int firRecord; // ù�� ° �Խù� 
		private int lasRecord; // ������ �Խù�
		private int firBlock; // ù�� ° ��
		private int lasBlock; //������ ��
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
