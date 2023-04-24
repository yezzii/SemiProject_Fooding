/**
 *  가게 상세 정보 Modal로 띄우기
 */

$(function () {

	
  function reservation_insert() {
	  
	  var main_idx = $(this).siblings('#date_idx').val();
	  console.log("메인 idx : " + main_idx);
	  
    $.ajax({
		
      type: "POST",
      url: "LoadRestaurantOne.do",
      dataType: "json",
      
      data: {
		  
        main_idx: main_idx,
        
      },
      
      success: function (data){
		
		data.idx
				  
      },
      error: function (request, status, error) {
        console.log(error); // 오류 발생시 콘솔에 출력
      },
      
    });
  });
});
