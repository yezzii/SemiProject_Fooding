<%@page import="com.board.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% BoardDTO dto = (BoardDTO)request.getAttribute("DTO"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div align="center">
		<hr width="50%" color = "marmoon">
			<h3>BOARD 테이블 게시판 글쓰기 폼 페이지</h3>
		<hr width="50%" color = "marmoon">
		<br>
		
		<form method="post" action="<%=request.getContextPath() %>/modify_ok.do?no=<%=dto.getBoard_no()%>" onsubmit="">
			<table border="1" cellspacing="0" width="300">
				
				<tr>
					<th>작성자</th>
					<td> <input type="text" name="writer" value=<%=dto.getBoard_writer() %> readonly></td>
				</tr>
				<tr>
					<th>글제목</th>
					<td> <input type="text" name="title" value=<%=dto.getBoard_title() %>></td>
				</tr>
				<tr>
					<th>글내용</th>
					<td> <textarea rows="7" cols="25" name="cont" ><%=dto.getBoard_cont() %></textarea></td>
				</tr>
				<tr>
					<th>글 비밀번호</th>
					<td> <input type="password" name="pwd" value=<%=dto.getBoard_pwd() %>></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center"> 
					<input type="submit" value = "수정">&nbsp;&nbsp;
					<input type="reset" value = "다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>