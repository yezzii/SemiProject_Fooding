<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(function() {
		let userId = "";
		$("#idcheck_btn")
				.click(
						function() { //회원가입 페이지에서 아이디 중복체크라는 버튼에 마우스가 올라갔을 때 호출되는 무명함수.
							$("#idcheck").hide(); //span테그 영역을 숨겨라.

							userId = $("#member_id").val();

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
												$("#idcheck").text(""); //span 태그 영역 초기화.
												$("#idcheck").show();
												$("#idcheck")
														.append(warningTxt);
												$("#member_id").val('').focus();//span 테그 영역 초기화.
											} else {
												let warningTxt = '<font color="green">사용가능한 아이디입니다.</font>';
												$("#idcheck").text(""); //span 테그 영역 초기화.
												$("#idcheck").show();
												$("#idcheck")
														.append(warningTxt);
											}
										},
										error : function(data) {
											alert("통신오류");
										}
									});

						});

	});
	function memberCheck(f) {
		//회원가입 유효성 검사
		//1)  아이디 5~10자 이내인가
		var id = $('#member_id').val();
		id = id.trim();
		if (id.length<5 || id.length>10) {
			alert("아이디가 5~10자 이내인지 확인해주세요");
			f.id.focus();
			return false;
		}//if end

		//2) 비밀번호 5~10자 이내인가 (특수문자가 들어가는 식도 존재함 - 정규표현식)
		var passwd = f.passwd.value;
		passwd = passwd.trim(); //공백 없애주기
		if (passwd.length<5 || passwd.length>10) {
			alert("비밀번호를 5~10자 이내인지 확인해주세요");
			f.passwd.focus(); //커서 가져다 두기
			return false;
		}//if end

		//3) 비밀번호와 비밀번호 확인이 서로 일치하는가
		var passwd = f.passwd.value;
		passwd = passwd.trim();

		var repasswd = f.repasswd.value;
		repasswd = repasswd.trim();

		if (passwd != repasswd) {
			alert("비밀번호가 일치 하지않습니다.")
			f.passwd.focus();
			return false;
		}//if end

		//4) 이름 2~20자 이내인가
		var mname = f.mname.value;
		mname = mname.trim();
		if (mname.length<2 || mname.length>20) {
			alert("이름을 2~20자 이내로 입력해주세요.");
			f.mname.focus();
			return false;
		}//if end

		//5) 이메일@ 문자가 있는가
		var email = f.member_email.value;
		email = email.trim();
		if (email.indexOf('@') == -1) {
			alert("이메일을 올바르게 입력해주세요.")
			f.email.focus();
			return false;
		}//if end

		return true; //유효성 검사를 모두 통과했으므로 memberProc.jsp로 전송됨
	}//memberCheck() end
</script>

</head>
<body>
	<div align="center">
		<hr width="50%" color="pink">
		<h3>개인 회원 가입 페이지</h3>
		<hr width="50%" color="pink">

		<form id="f" method="post" action=""
			onsubmit="return memberCheck(this)">
			<table border="1" cellspacing="0" width="400">

				<tr>
					<th>회원아이디</th>
					<td><input name="member_id" id="member_id" size="20">
						<input type="button" value="중복확인" id="idcheck_btn"> <br>
						<span id="idcheck"></span></td>
				</tr>
				<tr>
					<th>회원이름</th>
					<td><input type="text" id="memname="member_name"></td>
				</tr>
				<tr>
					<th>회원비밀번호</th>
					<td><input type="text" id="member_pwd" name="member_pwd"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="text" id="member_pwdok" name="member_pwdok"></td>
				</tr>
				<tr>
					<th>회원이메일</th>
					<td><input type="text" id="member_email" name="member_email"></td>
				</tr>
				<tr>
					<th>회원연락처</th>
					<td><input type="text" id = "member_phone" name="member_phone"></td>
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