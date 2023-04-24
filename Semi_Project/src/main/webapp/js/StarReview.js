   let idx = $("#idx").val();

   
    
    $('.starRev span').click(function(){
    $(this).parent().children('span').removeClass('on');
    $(this).addClass('on').prevAll('span').addClass('on');
    return false;
  });

  $("#id"+idx).on("click", function(){
    let star = $(".starRev .on").length;
    let review = $("#reviewContents").val();
	console.log("Ajax호출-Star");	
  
	$.ajax({
      type: "post",
      url: "star_review.do",
      data: {
    	  star : star,
    	  review : review,
    	  idx : idx
      },
      dataType: "json",
      success: function(data){
        
      }
    });
  });
