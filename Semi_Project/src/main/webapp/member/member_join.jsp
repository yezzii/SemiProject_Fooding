<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	let idchk = false;
	$(function() {
		
		$("#idcheck_btn")
				.click(
						function() { //회원가입 페이지에서 아이디 중복체크라는 버튼에 마우스가 올라갔을 때 호출되는 무명함수.
							$("#idcheck").hide(); //span테그 영역을 숨겨라.
							let userId = $("#member_id").val(); //member_id의 value값을 뽑아와라.

							if ($.trim($("#member_id").val()).length < 4) {

								let warningTxt = '<font color="red">아이디는 4자 이상이어야 합니다.</font>';
								$("#idcheck").text(""); //span 테그 영역 초기화.
								$("#idcheck").show();
								$("#idcheck").append(warningTxt);
								$("#member_id").val('').focus();//span 테그 영역 초기화.
								return false;

							}

							if ($.trim($("#member_id").val()).length > 16) {

								let warningTxt = '<font color="red">아이디는 16자 이하이어야 합니다.</font>';
								$("#idcheck").text(""); //span 테그 영역 초기화.
								$("#idcheck").show();
								$("#idcheck").append(warningTxt);
								$("#member_id").val('').focus();//span 테그 영역 초기화.
								return false;

							}

							//아이디 중복 여부 확인
							$
									.ajax({
										type : "post",
										url : "member_join_chk.do",
										data : {
											paramId : userId
										},
										datatype : "json",
										success : function(data) {
											if (data == -1) { //DB에 아이디 존재하는 경우(중복)
												let warningTxt = '<font color="red">중복 아이디 입니다.</font>';
												$("#idcheck").text(""); //span 테그 영역 초기화.
												$("#idcheck").show();
												$("#idcheck").append(warningTxt);
												$("#member_id").val('').focus();//span 테그 영역 초기화.
												idchk = false;
											} else {
												let warningTxt = '<font color="green">사용가능한 아이디입니다.</font>';
												$("#idcheck").text(""); //span 테그 영역 초기화.
												$("#idcheck").show();
												$("#idcheck").append(warningTxt);
												idchk = true;
											}
										},
										error : function(data) {
											alert("통신오류");
										}
									});

						});
	});
	function checkAll() {
		if (!checkUserId(form.member_id.value)) {
			return false;
		} else if (!checkPassword(form.member_id.value, form.member_pwd.value,
				form.member_pwdok.value)) {
			return false;
		} else if (!checkName(form.member_name.value)) {
			return false;
		} else if (!checkMail(form.member_email.value)) {
			return false;
		} else if (!checkPhone(form.member_phone.value)) {
			return false;
		} else if (!confirmId(idchk)) {
			return false;
		}else {
			document.form.submit();
		}
	}

	// 중복여부 확인 함수
	function confirmId(value) {
		if (value == false) {
			alert("아이디 중복여부를 확인해주세요");
			return false;
		}
		return true;
	}
	// 공백확인 함수
	function checkExistData(value, dataName) {
		if (value == "") {
			alert(dataName + " 입력해주세요!");
			return false;
		}
		return true;
	}

	function checkUserId(id) {
		//Id가 입력되었는지 확인하기
		if (!checkExistData(id, "아이디를"))
			return false;

		var idRegExp = /^[a-zA-Z0-9]{4,12}$/; //아이디 유효성 검사
		if (!idRegExp.test(id)) {
			alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
			form.userId.value = "";
			form.userId.focus();
			return false;
		}
		return true; //확인이 완료되었을 때
	}

	function checkPassword(id, password1, password2) {
		//비밀번호가 입력되었는지 확인하기
		if (!checkExistData(password1, "비밀번호를"))
			return false;
		//비밀번호 확인이 입력되었는지 확인하기
		if (!checkExistData(password2, "비밀번호 확인을"))
			return false;

		var password1RegExp = /^[a-zA-Z0-9]{4,12}$/; //비밀번호 유효성 검사
		if (!password1RegExp.test(password1)) {
			alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
			form.password1.value = "";
			form.password1.focus();
			return false;
		}
		//비밀번호와 비밀번호 확인이 맞지 않다면..
		if (password1 != password2) {
			alert("두 비밀번호가 맞지 않습니다.");
			form.password1.value = "";
			form.password2.value = "";
			form.password2.focus();
			return false;
		}

		//아이디와 비밀번호가 같을 때..
		if (id == password1) {
			alert("아이디와 비밀번호는 같을 수 없습니다!");
			form.password1.value = "";
			form.password2.value = "";
			form.password2.focus();
			return false;
		}
		return true; //확인이 완료되었을 때
	}

	function checkMail(mail) {
		//mail이 입력되었는지 확인하기
		if (!checkExistData(mail, "이메일을"))
			return false;

		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		if (!emailRegExp.test(mail)) {
			alert("이메일 형식이 올바르지 않습니다!");
			form.mail.value = "";
			form.mail.focus();
			return false;
		}
		return true; //확인이 완료되었을 때
	}

	function checkName(name) {
		if (!checkExistData(name, "이름을"))
			return false;

		var nameRegExp = /^[가-힣]{2,4}$/;
		if (!nameRegExp.test(name)) {
			alert("이름이 올바르지 않습니다.");
			return false;
		}
		return true; //확인이 완료되었을 때
	}
	function checkPhone(phone) {
		if (!checkExistData(phone, "연락처를"))
			return false;

		var nameRegExp = /^[0-9]{9,11}$/;
		if (!nameRegExp.test(phone)) {
			alert("연락처가 올바르지 않습니다.");
			return false;
		}
		return true; //확인이 완료되었을 때
	}
</script>

</head>
<body>
	<div align="center">
		<hr width="50%" color="pink">
		<h3>개인 회원 가입 페이지</h3>
		<hr width="50%" color="pink">

		<form method="post" action="<%=request.getContextPath()%>/member_join.do" name="form">
			<table border="1" cellspacing="0" width="400">

				<tr>
					<th>회원아이디</th>
					<td><input name="member_id" id="member_id" size="20">
						<input type="button" value="중복확인" id="idcheck_btn"> <br>
						<span id="idcheck"></span></td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td><input type="password" name="member_pwd" placeholder="영문 대소문자와 숫자를 포함해주세요"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="member_pwdok"></td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input type="text" name="member_name"></td>
				</tr>
				<tr>
					<th>회원이메일</th>
					<td><input type="text" name="member_email" placeholder="abc@naver.com"></td>
				</tr>
				<tr>
					<th>회원연락처</th>
					<td><input type="text" name="member_phone" placeholder="'-' 제외 후 입력해주세요."></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="button" onclick="return checkAll()"
						value="회원가입"> <input type="reset" value="다시작성"></td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>



