<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<h1>게시글 수정</h1>
	<div id="wrap">
		<form method="post" action="modi.do">
			<table>
				<tr>
					<th>No</th>
					<td>
						${modi.bno }
						<input type="hidden" name="idx" value="${modi.idx }" />
					</td>
				</tr>
				<tr>
					<th>userid</th>
					<td>
						${modi.userid }
					</td>
				</tr>
				<tr>
					<th>title</th>
					<td>
						<input type="text" name="title" value="${modi.title }" />
					</td>
				</tr>
				<tr>
					<th>content</th>
					<td>
						<textarea name="content">${modi.content }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정" /> 
						<input type="button" value="취소" onclick="location.href='view.do?idx=${modi.idx}'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>