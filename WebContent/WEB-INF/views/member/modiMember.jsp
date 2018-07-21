<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="js/jquery-1.11.3.js"></script>
</head>
<body>
	<c:if test="${modiMemberPswCheck == true }">
		<script>
			alert("비밀번호가 일치하지 않습니다.");
		</script>
	</c:if>
	<c:set scope="session" var="modiMemberPswCheck" value="${false }"/>

	<h1>정보수정</h1>
	<form action="modiMember.do" method="post" name="modiFrom">
		<table>
			<tr>
				<td>아이디</td>
				<td>
					${loginUser.userid }
					<input type="hidden" value="${loginUser.userid }" name="userid" />
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userpsw" maxlength="12" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username" maxlength="12" value="${loginUser.username }" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="sex" id="sex_w" value="여자" ${loginUser.sex eq "여자"?"checked":n} /><label for="sex_w">여자</label>
					<input type="radio" name="sex" id="sex_m" value="남자" ${loginUser.sex eq "남자"?"checked":n}/><label for="sex_m">남자</label>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>
					<input type="text" name="age" maxlength="3" value="${loginUser.age }" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Modify" onclick="return modiMemberPswCheck()" />
					<input type="reset" value="Cancel" onclick="location.href='index.do'" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>