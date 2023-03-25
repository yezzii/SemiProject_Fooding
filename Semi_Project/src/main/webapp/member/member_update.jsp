<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <c:set var="dto" value="${MemInfo }" />
	<div align="center">
	   <hr width="80%" color="blue">
	      <h3>${dto.getMember_id() }님의 정보 수정 페이지</h3>
	   <hr width="80%" color="blue">
	   <br>
	   
	   <form method="post"
	      action="<%=request.getContextPath() %>/member_updateOk.do">
	     
	      
	       <input type="hidden" name="db_pwd" value="${dto.getMember_pwd() }">
	       
	      <table border="1" cellspacing="0" width="350">
	      	
	          
	         <c:if test="${!empty dto }">
		        <tr>
		         	<th>회원 등록번호</th>
		            <td> <input type="text" name="member_account"
		                    value="${dto.getMember_account() }" readonly> </td>
		         </tr>  
		         
		         <tr>
		            <th>회원 아이디</th>
		            <td> <input type="text" name="member_id"
		                    value="${dto.getMember_id() }" readonly> </td>
		         </tr>
		         
		         <tr>
		         	<th>회원 이름</th>
		            <td> <input type="text" name="member_name"
		                    value="${dto.getMember_name() }" readonly> </td>
		         </tr>
		         
		         <tr>
		         	<th>회원 비밀번호</th>
		            <td> <input type="password" name="member_pwd"> </td>
		         </tr>
		         
		         <tr>
		         	<th>회원 이메일</th>
		            <td> <input type="text" name="member_email"
		                    value="${dto.getMember_email() }"> </td>
		         </tr>
		         
		         <tr>
		         	<th>회원 전화번호</th>
		            <td> <input type="text" name="member_phone"
		                    value="${dto.getMember_phone() }"> </td>
		         </tr>
		         
		         <tr>
		         	<th>회원 분류</th>
		            <td> <input type="text" name="member_mark"
		                    value="${dto.getMember_mark() }"> </td>
		         </tr>
		         
		         <tr>
		         	<th>회원 사업자번호</th>
		            <td> <input type="text" name="member_storenum"
		                    value="${dto.getMember_storenum() }"> </td>
		         </tr>
		 
	         </c:if>
	         
	         <c:if test="${empty dto }">
	            <tr>
	               <td colspan="2" align="center">
	                  <h3>회원에 대한 정보가 없습니다.....</h3>
	               </td>
	            </tr>
	         </c:if>
	         
	         <tr>
	            <td colspan="2" align="center">
	               <input type="submit" value="회원정보수정하기">&nbsp;&nbsp;
	               <input type="reset" value="다시작성">
	            </td>
	         </tr>
	      </table>
	   </form>
	
	</div>
	
	
</body>
</html>