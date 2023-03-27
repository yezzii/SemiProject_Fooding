<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {

		if (f.company_id.value == "") {
			alert("아이디를 입력하세요");
			f.company_id.focus();
			return false;
		}

		if (f.company_name.value == "") {
			alert("이름를 입력하세요");
			f.company_name.focus();
			return false;
		}

		if (f.company_pwd.value == "") {
			alert("비밀번호를 입력하세요");
			f.company_pwd.focus();
			return false;
		}

		if (f.company_email.value == "") {
			alert("이메일을 입력하세요");
			f.company_email.focus();
			return false;
		}

		if (f.company_phone.value == "") {
			alert("연락처를 입력하세요");
			f.company_phone.focus();
			return false;
		}
		
		if (f.company_phone.value == "") {
			alert("사업자번호를 입력하세요");
			f.company_storenum.focus();
			return false;
		}

	}
</script>
</head>
<body>
	<div align="center">
		<hr width="50%" color="pink">
		<h3>사업자 회원 가입 페이지</h3>
		<hr width="50%" color="pink">

		<form method="post" name="f"
			action="<%=request.getContextPath()%>/company_join.do"
			onsubmit="return check();">
			<table border="1" cellspacing="0" width="300">

				<tr>
					<th>아이디</th>
					<td><input type="text" name="company_id"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="company_name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" name="company_pwd"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="company_email"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="company_phone"></td>
				</tr>
				<tr>
					<th>사업자번호</th>
					<td><input type="text" name="company_storenum"></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="회원가입"> <input type="reset" value="다시작성"></td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>