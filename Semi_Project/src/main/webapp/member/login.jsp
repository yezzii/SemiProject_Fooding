<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<script>
	
	let txt;
	
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
        	       
        	 		 
        	 		 var id = response.id;
        	       	 var nickname = response.properties.nickname;
        	       	 var email = response.kakao_account.email;
							//alert(response);
        	 		location.href="<%=request.getContextPath()%>/member_KakaoLogin.do?member_id="+id+"&member_name="+nickname+"&member_email="+email;
        	 		//	MemberKakaoLoginAction  으로 이동.
         	  			},
         fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
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
    	var id = res.id;
    	 var nickname = res.properties.nickname;
    	 var email = res.kakao_account.email;
    	 var profileImg = res.kakao_account.profile.profile_image_url;		//카톡프로필사진
    
   	    alert(id);
		alert(nickname);
		alert(email);
		  scope : 'account_email';
		alert('카카오 계정 동기화가 완료 되었습니다. [확인]을 눌러 추가정보 입력 페이지로 이동합니다.');
					
     			location.href="<%=request.getContextPath()%>/member_Kakaojoin.do?member_id="+id+"&member_name="+nickname+"&member_email="+email+"&member_img="+profileImg;
   
    	 
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
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<form action="<%=request.getContextPath()%>/login.do" method = "post">
			<table border="1" cellspacing="0">
				
				<tr>
					<th>아이디 :</th>
					<td><input type="text" name="id"></td>
				</tr>

				<tr>
					<th>비밀번호 :</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				
				<tr>
				<th>카카오 로그인</th>
				<td>
					<input type="image" src="../button_img/kakao_login_medium_wide.png" onclick="kakaoLogin();" value="카카오 로그인 kakaoLogin();">
				</td>
				</tr>
				
		 		<tr>
					<th>카카오 로그아웃</th>
					<td><input type="image" src="../button_img/kakao_logout_medium_wide.png" onclick="kakaoLogout();" value="카카오 로그아웃 kakaoLogout();"></td>
				</tr>
				

				<tr>
					<td colspan="4" align="center">
					<input type="submit" value="로그인"> 
					<input type="button" onclick="location.href='member_join.jsp'"value="회원가입">
					<a href="find_id.jsp">
						<button type="button" class="find">
							<span class="">아이디 찾기</span>
						</button>
					</a>
				<!-- 아이디 찾기 -->
					<a href="find_pwd.jsp">
						<button type="button" class="find">
							<span class="">비밀번호 찾기</span>
						</button>
					</a>
				<!-- 비밀번호 찾기 -->
					</td>
				</tr>

			</table>
		</form>
				
	</div>


</body>
</html>