<%@page import="com.board.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div align="center">
		<hr width="50%" color="red">
			<h3>BOARD 테이블 전체 게시물 목록 페이지</h3>
		<hr width="50%" color="red">
		<br>
		
		<%-- 검색 관련 요청 태그 --%>
		<form method="post" action="<%=request.getContextPath() %>/search.do">
			<select name = "field">
				<option value="title">제목</option>
				<option value="cont">내용</option>
				<option value="title_cont">제목+내용</option>
				<option value="writer">작성자</option>
			</select>
			<input type ="text" name = "keyword">&nbsp;&nbsp;
			<input type = "submit" value="검색">
		</form>
		<table border="1" cellspacing="0" width="450">
			
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr>
			
			<%
				if(list.size() != 0){
					for(int i=0; i<list.size(); i++){
						BoardDTO dto = list.get(i);
			%>
			<tr>
				<td> <%=dto.getBoard_no() %> </td>
				<td> <a href="<%=request.getContextPath()%>/content.do?no=<%=dto.getBoard_no() %>"><%=dto.getBoard_title() %></a> </td>
				<td> <%=dto.getBoard_writer() %> </td>
				<td> <%=dto.getBoard_hit() %> </td>
				<td> <%=dto.getBoard_date().substring(0,10) %> </td>
			</tr>
			<%
					}//for문 end
				}else{ //조회된 게시물이 없는 경우
			%>
			<tr>
				<td colspan="5" align="center">
					<h3>조회된 게시물이 없습니다....</h3>
				</td>
			</tr>
			<%
				}
			%>
		</table>
		<br>
		<input type="button" value="전체목록" onclick="location.href='select.do'">
	</div>
	
</body>
</html>