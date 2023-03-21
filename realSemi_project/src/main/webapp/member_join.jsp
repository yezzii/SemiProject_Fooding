<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<hr width="50%" color="pink">
	<h3>회원 가입 페이지</h3>
<hr width="50%" color="pink">

<form method="post"
	action="<%=request.getContextPath() %>/insert_ok.go">
<table border="1" cellspacing="0" width="300">

<tr>
	<th>회원아이디</th>
	<td><input type="text" name="member_id"></td>
</tr>
<tr>
	<th>회원이름</th>
	<td><input type="text" name="member_name"></td>
</tr>
<tr>
	<th>회원비밀번호</th>
	<td><input type="text" name="member_pwd"></td>
</tr>
<tr>
	<th>회원이메일</th>
	<td><input type="text" name="member_email"></td>
</tr>
<tr>
	<th>회원연락처</th>
	<td><input type="text" name="member_phone"></td>
</tr>

<tr>
	<td colspan="2" align="center">
	<input type="submit" value="회원가입">
	<input type="reset" value="다시작성">
	</td>
</tr>

</table>	
</form>
</div>
</body>
</html>