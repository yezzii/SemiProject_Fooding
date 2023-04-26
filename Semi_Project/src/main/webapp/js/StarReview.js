/**
 * 
 */

$(function () {
	
    $('.starRev span').click(function(){
    $(this).parent().children('span').removeClass('on');
    $(this).addClass('on').prevAll('span').addClass('on');
    
    return false;
    
  });

  $(".starInsert").on("click", function(e){
	e.preventDefault(); // 기본 이벤트 방지
	console.log("예약기능 Ajax호출");
	 
	let main_idx = $(this).parents('.starInsert-idx').find("#detail_idx").val();
	console.log(main_idx);
    let star = $(".starRev .on").length;
    let review = $("#reviewContents"+main_idx).val();
    
	$.ajax({
      type: "post",
      url: "star_review.do",
      dataType: "json",
      data: {
    	  star : star,
    	  review : review,
    	  idx : main_idx
      },
      success: function(data){
        alert("성공");
      }
    });
  });
});