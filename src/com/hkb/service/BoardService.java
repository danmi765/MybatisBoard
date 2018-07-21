package com.hkb.service;

import java.util.List;

import com.hkb.dto.BoardBean;
import com.hkb.dto.CmtFormatDateBean;

public interface BoardService {

	public List<BoardBean> getAllList();
	public List<BoardBean> searchList(String keyword, String option);
	
	public List<BoardBean> getAllGallery();
	
	public int getTotalCount(BoardBean bb);
	public BoardBean getViewByIdx(BoardBean bb);
	public int totalCountSearchList(BoardBean bb);
	public void modiContent(BoardBean bb);
	public void deleteContent(BoardBean bb);
	public void UpdateBno(BoardBean bb);
	public void insertContent(BoardBean bb);
	
	public List<CmtFormatDateBean> getTotalCmt(Integer idx);
	public int getTotalCmtCount(Integer idx);
	public void insertCmt(String userid, String content, Integer bno);
	public void deleteCmt(Integer idx);
	public void updateCmt(String content, Integer idx);
	
}
