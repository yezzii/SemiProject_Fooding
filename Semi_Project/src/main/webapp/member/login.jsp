<%@page import="org.eclipse.jdt.internal.compiler.lookup.Scope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
        	  scope : 'account_email',
     		  success: function (response) {
        	 		 console.log(response)	//json형식 >> String 변환 후 벨류값을 변수에 넣어서 이걸 db로 넣어서 회원관리하기.
        	  			alert(response);
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
    	var email = res.nickname;
		  scope : 'account_email';
					alert('로그인성공');
					alert(id);
					alert(email);
        			 location.href="<%=request.getContextPath()%>/member_join.do?member_id="+id;
    	 
      })
      .catch(function(err) {
        alert(
          '로그인 실패 유저정보 불러오기 실패 ' + JSON.stringify(err)
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
					<input type="image" src="../button_img/kakao_login_medium_wide.png" onclick="kakaoLogin();" value="카카오 로그아웃 kakaoLogout();">
				</td>
				</tr>
				
				<tr>
				<th>카카오 로그아웃</th>
				<td><input type="image" src="../button_img/kakao_logout_medium_wide.png" onclick="kakaoLogout();" value="카카오 로그아웃 kakaoLogout();"></td>
				</tr>
				<tr>
					<td>
						<p id="token-result"></p>
						<button class="api-btn" onclick="requestUserInfo()" style="visibility:visible;">사용자 정보 가져오기</button>
					</td>
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