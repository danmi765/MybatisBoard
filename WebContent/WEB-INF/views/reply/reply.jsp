<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	var json = new Object();
	var dataList; // Controller에서 리턴되어오는 Object를 담는 변수
	var loginuser = "${loginUser.userid}"; // 본인확인을 위한 세션체크
	var boardno = "${view.idx}"; // 게시판 번호
	
	// 페이징을 위한 변수 설정
	var pagesize = 10 ; // 보여질 게시물 수
	var pageno = 1; // 시작 페이지번호
	var firstpage = 1 ; // 첫 페이지
	var startno = 0; // 해당 페이지의 첫번째 글번호
	var endno = 0 ; // 해당 페이지의 마지막 글번호
	var count = 1; // 페이지 번호
	var totalre = ${totalCmt} ; // 총 게시물 수
	var lastpage ; // 마지막 페이지
		
	// dataList의 내용을 위한 변수 설정
	var div;
	var userid;
	var writedate;
	var deletebtn;
	var modi;
	var content;
	
	/* 댓글 리스트를 풀력하는 반복문 */
	function fors(linker){ 
		
		lastpage = Math.ceil(totalre/pagesize) ; // 마지막 페이지
		
		// 페이지번호와 댓글내용 모두 지우기
		$(".cmt_paging").empty();
		$(".cmt").empty();
		
		if(linker == null){
			linker =1;
		}
		
		if(totalre == 0){
			$(".cmt_paging").html("댓글이 없습니다.");
		}else{
						
			count = linker; //클릭한 페이지번호
			startno = (count-1)*pagesize+1; //해당페이지 시작게시물 번호
			
			//해당페이지 마지막게시물 번호
			if(count==lastpage){
				endno = totalre-1;
			}else{
				endno = count * pagesize;
			}

			for(var k =startno-1 ; k<=endno ; k++){
			
				// 댓글데이터를 변수에 작성
				div = $("<div class='cmtBox' num='"+dataList.list[k].idx+"'>") ;
				userid = $("<span>").html(dataList.list[k].userid);
				writedate = $("<span>").html(dataList.list[k].writedate);
				deletebtn = $("<a href='javascript:deletecmt("+dataList.list[k].idx+","+count+")' class='deleteBtn'>").html("삭제");
				modi = $("<a href='javascript:modicmt("+dataList.list[k].idx+","+k+","+count+")' num='"+dataList.list[k].idx+"' class='modiBtn'>").html("수정");
				content = $("<p class='cmtContent' num='"+k+"'>").html(dataList.list[k].content);
				
				// 변수 조립
				$(".cmt").append(div);
				if(loginuser == dataList.list[k].userid){
					$(div).append(userid).append(writedate).append(modi).append(deletebtn).append(content);
				}else{
					$(div).append(userid).append(writedate).append(content);
				}
				
			} // inner for E
				
			// 페이징 출력
			for(pageno = 1;pageno<=lastpage;pageno++){
				if(count == pageno){
					$(".cmt_paging").append("[<a href='javascript:fors("+pageno+")'><b>"+ pageno + "</b></a>]");
				}else{
					$(".cmt_paging").append("[<a href='javascript:fors("+pageno+")'>"+ pageno + "</a>]");
				}
				
			}// page for E
			
		}// totlare if E
		
	}//fors() E
			
	/* 댓글불러오기 */	
	$.ajax({
		url:"cmt.do?bno=${view.idx}",
		type:"get",
		success:function(data){
			dataList = data;
			fors();
		},
		error:function(xhr,status,error){
			alert("code:"+xhr.status);
		}
	 });  
	  
	  
	  /* 댓글 작성 */
	  function writeCmt(){
		  // 작성된 댓글의 내용을 변수에 저장
		  var content1 = $(".cmt_content").val() ;
		  
		  // 저장된 댓글의 내용과 유저의 정보, 게시판 고유번호를 넘김
		  $.ajax({
			  url:"writecmt.do?bno=${view.idx}&userid=${loginUser.userid}&content="+content1,
				type:"post",
				success:function(data){
					$(".cmt").empty();
					dataList = data;
					totalre = totalre+1;
					fors();
				},
				error:function(xhr,status,error){
					alert("code:"+xhr.status);
				}
		  });
		  // 댓글작성 폼의 내용을 지움
		  $(".cmt_content").val("");
	  }
	  
	  /* 댓글 삭제 */
	  function deletecmt(cno,c){
		  // 댓글의 고유번호와 게시판의 고유번호를 변수에 저장
		  var idx = cno ;
		  var linker;
		  if(totalre%10 == 1){
			  linker = 1;
		  }else if(totalre%10 == 0){
			  linker = null;
		  }else{
			  linker = c;
		  }
 		  
		  // 댓글의 고유번호와 게시판의 고유번호는 넘김
		  $.ajax({
			  url:"deletecmt.do?idx="+idx+"&bno="+boardno,
				type:"post",
				success:function(data){
					//$(".cmt").empty();
					dataList = data;
					totalre = totalre-1;
					fors(linker);
				},
				error:function(xhr,status,error){
					alert("code:"+xhr.status);
				}
		  });
	  }
	  
	  /* 댓글 수정 */
	  
	     // 수정폼 열기 : 댓글의 고유번호와 게시판안의 댓글의 인덱스를 받음
	  function modicmt(idx,k,c){
		  var a = idx; // 클릭된 댓글의 idx
		  var p = $(".cmt>div:eq("+(k%10)+")").children(".cmtContent"); // 클릭된 댓글의 내용이 담긴 <p>태그
		  var count = c;
		  
		  console.log(k +"," + p.attr("num")+",");
		  
		  // 클릭된 댓글의 idx와 게시판안의 댓글의 인덱스 번호가 일치하면 수정폼을 출력
		  if(p.attr("num") == k){
			  var content =  p.html(); //기존의 댓글 내용을 변수에 저장
			  var input = $("<input type='text' class='newContent' name='content' value='"+content+"' />");
			  var btn = $("<input type='button' value='수정' onclick='updateCmt("+idx+","+k+","+count+")' />"); 

			  p.html("").append(input).append(btn); //기존댓글 삭제 하고 <input>태그 삽입
		  }  
	  }
	  
	   // 댓글 수정 처리 : 댓글의 고유번호와 게시판안의 댓글의 인덱스를 받음
	  function updateCmt(idx,k,c){
		  var p = $(".cmt>div:eq("+(k%10)+")").children(".cmtContent"); // 클릭된 댓글의 내용이 담긴 <p>태그
		  var newContent = p.children(".newContent").val(); // 새롭게 입력된 댓글의 내용
		  var linker = c;
		  
		  // 새로입력된 내용과 댓글, 게시판의 고유번호를 넘김
		  $.ajax({
			  url:"modicmt.do?idx="+idx+"&content="+newContent+"&bno=${view.idx}",
				type:"post",
				success:function(data){
					$(".cmt").empty();
					dataList = data;
					fors(linker);
				},
				error:function(xhr,status,error){
					alert("code:"+xhr.status);
				}
		  });
	  }
	  
	  
</script>