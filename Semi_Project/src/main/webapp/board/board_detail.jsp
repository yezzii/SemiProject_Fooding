<%@page import="com.board.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% BoardDTO dto = (BoardDTO)request.getAttribute("DTO"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function delete_func() {
		let pwd = prompt("게시글의 비밀번호를 입력해주세요.");
		
		if(pwd == <%=dto.getBoard_pwd()%>){
			location.href='delete.do?no=<%=dto.getBoard_no()%>'
		}else{
			alert("비밀번호를 확인 해 주세요.")
		}
	}
</script>
</head>
<body>
	<div align="center">
		<hr width="50%" color = "marmoon">
			<h3>BOARD 테이블 게시판 글쓰기 폼 페이지</h3>
		<hr width="50%" color = "marmoon">
		<br>
		
		<form method="post" action="<%=request.getContextPath() %>/insert_ok.do" onsubmit="">
		 <table border="1" cellspacing="0" width="500">
         <%
            if(dto != null) {
         %>   
               <tr>
                  <th colspan="4">
                     <h3><%=dto.getBoard_writer() %> 님의 게시글입니다.</h3>
                  </th>
               </tr>
               <tr>
                  <th>글 번호</th>
                  <td> <%=dto.getBoard_no() %> </td>
               
                  <th>글 작성자</th>
                  <td> <%=dto.getBoard_writer() %> </td>
               </tr>
               
               <tr>
                  <%
                     if(dto.getBoard_update() == null) {
                  %>
                        <th>작성일자</th>
                        <td> <%=dto.getBoard_date().substring(0, 10) %> </td>
                  <%   }else { %>
                        <th>수정일자</th>
                        <td> <%=dto.getBoard_update().substring(0, 10) %> </td>
                  <%   } %>   
               
                  <th>조회수</th>
                  <td colspan="3"> <%=dto.getBoard_hit() %> </td>
               </tr>
               
               <tr>
                  <th>글 제목</th>
                  <td colspan="3"> <%=dto.getBoard_title() %> </td>
               </tr>
               
               <tr>
                  <th>글 내용</th>
                  <td colspan="3" height="100"> 
                     <%-- <textarea rows="7" cols="25"> <%=cont.getBoard_cont() %></textarea> --%>
                     <%=dto.getBoard_cont().replace("\r\n", "<br>") %>
                  </td>
               </tr>
               
               <tr>
                  <th>글 비밀번호</th>
                  <td colspan="3">
                     <%
                        if(dto.getBoard_pwd().length() != 0) {
                           for(int i=1; i <= dto.getBoard_pwd().length(); i++) {
                     %>         
                                 *
                     <%      }
                        }  %>
                 
         <% } %>
 </td>
               </tr>
</table>
			
					<input type="button" value="목록" onclick="location.href='select.do'">&nbsp;&nbsp;
					<input type="button" value="수정"
					onclick="location.href='modify.do?no=<%=dto.getBoard_no()%>'">&nbsp;&nbsp;
					<input type="button" value="글삭제" onclick="delete_func()">
					&nbsp;&nbsp;
				
			
		</form>
	</div>
</body>
</html>