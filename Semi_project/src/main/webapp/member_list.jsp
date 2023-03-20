<%@page import="com.member.model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    List<MemberDTO> list = (List<MemberDTO>)request.getAttribute("List");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    
    <div>
    <h3>회원 리스트</h3>
    </div>
    
    <table border="1" cellspacing="0">
    <tr>
    <th>멤버 아이디</th> <th>멤버 이름</th>  <th>멤버 비밀번호</th> 
    <th>멤버 이메일</th> <th>멤버 핸드폰 번호</th> 
    </tr>
    
    <%
    if(list.size() != 0){
    	for(int i=0; i<list.size(); i++){
    		MemberDTO dto = list.get(i);
    %>
    
    <tr>
    <td><%=dto.getMember_id() %></td>
    <td><%=dto.getMember_name() %></td>
    <td><%=dto.getMember_pwd() %></td>
    <td><%=dto.getMember_email() %></td>
    <td><%=dto.getMember_phone() %></td>
    </tr>
 <% }
  }else{
 %>	  
         <tr>
         <td colspan="5" align="center">
         <h4>회원 없음</h4>
         </td>
         </tr>
  <%} %>
    
    
    
</body>
</html>