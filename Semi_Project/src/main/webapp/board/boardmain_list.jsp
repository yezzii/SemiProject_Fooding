<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<hr width="50%" color="pink">
			<h3>관리자 전체 가게 페이지</h3>
		<hr width="50%" color="pink">
		<br>
		<!--검색 폼 페이지 처리영역 -->
		<form method="post" action="<%=request.getContextPath() %>/board_main_search.do">
			<select name="field">
				<option value="main_name">가게이름</option>
				<option value="main_type">가게타입</option>
				<option value="main_info">가게정보</option>
				<option value="main_opentime">가게오픈시간</option>
				<option value="main_endtime">가게종료시간</option>
				<option value="main_addr">가게주소</option>
				<option value="main_phone">가게연락처</option>
				<option value="main_memid">아이디</option>
				<option value="main_storenum">사업자번호</option>
			</select>
			<input type="text" name="keyword">&nbsp;&nbsp;
			<input type="submit" name="검색">
		<br><br><br>
		
		<table border="1" cellspacing="0" width="1500">
		<c:set var="list" value="${List }"/>
		<tr>
			<td colspan="12" align="right"><h4>전체 가게 수 : ${totalBoardmain}개</h4></td>
		</tr>
		
		<tr>
			<th>가게 번호</th>		
			<th>가게 이름</th>		
			<th>가게 타입</th>		
			<th>가게 정보</th>		
			<th>가게 오픈시간</th>		
			<th>가게 종료시간</th>		
			<th>가게 주소</th>		
			<th>가게 연락처</th>		
			<th>가게 아이디</th>		
			<th> 사업자번호</th>	
			<th>가게 정보 수정</th>	
			<th>가게 정보 삭제</th>
		</tr>
		
		<c:if test="${!empty list }">
			<c:forEach items="${list }" var="dto">
			<input type="hidden" name="main_idx" value="${dto.getMain_idx() }">
				<tr>
					<td>${dto.getMain_idx() }</td>
					<td>${dto.getMain_name() }</td>
					<td>${dto.getMain_type() }</td>
					<td>${dto.getMain_info() }</td>
					<td>${dto.getMain_opentime() }</td>
					<td>${dto.getMain_endtime() }</td>
					<td>${dto.getMain_post()} ${dto.getMain_addr()} ${dto.getMain_detailaddr() }</td>
					<td>${dto.getMain_phone() }</td>
					<td>${dto.getMain_memid() }</td>
					<td>${dto.getMain_storenum() }</td>
					<td><input type="button" value="가게정보 수정" onclick="location.href='board_main_update.do?idx=${dto.getMain_idx()}'"></td>
					<td><input type="button" value="가게정보 삭제" onclick="if(confirm('가게정보를 삭제 하시겠습니까?'))
								{location.href='board_main_delete.do?idx=${dto.getMain_idx()}'}else{return;}"></td>
				</tr>
			</c:forEach>	
		</c:if>
		
		<c:if test ="${empty list }">
			<tr>
				<td colspan="12" align="center">
					<h3>전체 게시물 리스트가 없습니다.</h3>
				</td>
		</c:if>
		</table>
	</form>
</div>
	<%-- 페이징 처리 영역 --%>
	<nav>
	<br>
		<ul class="pagination">
			<li class="page-item">
				<a class="page-link" href="board_main_list.do?page=1">First</a>
			</li>
			
			<li>
				<a class="page-link" href="board_main_list.do?page=${page-1 }">Previous</a>
			</li>

			<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${ i == page }">
					<li class="page-item active" aria-current="page">
					<a class="page-link" href="board_main_list.do?page=${i }">${i }</a>
					</li>
				</c:if>

				<c:if test="${ i != page }">`
					<li class="page-item">
					<a class="page-link" href="board_main_list.do?page=${i }">${i }</a>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${endBlock < allPage }">
				<li class="page-item">
				<a class="page-link" href="board_main_list.do?page=${page+1 }">Next</a>
				</li>
			</c:if>

			<li class="page-item">
			<a class="page-link"
				href="board_main_list.do?page=${allPage}">End</a>
			</li>
		</ul>
	</nav>

</body>
</html>