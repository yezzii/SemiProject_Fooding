/**
 * 가게 찜 기능
 */


	 
	 $("#marking").on("click",function() {
		 
		 let idx = $("#main_idx").val();
		 
		 
		 if($().children())
		 $.ajax({
					type: "post",
					url: "Store_marking.do",
					data: {
						main_idx : idx
					},
					datatype: "json",
					success: function(data) {
						if (data == 1) { //가게 찜이 제대로 되었을 경우
							$("#store-undibs").hide();
							$("#store-dibs").show();
							$("#reg-idchk")
								.append(warningTxt);
							$("#reg-id").val('').focus();//span 테그 영역 초기화.
						} else {
							$("#store-undibs").show();
							$("#store-dibs").hide();
							$("#reg-idchk").append(warningTxt);
						}
					},
					error: function(data) {
						alert("통신오류");
					}
				});
		 
	 });
	 
 