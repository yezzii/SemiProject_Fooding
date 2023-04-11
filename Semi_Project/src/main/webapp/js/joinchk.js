/**
 * 
 */
	
	function checkAll() { 	
		if (!checkUserId($("#signup-id").val())) {
			return false;
		} 
		if (!checkPassword($("#signup-id").val(),$("#signup-password").val())) {
			return false;
		} 
		if (!checkPasswordConfirm($("#signup-password").val(),$("#signup-password-confirm").val())) {
			return false;
		}  
		if (!checkName($("#signup-name").val())) {
			return false;
		} 
		if (!checkMail($("#signup-email").val())) {
			return false;
		} 
		if (!checkPhone($("#signup-phone").val())) {
			return false;
		}
	}


	// 공백확인 함수
	function checkExistData(value,key, dataName) {
		if (value == "") {
			let warningTxt = '<font color="red">'+dataName+' 입력해주세요.</font>';
			$(key).text(""); //span 테그 영역 초기화.
			$(key).show();
			$(key).append(warningTxt);
			
			return false;
		}
		return true;
	}
	
	/* 아이디 공백 체크 */
	function checkUserId(id) {
		if (!checkExistData(id ,"#signup-idchk", "아이디를")){
			return false;
		}
	}

	/*비밀번호 체크*/
	function checkPassword(id, password1) {
		
	
		if (checkExistData(password1 ,"#signup-pwdchk", "비밀번호를")){
			return false;
		}
		
		var password1RegExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{4,12}$/; //비밀번호 유효성 검사
		
		if (!password1RegExp.test(password1)) {
			let warningTxt = '<font color="red">비밀번호는 영문자와 숫자 4~12자리로 입력해야합니다.</font>';
			$("#signup-pwdchk").text(""); //span 테그 영역 초기화.
			$("#signup-pwdchk").show();
			$("#signup-pwdchk").append(warningTxt);
			$("#signup-password").val("");
			$("#signup-password").focus();
			return false;
		}
				
		//아이디와 비밀번호가 같을 때..
		if (id == password1) {
			alert("아이디와 비밀번호는 같을 수 없습니다!");
			$("#signup-password").val("");
			$("#signup-password-confirm").val("");
			$("#signup-password").focus();
			return false;
		}
		return true; //확인이 완료되었을 때
	}
	
	/* 비밀번호 확인 체크 */
	function checkPasswordConfirm(id,password1, password2) {
	
		//비밀번호 확인이 입력되었는지 확인하기
		if (!checkExistData(password2 ,"#signup-pwdconfirm-chk", "비밀번호 확인을")){
			return false;
		}
		
		
		//비밀번호와 비밀번호 확인이 맞지 않다면..
		if (password1 != password2) {
			let warningTxt = '<font color="red">동일한 비밀번호를 작성해주세요.</font>';
			$("#signup-pwdchk").text(""); //span 테그 영역 초기화.
			$("#signup-pwdchk").show();
			$("#signup-pwdchk").append(warningTxt);
			$("#signup-password-confirm").val("");
			$("#signup-password-confirm").focus();
			return false;
		}

		return true; //확인이 완료되었을 때
	}

	

	function checkMail(mail) {
		//mail이 입력되었는지 확인하기
		if (!checkExistData(mail, "이메일을"))
			return false;

		var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
		if (!emailRegExp.test(mail)) {
			alert("이메일 형식이 올바르지 않습니다!");
			form.mail.value = "";
			form.mail.focus();
			return false;
		}
		return true; //확인이 완료되었을 때
	}

	function checkName(name) {
		if (!checkExistData(name, "이름을"))
			return false;

		var nameRegExp = /^[가-힣]{2,4}$/;
		if (!nameRegExp.test(name)) {
			alert("이름이 올바르지 않습니다.");
			return false;
		}
		return true; //확인이 완료되었을 때
	}
	
	function checkPhone(phone) {
		if (!checkExistData(phone, "연락처를"))
			return false;

		var nameRegExp = /^[0-9]{9,11}$/;
		if (!nameRegExp.test(phone)) {
			alert("연락처가 올바르지 않습니다.");
			return false;
		}
		return true; //확인이 완료되었을 때
	}