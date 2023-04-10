/**
 * 
 */
$(function() {

		let userId = "";
		let idchk = false;
		$("#signup-id")
				.on(
						"blur",
						function() { //회원가입 페이지에서 아이디 중복체크라는 버튼에 마우스가 올라갔을 때 호출되는 무명함수.
							$("#idcheck").hide(); //span테그 영역을 숨겨라.
							let userId = $("#signup-id").val(); //member_id의 value값을 뽑아와라.

							if ($.trim($("#signup-id").val()).length < 4) {

								let warningTxt = '<font color="red">아이디는 4자 이상이어야 합니다.</font>';
								$("#idcheck").text(""); //span 테그 영역 초기화.
								$("#idcheck").show();
								$("#idcheck").append(warningTxt);
								$("#signup-id").val('').focus();//span 테그 영역 초기화.
								return false;

							}

							if ($.trim($("#signup-id").val()).length > 16) {

								let warningTxt = '<font color="red">아이디는 16자 이하이어야 합니다.</font>';
								$("#idcheck").text(""); //span 테그 영역 초기화.
								$("#idcheck").show();
								$("#idcheck").append(warningTxt);
								$("#signup-id").val('').focus();//span 테그 영역 초기화.
								return false;

							}

							//아이디 중복 여부 확인
							$
									.ajax({
										type : "post",
										url : "member_join_chk.do",
										data : {
											paramId : userId
										},
										datatype : "json",
										success : function(data) {
											if (data == -1) { //DB에 아이디 존재하는 경우(중복)
												let warningTxt = '<font color="red">중복 아이디 입니다.</font>';
												$("#idcheck").text(""); //span 테그 영역 초기화.
												$("#idcheck").show();
												$("#idcheck")
														.append(warningTxt);
												$("#member_id").val('').focus();//span 테그 영역 초기화.
												idchk = false;
											} else {
												let warningTxt = '<font color="green">사용가능한 아이디입니다.</font>';
												$("#idcheck").text(""); //span 테그 영역 초기화.
												$("#idcheck").show();
												$("#idcheck")
														.append(warningTxt);
												idchk = true;
											}
										},
										error : function(data) {
											alert("통신오류");
										}
									});

						});
	});