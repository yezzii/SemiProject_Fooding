<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<script>

	
Kakao.init('fe3cf4492aa6c561d6c802d57d1418de'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그아웃
  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }
</script>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="main_img/fooding type_1.png"/>
<meta charset="UTF-8">
<title>Pooding 푸딩</title>

<link rel="stylesheet" href="css/MainCss.css">

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script	
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
	integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
	crossorigin="anonymous"></script>
<!-- 부트스트랩 end-->


<%
String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
if (session.getAttribute("id") != null) {
	userID = (String) session.getAttribute("id");
	userType = (int)session.getAttribute("type");
}
	String thumnail =  (String)session.getAttribute("Thumnail");
	String profile =  (String)session.getAttribute("member_profile");
	String name = (String)session.getAttribute("name");
%>

</head>
<body>
	<div class="flexMain">
		<div class="flexTop">
			<!-- 네비바 container -->
			<div>
				<a href="#" > <img class="ico_size"
					src="main_img/fooding type_3.png" style="width: 45px">
				</a>
				<a href="#" > <img class="ico_size"
					src="main_img/fooding type_2.png" style="width: 200px">
				</a>
		
			<!-- 로고 -->


			
				<a class="top_left_aTag"
					href="<%=request.getContextPath()%>/free_board.do"> <span>자유
						게시판</span>
				</a>
				<!-- 항목1 -->

				<a class="top_left_aTag"
					href="<%=request.getContextPath()%>/review_board.do"> <span>후기
						게시판</span>
				</a>
				<!-- 항목2 -->

				<a class="top_left_aTag"
					href="<%=request.getContextPath()%>/main_booking.do"> <span>예약</span>
				</a>
			</div>
			<!-- 항목3 -->
			<div>
				<%
				// 접속하기는 로그인이 되어있지 않은 경우만 나오게한다
				if (userID == null) {
				%>

				<a href="member/login.jsp">
					<button type="button" class="hideBtn" >
						<span class="">로그인</span>
					</button>
				</a>
				<!--  로그인 -->
				<a href="member/find_id.jsp">
					<button type="button" class="hideBtn">
						<span class="">아이디 찾기</span>
					</button>
				</a>
				<!-- 아이디 찾기 -->
				<a href="member/find_pwd.jsp">
					<button type="button" class="findpwd">
						<span class="">비밀번호 찾기</span>
					</button>
				</a>
				<!-- 아이디 찾기 -->

				<a href="member/join_select.jsp">
					<button type="button" class="hideBtn">
						<span class="">회원가입</span>
					</button>
				</a>
				<!-- 회원가입 -->
<<<<<<< HEAD
				
=======
				
				<a href="<%=request.getContextPath() %>/member_list.do">
					<button type="button" class="join">
						<span class="">관리자-회원관리페이지 테스트
						</span>
					</button>
				</a>
				<!-- test1 -->
				
<<<<<<< HEAD
				<a href="<%=request.getContextPath() %>/member_delete.do">
=======
				<a href="<%=request.getContextPath() %>/board_main_list.do">
>>>>>>> origin/yeji1
					<button type="button" class="join">
						<span class="">관리자-가게관리페이지 테스트
						</span>
					</button>
				</a>
<<<<<<< HEAD
				<!-- test2 -->
<<<<<<< HEAD
>>>>>>> GM
=======

				

>>>>>>> origin/test1
=======
				<!-- test1 -->
>>>>>>> origin/yeji1
				
				<%
				// 로그인이 되어있는 사람만 볼수 있는 화면 (사업자)
				} else if(userID != null && userType == 2 ) {
				%>
<<<<<<< HEAD
		<div class="profileFlex">
		

<<<<<<< HEAD
				<a href="board/board_write.jsp">
					<button type="button" class="hideBtn">
=======
				<a href="<%=request.getContextPath()%>/write_board.do">
					<button type="button" class="write">
>>>>>>> GM
=======
				<a href="board/board_write.jsp">
					<button type="button" class="hideBtn">
>>>>>>> origin/yeji1
						<span class="">글쓰기</span>
					</button>
				</a>
				<!-- 글쓰기 -->
<<<<<<< HEAD
				
				<a href="board/board_main.jsp">
				<button type="button" class="">
				<span class="">가게등록</span>
				</button>
=======

			
				<a href="member/logout.jsp">
					<button type="button" class="hideBtn">
						<span class="">로그아웃</span>
					</button>
>>>>>>> origin/yeji1
				</a>
			<!--  로그아웃 -->
				
				
		<span class="profileInfo" ><%=userID%> 님</span>
			<div class="radius_img">
				<a href="<%=request.getContextPath()%>/myprofile.go"> 
					<img class="profile_img" src="<%=thumnail%>">
				</a>
			</div>
				
				<a href="board/board_signUp.jsp">
					<button type="button" class="join">
						<span class="">가게 등록</span>
					</button>
					</a>
				<!-- test2 -->
				
				<a href="board/board_menu.jsp">
					<button type="button" class="menu">
						<span class="">가게메뉴 등록</span>
					</button>
					</a>
				<!-- test2 -->
				<%
				// 로그인이 되어있는 사람만 볼수 있는 화면 (카카오회원)
				}else if(userID != null && userType == 3 ){
				%>	
				
				<a href="board/board_write.jsp">
					<button type="button" class="hideBtn">
						<span class="">글쓰기</span>
					</button>
				</a>
				<!-- 글쓰기 -->

			
				<a href="member/logout.jsp">
					<button type="button" class="hideBtn">
						<span class="">로그아웃</span>
					</button>
				</a>
			<!--  로그아웃 -->
				
				
		<span class="profileInfo" ><%=userID%> 님</span>
			<div class="radius_img">
				<a href="<%=request.getContextPath()%>/myprofile.go"> 
					<img class="profile_img" src="<%=thumnail%>">
				</a>
			</div>
			

<<<<<<< HEAD
			
				<a href="member/logout.jsp">
					<button type="button" class="hideBtn">
						<span class="">로그아웃</span>
					</button>
=======

<<<<<<< HEAD
				<a href = "<%=request.getContextPath()%>/myprofile.go"> <img
=======
				<a href="<%=request.getContextPath()%>/myprofile.do"> <img
>>>>>>> origin/test1
					src="https://cdn-icons-png.flaticon.com/512/747/747376.png"
					width="30px" height="30px">
>>>>>>> GM
				</a>
			<!--  로그아웃 -->
				
				
		<span class="profileInfo" ><%=userID%> 님</span>
			<div class="radius_img">
				<a href="<%=request.getContextPath()%>/myprofile.go"> 
					<img class="profile_img" src="<%=thumnail%>">
				</a>
			</div>
			
			<img src="${profile }">
		</div>
				
				
				
				
				<%
				// 로그인이 되어있는 사람만 볼수 있는 화면 (일반회원)
				}else if(userID != null && userType == 1 ){
				%>	
				
				<a href="board/board_write.jsp">
					<button type="button" class="hideBtn">
						<span class="">글쓰기</span>
					</button>
				</a>
				<!-- 글쓰기 -->

			
				<a href="member/logout.jsp">
					<button type="button" class="hideBtn">
						<span class="">로그아웃</span>
					</button>
				</a>
			<!--  로그아웃 -->
				
				
		<span class="profileInfo" ><%=userID%> 님</span>
			<div class="radius_img">
				<a "<%=request.getContextPath()%>/myprofile.go"> 
					<img class="profile_img" src="<%=thumnail%>">
				</a>
			</div>
				<%	
				}
				%>
			</div>
			
			
			<!-- 로고 -->


		</div>
