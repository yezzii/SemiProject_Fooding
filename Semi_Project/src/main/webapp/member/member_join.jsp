<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<script>
Kakao.init('fe3cf4492aa6c561d6c802d57d1418de'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
	//1. 로그인 시도
    Kakao.Auth.login({
      success: function (response) {
    	  
    	  //2. 로그인 성공시, API 호출
       		 Kakao.API.request({
        	  url: '/v2/user/me',
     		  success: function (response) {
        	 		 console.log(response)	//json형식 >> String 변환 후 벨류값을 변수에 넣어서 이걸 db로 넣어서 회원관리하기.
        	 		requestUserInfo();
     		  },
         fail: function (error) {
            console.log(error)
         
          },
        })
      },
      fail: function (error) {
        console.log(error)
           alert("회원이 아닙니다. 회원가입을 진행해주세요.")
      },
    })
  }
  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }


function requestUserInfo() {
    Kakao.API.request({
      url: '/v2/user/me',
      
    })
      .then(function(res) {
    
    	 var token = res.id;
       	 var nickname = res.properties.nickname;
       	 var email = res.kakao_account.email;
       	 var thumbnail = res.properties.thumbnail_image;
       	 
       	const form = document.createElement('form');

       	let objs1 = document.createElement('input');
       	objs1.setAttribute('type', 'hidden');
       	objs1.setAttribute('name', 'member_id');
       	objs1.setAttribute('value', token);
       	form.appendChild(objs1);

       	let objs2 = document.createElement('input');
       	objs2.setAttribute('type', 'hidden');
       	objs2.setAttribute('name', 'member_name');
       	objs2.setAttribute('value', nickname);
       	form.appendChild(objs2);

       	let objs3 = document.createElement('input');
       	objs3.setAttribute('type', 'hidden');
       	objs3.setAttribute('name', 'member_email');
       	objs3.setAttribute('value', email);
       	form.appendChild(objs3);

       	let objs4 = document.createElement('input');
       	objs4.setAttribute('type', 'hidden');
       	objs4.setAttribute('name', 'thumbnail');
       	objs4.setAttribute('value', thumbnail);
       	form.appendChild(objs4);

       	form.setAttribute('method', 'post');
       	form.setAttribute('action', "../member_Kakaojoin.do");//	MemberKakaojoinAction  으로 이동.
       	document.body.appendChild(form);
       	form.submit();
    	 
    	 
    	 
    	 
    	 
      })
      .catch(function(err) {
        alert(
          '회원정보를 불러오는데 실패했습니다. ' + JSON.stringify(err)
        );
      });
  }
  
  
  
  
displayToken()
function displayToken() {
  var token = getCookie('authorize-access-token');

  if(token) {
    Kakao.Auth.setAccessToken(token);
    document.querySelector('#token-result').innerText = 'login success, ready to request API';
    document.querySelector('button.api-btn').style.visibility = 'visible';
  }
}

function getCookie(name) {
  var parts = document.cookie.split(name + '=');
  if (parts.length === 2) { return parts[1].split(';')[0]; }
}

</script>

</head>
<body>
	<div align="center">
		<hr width="50%" color="pink">
		<h3>회원 가입 페이지</h3>
		<hr width="50%" color="pink">

		<form method="post" id="f"
			action="<%=request.getContextPath()%>/member_join.do" autocomplete="off" onsubmit="return mySubmit()">
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
		<br>
		<div align="center">
			<p id="token-result"></p>
			<input class="api-btn" type="image" src="../button_img/kakaoJoin.png" 
			onclick="kakaoLogin();" value="카카오 회원가입" style="width:300px;">
		</div>
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
					alert("서버요청 실패");
				}
			})
		})
		
	
	</script>

</body>
</html>