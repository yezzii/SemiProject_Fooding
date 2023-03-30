<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<c:set var="dto" value="${pwd }" />
	<div align="center">
		<hr width="80%" color="blue">
		<h3>${dto.getMember_id() }님의정보페이지</h3>
		<hr width="80%" color="blue">
		<br>
		<table border="1" cellspacing="0" width="300">
			<tr>
				<th>이름</th>
				<td>${dto.getMember_id() }</td>
			</tr>

			<tr>
				<th>아이디</th>
				<td>${dto.grtMember_name() }</td>
			</tr>


			<tr>
				<td colspan="2" align="center">
				    <input type="button" value="수정"
					onclick="location.href='member/member_update.jsp'">&nbsp;&nbsp;
					<input type="button" value="탈퇴"
					onclick="location.href='member/member_delete.jsp'"></td>
			</tr>

		</table>
	</div>
</body>
</html>