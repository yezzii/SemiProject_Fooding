<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 페이지</title>
</head>
<body>

 <c:set var="dto" value="${DTO }" />		<%--변수선언 --%>
 
	<div align="center">
	   <hr width="50%" color="red">
	      <h3>${dto.getMember_name()}님의 회원탈퇴 페이지</h3>
	   <hr width="50%" color="red">
	   <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/member_delete_ok.do">
	   
	      <input type="hidden" name="member_id" value="${dto.getMember_id()}">
	      
	   	  <table border="1" cellspacing="0" width="350">
	   	     <tr>
	   	        <th>회원탈퇴를 위해 ${dto.getMember_name()}님의 비밀번호를 입력해주세요.</th>
	   	        <td> <input type="password" name="member_pwd"> </td>
	   	     </tr>
	   	     
	   	     <tr>
	   	        <td colspan="2" align="center">
	   	           <input type="submit" value="회원탈퇴">&nbsp;&nbsp;
	   	           <input type="reset" value="비밀번호 재입력">
	   	        </td>
	   	     </tr>
	   	  </table>
	   </form>
	
	
	</div>
</body>
</html>