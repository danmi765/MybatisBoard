package com.hkb.serviceimpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hkb.dto.BoardBean;
import com.hkb.dto.CmtFormatDateBean;
import com.hkb.dto.CommentBean;
import com.hkb.service.BoardService;

@Repository
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardBean> getAllList() {
		return sqlSession.selectList("board.getAllList");
	}

	@Override
	public int getTotalCount(BoardBean bb) {
		return sqlSession.selectOne("board.getTotalCount", bb);
	}

	@Override
	public BoardBean getViewByIdx(BoardBean bb) {
		return sqlSession.selectOne("board.getViewByIdx", bb);
	}

	@Override
	public List<CmtFormatDateBean> getTotalCmt(Integer idx) {
		List<CommentBean> a = sqlSession.selectList("board.getTotalCmt", idx);
		
		/* 날짜포맷 변경 */
	      Date writedate = null; // 변경 될 날짜
	      SimpleDateFormat fmt = null; 
	      String NewWriteDate = null; // 변경 된 날짜
	      
	      CmtFormatDateBean formatDate; // 날짜가 변경된 데이터가 저장될 빈
	      ArrayList<CmtFormatDateBean> formattedDate = new ArrayList<CmtFormatDateBean>();
	      
	      for(int i=0; i < a.size(); i++){
	    	  writedate = a.get(i).getWritedate();
	         
	         fmt = new SimpleDateFormat("yyyy-MM-dd");
	         
	         NewWriteDate = fmt.format(writedate);
	      
	         formatDate= new CmtFormatDateBean(
	                  a.get(i).getIdx(), 
	                  a.get(i).getUserid(),
	                  a.get(i).getContent(),
	                  NewWriteDate,
	                  a.get(i).getBno()
	                  );
	         formattedDate.add(i, formatDate);
	      } //end for
		
		
		return formattedDate;
	}

	@Override
	public int getTotalCmtCount(Integer idx) {
		return sqlSession.selectOne("getTotalCmtCount", idx);
	}

	@Override
	public void insertCmt(String userid, String content, Integer bno) {
		CommentBean cb = new CommentBean();
		cb.setUserid(userid);
		cb.setContent(content);
		cb.setIdx(bno);
		
		sqlSession.insert("board.insertCmt", cb);
	}

	@Override
	public void deleteCmt(Integer idx) {
		sqlSession.delete("board.deleteCmt", idx);
	}

	@Override
	public void updateCmt(String content, Integer idx) {
		CommentBean cb = new CommentBean(); 
		
		cb.setContent(content);
		cb.setIdx(idx);
		
		sqlSession.update("board.updateCmt", cb);
	}

	@Override
	public int totalCountSearchList(BoardBean bb) {
		return sqlSession.selectOne("board.totalCountSearchList", bb);
	}

	@Override
	public List<BoardBean> searchList(String keyword, String option) {
		BoardBean bb = new BoardBean();
		
		bb.setKeyword(keyword);
		bb.setOption(option);
		
		return sqlSession.selectList("board.searchList", bb);
	}

	@Override
	public void modiContent(BoardBean bb) {
		sqlSession.update("board.modiContent", bb);
	}

	@Override
	public void deleteContent(BoardBean bb) {
		sqlSession.delete("deleteContent", bb);
	}

	@Override
	public void UpdateBno(BoardBean bb) {
		sqlSession.update("UpdateBno", bb);
	}

	@Override
	public void insertContent(BoardBean bb) {
		sqlSession.insert("insertContent", bb);
	}

	@Override
	public List<BoardBean> getAllGallery() {
		return sqlSession.selectList("getAllGallery");
	}

}
