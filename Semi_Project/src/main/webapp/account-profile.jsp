<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>MStore | Modern Bootstrap E-commerce Template</title>
<!-- SEO Meta Tags-->
<meta name="description"
	content="MStore - Modern Bootstrap E-commerce Template">
<meta name="keywords"
	content="bootstrap, shop, e-commerce, market, modern, responsive,  business, mobile, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
<meta name="author" content="Createx Studio">
<!-- Viewport-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon and Touch Icons-->
<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
<link rel="manifest" href="site.webmanifest">
<link rel="mask-icon" color="#111" href="safari-pinned-tab.svg">
<meta name="msapplication-TileColor" content="#111">
<meta name="theme-color" content="#ffffff">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.js"></script>

<style type="text/css">
.pwCheck {
	color: red; /* 예시: 빨간색 텍스트로 표시 */
	font-size: 12px; /* 예시: 폰트 사이즈 12px로 설정 */
}

#image_container {
	width: 550px;
	margin-left: 0px;
}

.modal-title {
	text-align: center;
}

#modalCentered{
margin-top: 350px;
}

 
.table_bg th {
text-align: center;
} 

#listTable {
  margin: 0 auto;
}

#listTable th {
	text-align: center;
}

#listTable td {
	text-align: center;
}

.rst_no_txt{
width : 50px;
}
.menu_name_txt{
width :80px;

}

.menu_name1 {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  position: relative;
  width: 130px;
  margin-left: 50px;
  margin-top: 100px;
}

.menu_name1 input {
  font-size: 15px;
  color: #464444;
  width: 130px;
  border: none;
  border-bottom: solid #aaaaaa 1px;
  padding-bottom: 10px;
  padding-left: 10px;
  position: relative;
  background: none;
  z-index: 5;
}

.menu_name1 input::placeholder { color: #464444; }
.menu_name1 input:focus { outline: none; }

.menu_name1 span {
  display: block;
  position: absolute;
  bottom: 0;
  left: 0%;  /* right로만 바꿔주면 오 - 왼 */
  background-color: #666;
  width: 0;
  height: 2px;
  border-radius: 2px;
  transition: 0.5s;
}

.menu_name1 label {
  position: absolute;
  color: #464444;
  left: 10px;
  font-size: 15px;
  bottom: 8px;
  transition: all .2s;
}

.menu_name1 input:focus ~ label, input:valid ~ label {
  font-size: 15px;
  bottom: 30px;
  color: #464444;
}

.menu_name1 input:focus ~ span, input:valid ~ span {
  width: 100%;
}

.menu_price1 {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  position: relative;
  width: 130px;
  margin-left: 50px;
  margin-top: 100px;
}

.menu_price1 input {
  font-size: 15px;
  color: #464444;
  width: 110px;
  border: none;
  margin-left: 50px;
  border-bottom: solid #aaaaaa 1px;
  padding-bottom: 10px;
  padding-left: 10px;
  position: relative;
  background: none;
  z-index: 5;
}

.menu_price1 input::placeholder { color: #464444; }
.menu_price1 input:focus { outline: none; }

.menu_price1 span {
 display: block;
  position: absolute;
  bottom: 0;
  left: 0%;  /* right로만 바꿔주면 오 - 왼 */
  margin-left: 50px;
  background-color: #666;
  width: 0;
  height: 2px;
  border-radius: 2px;
  transition: 0.5s;
}

.menu_price1 label {
  position: absolute;
  color: #464444;
  left: 10px;
  font-size: 15px;
  bottom: 8px;
  transition: all .2s;
  margin-left: 50px;
}

.menu_price1 input:focus ~ label, input:valid ~ label {
  font-size: 15px;
  bottom: 30px;
  color: #464444;
}

.menu_price1 input:focus ~ span, input:valid ~ span {
  width: 100%;
}

#menu_img{
margin-left: 50px;
}
#menubtn{
margin-right: 20px;
}

.menu_text{
background-color:#e3e3e3;
width :90px;
border: none;
color : #ffff;
}
</style>

<!-- Vendor Styles including: Font Icons, Plugins, etc.-->
<link rel="stylesheet" media="screen" href="css/vendor.min.css">
<!-- Main Theme Styles + Bootstrap-->
<link rel="stylesheet" media="screen" id="main-styles"
	href="css/theme.min.css">
