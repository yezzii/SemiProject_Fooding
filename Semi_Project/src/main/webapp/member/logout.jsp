<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
// 1: 기존의 세션 데이터를 모두 삭제
session.invalidate();
// 2: 로그인 페이지로 이동시킴.
response.sendRedirect("../main.jsp");
%>
<!DOCTYPE html>
<html>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>

window.onload = function kakaoLogout() {
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

</script>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
</body>
</html>