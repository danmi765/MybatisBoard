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
<!-- 비로그인 회원 -->
	<c:if test="${loginUser == null }">
		<h1>환영합니다. 로그인 해주세요.</h1>
		<div>
			<c:if test="${NotFoundUserId == true }">
				<p>존재하지 않는 아이디 입니다.</p>
			</c:if>
			<c:set scope="session" var="NotFoundUserId" value="${false }"/>
			
			<c:if test="${NoMatchUserPsw == true }">
				<p>비밀번호를 확인 해 주세요.</p>
			</c:if>
			<c:set scope="session" var="NoMatchUserPsw" value="${false }"/>
			
			<c:if test="${join == true }">
				<p>가입이 완료되었습니다. 로그인 해주세요.</p>
			</c:if>
			<c:set scope="session" var="join" value="${false }"/>
						
			<form action="login.do" method="post">
				<table>
					<tr>
						<td><input type="text" name="userid" /></td>
						<td><input type="password" name="userpsw" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="login" />
							<input type="button" value="join" onclick="location.href='join.do'" />
						</td>
					</tr>
				</table>
			</form>
		</div>
	</c:if>
	
<!-- 로그인회원 -->
	<c:if test="${loginUser ne null }">
		<h1>반갑습니다. ${loginUser.username }님 !</h1>
		<div>
			<form action="logout.do" method="post">
				<input type="button" value="게시판" onclick="location.href='list.do'" />
				<input type="button" value="갤러리" onclick="location.href='gallery.do'" />
				<input type="button" value="정보보기" onclick="location.href='viewMember.do'" />
				<c:if test="${loginUser.userid == 'admin' }">
					<input type="button" value="관리자" onclick="location.href='admin.do'" />
				</c:if>
				<input type="submit" value="logout" />
			</form>
		</div>
	</c:if>
</body>
</html>