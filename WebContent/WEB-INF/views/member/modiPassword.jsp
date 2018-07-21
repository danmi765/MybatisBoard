<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="js/jquery-1.11.3.js"></script>
<script src="js/member.js"></script>
</head>
<body>
	<h1>비밀번호 변경</h1>
	
	<c:if test="${notMatchNewPassword == true }">
		<p>새로운 비밀번호가 일치하지 않습니다.</p>
	</c:if>
	<c:set scope="session" var="notMatchNewPassword" value="${false }"/>
	
	<c:if test="${notMatchUserPassword == true }">
		<p>현재 비밀번호가 일치하지 않습니다.</p>
	</c:if>
	<c:set scope="session" var="notMatchUserPassword" value="${false }"/>
	
	<form action="modiPassword.do" method="post" name="modiPswfrm" >
		<table>
			<thead>
				<tr>
					<td>현재 비밀번호</td>
					<td>새로운 비밀번호</td>
					<td>새로운 비밀번호 확인</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="hidden" name="userid" value="${loginUser.userid }" />
						<input type="password" name="userpswCheck" id="userpswCheck" />
					</td>
					<td><input type="password" name="newUserpsw" id="newUserpsw" /></td>
					<td><input type="password" name="newUserpswCheck" id="newUserpswCheck" /></td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="button" value="비밀번호 변경" onclick="modiPasswordCheck()" />
						<input type="reset" value="Cancel" onclick="location.href='index.do'" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>