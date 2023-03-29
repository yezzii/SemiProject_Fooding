<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

</head>
<body>
	<div align="center">
		<hr width="50%" color="pink">
		<h3>회원 회원 가입 페이지</h3>
		<hr width="50%" color="pink">

		<form method="post" id="f"
			action="<%=request.getContextPath()%>/member_join.do" onsubmit="return mySubmit()">
			<table border="1" cellspacing="0" width="600">

				<tr>
					<th>아이디</th>
					<td><input type="text" class="input_id" id="member_id" name="member_id">
						<font id="checkId" size="2"></font></td>
				</tr>

				<tr>
					<th>이름</th>
					<td><input type="text" id="member_name"name="member_name"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" id="password" name="member_pwd"></td>
				<tr>
					<th colspan="2"><font style="font-size: 5pt">영문자 대/소문자
							특수문자,숫자포함 8 ~20자</font></th>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" id="password_ok"
						name="member_pwd.ok"></td>
				<tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" id="member_email" name="member_email"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" id="member_phone" name="member_phone"></td>
				</tr>

				

			</table>
			<br>
			<div align = "center">
			<input type="submit" value="회원가입"> 
			<input type="reset" value="다시작성">
			</div>
		</form>
	</div>
	<script>
	let idCheck = false;
	
	function mySubmit() {


	    let member_id = $('#member_id').val();
	    let member_pw = $('#password').val();
	    let member_pwOk = $('#password_ok').val();
	    let member_name = $('#member_name').val();
	    let member_email = $('#member_email').val();
	    let member_phone = $('#member_phone').val();

	    let check_id = RegExp(/^[a-zA-Z0-9]{4,10}$/); // 아이디 유효성 검사 (영문 및 숫자 4-10글자)
	    let check_pw = RegExp(/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{4,20}$/); // 비밀번호 유효성 검사 (영문 및 숫자 4-20글자)
	    //let memberInsertForm = $('#memberInsertForm');


	    // 아이디 중복 체크 여부
	    if (idCheck == false) {
	        return false;
	    }

	    // 아이디 공백 확인
	    if (member_id == "" || member_id == null) {
	        $('.idCheck').html('아이디를 입력해주세요.');
	        alert("아이디를 입력해주세요.");
	        $('#member_id').focus();
	        return false;
	    }

	    // 아이디 유효성 체크
	    if (!check_id.test(member_id)) {
	        $('.idCheck').html('영문 및 숫자만 4-10자리까지 입력해주세요.');
	        $('#member_id').val("");
	        $('#member_id').focus();
	        return false;
	    }

	    // 비밀번호 공백 확인
	    if (member_pw == "" || member_pw == null) {
	        $('.pwCheck').html('비밀번호를 입력해주세요.');
	        alert("비밀번호를 입력해주세요.");
	        $('#member_pw').focus();
	        return false;
	    }
	    // 비밀번호 같은지 확인
	    if (member_pw == member_pwOk) {
	        $('.pwCheck').html('비밀번호를 입력해주세요.');
	        alert("비밀번호가 같지 않습니다");
	        $('#member_pw').focus();
	        return false;
	    }

	    // 비밀번호 유효성 체크
	    if (!check_pw.test(member_pw)) {
	        $('.pwCheck').html('영문 및 숫자, 특수문자를 포함한 비밀번호를 입력해주세요.');
	        $('#member_pw').val("");
	        $('#member_pw').focus();
	        return false;
	    }
	   

	    //memberInsertForm.submit();


	}
		
		$('.input_id').focusout(function(){
			let userId = $('.input_id').val();
			
			$.ajax({
				url:"member_join_chk.do",
				type : "post",
				data : {userId: userId},
				dataType : 'json',
				success : function(result){
					if(result == 0) {
						$("#checkId").html('사용할 수 없는 아이디 입니다.');
						$("#checkId").attr('color','red');
						idCheck = false;
					}else {
						$("#checkId").html('사용할 수 있는 아이디 입니다.');
						$("#checkId").attr('color','green');
						idCheck = true;
					}
				},
				error : function() {
					
				}
			})
		})
		
	
	</script>

</body>
</html>