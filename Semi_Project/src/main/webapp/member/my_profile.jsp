<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <div>
     <h3>내 정보 페이지</h3>
     <form action="<%=request.getContextPath() %>/my_profile.do" method="post">
     <table>
     <tr>
     <th>비밀번호 입력</th>
     <td><input type="hidden" value="<%=session.getAttribute("id") %>" name="id"></td>
     <td><input type="password" name="pwd"></td>
     </tr>
     
     <tr>
     <td colspan="2" >
     <input type="submit" value="내정보보기">
     </td>
     </tr>
     </table>
     
     </form>
     </div>
     
</body>
</html>