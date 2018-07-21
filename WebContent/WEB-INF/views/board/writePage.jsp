<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h1>게시글 작성</h1>
	<div id="wrap">
		<form action="insert.do" method="post">
			<input type="hidden" name="userid" value="${loginUser.userid }" />
			<table>
				<tr>
					<th>title</th>
					<td>
						<input type="text" name="title" />
					</td>
				</tr>
				<tr>
					<th>content</th>
					<td>
						<textarea name="content"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="작성" />
						<input type="button" value="취소" onclick="location.href='list.do'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>