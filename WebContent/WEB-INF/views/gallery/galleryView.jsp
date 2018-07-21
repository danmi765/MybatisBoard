<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글보기</title>
<script src="http://code.jquery.com/jquery.min.js"></script>
<style>
	.cmt>div{border-bottom:1px solid #000;}
</style>
</head>
<body>
	<h1>글보기</h1>
	<div id="wrap">
		<table>
			<tr>
				<th>No</th>
				<td>${view.bno}</td>
			</tr>
			<tr>
				<th>writedate</th>
				<td>${fn:substring(view.writedate,0,10)}</td>
			</tr>
			<tr>
				<th>userid</th>
				<td>${view.userid}</td>
			</tr>
			<tr>
				<th>title</th>
				<td>${view.title }</td>
			</tr>
			<tr>
				<th>content</th>
				<td>${view.content }</td>
			</tr>
			<tr>
				<form action="" method="" name="frm">
					<td>
						<input type="text" name="cmt_content" class="cmt_content" />
					</td>
					<td>
						<input type="button" value="작성" onclick="writeCmt()"  />
					</td>
				</form>
			</tr>
		</table>
		<div class="imgBox">
			<img src='upload/${view.filename }' alt='' />
		</div>
		<div>
			<input type="button" value="목록" onclick="location.href='gallery.do'" />
			<c:if test="${loginUser.userid eq view.userid}">
				<input type="button" value="수정" onclick="location.href='modigallery.do?idx=${view.idx}'" />
				<input type="button" value="삭제" onclick="location.href='deletegallery.do?idx=${view.idx}'" />
			</c:if>
		</div>
		<div class="cmt">
		
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/reply/reply.jsp" />
</body>
</html>