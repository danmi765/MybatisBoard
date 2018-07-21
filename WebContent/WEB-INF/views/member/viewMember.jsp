<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<h1>정보보기</h1>
	<table>
		<tr>
			<td>아이디</td>
			<td>${loginUser.userid }</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${loginUser.username }</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${loginUser.sex }</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>${loginUser.age }</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td>${loginUser.joindate }</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="Modify" onclick="location.href='modiMember.do'" />
				<input type="button" value="ModifyPassword" onclick="location.href='modiPassword.do'" />
				<input type="button" value="홈으로" onclick="location.href='index.do'" />
			</td>
		</tr>
	</table>
</body>
</html>