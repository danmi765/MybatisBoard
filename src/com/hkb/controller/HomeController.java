package com.hkb.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hkb.dto.BoardBean;
import com.hkb.dto.MemberBean;
import com.hkb.serviceimpl.BoardServiceImpl;
import com.hkb.serviceimpl.MemberServiceImpl;
import com.hkb.utill.PagingUtil;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class HomeController {

	@Autowired
	MemberServiceImpl memberServiceImpl;
	
	@Autowired
	BoardServiceImpl boardServiceImpl;
	
	
	@RequestMapping(value="index.do", method=RequestMethod.GET)
	public String goHome(){
		
		return "index";
	}
	
	
	/* login & logout */
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String Login(MemberBean fromview, Model model,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		MemberBean member = memberServiceImpl.loginCheck(fromview);
		
		// Not Found User ID 
		if(member == null){
			session.setAttribute("NotFoundUserId", true);
			return "redirect:index.do";
		
		// Found User ID
		}else{
			
			// Success Login
			if(member.getUserpsw().equals(fromview.getUserpsw())){
				session.setAttribute("loginUser", memberServiceImpl.loginCheck(fromview));
				return "redirect:index.do";
				
			// Fail Login
			}else{
				session.setAttribute("NoMatchUserPsw", true);
				return "redirect:index.do" ;
			}
		}
	}
	
	@RequestMapping(value="logout.do", method=RequestMethod.POST)
	public String Logout(HttpServletRequest request){
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:index.do" ;
	}
	
	

	/* member */
	@RequestMapping(value="join.do" , method=RequestMethod.GET)
	public String GoJoinPage(){
		System.out.println("가입페이지로 이동 : member/join");
		return "member/join";
	}
	
	@RequestMapping(value="join.do" , method=RequestMethod.POST)
	public String GoJoin(HttpServletRequest request, MemberBean mb){
		HttpSession session = request.getSession();
		
		memberServiceImpl.joinMember(mb);
		session.setAttribute("join", true);
		
		return "redirect:index.do";
	}
	
	@RequestMapping(value="viewMember.do", method=RequestMethod.GET)
	public String GoViewMemberPage(Model model, MemberBean mb){
		return "member/viewMember" ;
	}
	
	@RequestMapping(value="modiMember.do", method=RequestMethod.GET)
	public String GoModiPage(Model model, MemberBean mb){
		return "member/modiMember" ;
	}
	
	@RequestMapping(value="modiMember.do", method=RequestMethod.POST)
	public String GoModi(MemberBean fromview,
				HttpServletRequest request){
		HttpSession session = request.getSession();
		
		MemberBean mb = new MemberBean();
		mb =  memberServiceImpl.loginCheck(fromview);
		
		// userpsw match
		if(mb.getUserpsw().equals(fromview.getUserpsw())){
			memberServiceImpl.updateMember(fromview);
			session.setAttribute("loginUser", mb);
			
			return "redirect:index.do" ;
		
		// userpsw not match
		}else{
			session.setAttribute("modiMemberPswCheck", true);
			return "member/modiMember";
		}
	}
	
	@RequestMapping(value="modiPassword.do", method=RequestMethod.GET)
	public String GoModiPasswordPage(){
		return "member/modiPassword";
	}
	
	@RequestMapping(value="modiPassword.do", method=RequestMethod.POST)
	public String GoModiPassword(HttpServletRequest request,
					@RequestParam("userid") String userid,
					@RequestParam("userpswCheck") String userpswCheck,
					@RequestParam("newUserpsw") String newUserpsw,
					@RequestParam("newUserpswCheck") String newUserpswCheck){
		HttpSession session = request.getSession();
		MemberBean mb = new MemberBean();
		
		mb.setUserid(userid);
		MemberBean mbc = memberServiceImpl.loginCheck(mb);
		
		System.out.println("controller modiPassword");
		
		// password match
		if(mbc.getUserpsw().equals(userpswCheck)){
			
			//new passwoed match
			if(newUserpsw.equals(newUserpswCheck)){
				mb.setUserpsw(newUserpsw);
				memberServiceImpl.updateMemberPassword(mb);
				session.invalidate();
			
				return "redirect:index.do";
						
			//new password not match
			}else{
				session.setAttribute("notMatchNewPassword", true);
				return "member/modiPassword";
			}
			
		// password not match
		}else{
			session.setAttribute("notMatchUserPassword", true);
			return "member/modiPassword";
		}
	}
	
	
	/* admin */
	@RequestMapping(value="admin.do", method=RequestMethod.GET)
	public String GoAdminPage(){
		return "admin/admin" ;
	}
	
	@RequestMapping(value="createBoard.do", method=RequestMethod.GET)
	public String goCreateBoardPage(){
		return "admin/createBoard";
	}
	
	@RequestMapping(value="createBoard.do", method=RequestMethod.POST)
	public String goCreateBoard(){
		
		return "";
	}
	
	
	
	/* basic */
	@RequestMapping(value="list.do", method=RequestMethod.GET)
	public String List(Model model,
					@RequestParam(value="page", required=false) String page){
		
		if(page == null){ page = "1"; }
		
		BoardBean bb = new BoardBean();
		bb.settabletype("board");
		
		/* PagingUtil */
		PagingUtil paging = new PagingUtil();
        paging.setPageNo(Integer.parseInt(page));
        paging.setPageSize(5);
        paging.setTotalCount(boardServiceImpl.getTotalCount(bb)); 
        
        /* begin & end */
        int rowsPerPage = 5; // totalRecord
        int begin = (Integer.parseInt(page)-1) * rowsPerPage ; // startRecord
        int end = begin + rowsPerPage -1 ; // endRecord
        
		model.addAttribute("paging", paging);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
		model.addAttribute("url", "list.do");
		model.addAttribute("search", "n");
		model.addAttribute("boardlist", boardServiceImpl.getAllList());
		return "board/list";
	}
	
	@RequestMapping(value="list.do", method=RequestMethod.POST)
	public String searchByKeyword(Model model, BoardBean bb,
						@RequestParam(value="page", required=false) String page){
		if(page == null){ page = "1";}
		
		bb.settabletype("board");
		
		/* PagingUtil */
		PagingUtil paging = new PagingUtil();
		paging.setPageNo(Integer.parseInt(page));
		paging.setPageSize(5);
		paging.setTotalCount(boardServiceImpl.totalCountSearchList(bb));
		
        /* 뷰페이지 보여질 게시글 수 지정 */
        int rowsPerPage = 5; // totalRecord
        int begin = (Integer.parseInt(page)-1) * rowsPerPage ; // startRecord
        int end = begin + rowsPerPage -1 ; // endRecord

		model.addAttribute("boardlist", boardServiceImpl.searchList(bb.getKeyword(),bb.getOption()));
        model.addAttribute("paging", paging);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
		model.addAttribute("search", "y");
		
		return "board/list";
	}
	
	@RequestMapping(value="view.do", method=RequestMethod.GET)
	public String getViewByidx(Model model, BoardBean bb){
		bb.settabletype("board");
		
		model.addAttribute("totalCmt", boardServiceImpl.getTotalCmtCount(bb.getIdx()));
		model.addAttribute("view", boardServiceImpl.getViewByIdx(bb) );
		
		return "board/viewPage";
	}
	
	@RequestMapping(value="modi.do", method=RequestMethod.GET)
	public String getViewByidxAndModiForm(Model model, BoardBean bb){
		
		bb.settabletype("board");
		
		model.addAttribute("modi", boardServiceImpl.getViewByIdx(bb) );
		
		return "board/modiPage";
	}
	
	@RequestMapping(value="modi.do", method=RequestMethod.POST)
	public String getViewByidxAndModi(Model model, BoardBean bb){
	
		bb.settabletype("board");
		
		boardServiceImpl.modiContent(bb);
		model.addAttribute("view", boardServiceImpl.getViewByIdx(bb) );
		
		return "redirect:view.do?idx=" + bb.getIdx();
	}
	
	@RequestMapping(value="delete.do", method=RequestMethod.GET)
	public String deleteContent(BoardBean bb){
		bb.settabletype("board");
		
		boardServiceImpl.deleteContent(bb);
		boardServiceImpl.UpdateBno(bb);
		
		return "redirect:list.do";
	}
	
	@RequestMapping(value="insert.do", method=RequestMethod.GET)
	public String insertForm(){
				
		return "board/writePage";
	}
	
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public String insertContent(Model model,
						BoardBean bb){
		bb.settabletype("board");
		
		Integer bno = boardServiceImpl.getTotalCount(bb)+1;
		bb.setBno(bno);
		
		boardServiceImpl.insertContent(bb);
		
		return "redirect:list.do";
	}
	
	/* gallery */
	@RequestMapping(value="gallery.do", method=RequestMethod.GET)
	public String goGallery(Model model,
				@RequestParam(value="page",  required=false) String page){
		if(page == null){page = "1";}
		
		BoardBean bb = new BoardBean();
		bb.settabletype("gallery");
		
		/* PagingUtil */
		PagingUtil paging = new PagingUtil();
        paging.setPageNo(Integer.parseInt(page));
        paging.setPageSize(15);
        paging.setTotalCount(boardServiceImpl.getTotalCount(bb));
        
        /* 뷰페이지 보여질 게시글 수 지정 */
        int rowsPerPage = 15; // totalRecord
        int begin = (Integer.parseInt(page)-1) * rowsPerPage ; // startRecord
        int end = begin + rowsPerPage -1 ; // endRecord

		model.addAttribute("gallerylist", boardServiceImpl.getAllGallery());
        model.addAttribute("paging", paging);
		model.addAttribute("begin", begin);
		model.addAttribute("end", end);
		model.addAttribute("url", "gallery.do");
		model.addAttribute("search", "n");
		
		return "gallery/gallery";
	}
	
	@RequestMapping(value="gallerywrite.do", method=RequestMethod.GET)
	public String goGalleryWrite(){
		
		return"gallery/gallerywrite";
	}
	
	@RequestMapping(value="gallerywrite.do", method=RequestMethod.POST)
	public String writeGallery(HttpServletRequest request) throws IOException{
		BoardBean bb = new BoardBean();
		bb.settabletype("gallery");
		
		String path = "D:\\workspace\\MybatisBoard\\WebContent\\upload";
		String encType="UTF-8";
		int sizeLimit = 8*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, path, sizeLimit, encType, new DefaultFileRenamePolicy());
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String uploadFile = multi.getFilesystemName("uploadFile");
		String userid = multi.getParameter("userid");
		
		Integer gno = boardServiceImpl.getTotalCount(bb) + 1;
		bb.setBno(gno);
		bb.setTitle(title);
		bb.setUserid(userid);
		bb.setContent(content);
		bb.setFilename(uploadFile);
		
		boardServiceImpl.insertContent(bb);
		
		return "redirect:gallery.do";
	}
	
	@RequestMapping(value="galleryview.do", method=RequestMethod.GET)
	public String galleryView(Model model, BoardBean bb,
					HttpSession session, HttpServletRequest request){
		bb.settabletype("gallery");
		
		model.addAttribute("view", boardServiceImpl.getViewByIdx(bb));
		model.addAttribute("totalCmt", boardServiceImpl.getTotalCmtCount(bb.getIdx()));
		
		return "gallery/galleryView";
	}
	
	@RequestMapping(value="deletegallery.do" , method=RequestMethod.GET)
	public String deleteGallery(BoardBean bb){
		bb.settabletype("gallery");
		
		boardServiceImpl.deleteContent(bb);
		boardServiceImpl.UpdateBno(bb);
		
		return "redirect:gallery.do";
	}
	
	@RequestMapping(value="modigallery.do" , method=RequestMethod.GET)
	public String modiGallery(Model model, BoardBean bb){
		bb.settabletype("gallery");
		
		model.addAttribute("modi", boardServiceImpl.getViewByIdx(bb));
		return "gallery/gallerymodi" ;
	}
	
	
	/* Comment */
	@RequestMapping(value="cmt.do" , method=RequestMethod.GET)
	@ResponseBody
	public Object getComent(@RequestParam("bno") int bno, Model model){
		
		 Map<String, Object> object = new HashMap<String, Object>();
		 object.put("list", boardServiceImpl.getTotalCmt(bno));
		return object;
	}
	
	@RequestMapping(value="writecmt.do" , method=RequestMethod.POST)
	@ResponseBody
	public Object writeAndGetComent(@RequestParam("bno") Integer bno,
									@RequestParam("content") String content,
									@RequestParam("userid") String userid){
		boardServiceImpl.insertCmt(userid, content, bno);
		
		 Map<String, Object> object = new HashMap<String, Object>();
		 object.put("list", boardServiceImpl.getTotalCmt(bno));
		 
		return object;
	}
	
	@RequestMapping(value="deletecmt.do" , method=RequestMethod.POST)
	@ResponseBody
	public Object deleteAndGetComent(@RequestParam("idx") Integer idx,
									@RequestParam("bno") Integer bno){
		
		boardServiceImpl.deleteCmt(idx);
		
		 Map<String, Object> object = new HashMap<String, Object>();
		 object.put("list", boardServiceImpl.getTotalCmt(bno));
		 
		return object;
	}
	
	@RequestMapping(value="modicmt.do" , method=RequestMethod.POST)
	@ResponseBody
	public Object UpdateAndGetComent(@RequestParam("idx") Integer idx,
									@RequestParam("content") String content,
									@RequestParam("bno") Integer bno){
		
		boardServiceImpl.updateCmt(content, idx);
		
		 Map<String, Object> object = new HashMap<String, Object>();
		 object.put("list", boardServiceImpl.getTotalCmt(bno));
		 
		return object;
	}
	
	
	
} 
