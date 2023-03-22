<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pooding 푸딩</title>

<link rel="stylesheet" href="MainCss/MainCss.css">	

<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<!-- 부트스트랩 end-->
 
<script type="text/javascript">

</script>


</head>
<body>
<div class="flexMain">
	<div class="flexTop">	<!-- 네비바 container -->
		<div><a href="#">	
		<img src="https://d1il53drs2cmia.cloudfront.net/resources/img/appicon.svg">
		</a></div>	<!-- 로고 -->
		
		
		<div class="top_left"><a class="top_left_aTag" href="<%=request.getContextPath() %>/freeBoard.go">	
		<span>자유 게시판</span>
		</a>	<!-- 항목1 -->
		
		<a class="top_left_aTag" href="<%=request.getContextPath() %>/reviewBoard.go">	
		<span>후기 게시판</span>
		</a>	<!-- 항목2 -->
		
		<a class="top_left_aTag" href="<%=request.getContextPath() %>/main_booking.go">	
		<span>예약</span>
		</a></div>	<!-- 항목3 -->
	
	
		<div><a href="<%=request.getContextPath() %>/login.go">	
		<button type="button" class="login"><span class="">로그인</span></button>
		</a> <!--  로그인 -->
		
		
		<a href="member/member_join.jsp">	
		<button type="button" class="join"><span class="">회원가입</span></button>
		</a>  <!-- 회원가입 -->
		
		
		<a href="<%=request.getContextPath() %>/write_main.go">	
		<button type="button" class="write"><span class="">글쓰기</span></button>
		</a>  <!-- 글쓰기 -->
		
		<a href="<%=request.getContextPath() %>/myprofile.go">	
		<img src="https://cdn-icons-png.flaticon.com/512/747/747376.png" width="30px" height="30px">
		</a></div>	<!-- 로고 -->
		
		
	</div> 
		
	<div>
		<a class="searchLine" href="<%=request.getContextPath() %>/main_search.go">	
			<span class="top_left_aTag-s"><input type="text" class="top_search" value="지역,음식,레스토랑명 검색"></span>
		</a>
	</div>  <!-- 검색 -->
		
		
	
		<div class="main1">  <!-- 메인섹션1 -->
			<div class="card-deck">
			  <div class="card">
			    <img src="..." class="card-img-top" alt="...">
			    <div class="card-body">
			      <h5 class="card-title">Card title</h5>
			      <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
			      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
			    </div>
			  </div>
			  <div class="card">
			    <img src="..." class="card-img-top" alt="...">
			    <div class="card-body">
			      <h5 class="card-title">Card title</h5>
			      <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
			      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
			    </div>
			  </div>
			  <div class="card">
			    <img src="..." class="card-img-top" alt="...">
			    <div class="card-body">
			      <h5 class="card-title">Card title</h5>
			      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
			      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
			    </div>
			  </div>
			</div>
		</div>	<!-- 메인섹션1 end-->
		
		<div>  <!-- 메인섹션2 -->
		
		</div>	<!-- 메인섹션2 end -->
		
		<div>  <!-- 메인섹션3 -->
		
		</div> <!-- 메인섹션3 end-->
		
		<div>  <!-- 메인섹션4 -->
		
		</div>	<!-- 메인섹션4 end -->
	
	
	<div>  <!-- 푸터 -->
	
	</div><!-- 푸터 end -->
</div> 	<!-- 전체 container -->
	
</body>
</html>