<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<style>
	a{text-decoration:none; color:#000;}
	.choice{font-weight:bold;}
	.paginate{margin:40px 0 0 0 ;}
	.paginate>a{padding:0 10px;}
</style>
</head>
<body>
	<h1>게시판</h1>
	<div id="wrap">
		<div>
			<input type="button" value="홈으로" onclick="location.href='index.do'" />
		</div>
		<form action="list.do" method="post">
			<select name="option">
				<option value="userid">작성자</option>
				<option value="title">제목</option>
			</select>
			<input type="text" name="keyword" />
			<input type="submit" value="검색" />
			<table>
				<thead>
					<tr>
						<th>No</th>
						<th>title</th>
						<th>userid</th>
						<th>writedate</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${boardlist }" begin="${begin }" end="${end }">
						<tr>
							<td>${list.bno }</td>
							<td>
								<a href="view.do?idx=${list.idx }">${list.title }</a>
								<c:if test="${list.totcmt ne 0}">
									<span>[${list.totcmt }]</span>
								</c:if>
							</td>
							<td>${list.userid }</td>
							<td>${fn:substring(list.writedate,0,10)}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4">
							<c:if test="${loginUser ne null }">
								<input type="button" value="글쓰기"  onclick="location.href='insert.do'"/>
							</c:if>
							<c:if test="${search eq 'y' }">
								<input type="button" value="전체목록" onclick="location.href='list.do'" />
							</c:if>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<jsp:include page="/WEB-INF/views/paging.jsp" flush="true">
		    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
		    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
		    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
		    <jsp:param name="pageNo" value="${paging.pageNo}" />
		    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
		    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
		    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
		</jsp:include>
	</div>
</body>
</html>