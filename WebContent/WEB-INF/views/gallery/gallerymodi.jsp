<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 업로드</title>
</head>
<body>
	<h1>이미지 업로드</h1>
	<div id="wrap">
		<form action="modigallery.do" method="post" enctype="multipart/form-data">
			<input type="hidden" value="${loginUser.userid }" name="userid" />
			<table>
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
					<th>file</th>
					<td>
						<input type="file" name="uploadFile" value="${modi.filename }" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정" />
						<input type="button" value="취소" onclick="location.href='galleryview.do?idx=${modi.idx}'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>