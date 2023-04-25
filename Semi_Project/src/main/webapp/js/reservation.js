$(function () {
	
  $('.reservation-btn').on('click', function(e) {
	  
		
		
		
    console.log("예약기능 Ajax호출");
    e.preventDefault(); // 기본 이벤트 방지

    let main_idx = $(this).parents('.modal-dialog').find("#detail_idx").val();
    let date = $("#resvation_date"+main_idx).val();
    let time = $("#resvation_time"+main_idx+" option:selected").val();
    let people_num = $("#people-num"+main_idx).val();
    let req_text = $("#request-text"+main_idx).val();
let success_toast = $("#login_success");


    console.log(main_idx);

    $.ajax({
      type: "POST",
      url: "reservation_insert.do",
      dataType : "json",
      data: {
        date: date,
        time: time,
        people_num: people_num,
        req_text: req_text,
        main_idx: main_idx,
      },
      success: function (data) {
        if (data == 1) {
          location.href="reservation-finish.jsp";
        } else {
          $("#quick-view").hide();
          success_toast.toast("show");
        }
      },
      error: function (request, status, error) {
        console.log(error); // 오류 발생시 콘솔에 출력
      },
    });
    
  });
});