<link rel="stylesheet" media="screen" href="css/Board_Main.css" />
<!-- Customizer styles and scripts-->
</head>
<!-- Body-->
<body>
	<!-- Off-canvas search-->
	<div class="offcanvas offcanvas-reverse" id="offcanvas-search">
				<div
					class="offcanvas-header d-flex justify-content-between align-items-center">
					<h3 class="offcanvas-title">푸딩 - 검색</h3>
					<button class="close" type="button" data-dismiss="offcanvas"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form>
				<div class="offcanvas-body">
					<div class="offcanvas-body-inner">
						<div class="input-group pt-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="search-icon"><i
									data-feather="search"></i></span>
							</div>
							<input class="form-control" type="text" id="site-search" name="main_search"
								placeholder="지역,음식,레스토랑 명 검색" aria-label="Search site"
								aria-describedby="search-icon" onsubmit="<%=request.getContextPath() %>/main_search.do?keyword=" />
						</div>
						<small class="form-text pt-1">원하는 지역, 음식, 레스토랑을 자유럽게 검색해보세요!<br> Powered by Fooding.co  _Dong</small>
					</div>
				</div>
				</form>
			</div>




	<%
	String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
	if (session.getAttribute("id") != null) {
		userID = (String) session.getAttribute("id");
		
	}
	
	%>

	<!-- Off-canvas account-->
	<div class="offcanvas offcanvas-reverse" id="offcanvas-account">
		<div
			class="offcanvas-header d-flex justify-content-between align-items-center">
			<h3 class="offcanvas-title">로그인 / 회원가입</h3>
			<button class="close" type="button" data-dismiss="offcanvas"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		
		<%-- 로그인 --%>
		<div class="offcanvas-body">
			<div class="offcanvas-body-inner">
				<ul class="nav nav-tabs nav-justified" role="tablist">
					<li class="nav-item"><a class="nav-link active" href="#signin"
						data-toggle="tab" role="tab"><i data-feather="log-in"></i>&nbsp;로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="#signup"
						data-toggle="tab" role="tab"><i data-feather="user"></i>&nbsp;회원가입</a></li>
				</ul>
				<div class="tab-content pt-1">
					<div class="tab-pane fade show active" id="signin" role="tabpanel">
						<form class="needs-validation" novalidate method="post"
							action="<%=request.getContextPath()%>/login.do">
							<div class="form-group">
								<label class="sr-only" for="signin-id">ID</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="signin-id-icon"><i
											data-feather="mail"></i></span>
									</div>
									<input class="form-control" type="text" id="signin-id"
										placeholder="ID" aria-label="ID" name="id"
										aria-describedby="signin-id-icon" required />
									<div class="invalid-feedback">아이디를 입력해주세요.</div>
								</div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signin-password">Password</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="signin-password-icon"><i
											data-feather="lock"></i></span>
									</div>
									<input class="form-control" type="password"
										id="signin-password" placeholder="Password"
										aria-label="Password" name="pwd"
										aria-describedby="signin-password-icon" required />
									<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
								</div>
							</div>
							<div class="custom-control custom-checkbox mb-3">
								<input class="custom-control-input" type="checkbox"
									id="remember-me" checked /> <label
									class="custom-control-label" for="remember-me">아이디 저장</label>
							</div>
							<button class="btn btn-primary btn-block" type="submit">
								로그인</button>
						</form>
					</div>

					<%-- 회원가입 --%>
					<div class="tab-pane fade" id="signup" role="tabpanel">
						<form method="post" class="needs-validation" novalidate action="<%=request.getContextPath()%>/member_join.do" id="signup-form" name="signup-form">
							<div class="form-group">
								<label class="sr-only" for="singup-id">아이디</label> <input
									class="form-control" type="text" id="signup-id"
									name="member_id" placeholder="아이디" aria-label="아이디" />
									<span class="feedback" id="signup-idchk"></span>
									<div class="invalid-feedback"></div>

							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-password">비밀번호</label> <input
									class="form-control" type="password" id="signup-password"
									name="member_pwd" placeholder="Password" aria-label="Password"
									 />
								<span class="feedback" id="signup-pwdchk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-password-confirm">비밀번호
									확인</label> <input class="form-control" type="password"
									name="member_pwdchk" id="signup-password-confirm"
									placeholder="Confirm password" aria-label="Confirm password"
									 />
									 <span class="feedback" id="signup-pwdconfirm-chk"></span>
									 <div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-name">이름</label> <input
									class="form-control" type="text" id="signup-name"
									name="member_name" placeholder="이름" aria-label="Full name"
									/>
								<span class="feedback" id="signup-namechk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-email">이메일</label> <input
									class="form-control" type="email" id="signup-email"
									name="member_email" placeholder="Email"
									aria-label="Email address"/>
								<span class="feedback" id="signup-emailchk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-phone">연락처
									확인</label> <input class="form-control" type="text"
									name="member_phone" id="signup-phone"
									placeholder="Phone" aria-label="Phone"
									 />
								<span class="feedback" id="signup-phonechk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<button class="btn btn-primary btn-block" type="button" onclick="checkAll()">
								가입하기</button>
								<button class="btn btn-primary btn-block" type="button" onclick="location.href='company-signup.jsp'">
								사업자 가입</button>
						
						</form>
						
						
					

					</div>
				</div>
				<div class="d-flex align-items-center pt-5">
					<hr class="w-100" />
					<div class="px-3 w-100 text-nowrap font-weight-semibold">소셜
						로그인</div>
					<hr class="w-100" />
				</div>
				<div class="text-center pt-4">
					<a class="social-btn sb-facebook mx-2 mb-3" href="#"
						data-toggle="tooltip" title="Facebook"><i
						class="flaticon-facebook"></i></a><a
						class="social-btn sb-google-plus mx-2 mb-3" href="#"
						data-toggle="tooltip" title="Google"><i
						class="flaticon-google-plus"></i></a><a
						class="social-btn sb-twitter mx-2 mb-3" href="#"
						data-toggle="tooltip" title="Twitter"><i
						class="flaticon-twitter"></i></a>
				</div>
			</div>
		</div>
	</div>

	
	<!-- Off-canvas cart-->
	<div class="offcanvas offcanvas-reverse" id="offcanvas-cart">
		<div
			class="offcanvas-header d-flex justify-content-between align-items-center">
			<h3 class="offcanvas-title">Your cart</h3>
			<button class="close" type="button" data-dismiss="offcanvas"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="offcanvas-body">
			<div class="offcanvas-body-inner">
				<div class="text-right">
					<a class="text-danger btn-sm pr-0" href="#"><i class="mr-1"
						data-feather="x" style="width: 0.85rem; height: 0.85rem"></i>Clear
						cart</a>
				</div>
				<div class="widget widget-featured-entries pt-3">
					<div class="media">
						<div class="featured-entry-thumb mr-3">
							<a href="#"><img src="img/shop/widget/07.jpg" width="64"
								alt="Product thumb" /></a><span class="item-remove-btn"><i
								data-feather="x"></i></span>
						</div>
						<div class="media-body">
							<h6 class="featured-entry-title">
								<a href="#">Calvin Klein Jeans Keds</a>
							</h6>
							<p class="featured-entry-meta">
								1 <span class="text-muted">x</span> $125.00
							</p>
						</div>
					</div>
					<div class="media">
						<div class="featured-entry-thumb mr-3">
							<a href="#"><img src="img/shop/widget/08.jpg" width="64"
								alt="Product thumb" /></a><span class="item-remove-btn"><i
								data-feather="x"></i></span>
						</div>
						<div class="media-body">
							<h6 class="featured-entry-title">
								<a href="#">The North Face Hoodie</a>
							</h6>
							<p class="featured-entry-meta">
								1 <span class="text-muted">x</span> $134.00
							</p>
						</div>
					</div>
					<div class="media">
						<div class="featured-entry-thumb mr-3">
							<a href="#"><img src="img/shop/widget/09.jpg" width="64"
								alt="Product thumb" /></a><span class="item-remove-btn"><i
								data-feather="x"></i></span>
						</div>
						<div class="media-body">
							<h6 class="featured-entry-title">
								<a href="#">Medicine Chameleon Sunglasses</a>
							</h6>
							<p class="featured-entry-meta">
								1 <span class="text-muted">x</span> $47.00
							</p>
						</div>
					</div>
					<div class="media">
						<div class="featured-entry-thumb mr-3">
							<a href="#"><img src="img/shop/widget/10.jpg" width="64"
								alt="Product thumb" /></a><span class="item-remove-btn"><i
								data-feather="x"></i></span>
						</div>
						<div class="media-body">
							<h6 class="featured-entry-title">
								<a href="#">Adidas Performance Hat</a>
							</h6>
							<p class="featured-entry-meta">
								1 <span class="text-muted">x</span> $19.00
							</p>
						</div>
					</div>
					<hr />
					<div class="d-flex justify-content-between align-items-center py-3">
						<div class="font-size-sm">
							<span class="mr-2">Subtotal:</span><span
								class="font-weight-semibold text-dark">$325.00</span>
						</div>
						<a class="btn btn-outline-secondary btn-sm" href="cart.jsp">Expand
							cart<i class="mr-n2" data-feather="chevron-right"></i>
						</a>
					</div>
					<a class="btn btn-primary btn-sm btn-block"
						href="checkout-details.jsp"><i class="mr-1"
						data-feather="credit-card"></i>Checkout</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Navbar Light-->
	<header class="navbar navbar-expand-lg navbar-light fixed-top bg-light">
		<div class="container-fluid navbar-inner">
			<!-- navbar brand-->
			<a class="navbar-brand" style="min-width: 100px" href="index.jsp"><img
				width="250" src="img/logo-fooding.png" alt="Fooding" /></a>
			<!-- navbar collapse area-->
			<div class="collapse navbar-collapse" id="menu">
				<!-- Site menu-->
				<ul class="navbar-nav">
					<li class="nav-item dropdown mega-dropdown dropdown-more"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">카테고리<i
							data-feather="more-horizontal"></i></a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<div class="dropdown-column">
									<div
										class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3"
										style="background-image: url(img/megamenu/cat_bg02.jpg)">
										<h3 class="h5 text-white text-shadow my-3">지역별</h3>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">서울</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">경기/인천</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">대구</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">부산</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">제주</span></a></li>
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div
										class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3"
										style="background-image: url(img/megamenu/cat_bg01.jpg)">
										<h3 class="h5 text-white text-shadow my-3">테마별</h3>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">데이트 코스</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">가족모임</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">뷰가 좋은</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">전통적인</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">비지니스미팅</span></a></li>
											
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div
										class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3"
										style="background-image: url(img/megamenu/cat_bg03.jpg)">
										<h3 class="h5 text-white text-shadow my-3">장르별</h3>
									</div>
									<div class="widget widget-links">
										<ul>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">고기요리</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">일식</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">한식</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">중식</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">양식</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">아시안</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">카페,디저트</span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div></li>
					<li class="nav-item dropdown mega-dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">게시판</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<div class="dropdown-column">
									<div class="widget widget-links">
										<h3 class="widget-title">게시판</h3>
										<ul>
											<li><a href="shop-style1-ls.jsp"> <i
													class="widget-categories-indicator"
													data-feather="chevron-right"> </i><span
													class="font-size-sm">Shop Style 1 - Left Sidebar</span></a></li>
											<li><a href="<%=request.getContextPath() %>/review_board.do"> <i
													class="widget-categories-indicator"
													data-feather="chevron-right"> </i><span
													class="font-size-sm">후기 게시판</span></a></li>
											<li><a href="<%=request.getContextPath() %>/free_board.do"> <i
													class="widget-categories-indicator"
													data-feather="chevron-right"> </i><span
													class="font-size-sm">자유 게시판</span></a></li>
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div class="widget widget-links">
										<h3 class="widget-title">Shop</h3>
										<ul>
											<li><a href="shop-categories-apparel.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Shop
														Categories - Apparel</span></a></li>

											<li><a href="board_write.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">후기 작성
														</span></a></li>

											<li><a href="cart.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Cart</span></a></li>
											<li><a href="checkout-details.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Checkout
														- Details</span></a></li>
											<li><a href="checkout-shipping.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Checkout
														- Shipping</span></a></li>
											<li><a href="checkout-payment.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Checkout
														- Payment</span></a></li>
											<li><a href="checkout-review.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Checkout
														- Review</span></a></li>
											<li><a href="checkout-complete.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Checkout
														- Complete</span></a></li>
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<a class="d-block mx-auto" href="#" style="max-width: 228px"><img
										class="d-block" src="img/megamenu/promo-banner.jpg"
										alt="Promo banner" /></a>
								</div>
							</div>
						</div></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">예약</a>
						<ul class="dropdown-menu">
							<li class="dropdown"><a
								class="dropdown-item dropdown-toggle" href="#"
								data-toggle="dropdown">Blog Layout</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="blog-rs.jsp">Blog
											Right Sidebar</a></li>
								</ul></li>
							<li class="dropdown-divider"></li>
							<li class="dropdown"><a
								class="dropdown-item dropdown-toggle" href="#"
								data-toggle="dropdown">Single Post Layout</a>
								<ul class="dropdown-menu">
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="blog-single-ns.jsp">Post
											No Sidebar</a></li>
								</ul></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">내정보</a>
						<ul class="dropdown-menu">
							<li class="dropdown"><a
								class="dropdown-item dropdown-toggle" href="#"
								data-toggle="dropdown">User Account</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="account-orders.jsp">Orders
											History</a></li>
									
										<%
										if (session.getAttribute("id") != null) {
										%>
											<li class="dropdown-divider"></li>
											<li><a class="dropdown-item" href="<%=request.getContextPath()%>/member_profile.do">마이페이지</a></li>
											<li class="dropdown-divider"></li>
									<%}%>
									
									
									<li><a class="dropdown-item" href="account-address.jsp">Account
											Addresses</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="account-payment.jsp">Payment
											Methods</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="account-wishlist.jsp">Wishlist</a>
									</li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="account-tickets.jsp">My
											Tickets</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item"
										href="account-single-ticket.jsp">Single Ticket</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="account-signin.jsp">Sign
											In / Sign Up Page</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item"
										href="account-password-recovery.jsp">Password Recovery</a></li>
								</ul></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="about.jsp">About Us</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="contacts.jsp">Contacts</a>
							</li>
							<li class="dropdown-divider"></li>
							<li class="dropdown"><a
								class="dropdown-item dropdown-toggle" href="#"
								data-toggle="dropdown">Help Center</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="help-topics.jsp">Help
											Topics</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="help-single-topic.jsp">Single
											Topic</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item"
										href="help-submit-request.jsp">Submit a Request</a></li>
								</ul></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="product-comparison.jsp">Product
									Comparison</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="order-tracking.jsp">Order
									Tracking</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="404.jsp">404 Not
									Found</a></li>
						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"><i
							class="mr-1" data-feather="file-text"></i>레스토랑</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="<%=request.getContextPath() %>/board_main_list.do" >
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="file-text"
											style="width: 1.4375rem; height: 1.4375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">레스토랑 목록</span>
										</div>
									</div>
							</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" data-toggle="modal" href="#modalLong" >
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="grid"
											style="width: 1.375rem; height: 1.375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">레스토랑 추가
											</span>
										</div>
									</div>
							</a></li>
							
				
							
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="RoadRestaurantList.do">
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="grid"
											style="width: 1.375rem; height: 1.375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">레스토랑 목록<br>(동현작업중)
											</span>
										</div>
									</div>
							</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item"
								href="mailto:contact@createx.studio">
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="life-buoy"
											style="width: 1.4375rem; height: 1.4375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">Support</span><small
												class="text-muted">contact@createx.studio</small>
										</div>
									</div>
							</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- navbar buttons-->
			<div class="navbar-btns">
				<div class="navbar-btns-inner">
					<div class="navbar-toggler navbar-btn collapsed"
						data-toggle="collapse" data-target="#menu">
						<i class="mx-auto mb-1" data-feather="menu"></i>Menu
					</div>
					<form method="get" action="<%=request.getContextPath()%>/main_search.do">
						<div class="flex-grow-1 pb-3 pt-sm-3 my-1 pr-lg-4 order-sm-2">
							<div class="input-group flex-nowrap">
								<div class="input-group-prepend">
									<%-- 검색input테그 --%>

									<input class="form-control rounded" type="text"
										id="site-search" placeholder="통합 검색" name="keyword"
										aria-label="Search site" aria-describedby="search-icon">
									<%-- 검색input테그 END --%>

									<%-- 검색버튼 --%>
						

									<%-- 검색버튼 END--%>
								</div>

							</div>
						</div>
						
						
					</form>
					<%
					// 접속하기는 로그인이 되어있지 않은 경우만 나오게한다
					if (userID == null) {
					%>
					<a class="navbar-btn navbar-collapse-hidden"
						href="#offcanvas-account" data-toggle="offcanvas"><i
						class="mx-auto mb-1" data-feather="log-in"></i>로그인/가입</a>


					<%
					// 로그인이 되어있는 사람만 볼수 있는 화면
					} else {
					%>
					<a class="navbar-btn navbar-collapse-hidden"
						href="member/logout.jsp"><i
						class="mx-auto mb-1" data-feather="log-out"></i>로그아웃</a>

					<%
					}
					%>
					<a class="navbar-btn" href="#offcanvas-cart"
						data-toggle="offcanvas"><span
						class="d-block position-relative"><span
							class="navbar-btn-badge bg-primary text-light">4</span><i
							class="mx-auto mb-1" data-feather="shopping-cart"></i>관심 레스토랑</span></a>
				</div>
			</div>
		</div>
	</header>
	<!-- Page Content-->

	<div class="container pt-lg-3 pb-5 mb-sm-3">
		<!-- Toast notifications-->
		<div class="toast-container toast-bottom-center">
			<div class="toast mb-3" id="cart-toast" data-delay="5000"
				role="alert" aria-live="assertive" aria-atomic="true">
				<div class="toast-header bg-success text-white">
					<i class="mr-2" data-feather="check-circle"
						style="width: 1.25rem; height: 1.25rem;"></i><span
						class="font-weight-semibold mr-auto">Added to cart!</span>
					<button class="close text-white ml-2 mb-1" type="button"
						data-dismiss="toast" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body">This item was added to your cart.</div>
			</div>

			<div class="toast mb-3" id="compare-toast" data-delay="5000"
				role="alert" aria-live="assertive" aria-atomic="true">
				<div class="toast-header bg-info text-white">
					<i class="mr-2" data-feather="info"
						style="width: 1.25rem; height: 1.25rem;"></i><span
						class="font-weight-semibold mr-auto">Added to comparison!</span>
					<button class="close text-white ml-2 mb-1" type="button"
						data-dismiss="toast" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body">This item was added to comparison
					table.</div>
			</div>

			<div class="toast mb-3" id="wishlist-toast" data-delay="5000"
				role="alert" aria-live="assertive" aria-atomic="true">
				<div class="toast-header bg-info text-white">
					<i class="mr-2" data-feather="info"
						style="width: 1.25rem; height: 1.25rem;"></i><span
						class="font-weight-semibold mr-auto">Added to wishlist!</span>
					<button class="close text-white ml-2 mb-1" type="button"
						data-dismiss="toast" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body">This item was added to your wishlist.</div>
			</div>

			<div class="toast mb-3" id="address-toast" data-delay="5000"
				role="alert" aria-live="assertive" aria-atomic="true">
				<div class="toast-header bg-success text-white">
					<i class="mr-2" data-feather="check-circle"
						style="width: 1.25rem; height: 1.25rem;"></i><span
						class="font-weight-semibold mr-auto">Updated!</span>
					<button class="close text-white ml-2 mb-1" type="button"
						data-dismiss="toast" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body">Your addresses info updated
					successfuly.</div>
			</div>


			<div class="toast mb-3" id="profile-toast" data-delay="5000"
				role="alert" aria-live="assertive" aria-atomic="true">
				<div class="toast-header bg-success text-white">
					<i class="mr-2" data-feather="check-circle"
						style="width: 1.25rem; height: 1.25rem;"></i><span
						class="font-weight-semibold mr-auto">Updated!</span>
					<button class="close text-white ml-2 mb-1" type="button"
						data-dismiss="toast" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="toast-body" class="toast-body">Your profile info
					updated successfuly.</div>
			</div>


			<!-- Warning toast -->
			<div class="toast" role="alert" aria-live="assertive"
				aria-atomic="true" id="my-toast">
				<div class="toast-header bg-warning text-white">
					<i class="mr-2" data-feather="alert-circle"
						style="width: 1.25rem; height: 1.25rem;"></i> <span
						class="font-weight-semibold mr-auto">Warning toast</span>
					<button type="button" class="close text-white ml-2 mb-1"
						data-dismiss="toast" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="toast-body2" class="toast-body text-warning">Hello,
					world! This is a toast message.</div>
			</div>


		</div>
		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/MemberProfileUpdate.do">
			<div class="row pt-5">

				<!-- Sidebar-->

				<div class="col-xl-3 col-lg-4">

					<c:set var="dto" value="${List }" />


					<!-- Customer picture-->
					<!-- 일반 프로필 -->

					<a class="gallery-item mb-grid-gutter mx-auto"
						style="max-width: 18.75rem;"> <c:if
							test="${empty dto.getMember_image()}">
							<img src="${Thumnail }">
						</c:if> <c:if test="${!empty dto.getMember_image()}">
							<img src="${dto.getMember_image() }">
						</c:if>

						<div id="image_container"></div>
						<div class="gallery-caption">
							<div class="gallery-indicator">
								<i class="gallery-indicator-icon" data-feather="refresh-ccw"></i>
							</div>
							<span id="Change_Profile">Change profile picture</span>
						</div>
					</a> <input type="file" name="fileProfile" style="display: none;"
						onchange="setThumbnail(event);">


					<!-- Technical support + Tickets (visible Desktop)-->
					<div class="d-none d-lg-block" align="center">
						<h6 class="font-size-sm mb-3 pb-2 border-bottom">
							<span>${dto.getMember_name() } 님의 프로필</span>
							<c:if test="${dto.getMember_type() == 0}">
           					(Manager)
            			</c:if>

							<c:if test="${dto.getMember_type() == 1}">
           					(General Member)
            			</c:if>

							<c:if test="${dto.getMember_type() == 2}">
            				(Business Member)
            			</c:if>

							<c:if test="${dto.getMember_type() == 3}">
            				(Kakako Member)
            			</c:if>


						</h6>


						<%-- <c:if
						test="${dto.getMember_type() == 1 || dto.getMember_type() == 3}"> --%>
						<ul class="list-unstyled">
							<li class="font-size-sm mb-2"><i class="text-muted mr-2"
								data-feather="mail" style="width: .875rem; height: .875rem;"></i><a
								class="nav-link-inline" href="${dto.getMember_email()}">${dto.getMember_email()}</a></li>
							<li class="font-size-sm mb-2"><i class="text-muted mr-2"
								data-feather="phone" style="width: .875rem; height: .875rem;"></i><a
								class="nav-link-inline" href="${dto.getMember_phone()}">${dto.getMember_phone()}</a></li>

						</ul>
						<div class="pt-2">
							<a class="btn btn-outline-secondary btn-sm btn-block"
								href="account-tickets.html"><i class="mr-1"
								data-feather="tag"></i>My tickets (1)</a><a
								class="btn btn-success btn-sm btn-block"
								href="account-tickets.html" data-toggle="modal"
								data-target="#open-ticket">Submit new ticket</a>
						</div>
						<%-- </c:if> --%>
					</div>
				</div>
				<!-- Main content-->


				<div class="col-lg-8 offset-xl-1">
					<!-- Customer details-->
					<div class="d-flex flex-wrap justify-content-between pb-4">
						<div class="pt-3 mr-3">

							<h3 class="mb-0">${dto.getMember_name() }</h3>
							<span class="font-size-sm text-warning">${dto.getMember_email() }</span>
						</div>
						<div class="pt-3">
							<a class="btn btn-outline-primary btn-sm" data-toggle="modal" href="#modalCentered"
								onclick="location.href='#modalCentered?id=${dto.getMember_id()}'">
								<i class="mr-1" data-feather="log-out"></i>Sign Out
							</a>
						</div>
						
					</div>
					<ul class="list-unstyled border p-3 mb-4">
						<li class="pb-1"><span class="opacity-80">&ndash;
								Joined:</span><span class="font-weight-semibold ml-1">${dto.getMember_joindate().substring(0,10) }</span></li>
						<li class="pb-1"><span class="opacity-80">&ndash;
								Total booking:</span><span class="font-weight-semibold ml-1">15(바꿔야함)</span></li>
						<li class="pb-1"><span class="opacity-80">&ndash;
								Total Account:</span><span class="font-weight-semibold ml-1"> <fmt:formatNumber
									value="${dto.getMember_account()}" type="number"
									pattern="#,##0" />원
						</span></li>
					</ul>
					<!-- Navigation (visible sm-up)-->

					<c:if test="${dto.getMember_type() != 2}">
						<ul class="nav nav-tabs d-none d-sm-flex">
							<li class="nav-item"><a class="nav-link"
								href="account-orders.html"> <i data-feather="shopping-bag"></i>&nbsp;예약현황
									<span class="badge badge-pill badge-secondary bg-0 border ml-2">
										<span class="text-primary">1</span>
								</span></a></li>
					</c:if>

					<c:if test="${dto.getMember_type() == 2}">
						<ul class="nav nav-tabs d-none d-sm-flex">
							<li class="nav-item"><a class="nav-link"
								href="account-orders.html"> <i data-feather="shopping-bag"></i>&nbsp;
									가게 예약 현황 <span
									class="badge badge-pill badge-secondary bg-0 border ml-2">
										<span class="text-primary">1</span>
								</span></a></li>
					</c:if>


					<!-- 고객한테만 북마크 보이게 작업 -->
					<c:if
						test="${dto.getMember_type() == 3 || dto.getMember_type() == 1}">
						<li class="nav-item"><a class="nav-link"
							href="account-wishlist.html"> <i data-feather="heart"></i>&nbsp;북마크<span
								class="badge badge-pill badge-secondary bg-0 border ml-2">
									<span class="text-primary">3</span>
							</span></a></li>
					</c:if>

					<c:if test="${dto.getMember_type() == 2}">
						<li class="nav-item"><a class="nav-link" data-toggle="modal"
							href="#modalLong"> <i data-feather="shopping-bag"></i>&nbsp;가게
								등록 <span
								class="badge badge-pill badge-secondary bg-0 border ml-2"></span></a></li>
					</c:if>

					<c:if test="${dto.getMember_type() == 2}">
						<li class="nav-item"><a class="nav-link" data-toggle="modal"
							href="#Board_MainModify"> <i data-feather="shopping-bag"></i>&nbsp;가게
								정보 수정 <span
								class="badge badge-pill badge-secondary bg-0 border ml-2"></span></a></li>
					</c:if>
					
					
					<c:if test="${dto.getMember_type() == 2}">
						<li class="nav-item"><a class="nav-link" data-toggle="modal" data-target="#modalLarge">
						 <i data-feather="shopping-bag"></i>&nbsp;메뉴 등록 
							<span class="badge badge-pill badge-secondary bg-0 border ml-2"></span></a></li>
					</c:if>
					
					

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle active" href="#"
						data-toggle="dropdown"><i data-feather="settings"></i>&nbsp;회원 수정</a>

						<div class="dropdown-menu">
							<a class="dropdown-item active" href="account-profile.html">Profile
								info</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="account-address.html">Addresses</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="account-payment.html">Payment
								methods</a>
						</div></li>
						
					
						
						
					</ul>
					<!-- Navigation (visible sm-down)-->
					<div class="d-sm-none pb-4">
						<button class="btn btn-primary btn-block mb-2" type="button"
							data-toggle="collapse" data-target="#account-menu">
							<i class="mr-2" data-feather="menu"></i>Menu
						</button>
						<div class="collapse" id="account-menu">
							<div class="list-group">
								<a class="list-group-item list-group-item-action"
									href="account-orders.html"><i class="mr-2"
									data-feather="shopping-bag" style="width: 1rem; height: 1rem;"></i>My
									orders<span
									class="badge badge-pill badge-secondary bg-0 border ml-2"><span
										class="text-primary">1</span></span></a><a
									class="list-group-item list-group-item-action"
									href="account-wishlist.html"><i class="mr-2"
									data-feather="heart" style="width: 1rem; height: 1rem;"></i>Wishlist<span
									class="badge badge-pill badge-secondary bg-0 border ml-2"><span
										class="text-primary">3</span></span></a><a
									class="list-group-item list-group-item-action active"
									href="account-profile.html"><i class="mr-2"
									data-feather="user" style="width: 1rem; height: 1rem;"></i>Profile
									info</a><a class="list-group-item list-group-item-action"
									href="account-address.html"><i class="mr-2"
									data-feather="map-pin" style="width: 1rem; height: 1rem;"></i>Addresses</a><a
									class="list-group-item list-group-item-action"
									href="account-payment.html"><i class="mr-2"
									data-feather="credit-card" style="width: 1rem; height: 1rem;"></i>Payment
									methods</a>
							</div>
						</div>
					</div>
					<!-- Profile info-->
					<h5 class="mb-4 pt-sm-3">회원정보 수정</h5>


					<div class="row">

						<div class="col-md-6">
							<div class="form-group">
								<label for="account-name">Name</label> <input
									class="form-control" type="text" id="account-name"
									name="member_name" value="<%=session.getAttribute("name")%>"
									disabled>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="account-id">User_Id</label> <input
									class="form-control" type="text" id="account-id"
									name="member_id" value="${dto.getMember_id() }" disabled>
							</div>
						</div>




						<!--비밀번호 유효성 검사 -->

						<div class="col-md-6">
							<div class="form-group">
								<label for="account-pass" class="inputpwd">New Password</label>
								<input name="member_pwd" class="form-control" type="password"
									id="account-pass">
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="account-confirm-pass" class="inputpwd">Confirm
									Password</label> <input class="form-control" type="password"
									id="account-confirm-pass">
							</div>
						</div>

						<div class="pwCheck"></div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="account-phone">Phone Number</label> <input
									class="form-control" type="text" id="account-phone"
									name="member_phone" value="${dto.getMember_phone() }" required>
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="account-email">Email Address</label> <input
									class="form-control" type="email" id="account-email"
									name="member_email" value="${dto.getMember_email() }">
							</div>
						</div>

						<div class="col-12">
							<hr class="mt-2 mb-3">
							<div
								class="d-flex flex-wrap justify-content-between align-items-center">
								<div class="custom-control custom-checkbox d-block">
									<input class="custom-control-input" type="checkbox"
										id="subscribe_me" checked> <label
										class="custom-control-label" for="subscribe_me">Subscribe
										me to Newsletter</label>
								</div>
								<button id="updatebtn123" class="btn btn-primary mt-3 mt-sm-0"
									type="submit" data-toggle="toast" data-target="#profile-toast">Update
									profile</button>
							</div>
						</div>

					</div>

					<!-- Technical support + Tickets (visible Mobile)-->
					<div class="d-lg-none bg-secondary px-3 py-4 mt-5">
						<h6 class="font-size-sm mb-3 pb-2 border-bottom"></h6>
						<ul class="list-unstyled">
							<li class="font-size-sm mb-2"><i class="text-muted mr-2"
								data-feather="mail" style="width: .875rem; height: .875rem;"></i><a
								class="nav-link-inline" href="mailto:support@example.com">support@example.com</a></li>
							<li class="font-size-sm mb-2"><i class="text-muted mr-2"
								data-feather="phone" style="width: .875rem; height: .875rem;"></i><a
								class="nav-link-inline" href="tel:+100331697720">+1 00 33
									169 7720</a></li>
							<li class="font-size-sm mb-2"><i class="text-muted mr-2"
								data-feather="clock" style="width: .875rem; height: .875rem;"></i>1-2
								business days</li>
						</ul>
						<div class="pt-2">
							<a class="btn btn-outline-secondary btn-sm btn-block"
								href="account-tickets.html"><i class="mr-1"
								data-feather="tag"></i>My tickets (1)</a><a
								class="btn btn-success btn-sm btn-block"
								href="account-tickets.html" data-toggle="modal"
								data-target="#open-ticket">Submit new ticket</a>
						</div>
					</div>

				</div>

			</div>
		</form>
	</div>

	<!-- 가게 등록 Modal markup -->
	<div class="modal" tabindex="-1" role="dialog" id="modalLong">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">가게 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden=true>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						<%--enctype : 파일을 업로드하기 위한 메서드 --%>
					<form method="post" enctype="multipart/form-data"
						action="<%=request.getContextPath()%>/board_signUp_ok.do">

						<div class="select-box">

							<label for="select-box1" class="label select-box2"> <span
								class="label-desc">가게 타입</span>
							</label> <select id="select-box1" class="select" name="main_type">
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

							<label for="select-box2" class="label select-box2"> <span
								class="label-desc1">가게 테마</span>
							</label> <select id="select-box2" class="select1" name="main_thema">
								<option value="데이트 코스">데이트 코스</option>
								<option value="가족모임">가족모임</option>
								<option value="뷰가 좋은">뷰가 좋은</option>
								<option value="전통적인">전통적인</option>
								<option value="비지니스미팅">비지니스미팅</option>
							</select>
						</div>

						<div class="textForm">
							<input name="main_name" type="text" class="name"
								placeholder="가게이름">
						</div>

						<div class="textForm">
							<textarea class="cont" rows="5" cols="25" name="main_info"
								placeholder="가게정보"></textarea>
						</div>


						<div class="time_textForm" align="center">

							<label for="main_opentime" style="color: #636e72">영업시작시간</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="time" id="main_opentime" name="main_opentime"
								value="10:00"> <br> <br> <label
								for="main_endtime" style="color: #636e72">영업종료시간</label>
							&nbsp;&nbsp;&nbsp; <input type="time" id="main_endtime"
								name="main_endtime" value="21:00">
						</div>

						<div class="textForm">
							<input name="main_post" id="post" type="text" class="location"
								placeholder="우편번호" readonly onclick="findAddr()"> <input
								name="main_addr" id="addr" type="text" class="location"
								placeholder="주소" readonly> <input name="main_detailaddr"
								type="text" class="location" placeholder="상세 주소">
						</div>

						<div class="textForm">
							<input name="main_phone" type="text" class="phone"
								placeholder="전화번호">
						</div>

						<div class="image">
							<span class="pic_txt">가게등록 사진</span> <input class="main_file"
								type="file" name="main_img">
						</div>

						</p>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<input type="submit" class="btn btn-primary btn-sm" value="가입하기" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->

	<!-- 가게 수정 Modal markup -->
	<c:set var="main" value="${boardmain }" />
	<div class="modal" tabindex="-1" role="dialog" id="Board_MainModify" >
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">가게 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden=true>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						<%--enctype : 파일을 업로드하기 위한 메서드 --%>
					<form method="post" enctype="multipart/form-data"
						action="<%=request.getContextPath()%>/board_mainprofilemodify.do">
						<input type="hidden" name="main_idx" value="${main.getMain_idx() }">
						<div class="select-box">
							<label for="select-box1" class="label select-box2"> <span
								class="label-desc">가게 타입</span>
							</label> <select id="select-box1" class="select" name="main_type" value="${main.getMain_type()}">
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
							<span class="label-desc1">가게 테마</span>
							</label> <select id="select-box2" class="select1" name="main_thema" value="${main.getMain_thema()}">
								<option value="데이트 코스">데이트 코스</option>
								<option value="가족모임">가족모임</option>
								<option value="뷰가 좋은">뷰가 좋은</option>
								<option value="전통적인">전통적인</option>
								<option value="비지니스미팅">비지니스미팅</option>
							</select>
						</div>

						<div class="textForm">
							<input name="main_name" type="text" class="name"
								value="${main.getMain_name()}" readonly>
						</div>

						<div class="textForm">
							<textarea class="cont" rows="5" cols="25" name="main_info">${main.getMain_info() }</textarea>
						</div>


						<div class="time_textForm" align="center">

							<label for="main_opentime" style="color: #636e72">영업시작시간</label>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="time" id="main_opentime" name="main_opentime"
								value="${main.getMain_opentime() }"> <br> <br>
							<label for="main_endtime" style="color: #636e72">영업종료시간</label>
							&nbsp;&nbsp;&nbsp; <input type="time" id="main_endtime"
								name="main_endtime" value="${main.getMain_endtime() }">
						</div>

						<div class="textForm">
							<input name="main_post" id="post" type="text" class="location"
								value="${main.getMain_post() }" readonly onclick="findAddr()">
							<input name="main_addr" id="addr" type="text" class="location"
								value="${main.getMain_addr() }" readonly> <input
								name="main_detailaddr" type="text" class="location"
								value="${main.getMain_detailaddr() }">
						</div>

						<div class="textForm">
							<input name="main_phone" type="text" class="phone"
								value="${main.getMain_phone() }">
						</div>

						<div class="image">
							<span class="pic_txt">가게등록 사진</span> <input class="main_file"
								type="file" name="main_img">
						</div>

						</p>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-sm"
								data-dismiss="modal">Close</button>
							<input type="submit" class="btn btn-primary btn-sm" value="수정하기" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->



