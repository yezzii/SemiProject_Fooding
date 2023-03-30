<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
     
<div>
		<h3>비번 찾기</h3>
		<br>
		<form action="<%=request.getContextPath()%>/find_pwd.do" method="post">
			<table border="1" cellspacing="0">

				<tr>
					<th>이름 입력</th>
					<td><input type="text" name="name"></td>
				</tr>

				<tr>
					<th>e-mail 입력</th>
					<td><input type="text" name="email"></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="전송">
					</td>
				</tr>


			</table>
		</form>
	</div>
     
</body>
</html>