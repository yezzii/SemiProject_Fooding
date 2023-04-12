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


	
	<div align="center">
	<c:set var="dto" value="${info }" />
		<hr width="80%" color="blue">
		<h3>${dto.getMember_id() }님의 정보페이지</h3>
		<hr width="80%" color="blue">
		<br>
		<table border="1" cellspacing="0" width="300">
			
			
			<tr>
				<th>이름</th>
				<td>${dto.getMember_id() }</td>
			</tr>

			<tr>
				<th>아이디</th>
				<td>${dto.getMember_name() }</td>
			</tr>
			
						<tr>
				<th>이메일</th>
				<td>${dto.getMember_email() }</td>
			</tr>
			
						<tr>
				<th>전화번호</th>
				<td>${dto.getMember_phone() }</td>
			</tr>
			


			<tr>
				<td colspan="2" align="center">
				    <a href="<%=request.getContextPath() %>/main.jsp">
					<button type="button" class="join">
						<span class="">홈으로
						</span>
					</button>
				</a>
					
			</tr>

		</table>
	</div>
</body>
</html>