<!-- 메뉴 Modal markup -->
	<div class="modal" tabindex="-1" role="dialog" id="modalLarge">
  		<div class="modal-dialog modal-lg" role="document">
    	<div class="modal-content">
     	 <div class="modal-header">
					<h5 class="modal-title">메뉴 페이지</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden=true>&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>
						<form method="post" enctype="multipart/form-data" name="inForm" id="inForm" width="100%" >
						<table cellspacing="0" align="center" width="100%">
					<tr class="table_bg">
						<th> </th><th> </th><th> </th> 
					</tr>
						
					<tr>
						<td class="menu_name1">
						 <input type="text" required  name="menu_name" id="menu_name">
						<label>메뉴 이름</label>
						<span></span>
						</td>
						
						<td class="menu_price1">
						 <input type="text" required name="menu_price" id="menu_price">
						<label>메뉴 가격</label>
						<span></span>
						</td>
						
						
						<td> <input type="file" name="menu_img" id="menu_img" size="10"></td>
						<input type="hidden" name="main_idx" id="main_idx" value="${main.getMain_idx() }">
							
						<td>
						</td>
						<td colspan="3" align="center">	
						<input type="button" class="btn btn-primary btn-sm" value="등록하기" id="menubtn">	
						</td>
					</tr>
					
					</table>
					</form>
					
					<br>
					<form method="post" enctype="multipart/form-data" name="upForm" id="upForm" width="100%" >
					<br>
					<span align="center"><h5>메뉴 리스트</h5></span>
						<table id="listTable" border="1" cellspacing="0" width="90%" bordercolor="#e3e3e3">
							<tr>
								
								<!-- <th>가게 번호</th> -->
								<th>메뉴 번호</th>
								<th>메뉴 이름</th>
								<th>메뉴 가격</th>
								<th>메뉴 사진</th>
								<th>수 정</th>
								<th>삭 제</th>
							
							</tr>
							
						</table>
					</form>
						
					</p>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary btn-sm"
								data-dismiss="modal">Close</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->





	<!--회원 탈퇴 Modal markup -->
	
	
	<div class="modal" tabindex="-1" role="dialog" id="modalCentered">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	    <form method="post"  action="<%=request.getContextPath() %>/member_delete_ok.do">
	      <div class="modal-header">
	        <h5 class="modal-title">회원 탈퇴</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      
	       <input type="hidden" name="member_id" value="${dto.getMember_id()}">
	      	<br>
	        <p align="center">회원 탈퇴를 위해 ${dto.getMember_name()}님의 비밀번호를 입력해주세요.
	       <div class="textForm">
				<input name="member_pwd" type="text" class="phone" placeholder="비밀번호">
			</div>
	        </p>
	      </div>
	        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary btn-sm">회원 탈퇴</button>
	      </div>
	    </form>
	    </div>
	  </div>
	</div>

	<!-- Footer-->
	<footer class="page-footer bg-dark">
		<!-- first row-->
		<div class="pt-5 pb-0 pb-md-4">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-6">
						<div class="widget widget-links pb-4">
							<h3 class="widget-title text-white border-light">Shop
								departments</h3>
							<ul>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Apparel
											&amp; Shoes</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Glasses
											&amp; Accessories</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Handbags
											&amp; Backpacks</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Computers
											&amp; Accessories</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Smartphones
											&amp; Tablets</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">TV,
											Video &amp; Audio</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Cameras,
											Photo &amp; Video</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Headphones</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Wearable
											Electronics</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Printers
											&amp; Ink</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Video
											Games</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Car
											Electronics</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Smart
											Home, IoT</span></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="widget widget-links pb-4">
							<h3 class="widget-title text-white border-light">Account
								&amp; shipping info</h3>
							<ul>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Your
											account</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Shipping
											rates &amp; policies</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Refunds
											&amp; replacements</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Taxes</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Delivery
											info</span></a></li>
							</ul>
						</div>
						<div class="widget widget-links pb-4">
							<h3 class="widget-title text-white border-light">About us</h3>
							<ul>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Careers</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">About
											shop</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Our
											stores</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">Services</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">News</span></a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-4 offset-xl-1 col-md-5">
						<div class="widget">
							<!-- Subscription form (MailChimp)-->
							<h3 class="widget-title text-white border-light">Stay
								informed</h3>
							<form class="validate pb-4"
								action="https://studio.us12.list-manage.com/subscribe/post-json?u=c7103e2c981361a6639545bd5&amp;amp;id=29ca296126&amp;c=?"
								method="get" name="mc-embedded-subscribe-form"
								id="mc-embedded-subscribe-form">
								<div class="input-group mb-2">
									<div class="input-group-prepend">
										<span class="input-group-text"
											style="background-color: #e8e8e8;"><i
											data-feather="mail"></i></span>
									</div>
									<input class="form-control border-0 box-shadow-0 bg-secondary"
										type="email" name="EMAIL" id="mce-EMAIL" value=""
										placeholder="Your email" required>
								</div>
								<!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
								<div style="position: absolute; left: -5000px;"
									aria-hidden="true">
									<input type="text"
										name="b_c7103e2c981361a6639545bd5_29ca296126" tabindex="-1">
								</div>
								<button class="btn btn-primary btn-block" type="submit"
									name="subscribe" id="mc-embedded-subscribe">Subscribe*</button>
								<p class="font-size-xs text-white opacity-60 pt-2 mb-2"
									id="mc-helper">*Subscribe to our newsletter to receive
									early discount offers, updates and new products info.</p>
								<!-- Subscription status-->
								<div class="subscribe-status"></div>
							</form>
							<!-- Mobile app download-->
							<div class="widget pb-4">
								<h3 class="widget-title text-white border-light">Download
									our app</h3>
								<a class="market-btn market-btn-light apple-btn mr-2 mb-2"
									href="#" role="button"><span class="market-button-subtitle">Download
										on the</span><span class="market-button-title">App Store</span></a><a
									class="market-btn market-btn-light google-btn" href="#"
									role="button"><span class="market-button-subtitle">Download
										on the</span><span class="market-button-title">Google Play</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- shop features-->
		<div class="pt-5 pb-0 pb-md-5 border-bottom border-light"
			id="shop-features" style="background-color: #1f1f1f;">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-6 border-right border-light">
						<div class="icon-box text-center mb-5 mb-md-0">
							<div class="icon-box-icon">
								<i data-feather="truck"></i>
							</div>
							<h3 class="icon-box-title font-weight-semibold text-white">Free
								local delivery</h3>
							<p class="icon-box-text">Free delivery for all orders over
								$100</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 border-right border-light">
						<div class="icon-box text-center mb-5 mb-md-0">
							<div class="icon-box-icon">
								<i data-feather="refresh-cw"></i>
							</div>
							<h3 class="icon-box-title font-weight-semibold text-white">Money
								back guarantee</h3>
							<p class="icon-box-text">Free delivery for all orders over
								$100</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6 border-right border-light">
						<div class="icon-box text-center mb-5 mb-md-0">
							<div class="icon-box-icon">
								<i data-feather="life-buoy"></i>
							</div>
							<h3 class="icon-box-title font-weight-semibold text-white">24/7
								customer support</h3>
							<p class="icon-box-text">Friendly 24/7 customer support</p>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="icon-box text-center mb-5 mb-md-0">
							<div class="icon-box-icon">
								<i data-feather="credit-card"></i>
							</div>
							<h3 class="icon-box-title font-weight-semibold text-white">Secure
								online payment</h3>
							<p class="icon-box-text">We posess SSL / Secure сertificate</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- third row-->
		<div class="pt-5 pb-4" style="background-color: #1f1f1f;">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 text-center text-sm-left">
						<div class="mb-4 mb-sm-0">
							<a class="d-inline-block" href="index.html"><img width="100"
								src="img/logo-light.png" alt="MStore" /></a>
							<div
								class="navbar-lang-switcher dropdown border-light mt-3 mb-0 mt-sm-0">
								<div class="dropdown-toggle text-white" data-toggle="dropdown">
									<img width="20" src="img/flags/en.png" alt="English" /><span>USD</span>
								</div>
								<ul class="dropdown-menu" style="width: 150px;">
									<li class="dropdown-item"><select
										class="custom-select custom-select-sm">
											<option value="usd">$ USD</option>
											<option value="usd">€ EUR</option>
											<option value="usd">£ UKP</option>
											<option value="usd">¥ JPY</option>
									</select></li>
									<li><a class="dropdown-item" href="index.html"><img
											class="mr-2" width="20" src="img/flags/fr.png" alt="Français" />Français</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="#"><img
											class="mr-2" width="20" src="img/flags/de.png" alt="Deutsch" />Deutsch</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="#"><img
											class="mr-2" width="20" src="img/flags/it.png" alt="Italiano" />Italiano</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-6 text-center text-sm-right">
						<a class="social-btn sb-facebook sb-light mx-1 mb-2" href="#"><i
							class="flaticon-facebook"></i></a><a
							class="social-btn sb-twitter sb-light mx-1 mb-2" href="#"><i
							class="flaticon-twitter"></i></a><a
							class="social-btn sb-instagram sb-light mx-1 mb-2" href="#"><i
							class="flaticon-instagram"></i></a><a
							class="social-btn sb-vimeo sb-light mx-1 mb-2" href="#"><i
							class="flaticon-vimeo"></i></a>
					</div>
				</div>
				<div class="row pt-4">
					<div class="col-sm-6 text-center text-sm-left">
						<ul class="list-inline font-size-sm">
							<li class="list-inline-item mr-3"><a
								class="nav-link-inline nav-link-light" href="#">Outlets</a></li>
							<li class="list-inline-item mr-3"><a
								class="nav-link-inline nav-link-light" href="#">Affiliates</a></li>
							<li class="list-inline-item mr-3"><a
								class="nav-link-inline nav-link-light" href="#">Support</a></li>
							<li class="list-inline-item mr-3"><a
								class="nav-link-inline nav-link-light" href="#">Privacy</a></li>
							<li class="list-inline-item mr-3"><a
								class="nav-link-inline nav-link-light" href="#">Terms of use</a></li>
						</ul>
					</div>
					<div class="col-sm-6 text-center text-sm-right">
						<div class="d-inline-block">
							<img width="187" src="img/cards.png" alt="Payment methods" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="py-3" style="background-color: #1a1a1a;">
			<div class="container font-size-xs text-center"
				aria-label="Copyright">
				<span class="text-white opacity-60 mr-1">© All rights
					reserved. Made by</span><a class="nav-link-inline nav-link-light"
					href="https://createx.studio/" target="_blank">Createx Studio</a>
			</div>
		</div>
	</footer>
	<!-- Back To Top Button-->
	<a class="scroll-to-top-btn" href="#"><i
		class="scroll-to-top-btn-icon" data-feather="chevron-up"></i></a>
	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script src="js/vendor.min.js"></script>
	<script src="js/theme.min.js"></script>
	<script src="js/Board_Main.js"></script>
	<script src="js/Main_Menu.js"></script>
	<script src="js/Member_profile.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
</body>
</html>