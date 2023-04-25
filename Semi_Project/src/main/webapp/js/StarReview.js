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
		  	console.log("댓글 작성 완료.");

      }
    });
  });
});

$(function () {
   
   $(".starRatingList").on("click", function(e){
	e.preventDefault(); // 기본 이벤트 방지
	
$.ajax({
  url: "starList.do",
  type: "POST",
  dataType: "json",
  success: function(data) {
    console.log(data); 
    
    var list = data.list;
    var starRatingHTML = '';
    
    for (var i = 0; i < list.length; i++) {
      starRatingHTML += '<blockquote class="blockquote comment border-top-0 border-left-0 border-right-0 px-0 pt-0">';
      starRatingHTML += '<div class="d-sm-flex align-items-center pb-2">';
      starRatingHTML += '<h6 class="mb-0">' + list[i].member_id + '</h6>';
      starRatingHTML += '<span class="d-none d-sm-inline mx-2 text-muted opacity-50">|</span>';
      starRatingHTML += '<div class="star-rating">';
      
      for (var j = 0; j < 5; j++) {
        if (j < list[i].star_count) {
          starRatingHTML += '<span class="star">&#9733;</span>'; 
        } else {
          starRatingHTML += '<span class="star">&#9734;</span>'; 
        }
      }
      
      starRatingHTML += '</div></div>';
      starRatingHTML += '<p class="mb-0">' + list[i].review + '</p>';
      starRatingHTML += '</blockquote>';
    }
    
    $('#starRatingList').html(starRatingHTML);
  },
  error : function(request, status, error) {
	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
  }
});
});
});