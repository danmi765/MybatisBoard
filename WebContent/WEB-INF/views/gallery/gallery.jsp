<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리</title>
<style>
	a{text-decoration:none; color:#000;}
	.choice{font-weight:bold;}
	.paginate{margin:40px 0 0 0 ;}
	.paginate>a{padding:0 10px;}
	
	
	.galleryBox{border:1px solid #ccc;width:150px;padding:0 10px;}
	.uploadImg{margin:0 auto;width:128px; height:128px;}
	.uploadImg>img{width:128px; height:128px;}
	.galleryTitle a{font-weight:bold;}
	.galleryTitle span{text-align:right;}
</style>
</head>
<body>
	<h1>갤러리</h1>
	<div id="wrap">
	<input type="button" value="홈으로" onclick="location.href='index.do'" />
		<table>
			<tr>
				<c:forEach var="list" items="${gallerylist }" begin="${begin }" end="${end }" varStatus="n">
					<td class="galleryBox">
						<div class="uploadImg">
							<img src='upload/${list.filename }' alt='' />
						</div>
						<div class="galleryTitle">
							<p><a href="galleryview.do?idx=${list.idx }">${list.title}</a></p>
							<c:choose>
								<c:when test="${fn:length(list.content) >= 10}" >
									<p>${fn:substring(list.content,0,10)}...<p>
								</c:when>
								<c:otherwise>
									<p>${list.content}<p>
								</c:otherwise>
							</c:choose>
							<span>${list.userid}</span>
							<span>${fn:substring(list.writedate,0,10)}</span>
						</div>
					</td>
					<c:if test="${n.count%5 == 0 }"></tr><tr></c:if> 
				</c:forEach>
			</tr>
		</table>
		
		<div>
			<c:if test="${loginUser ne null }">
				<input type="button" value="글쓰기" onclick="location.href='gallerywrite.do'" />
			</c:if>
		</div>
		
		
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