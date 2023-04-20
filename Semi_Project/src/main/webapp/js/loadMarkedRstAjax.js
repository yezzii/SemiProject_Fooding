function loadMark() {
    
var id = '<%= session.getAttribute("id") %>';

    $.ajax({
      type: 'POST',
      url: 'memMarkLoad.do',
      data: {
        id: id,
      },
      success: function (data) {
        if (data == 1) { // DB에서 삭제 성공시
          // 좋아요 활성
			console.log("AJAX호출 성공")
        } else if (data == 2) {//좋아요 비활성 상태일 경우


        }
      },
      error: function (request, status, error) {
        console.log(error); // 오류 발생시 콘솔에 출력
      }

    });
  };
