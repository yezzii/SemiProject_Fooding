<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script>
	function check() {
      
      var pw = document.getElementById('password').value;
      var pwok = document.getElementById('password_ok').value;
       var num = pw.search(/[0-9]/g);
       var eng = pw.search(/[a-z]/ig);
       var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
       
	if (f.member_id.value == "") {
        alert("아이디를 입력하세요");
        f.member_id.focus();
        return false;

      if (f.member_name.value == "") {
         alert("이름를 입력하세요");
         f.member_name.focus();
         return false;
      }

      if (f.member_pwd.value == "") {
         alert("비밀번호를 입력하세요");
         f.member_pwd.focus();
         return false;
      }
      if(pw.length < 8 || pw.length > 20){

          alert("8자리 ~ 20자리 이내로 입력해주세요.");
          return false;
         }
         if(pw.search(/\s/) != -1){
          alert("비밀번호는 공백 없이 입력해주세요.");
          return false;
         }
         if(num < 0 || eng < 0 || spe < 0 ){
          alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
          return false;
         }
         
         if(pw != pwok){
            alert("비밀번호가 일치 하지 않습니다.");
            return false;
         }

      if (f.member_email.value == "") {
         alert("이메일을 입력하세요");
         f.member_email.focus();
         return false;
      }

      if (f.member_phone.value == "") {
         alert("연락처를 입력하세요");
         f.member_phone.focus();
         return false;
      }
	}
	</script>
</head>
<body>
	<div align="center">
		<hr width="50%" color="pink">
		<h3>회원 회원 가입 페이지</h3>
		<hr width="50%" color="pink">

		<form method="post" id="f"
			action="<%=request.getContextPath()%>/member_join.do">
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

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="회원가입" onclick="return check()"> <input type="reset" value="다시작성"></td>
				</tr>

			</table>
		</form>
	</div>
	<script>
	
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
						chk = 1;
					}else {
						$("#checkId").html('사용할 수 있는 아이디 입니다.');
						$("#checkId").attr('color','green');
					}
				},
				error : function() {
					alert("서버요청 실패");
				}
			})
		})
	</script>

</body>
</html>