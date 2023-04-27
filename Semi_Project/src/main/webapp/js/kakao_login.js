


$(function () {

  $("#kakaoAjax").on("click", function () {

    Kakao.init('fe3cf4492aa6c561d6c802d57d1418de'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    
    let success_toast = $("#login_success");
    let fail_toast = $("#login_fail");
    
    //카카오로그인

    //1. 로그인 시도
    Kakao.Auth.login({
      success: function (response) {

        //2. 로그인 성공시, API 호출
        Kakao.API.request({
			
          url: '/v2/user/me',
          
          success: function (response) {
            console.log(response)   //json형식 >> String 변환 후 벨류값을 변수에 넣어서 이걸 db로 넣어서 회원관리하기.


            var token = response.id;
            var nickname = response.properties.nickname;
            var email = response.kakao_account.email;
            var thumbnail = response.properties.profile_image;

            $.ajax({
              url: "member_KakaoLogin.do",
              data: {
                member_token: token,
                member_name: nickname,
                member_email : email, 
                thumbnail : thumbnail
              },
              
              dataType: "json",
              
              success: function (data) {
				  
                if (data.result == 1) {
					
               console.log(data.name);
               
                  toast_success_div.text(data.name + " 님 다시 오신걸 환영합니다.")
                  success_toast.toast("show");
                  
                  setTimeout(function () {
					  
                    location.reload();
                    
                  }, 2000);
                  
                } else {
					
                  fail_toast.toast("show");
                  
                }
              },
              
              error: function (jqXHR, textStatus, errorThrown) {
                alert("서버 오류: " + jqXHR + "\n textStatus : " + textStatus + "\n errorThrown : " + errorThrown);
                
              }
              
            });


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
  });
});