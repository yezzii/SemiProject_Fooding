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


$(document).ready(function() {
  $.ajax({
    url: "starList.do",
    type: "get",
    dataType: "json", 

    success: function(data) {
      var list = data.list;
      for (var i = 0; i < list.length; i++) {
        var member_id = list[i].member_id;
        var review = list[i].review;
        var star_count = list[i].star_count;

        var title = $('.member_id_title').text("");
        title = $('.member_id_title').text(member_id);
        
        var p = $('.user_comment').text("");
        p = $('.user_comment').text(review);

        var star_rating = $('.star-rating');
        star_rating.html('');

        for (var j = 0; j < 5; j++) {
          var spa = $('<span>').addClass('starR');
          if (j < star_count) {
            spa.addClass('on');
          }
          spa.text('⭐');
          star_rating.append(spa);
        }
      }
    },

    error: function(xhr, status, error) {
      console.log(error);
    }
  });
});



});
