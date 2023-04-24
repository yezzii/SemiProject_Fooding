/**
 * 
 */
 
 $(function () {


  $("#booking-btn").on("click", function () {
	  
  let date = $("#resvation_date").val();
  let time = $("#resvation_time").val();
  let people_num = $("#people-num").val();
  let req_text = $("#request-text").val();
  let main_idx = $("#main_idx").val();
  
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
          alert("성공");
        } else {
          alert("실패");
        }
      },
      error: function (request, status, error) {
        console.log(error); // 오류 발생시 콘솔에 출력
      },
    });
  });
});
