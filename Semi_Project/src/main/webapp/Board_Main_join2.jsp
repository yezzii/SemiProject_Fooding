<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

                
<style type="text/css">

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


/* 타입 */

.select-box {
  cursor: pointer;
  position : relative;
  max-width:  25em;
  margin: 2em auto;

}

.select-box1 {
  cursor: pointer;
  position : relative;
  max-width:  25em;
  margin: 2em auto;

}

.select,
.label {
  color: #414141;
  display: block;
  font-size: 14px;
}

.select1,
.label {
  color: #414141;
  display: block;
  font-size: 14px;
}



.select {
  width: 100%;
  position: absolute;
  top: 0;
  padding: 5px 0;
  height: 40px;
  opacity: 0;
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
  background: none transparent;
  border: 0 none;
}

.select1 {
  width: 100%;
  position: absolute;
  top: 0;
  padding: 5px 0;
  height: 40px;
  opacity: 0;
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
  background: none transparent;
  border: 0 none;
}
.select-box1 {
  background: #f7f7f7;
}

.select-box2 {
  background: #f7f7f7;
}


.label {
  position: relative;
  padding: 5px 10px;
  cursor: pointer;
  
}
.open .label::after {
   content: "▲";
}
.label::after {
  content: "▼";
  font-size: 12px;
  position: absolute;
  right: 0;
  top: 0;
  padding: 8px 15px;
  border-left: 5px solid #fff;
}
.image{
	padding-right: -50px;
	
}
.main_file{
margin-left: 100px;
width : 210px;

}

.pic_txt{
margin-left : 35px;
font-size: 15px;
color: rgba(98, 98, 98);
}
</style>


<!-- Vendor Styles including: Font Icons, Plugins, etc.-->
<link rel="stylesheet" media="screen" href="css/vendor.min.css">
<!-- Main Theme Styles + Bootstrap-->
<link rel="stylesheet" media="screen" id="main-styles"
   href="css/theme.min.css">
<!-- Customizer styles and scripts-->
<script src="js/vendor.min.js"></script>
<script src="js/theme.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#modalLarge">
  Large modal
</button>



<!-- Modal markup -->
<div class="modal" tabindex="-1" role="dialog" id="modalLarge">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary btn-sm">Save changes</button>
      </div>
    </div>
  </div>
</div>



<%-- 
<!-- Launch long modal -->
<button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#modalLong">
  Long modal
</button>

<!-- Modal markup -->
<div class="modal" tabindex="-1" role="dialog" id="modalLong">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">가게 등록</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden=true>&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>
        enctype : 파일을 업로드하기 위한 메서드
		<form method="post" enctype="multipart/form-data" action ="<%=request.getContextPath() %>/board_signUp_ok.do">
			
			<div class="select-box">

				<label for="select-box1" class="label select-box2">
				<span class="label-desc">가게 타입</span> </label> 
				<select id="select-box1" class="select" name="main_type">
					<option value="고기요리">고기요리</option>
					<option value="일식">일식</option>
					<option value="한식">한식</option>
					<option value="중식">중식</option>
					<option value="양식">양식</option>
					<option value="이탈리아">이탈리아</option>
					<option value="카페,디저트">카페,디저트</option>
				</select>
			</div>

			<div class="select-box1">

				<label for="select-box2" class="label select-box2">
				<span class="label-desc1">가게 테마</span> </label> 
				<select id="select-box2" class="select1" name="main_thema">
					<option value="데이트 코스">데이트 코스</option>
					<option value="가족모임">가족모임</option>
					<option value="뷰가 좋은">뷰가 좋은</option>
					<option value="전통적인">전통적인</option>
					<option value="비지니스미팅">비지니스미팅</option>
				</select>
			</div>
		
        <div class="textForm">
			<input name="main_name" type="text" class="name" placeholder="가게이름">
		</div>

		<div class="textForm">
			<textarea class="cont" rows="5" cols="25" name="main_info"
				placeholder="가게정보"></textarea>
		</div>


		<div class="time_textForm" align="center">
			
			<label for="main_opentime" style="color: #636e72">영업시작시간</label>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="time" id="main_opentime" name="main_opentime"value="10:00"> <br> <br>
			<label for="main_endtime" style="color: #636e72">영업종료시간</label> &nbsp;&nbsp;&nbsp;
			<input type="time" id="main_endtime" name="main_endtime" value="21:00">
		</div>

		<div class="textForm">
			<input name="main_post" id="post" type="text" class="location" placeholder="Zip Code" readonly onclick="findAddr()"> 
			<input name="main_addr" id="addr" type="text" class="location" placeholder="Address" readonly> 
			<input name="main_detailaddr" type="text" class="location" placeholder="Detailed Address">
		</div>

		<div class="textForm">
			<input name="main_phone" type="text" class="phone" placeholder="전화번호">
		</div>
		
		<div class="image">
			<span class="pic_txt">가게등록 사진</span>
			<input class="main_file" type="file" name="main_img">				
		</div>		
		
		</p>
		<div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-primary btn-sm" value="가입하기"/>
		</div>
		</form>
		</div>
      </div>
    </div>
  </div>

 --%>


</body>
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

/* ===== 1번째 Select Boxes ===== */
$("select").on("click" , function() {
  
  $(this).parent(".select-box").toggleClass("open");
  
});

$(document).mouseup(function (e)
{
    var container = $(".select-box");

    if (container.has(e.target).length === 0)
    {
        container.removeClass("open");
    }
});


$("select").on("change" , function() {
  
  var selection = $(this).find("option:selected").text(),
      labelFor = $(this).attr("id"),
      label = $("[for='" + labelFor + "']");
    
  label.find(".label-desc").html(selection);
    
});

/* ===== 2번쨰 Select Boxes ===== */
$("select1").on("click" , function() {
  
  $(this).parent(".select-box1").toggleClass("open");
  
});

$(document).mouseup(function (e)
{
    var container = $(".select-box1");

    if (container.has(e.target).length === 0)
    {
        container.removeClass("open");
    }
});


$("select").on("change" , function() {
  
  var selection = $(this).find("option:selected").text(),
      labelFor = $(this).attr("id"),
      label = $("[for='" + labelFor + "']");
    
  label.find(".label-desc1").html(selection);
    
});

</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>