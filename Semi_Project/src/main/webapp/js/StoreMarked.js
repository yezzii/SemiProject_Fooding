$(document).ready(function() {
  // 하트 아이콘을 클릭할 때마다 실행
  $('.product-wishlist-btn').on('click', function(e) {
	  console.log("찜하기 기능 Ajax호출");
    e.preventDefault(); // 기본 이벤트 방지
	
    var main_idx = $(this).siblings('#main_idx').val(); // 가게 idx 가져오기

    if ($(this).find('span').hasClass('bi-heart-fill')) { // 이미 위시리스트에 추가된 경우
      // DB에서 해당 정보 삭제
      $.ajax({
        type: 'POST',
        url: 'Marking_Delete.do',
        data: {
          main_idx: main_idx,
        },
        success: function(data) {
          if (data === 1) { // DB에서 삭제 성공시
            // 하트 아이콘을 빈 하트로 변경
            $('#Heart').find('span').toggleClass('bi-heart bi-heart-fill');
          }
        },
        error: function(request, status, error) {
          console.log(error); // 오류 발생시 콘솔에 출력
        }
      });
    } else { // 위시리스트에 추가되지 않은 경우
      // DB에 해당 정보 추가
      $.ajax({
        type: 'POST',
        url: 'Marking_Insert.do',
        data: {
          main_idx: main_idx,
        },
        success: function(data) {
          if (data === 1) { // DB에 추가 성공시
            // 하트 아이콘을 채워진 하트로 변경
            $('#Heart').find('span').toggleClass('bi-heart bi-heart-fill');
          }
        },
        error: function(request, status, error) {
          console.log("찜하기기능오류발생"+error); // 오류 발생시 콘솔에 출력
        }
      });
    }
  });
});
