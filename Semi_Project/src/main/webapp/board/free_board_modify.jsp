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
		<c:set var="dto" value="${dto }" />
		<hr width="50%" color="red">
		<h3>${dto.getBoard_writer() }님의게시물 수정 페이지</h3>
		<hr width="50%" color="red">
		<br>



		<form method="post"
			action="<%=request.getContextPath()%>/board_modify_ok.do">
			<table border="1" cellspacing="0" width="500">

				<c:if test="${!empty dto }">

					<tr>
						<th colspan="4">
							<h3>${dto.getBoard_writer()}님의 게시글 수정 폼 페이지.</h3>
						</th>
					</tr>
					<tr>
						<th>글 번호</th>
						<td><input type="text" name="idx"
							value="${dto.getBoard_idx()}"readonly></td>

						<th>글 작성자</th>
						<td><input type="text" name="writer"
							value="${dto.getBoard_writer()}"readonly></td>
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
						<td colspan="3"><input type="text" name="title"
							value="${dto.getBoard_title()}"></td>
					</tr>

					<tr>
						<th>글 내용</th>
						<td colspan="3" height="100"><input type="text" name="cont"
							value="${dto.getBoard_content()}"></td>
					</tr>

				</c:if>

				<c:if test="${empty dto }">
					<tr>
						<td colspan="2" align="center">
							<h3>게시물 없음</h3>
						</td>
					</tr>
				</c:if>

				<tr>
					<td colspan="4" align="center"><input type="submit"
						value="게시물 수정">&nbsp;&nbsp; <input type="reset"
						value="다시작성"></td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>