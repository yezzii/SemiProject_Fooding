<%@page import="com.member.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
	integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
	crossorigin="anonymous"></script>

<style type="text/css">
.pagination {
	justify-content: center;
}
</style>


</head>
<body>
	<div align="center">
		<hr width="50%" color="red">
		<h3>관리자 전체 회원 페이지</h3>
		<hr width="50%" color="red">
		<br>

		<%--검색 폼 페이지 처리 영역 --%>
		<form method="post"
			action="<%=request.getContextPath()%>/member_search.do">
			<select name="field">
				<option value="mem_id">아이디</option>
				<option value="mem_name">이름</option>
				<option value="mem_email">이메일</option>
				<option value="mem_phone">연락처</option>
				<option value="mem_account">잔액</option>
				<option value="mem_storenum">가게넘버</option>
				<option value="mem_type">회원타입</option>
			</select> <input type="text" name="keyword"> &nbsp;&nbsp; <input
				type="submit" name="검색">
		
		<br>
		<table border="1" cellspacing="0" width="900">
			<c:set var="list" value="${List }" />
			<tr>
				<td colspan="10" align="right"></td>
			</tr>

			<tr>
				<th>회원 번호</th>
				<th>회원아이디</th>
				<th>회원 이름</th>
				<th>회원 이메일</th>
				<th>회원 연락처</th>
				<th>회원 잔액</th>
				<th>가게넘버</th>
				<th>회원타입</th>
				<th>회원정보 수정</th>
				<th>회원정보 삭제</th>
			</tr>

			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.getMember_no() }</td>
						<td>${dto.getMember_id() }</td>
						<td>${dto.getMember_name() }</td>
						<td>${dto.getMember_email() }</td>
						<td>${dto.getMember_phone() }</td>
						<td>${dto.getMember_account() }</td>
						<td>${dto.getMember_storenum() }</td>
						<td>
							<c:if test="${dto.getMember_type() == 0}">
							관리자
							</c:if> 
							<c:if test="${dto.getMember_type() == 1}">
							일반회원
							</c:if> 
							<c:if test="${dto.getMember_type() == 2}">
							사업자
							</c:if>
						</td>
						<td><input type="button" value="회원정보 수정" onclick="location.href='member_update.do?id=${dto.getMember_id()}'"></td>
						<td><input type="button" value="회원정보 삭제" onclick="location.href='member_delete.do?id=${dto.getMember_id()}'"></td>
						
			
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
			
				<tr>
					<td colspan="10" align="center">
						<h3>전체 게시물 리스트가 없습니다.</h3>
					</td>
				</tr>
			</c:if>
		</table>
	</form>
	</div>
	<%-- 페이징 처리 영역 --%>
	<nav>
	<br>
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" href="member_list.do?page=1">First</a>
			</li>
			
			<li>
				<a class="page-link" href="member_list.do?page=${page-1 }">Previous</a>
			</li>

			<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${ i == page }">
					<li class="page-item active" aria-current="page">
					<a class="page-link" href="member_list.do?page=${i }">${i }</a>
					</li>
				</c:if>

				<c:if test="${ i != page }">`
					<li class="page-item">
					<a class="page-link" href="member_list.do?page=${i }">${i }</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${endBlock < allPage }">
				<li class="page-item">
				<a class="page-link" href="member_list.do?page=${page+1 }">Next</a>
				</li>
			</c:if>

			<li class="page-item">
			<a class="page-link"
				href="member_list.do?page=${allPage}">End</a>
			</li>
		</ul>
	</nav>

</body>
</html>