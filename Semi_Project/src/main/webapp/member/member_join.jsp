<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script type="text/javascript">
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
      }

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

   
   function	id_chk() {

	    let member_id = document.getElementById('member_id').value;

	    location.href='<%=request.getContextPath()%>/member_join_chk.do?id='+member_id;

	}    

      
   
</script>
</head>
<body>
	<div align="center">
		<hr width="50%" color="pink">
		<h3>회원 회원 가입 페이지</h3>
		<hr width="50%" color="pink">

		<form method="post" name="f" onsubmit="return check();"
			action="<%=request.getContextPath()%>/member_join.do">
			<table border="1" cellspacing="0" width="400">

				<tr>
					<th>아이디</th>
					<td><input type="text" class="id" name="member_id"> <span
						class="error_next_box" id="idMsg" style="display: none"
						aria-live="assertive"></span></td>
				</tr>

				<tr>
					<th>이름</th>
					<td><input type="text" name="member_name"></td>
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
					<td><input type="text" name="member_email"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="member_phone"></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="회원가입"> <input type="reset" value="다시작성"></td>
				</tr>

			</table>
		</form>
		<script>
		//필요한 플래그들을 세운다.
		var idFlag = false;
	    
		    //id = 'id' 인 input에 플래그가 있다. checkId 함수를 시행한다.
		    $("#id").blur(function() {
		        idFlag = false;
		        checkId("first");
		    });
		    
		    //========= id 체크 함수 시행 ===============
		    function checkId(event) {
		        if (idFlag)
		            return true;
		        
		        var id = $("#id").val();
		        var oMsg = $("#idMsg");
		        var oInput = $("#id");
		        
		        //============ [id 필수입력] ============
		        if (id == "") {
		            showErrorMsg(oMsg, "필수 정보입니다."); //에러메시지 출력
		            setFocusToInputObject(oInput); //전송 플래그 조절
		            return false;
		        }
		        
		        //============ [id 유효성검사] ============
		        var isID = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
		        if (!isID.test(id)) {
		            showErrorMsg(oMsg, "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다."); //에러메시지 출력
		            setFocusToInputObject(oInput); //전송 플래그 조절
		            return false;
		        }
		        
		        //============ [id 중복체크] ============
		        // 추가) ajax 통신으로 DB 데이터 조회해서 중복확인하기!!!(post 방식)
		        idFlag = false; //검사 flag
		        let userId = $('input[name=member_id]').val(); // input_id에 입력되는 값
		        console.log("입력한 id값 : " + userId);
		        
		        //id 중복체크를 위해 input에 입력한 id값을 가져와서 ajax data로 반드시 보내줘야한다.
		        $.ajax({
		            url: "IdCheckService/idcheckAjax",
		            type: "post",
		            data: {
		                userId: userId
		            },
		            dataType: 'json',
		            success: function (result) {
		                //Action에서 받은 result값 : 1이면 사용가능, 0이면 중복됨
		                if (result == 0) { //돌려받은 결과가 중복이 존재한다는 0이면
		                    
		                    showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 아이디입니다."); //에러메시지 출력
		                    setFocusToInputObject(oInput); //전송 플래그 조절
		                    
		                } else { //돌려받은 결과가 중복이 없다는 false이면
		                    
		                    if (event == "first") { //그리고 #id라면
		                        showSuccessMsg(oMsg, "멋진 아이디네요!"); //에러메시지 출력
		                    } else {
		                        hideMsg(oMsg); //메시지 숨김
		                    }
		                    idFlag = true; //id 플래그 1로 변경. 더이상 id alert 발생 x
		                }
		            },
		            error: function () {
		                alert("서버요청실패");
		            }
		        })
		        return true;
		    } //function checkId(event) { 끝
		    	
		  //============ [id 필수입력] ============
		    if (id == "") {
		        showErrorMsg(oMsg, "필수 정보입니다."); //에러메시지 출력
		        setFocusToInputObject(oInput); //전송 플래그 조절
		        return false;
		    }
		    
		  //============ [id 유효성검사] ============
		    var isID = /^[a-z0-9][a-z0-9]{4,19}$/;
		    if (!isID.test(id)) {
		        showErrorMsg(oMsg, "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다."); //에러메시지 출력
		        setFocusToInputObject(oInput); //전송 플래그 조절
		        return false;
		    }
		    
		
		</script>
	</div>
</body>
</html>