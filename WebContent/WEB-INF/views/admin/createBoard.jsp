<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>
	<h1>게시판 생성</h1>
	<form action="createBoard.do" method="post">
		<table>
			<tr>
				<td>게시판 아이디</td>
				<td><input type="text" name="tableid" /></td>
			</tr>
			<tr>
				<td>게시판 이름</td>
				<td><input type="text" name="tablename" /></td>
			</tr>
			<tr>
				<td>게시판 종류</td>
				<td>
					<select name="tabletype">
						<option value="basic">basic</option>
						<option value="gallery">gallery</option>
					</select>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>