<<<<<<< HEAD

	<hr align="center" width="90%" color="lightgray">
	<br>
	
	

		<div align="center">
=======
		<div>
>>>>>>> origin/test1
			<form class="searchLine"
				action="loaction.href='<%=request.getContextPath()%>/main_search.go'">
				<span class="top_left_aTag-s" >
					<input type="text"class="top_search" name="searchText" placeholder="지역,음식,레스토랑명 검색">
				</span>
			</form>
		</div>
		<!-- 검색 -->
	</div>

<<<<<<< HEAD
 
	<div class="main1-section">
		<div class="main1">
			<!-- 메인섹션1 -->
			<div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active" data-interval="10000">
			      <img src="main_img/1.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item" data-interval="2000">
			      <img src="main_img/2.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="main_img/3.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="main_img/4.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="main_img/5.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="main_img/6.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="main_img/7.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="main_img/8.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="main_img/9.png" class="d-block w-100" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="main_img/10.png" class="d-block w-100" alt="...">
			    </div>
			  </div>
			 <button class="carousel-control-prev" type="button" data-target="#carouselExampleInterval" data-slide="prev">
			   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			   <span class="sr-only">Previous</span>
			 </button>
			 <button class="carousel-control-next" type="button" data-target="#carouselExampleInterval" data-slide="next">
			   <span class="carousel-control-next-icon" aria-hidden="true"></span>
			   <span class="sr-only">Next</span>
			 </button>
