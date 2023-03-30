<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">

	$(function(){
		$("#idcheck_btn").click(function(){	//회원가입 페이지에서 아이디 중복체크라는 버튼에 마우스가 올라갔을 때 호출되는 무명함수.
			$("#idcheck").hide();	//span테그 영역을 숨겨라.
			let userId = $("#member_id").val();		//member_id의 value값을 뽑아와라.
			
			
			
			if($.trim($("#member_id").val()).length > 16)	{
				
				let warningTxt = '<font color="red">아이디는 16자 이하이어야 합니다.</font>';
				$("#idcheck").text("");		//span 테그 영역 초기화.
				$("#idcheck").show();		
				$("#idcheck").append(warningTxt);
				$("#member_id").val('').focus();//span 테그 영역 초기화.
				return false;
				
			}
			
			//아이디 중복 여부 확인
			$.ajax({
				type	:	"post",
				url		:	"member_join_chk.do",
				data	:	{paramId : userId},
				datatype:	"json",
				success	:	function(data)	{
							if(data == -1){	//DB에 아이디 존재하는 경우(중복)
								let warningTxt = '<font color="red">중복 아이디 입니다.</font>';
								$("#idcheck").text("");		//span 태그 영역 초기화.
								$("#idcheck").show();		
								$("#idcheck").append(warningTxt);
								$("#member_id").val('').focus();//span 테그 영역 초기화.
							}else {
								let warningTxt = '<font color="green">사용가능한 아이디입니다.</font>';
								$("#idcheck").text("");		//span 테그 영역 초기화.
								$("#idcheck").show();		
								$("#idcheck").append(warningTxt);
							}
						},
				error 	:	function(data)	{
						alert("통신오류");
						}
			});
			
		});
	});
	
</script>

</head>
<body>
	<div align="center">
		<hr width="50%" color="pink">
			<h3>개인 회원 가입 페이지</h3>
		<hr width="50%" color="pink">
		
		<form method="post"	action="">
			<table border="1" cellspacing="0" width="400">
			
			<tr>
				<th>회원아이디</th>
				<td>
					<input name="member_id" id="member_id" size="20">
					<input type="button" value="중복확인" id="idcheck_btn">
					<br>
						<span id="idcheck"></span>
				</td>
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