
let idchk = false;
$(function() {

		let userId = "";
		let idchk = false;
		$("#signup-id")
				.on(
						"blur",
						function() { //회원가입 페이지에서 입력창에서 시점이 옮겨 갔을때  호출되는 무명함수.
							$("#signup-idchk").hide(); //span테그 영역을 숨겨라.
							let userId = $("#signup-id").val(); //signup-id의 value값을 뽑아와라.

							
							let idRegExp = /^[a-z0-9]{4,12}$/; //아이디 유효성 검사
							if(!idRegExp.test(userId)){
								
								let warningTxt = '<font color="red">영문 소문자나 숫자 4~12자리로 입력해야합니다.</font>';
								$("#signup-idchk").text(""); //span 테그 영역 초기화.
								$("#signup-idchk").show();
								$("#signup-idchk").append(warningTxt);
								$("#signup-id").val('').focus();//span 테그 영역 초기화.
								return false;

							}
							//아이디 중복 여부 확인
							$.ajax({
										type : "post",
										url : "member_join_chk.do",
										data : {
											paramId : userId
										},
										datatype : "json",
										success : function(data) {
											if (data == -1) { //DB에 아이디 존재하는 경우(중복)
												let warningTxt = '<font color="red">중복 아이디 입니다.</font>';
												$("#signup-idchk").text(""); //span 테그 영역 초기화.
												$("#signup-idchk").show();
												$("#signup-idchk")
														.append(warningTxt);
												$("#signup-id").val('').focus();//span 테그 영역 초기화.
												idchk = false;
											} else {
												let warningTxt = '<font color="green">사용가능한 아이디입니다.</font>';
												$("#signup-idchk").text(""); //span 테그 영역 초기화.
												$("#signup-idchk").show();
												$("#signup-idchk")
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