=======


	<div class="main1">
		<!-- 메인섹션1 -->
		<c:if test=""></c:if>
		<div class="card-deck">
			<div class="card">
				<img src="main_img/1.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">This is a longer card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
			<div class="card">
				<img src="main_img/2.jpeg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">This card has supporting text below as a
						natural lead-in to additional content.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
			<div class="card">
				<img src="main_img/3.jpg" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This card has
						even longer content than the first to show that equal height
						action.</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
>>>>>>> GM
			</div>
		</div>
		<!-- 메인섹션1 end-->
	
	
		<div class="main2">
			<c:if test=""></c:if>
			<div class="card-deck">
				<div class="card">
					<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA1MDNfMTk0%2FMDAxNjUxNTI4NTI3OTg3.U86CbrKkNjulokeQf9ElnDy1A18DMU8-N2xDZdipT0Eg.nIiAzj2WPv8vmrI0yHEbfcPwDOkoKEmNqzwY5kysnM8g.JPEG.kzmiddle%2FL1020543.jpg&type=sc960_832" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">스시 오마카세 입문해보기!</h5>
						<br>
						<p class="card-text">영등포구에 위치한 이 곳은 "스시 코우지" 입니다! 약속이 생겨서 예약을 어렵게해서 다녀와봤어요!!!!...</p>
						<p class="card-text">
							<small class="text-muted">3분 전 업데이트 됨</small>
						</p>
					</div>
				</div>
				<!-- <div class="card">
					<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMTBfMTgg%2FMDAxNjcwNjc2NDU3OTQ0.XcjTaHMreL8-RQWiL-rfK6NdSaFFbH78ODqw0x2gbV8g.JliXS3IGdIrUsbiraKTL9ARJjYfixn60r6xfWM6FBbcg.JPEG.chlwldms0410%2FSE-c4d5e3f2-6273-4e62-8d26-7d0b5f99b43a.jpg&type=sc960_832" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">삼청동한정식 편안한집 :: 한옥에서 즐기는 한정식</h5>
						<p class="card-text">메뉴판 디자인도 깔끔하더라고요~ 저희는 보쌈정식 (15,000원)과 능이 불고기정식 (13,000원)을 시켰어요... 점심시간이었는데도 주문한지 10분 만에 음식이 나왔어요!...</p>
						<p class="card-text">
							<small class="text-muted">1일 전 업데이트 됨</small>
						</p>
					</div>
				</div>
				<div class="card">
					<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA1MzBfNjkg%2FMDAxNjUzOTA2NDgxMDYx.fZXJCnuth6tNJKpefLypOscwR4cQs8DvLK4VW7ewrBcg.YW9Ek_CepXxB9FSEVHa2MRqnr_jEVPspd1mL8atjhZUg.JPEG.i1214%2FIMG_0905.JPG&type=sc960_832" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">광화문 한정식 파인다이닝:) 데이트하기 좋은 '암소서울'</h5>
						<p class="card-text">안에 공간도 넉넉하고 일대에서 보기 드문 광화문 깔끔한 한정식 집이라서 어르신들 모시고 오기에 괜찮았어요 나와서 좀만 걸으면 경희궁이 보인답니다! 경복궁 ...</p>
						<p class="card-text">
							<small class="text-muted">3일전 업데이트 됨</small>
						</p>
					</div>
				</div> -->
			</div>
		</div>
		<!-- 메인섹션2 end-->
	</div>	
	
	
	
	
	<div>
		<!-- 메인섹션3 -->
		<a href="<%=request.getContextPath() %>/member_list.do">
					<button type="button" class="hideBtn">
						<span class="">관리자-회원관리페이지 테스트
						</span>
					</button>
				</a>
				<!-- test1 -->
				
					<a href="<%=request.getContextPath() %>/member_delete.do?">
					<button type="button" class="hideBtn">
						<span class="">관리자-회원삭제 테스트
						</span>
					</button>
				</a>
				<!-- test2 -->
				

	</div>
	<!-- 메인섹션3 end -->


	<div>
		<!-- 메인섹션4 -->

	</div>
	<!-- 메인섹션4 end -->


	<div>
		<!-- 푸터 -->

	</div>
	<!-- 푸터 end -->
	</div>
	<!-- 전체 container -->
	</div>
</body>
</html>