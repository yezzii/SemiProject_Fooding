<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	width: 300px;
	text-decoration: none;
	font-family: sans-serif;
}

body {
	background-image: #34495e;
}

.joinForm {
	position: absolute;
	width: 400px;
	height: 400px;
	padding: 30px, 20px;
	background-color: #FFFFFF;
	text-align: center;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 15px;
}

.joinForm h2 {
	text-align: center;
	margin: 30px;
}

.textForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.textForm_btn {
	width:80px;
	margin-left : 230px;
	background: #6c5ce7;
	height: 30px;
	background-position: left;
	background-size: 200%;
	color: white;
	border: none;
	border-radius: 0.5em;
	display: inline;

}

.menu_text{
	color: #636e72;
	display:inline-block;
	padding-left : -230px;

}

.time_textForm {
	margin: 30px;
	padding: 10px 10px;
}

.name {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.cont {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.phone {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.location {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}


.btn {
	position: relative;
	left: 40%;
	transform: translateX(-50%);
	margin-bottom: 40px;
	width: 80%;
	height: 40px;
	background: linear-gradient(125deg, #81ecec, #6c5ce7, #81ecec);
	background-position: left;
	background-size: 200%;
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
	transition: 0.4s;
	display: inline;
}

.btn:hover {
	background-position: right;
}
</style>
</head>
<body>
 <c:set var="dto" value="${boardmain }" />
	<form class="joinForm" method="post" action="<%=request.getContextPath() %>/board_main_updateOk.do" >
		

		<input type="hidden" name="main_idx" value="${dto.getMain_idx() }" >
		
		<h2>가게 수정</h2>
		<div class="textForm">
			<input name="main_name" type="text" class="name" value="${dto.getMain_name() }"readonly>
		</div>

		<div class="textForm">
			<select name="main_type">
				<option value="">가게타입</option>
				<option value="고기요리">고기요리</option>
				<option value="일식">일식</option>
				<option value="한식">한식</option>
				<option value="중식">중식</option>
				<option value="양식">양식</option>
				<option value="이탈리아">이탈리아</option>
				<option value="카페,디저트">카페,디저트</option>
			</select>
		</div>
				
		<div class="textForm">
			<textarea class="cont" rows="5" cols="25" name="main_info">${dto.getMain_info() }</textarea>
		</div>


		<div class="time_textForm">
			<!-- <input name="main_opentime" type="text" class="name" placeholder="영업시작시간">
			<input name="main_endtime" type="text" class="name" placeholder="영업종료시간"> -->
			 <label for="main_opentime" style="color: #636e72">영업시작시간</label>
			 <input type="time" id="main_opentime" name="main_opentime" value="${dto.getMain_opentime() }"> 
			 <label for="main_endtime" style="color: #636e72">영업종료시간</label>
			 <input type="time" id="main_endtime" name="main_endtime" value="${dto.getMain_opentime() }"> 
			 
			
		</div>

		<div class="textForm">
			<input name = "main_post" id="post" type="text" class="location" value="${dto.getMain_post() }" readonly onclick = "findAddr()">
			<input name = "main_addr" id="addr" type="text" class="location" value="${dto.getMain_addr() }" readonly  >
			<input name = "main_detailaddr" type="text" class="location"  value="${dto.getMain_detailaddr() }">
		</div> 
		
		<div class="textForm">
			<input name="main_phone" type="text" class="phone" value="${dto.getMain_phone() }">
		</div>
		
		<div class="textForm">
			<select name="main_thema">
				<option value="">가게테마</option>
				<option value="데이트 코스">데이트 코스</option>
				<option value="가족모임">가족모임</option>
				<option value="뷰가 좋은">뷰가 좋은</option>
				<option value="전통적인">전통적인</option>
				<option value="비지니스미팅">비지니스미팅</option>
			</select>
		</div>
		
		<input type="submit" class="btn" value="J O I N" />
	</form>

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">

function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("addr").value = jibunAddr;
            }
        }
    }).open();
}
	$(document).ready(function() {
		  // 사용자가 선택한 셀렉트값 가져오기
		  var selectedValue = "${dto.getMain_type()}";
		  
		  // 셀렉트박스에서 선택된 항목을 selected로 설정
		  $("select option[value='" + selectedValue + "']").attr("selected", "selected");
		});

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>