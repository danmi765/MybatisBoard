<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<h1>회원가입</h1>
	<form action="join.do" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" maxlength="12" /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userpsw" maxlength="12" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username" maxlength="12" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="sex" id="sex_w" value="여자" /><label for="sex_w">여자</label>
					<input type="radio" name="sex" id="sex_m" value="남자" /><label for="sex_m">남자</label>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td>
					<input type="text" name="age" maxlength="3" />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Join" />
					<input type="reset" value="Cancel" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>