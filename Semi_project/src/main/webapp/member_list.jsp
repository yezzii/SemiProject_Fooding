<%@page import="com.member.model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
    <c:set var="list" value="${List }" />
    <tr>
    <th>멤버 아이디</th> <th>멤버 이름</th>  <th>멤버 비밀번호</th> 
    <th>멤버 이메일</th> <th>멤버 핸드폰 번호</th> 
    </tr>
    
    
    
    <c:if test="${!empty list }">
    <c:forEach items="${list }" var="dto"> 
    <tr>
    <td>${dto.getMember_id() }</td>
    <td>${dto.getMember_name() }</td>
    <td>${dto.getMember_pwd() }</td>
    <td>${dto.getMember_email() }</td>
    <td>${dto.getMember_phone() }</td>
    </tr>
    </c:forEach>
    </c:if>
    
    <c:if test="${empty list }">
    <tr>
    <td colspan="4" align="center">
    <h3>회원이 없습니다.</h3>
    </td>
    </tr>
    </c:if>
    </table>


    
    
    
</body>
</html>