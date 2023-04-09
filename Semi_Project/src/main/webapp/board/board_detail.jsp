<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<c:set var="dto" value="${DTO}" />
	<div align="center">
		<hr width="50%" color="marmoon">
		<h3>BOARD 테이블 게시판 글쓰기 폼 페이지</h3>
		<hr width="50%" color="marmoon">
		<br>

		<form method="post" >
			<table border="1" cellspacing="0" width="500">

				<c:if test="${!empty dto }">

					<tr>
						<th colspan="4">
							<h3>${dto.getBoard_writer()}님의 게시글입니다.</h3>
						</th>
					</tr>
					<tr>
						<th>글 번호</th>
						<td>${dto.getBoard_idx()}</td>

						<th>글 작성자</th>
						<td>${dto.getBoard_writer()}</td>
					</tr>

					<tr>
						<c:if test="dto.getBoard_update() == null">

							<th>작성일자</th>
							<td>${dto.getBoard_date().substring(0, 10)}</td>
						</c:if>

						<th>조회수</th>
						<td colspan="3">${dto.getBoard_viewcnt()}</td>
					</tr>

					<tr>
						<th>글 제목</th>
						<td colspan="3">${dto.getBoard_title()}</td>
					</tr>

					<tr>
						<th>글 내용</th>
						<td colspan="3" height="100">${dto.getBoard_content()}</td>
						
					</tr>
					<tr>
					<td colspan="3">
					<img src="<%=request.getContextPath() %>/photo/${dto.getBoard_image() }" width="300" height="300">
					</td>
					</tr>
					
					

				</c:if>
			</table>

			<input type="button" value="목록"
				onclick="location.href='free_board.do'">&nbsp;&nbsp; <input
				type="button" value="수정"
				onclick="location.href='<%=request.getContextPath() %>/board_modify.do?no=${dto.getBoard_idx()}'">&nbsp;&nbsp;
			<input type="button" value="글삭제"
				onclick="location.href='<%=request.getContextPath() %>/board_delete.do?no=${dto.getBoard_idx()}'">
			&nbsp;&nbsp;

		</form>
	</div>
</body>

</html>