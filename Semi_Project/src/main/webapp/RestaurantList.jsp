<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
response.setHeader("Cache-Control", "no-store"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", 0); // Proxies
if (request.getProtocol().equals("HTTP/1.1"))
	response.setHeader("Cache-Control", "no-cache");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>Fooding</title>
<!-- SEO Meta Tags-->
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Expires" CONTENT="-1">
<meta name="description"
	content="MStore - Modern Bootstrap E-commerce Template" />

<meta name="keywords"
	content="bootstrap, shop, e-commerce, market, modern, responsive,  business, mobile, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean" />
<meta name="author" content="Createx Studio" />
<!-- Viewport-->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Favicon and Touch Icons-->
<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png" />
<link rel="manifest" href="site.webmanifest" />
<link rel="mask-icon" color="#111" href="safari-pinned-tab.svg" />
<meta name="msapplication-TileColor" content="#111" />
<meta name="theme-color" content="#ffffff" />
<!-- Vendor Styles including: Font Icons, Plugins, etc.-->
<link rel="stylesheet" media="screen" href="css/vendor.min.css" />
<!-- Main Theme Styles + Bootstrap-->
<link rel="stylesheet" media="screen" id="main-styles"
	href="css/theme.min.css" />
<link rel="stylesheet" media="screen" href="css/Board_Main.css" />

<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
<script src="js/kakao_login.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

</head>
<!-- Body-->
<body>


	<!-- Success toast -->
	<div class="toast-container toast-top-center">
		<div class="toast" role="alert" aria-live="assertive"
			aria-atomic="true" id="login_success">
			<div class="toast-header bg-success text-white">
				<i class="mr-2" data-feather="check-circle"
					style="width: 1.75rem; height: 1.75rem;"></i> <span
					class="font-weight-semibold mr-auto">로그인 성공</span>
				<button type="button" class="close text-white ml-2 mb-1"
					data-dismiss="toast" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="toast-body text-success" id="toast_success_div"></div>
		</div>
	</div>

	<!-- Warning toast -->
	<div class="toast-container toast-top-center">
		<div class="toast" role="alert" aria-live="assertive" id="login_fail"
			aria-atomic="true">
			<div class="toast-header bg-warning text-white">
				<i class="mr-2" data-feather="alert-circle"
					style="width: 1.75rem; height: 1.75rem;"></i> <span
					class="font-weight-semibold mr-auto">로그인 실패</span>
				<button type="button" class="close text-white ml-2 mb-1"
					data-dismiss="toast" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="toast-body text-warning">아이디 혹은 비밀번호를 확인해주세요.</div>
		</div>
	</div>
	<!--   ==============================  네비바  ================================= -->


	<%
	String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
	if (session.getAttribute("id") != null) {
		userID = (String) session.getAttribute("id");

	}

	String thumnail = (String) session.getAttribute("Thumnail");
	String profile = (String) session.getAttribute("member_profile");
	String name = (String) session.getAttribute("name");
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
								<label class="sr-only" for="signin-id">아이디</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="signin-id-icon"><i
											data-feather="mail"></i></span>
									</div>
									<input class="form-control" type="text" id="signin-id"
										placeholder="아이디" aria-label="ID" name="id"
										aria-describedby="signin-id-icon" required />
									<div class="invalid-feedback">아이디를 입력해주세요.</div>
								</div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signin-password">비밀번호</label>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text" id="signin-password-icon"><i
											data-feather="lock"></i></span>
									</div>
									<input class="form-control" type="password"
										id="signin-password" placeholder="비밀번호" aria-label="Password"
										name="pwd" aria-describedby="signin-password-icon" required />
									<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
								</div>
							</div>
							<div class="custom-control custom-checkbox mb-3">
								<input class="custom-control-input" type="checkbox"
									id="remember-me" checked /> <label
									class="custom-control-label" for="remember-me">아이디 저장</label>
							</div>
							<button class="btn btn-primary btn-block" type="button"
								id="ImLogin">로그인</button>

							<div class="pt-3" align="center">
								<a href="account-id-recovery.jsp"
									class="a-cssIdPwd font-size-xs">아이디 찾기</a><a
									href="account-password-recovery.jsp"
									class="a-cssIdPwd font-size-xs">비밀번호 찾기</a>
							</div>
						</form>
					</div>


					<%-- 회원가입 --%>
					<div class="tab-pane fade" id="signup" role="tabpanel">
						<form method="post" class="needs-validation" novalidate
							action="<%=request.getContextPath()%>/member_join.do"
							id="signup-form" name="signup-form">
							<div class="form-group">
								<label class="sr-only" for="singup-id">아이디</label> <input
									class="form-control" type="text" id="signup-id"
									name="member_id" placeholder="아이디" aria-label="아이디" /> <span
									class="feedback" id="signup-idchk"></span>
								<div class="invalid-feedback"></div>

							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-password">비밀번호</label> <input
									class="form-control" type="password" id="signup-password"
									name="member_pwd" placeholder="비밀번호" aria-label="Password" />
								<span class="feedback" id="signup-pwdchk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-password-confirm">비밀번호
									확인</label> <input class="form-control" type="password"
									name="member_pwdchk" id="signup-password-confirm"
									placeholder="비밀번호 확인" aria-label="Confirm password" /> <span
									class="feedback" id="signup-pwdconfirm-chk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-name">이름</label> <input
									class="form-control" type="text" id="signup-name"
									name="member_name" placeholder="이름" aria-label="Full name" />
								<span class="feedback" id="signup-namechk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-email">이메일</label> <input
									class="form-control" type="email" id="signup-email"
									name="member_email" placeholder="이메일"
									aria-label="Email address" /> <span class="feedback"
									id="signup-emailchk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-phone">연락처 확인</label> <input
									class="form-control" type="text" name="member_phone"
									id="signup-phone" placeholder="연락처" aria-label="Phone" /> <span
									class="feedback" id="signup-phonechk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<button class="btn btn-primary btn-block" type="button"
								onclick="checkAll()">가입하기</button>
							<button class="btn btn-primary btn-block" type="button"
								onclick="location.href='company-signup.jsp'">사업자 가입</button>
						</form>
					</div>
				</div>


				<div class="d-flex align-items-center pt-4">
					<hr class="w-100" />
					<div class="px-3 w-100 text-nowrap font-weight-semibold">소셜
						로그인</div>
					<hr class="w-100" />
				</div>
				<div class="text-center pt-4">
					<input type="image" style="width: 320px;"
						src="main_img/kakao_login.jpg" onclick="kakaoLogin();"
						value="카카오 로그인 kakaoLogin();"> <br> <br> <a
						class="social-btn sb-facebook mx-2 mb-3" href="#"
						data-toggle="tooltip" title="Facebook"><i
						class="flaticon-facebook"></i></a> <a
						class="social-btn sb-google-plus mx-2 mb-3" href="#"
						data-toggle="tooltip" title="Google"><i
						class="flaticon-google-plus"></i></a> <a
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
											<li><a href="SearchKeyRestaurant.do?keyword=서울"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">서울</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=경기"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">경기</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=인천"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">인천</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=대구"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">대구</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=부산"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">부산</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=제주"><i
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
											<li><a href="SearchKeyRestaurant.do?keyword=데이트"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">데이트
														코스</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=가족"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">가족모임</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=뷰"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">뷰가
														좋은</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=전통"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">전통적인</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=비지니스"><i
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
											<li><a href="SearchKeyRestaurant.do?keyword=고기"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">고기요리</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=한식"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">한식</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=양식"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">양식</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=중식"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">중식</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=일식"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">일식</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=아시안"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">아시안</span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=카페"><i
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
											<li><a
												href="<%=request.getContextPath()%>/review_board.do"> <i
													class="widget-categories-indicator"
													data-feather="chevron-right"> </i><span
													class="font-size-sm">후기 게시판</span></a></li>
											<li><a
												href="<%=request.getContextPath()%>/free_board.do"> <i
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
													data-feather="chevron-right"></i><span class="font-size-sm">후기
														작성 </span></a></li>

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
									<li><a class="dropdown-item"
										href="<%=request.getContextPath()%>/member_profile.do">마이페이지</a></li>
									<li class="dropdown-divider"></li>
									<%
									}
									%>


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

							<li><a class="dropdown-item"
								href="<%=request.getContextPath()%>/board_main_list.do">

									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="file-text"
											style="width: 1.4375rem; height: 1.4375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">레스토랑 목록</span>
										</div>
									</div>
							</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" data-toggle="modal"
								href="#modalLong">
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="grid"
											style="width: 1.375rem; height: 1.375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">레스토랑 추가 </span>
										</div>
									</div>
							</a></li>



							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="LoadRestaurantList.do">
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
					<form method="get"
						action="<%=request.getContextPath()%>/total_main_search.do">
						<div class="flex-grow-1 pb-3 pt-sm-4 my-1 pr-lg-4 order-sm-2">
							<div class="input-group flex-nowrap">
								<div class="input-group-prepend">
									<%-- 검색input테그 --%>

									<input class="form-control-dong rounded" type="text"
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
					<a class="navbar-btn" href="#offcanvas-cart"
						data-toggle="offcanvas"><span
						class="d-block position-relative"><span
							class="navbar-btn-badge bg-primary text-light">4</span><i
							class="mx-auto mb-1" data-feather="shopping-cart"></i>관심 레스토랑</span></a> <a
						class="navbar-btn navbar-collapse-hidden" href="member/logout.jsp">

						<i class="mx-auto mb-1" data-feather="log-out"></i>로그아웃
					</a>

					<%-- 프로필 정보란 --%>
					<div class="navbar-btn navbar-collapse-hidden">
						<div class="kakao_img mx-auto mb-1">
							<a href="<%=request.getContextPath()%>/myprofile.go"> <img
								class="profile_img" src="<%=thumnail%>">
							</a>
						</div>
						<span class="mx-auto mb-1"
							style="font-family: 'GmarketSansMedium'; font-size: 12px;"><%=name%>
							님 </span> <img src="${profile }">
					</div>

					<%-- 프로필 정보란 --%>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</header>
	<%--   ======================================상단 네비바 <<END>>======================================= --%>


	<!-- Page Title-->
	<div class="page-title-wrapper" aria-label="Page title">
		<div class="container">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="mt-n1 mr-1"><i data-feather="home"></i></li>
					<li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="#">레스토랑</a></li>
				</ol>
			</nav>
			<h1 class="page-title">
				레스토랑 목록 &nbsp;&nbsp;&nbsp;&nbsp;🔍&nbsp;${keyword } <span
					class="lead font-weight-semibold text-muted"></span>
			</h1>
			<span class="d-block mt-2 text-muted"></span>
			<hr class="mt-4">
		</div>
	</div>
	<!-- Page Content  ==========================================================================================-->

	<%--
    	  <c:set var="list" value="${List}" />
              <c:if test="${!empty list }">
                <c:forEach items="${list }" var="dto">
                <!-- DB데이터만큼 리스트 출력되는 가게목록. -->
                <div class="col-md-4 col-sm-6">
                  <div class="product-card mb-4">
                    <div class="product-thumb">
                      <a class="product-thumb-link" href="">	</a><span
                        class="product-wishlist-btn" data-toggle="tooltip"
                        data-placement="left" title="찜하기"><i
                        data-feather="heart"></i></span><img src="${dto.getMain_img()}"
                        alt="${dto.getMain_name()}">
                    </div>
                    <div class="product-card-body text-center">
                      <a class="product-meta" href="#"  style="font-family: 'GmarketSansMedium';">${dto.getMain_info() }</a>
                      <h3 class="product-card-title">
                        <a href="shop-single-apparel.jsp"  style="font-family: 'GmarketSansMedium'; font-size: 18px;">${dto.getMain_name()}</a>
                      </h3>
                      <span class="text-primary-orange"  style="font-family: 'GmarketSansMedium'; font-size: 13px;">${dto.getMain_addr() }</span>
                    </div>
                    <div class="product-card-body body-hidden">
                     
                      <button class="btn btn-primary btn-sm btn-block" type="button"
                        data-toggle="toast" data-target="#cart-toast"  style="font-family: 'GmarketSansMedium';">예약하기</button>
                      <a class="quick-view-btn" href="#${dto.getMain_idx()}-quick-view"
                        data-toggle="modal" style=" color:black;"><i class="mr-2" data-feather="eye" style="font-family: 'GmarketSansMedium';"></i>자세히</a>
                    </div>
                  </div>
                </div>
    
              </c:forEach>
              </c:if>				
     --%>



	<div class="container pb-5 mb-4">
		<div class="row">
			<div class="col-lg-3">
				<!-- Shop sidebar-->
				<div class="offcanvas-sidebar">
					<div class="offcanvas-sidebar-toggle">
						<span class="toggle-knob"><i data-feather="chevrons-right"></i>Sidebar</span>
					</div>
					<div class="offcanvas-sidebar-body">
						<div class="offcanvas-sidebar-body-inner">
							<!-- Categories-->
							<div class="widget widget-categories mb-4 py-1">
								<p class="widget-title">카테고리</p>
								<ul id="shopCategories">
									<li class="has-children"><a href="#shoes"
										data-toggle="collapse"> <i
											class="widget-categories-indicator"
											data-feather="chevron-down"></i>지역<span
											class="badge text-muted ml-1"></span></a>
										<ul class="collapse show" id="shoes"
											data-parent="#shopCategories">
											<li><a href="SearchKeyRestaurant.do?keyword=서울">서울<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=경기">경기<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=인천">인천<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=대구">대구<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=부산">부산<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=제주">제주<span
													class="badge text-muted ml-1"></span></a></li>
										</ul></li>
									<li class="has-children"><a class="collapsed"
										href="#clothing" data-toggle="collapse"> <i
											class="widget-categories-indicator"
											data-feather="chevron-down"></i>음식 종류<span
											class="badge text-muted ml-1"></span></a>
										<ul class="collapse" id="clothing"
											data-parent="#shopCategories">
											<li><a href="SearchKeyRestaurant.do?keyword=고기">고기요리<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=한식">한식<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=양식">양식<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=중식">중식<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=일식">일식<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=아시안">아시안<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=카페">카페,디저트<span
													class="badge text-muted ml-1"></span></a></li>
										</ul></li>
									<li class="has-children"><a class="collapsed" href="#bags"
										data-toggle="collapse"> <i
											class="widget-categories-indicator"
											data-feather="chevron-down"></i>테마별<span
											class="badge text-muted ml-1"></span></a>
										<ul class="collapse" id="bags" data-parent="#shopCategories">
											<li><a href="SearchKeyRestaurant.do?keyword=데이트">데이트코스<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=가족">가족모임<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=뷰">뷰가 좋은<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=전통">전통적인<span
													class="badge text-muted ml-1"></span></a></li>
											<li><a href="SearchKeyRestaurant.do?keyword=비지니스">비지니스
													미팅<span class="badge text-muted ml-1"></span>
											</a></li>
										</ul></li>

								</ul>
							</div>
							<!-- Price range-->
							<div class="widget mb-4 pb-3">
								<h3 class="widget-title">메뉴 가격으로 레스토랑 검색</h3>
								<form method="get" action="SearchCostRestaurant.do?"
									class="range-slider" data-start-min="250" data-start-max="650"
									data-min="0" data-max="300000" data-step="1000">
									<div class="ui-range-slider"></div>
									<footer class="ui-range-slider-footer">
										<div class="column">
											<button class="btn btn-outline-primary btn-sm" type="submit">검색</button>
										</div>
										<div class="column">
											<div class="ui-range-values">
												<div class="ui-range-label">가격:</div>
												<div class="ui-range-value-min">
													￦<span></span> <input type="hidden" name="min">
												</div>
												&nbsp;&ndash;&nbsp;
												<div class="ui-range-value-max">
													￦<span></span> <input type="hidden" name="max">
												</div>
											</div>
										</div>
									</footer>
								</form>
							</div>

							<%--Promo banner --%>
							<div class="bg-secondary">
								<img
									src="https://media.hellobot.co/fixedmenu/%E1%84%86%E1%85%A5%E1%86%A8%E1%84%8B%E1%85%B3%E1%86%AF%E1%84%81%E1%85%A1%E1%84%86%E1%85%A1%E1%86%AF%E1%84%81%E1%85%A1.png"
									alt="뭐 먹지?">
								<div class="px-3 pt-4 text-center">
									<h4 class="font-size-sm font-weight-normal pt-1 mb-0"></h4>
									<h4 class="h5 pb-2" style="font-family: 'GmarketSansMedium';">
										레스토랑을 고르기 <br>힘들다면?
									</h4>
									<a class="d-block text-decoration-0" href="RandomRST.do">
										<div class="btn btn-primary btn-sm"
											style="font-family: 'GmarketSansMedium';">레스토랑 추천</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<c:set var="list" value="${List}" />
			<c:if test="${!empty list }">

				<div class="col-lg-9">
					<!-- 정렬-->
					<div
						class="d-flex flex-wrap justify-content-center justify-content-sm-between pb-3">
						<div class="d-flex flex-wrap">
							<div class="form-inline flex-nowrap mr-3 mr-sm-4 pb-3">

								<form method="get"
									action="<%=request.getContextPath()%>/RestaurantSort.do">
									<label class="text-nowrap mr-2 d-none d-sm-block" for="sorting">정렬</label>
									<select class="form-control custom-select" id="sorting">
										<option>저장순</option>
										<option>예약순</option>
										<option>리뷰많은순</option>
									</select>
								</form>
							</div>
			</c:if>
			<!--레스토랑 리스트-->


			<div class="row">
				<c:set var="list" value="${List}" />
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<!-- DB데이터만큼 리스트 출력되는 가게목록. -->
						<div class="col-md-4 col-sm-6">
							<div class="product-card mb-4">
								<div class="product-thumb">

									<span class="product-wishlist-btn" data-toggle="tooltip"
										data-placement="left" title="찜하기"
										id="Heart${dto.getMain_idx() }"> <svg
											xmlns="http://www.w3.org/2000/svg" width="16" height="16"
											fill="currentColor" class="bi bi-suit-heart"
											viewBox="0 0 16 16">
					                          <path
												d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
					                        </svg>

									</span> <input type="hidden" id="main_idx"
										value="${dto.getMain_idx()}"> <img
										src="${dto.getMain_img()}" alt="${dto.getMain_name()}">

								</div>
								<div class="product-card-body text-center">
									<a class="product-meta" href="#"
										style="font-family: 'GmarketSansMedium';">${dto.getMain_info() }</a>
									<h3 class="product-card-title">
										<a href="shop-single-apparel.jsp"
											style="font-family: 'GmarketSansMedium'; font-size: 18px;">${dto.getMain_name()}</a>
									</h3>
									<span class="text-primary-orange"
										style="font-family: 'GmarketSansMedium'; font-size: 13px;">${dto.getMain_addr() }</span>
								</div>
								<div class="product-card-body body-hidden">

									<button class="btn btn-primary btn-sm btn-block" type="button"
										data-toggle="toast" data-target="#cart-toast"
										style="font-family: 'GmarketSansMedium';">예약하기</button>
									<a class="quick-view-btn" id="StoreDetail"
										href="#quick-view${dto.getMain_idx()}" data-toggle="modal"
										style="color: black;"><i class="mr-2" data-feather="eye"
										style="font-family: 'GmarketSansMedium';"></i>자세히</a>
								</div>
							</div>
						</div>


						
						<!--가게정보 상세페이지  ==============================================================================================-->
						<div class="modal modal-quick-view fade"
							id="quick-view${dto.getMain_idx()}" tabindex="-1" role="dialog">
							<div class="modal-dialog" role="document">
								<input type="hidden" id="main_idx${dto.getMain_idx()}" value="${dto.getMain_idx()}">
								<div class="modal-content">
									<div class="modal-header">
										<div>
											<h2 class="h2 modal-title mb-1"
												style="font-family: 'GmarketSansMedium';">${dto.getMain_name()}</h2>
											<h5 class="text-primary font-weight-light mb-0"
												style="font-family: 'GmarketSansMedium';">${dto.getMain_info() }</h5>
										</div>
										<button class="close" type="button" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="row">
											<!-- Product gallery-->
											<div class="col-lg-7">
												<div class="owl-carousel"
													data-owl-carousel="{ &quot;nav&quot;: true, &quot;dots&quot;: false, &quot;loop&quot;: true, &quot;margin&quot;: 15 }">
													<img src="${dto.getMain_img()}" alt="${dto.getMain_img()}">
													<img src="${dto.getMain_img()}" alt="${dto.getMain_img()}">
													<img src="${dto.getMain_img()}" alt="${dto.getMain_img()}">
													<img src="${dto.getMain_img()}" alt="${dto.getMain_img()}">
												</div>
											</div>
											<!-- Product details-->
											<div class="col-lg-5 pt-4 pt-lg-0">
												<form class="pb-4" method="post" action="">
													<label for="resvation_date">예약날짜</label>

													<%-- 예약 시간 옵션 설정 예약 시간 옵션 설정 예약 시간 옵션 설정 예약 시간 옵션 설정  --%>

													<c:set var="opentime" value="${dto.getMain_opentime()}" />
													<c:set var="endtime" value="${dto.getMain_endtime()}" />
													<div class="form-group">
														<div class="form-inline pb-3" style="float: left;">
															<input class="form-control" type="date"
																id="resvation_date" min="<%=java.time.LocalDate.now()%>"
																value="<%=java.time.LocalDate.now()%>">
														</div>
														<div class="form-inline pb-3" style="float: left;">
															<select class="form-control custom-select"
																id="resvation_time" name="size" required>
																<option>예약 시간</option>
																<c:forEach var="res_time"
																	begin="${fn:substring(opentime,0,2)}"
																	end="${fn:substring(endtime,0,2)}">
																	<option
																		value="${res_time}:${fn:substring(opentime,3,5)}">${res_time}
																		: ${fn:substring(opentime,3,5)}</option>
																</c:forEach>

															</select>
														</div>

														<div class="" style="float: right;">

															<input class="pl-2 form-control pb-3" type="number"
																id="people-num" name="quantity"
																style="width: 3.5rem; height: 2.625rem;" value="1"
																required>
														</div>
														<div style="float: right;">
															<label class="pt-2" for="people-num">인원&nbsp;&nbsp;</label>
														</div>
														<%-- 예약 시간 옵션 설정 예약 시간 옵션 설정 예약 시간 옵션 설정 예약 시간 옵션 설정  --%>



													</div>
													<div class="form-group" style="float: left;">
														<div class="form-inline pb-2" style="float: right;"></div>
													</div>
													<textarea class="form-control" id="request-text" rows="3"
														style="resize: none;" placeholder="요청사항 혹은 알러지 음식을 작성해주세요"></textarea>
													<div class="d-flex flex-wrap align-items-center pt-1">

														<div>
															<button class="btn btn-primary px-5 mr-2" type="button"
																id="booking-btn">
																<i class="mr-2" data-feather="shopping-cart"
																	style="font-family: 'GmarketSansMedium';"></i>예약하기
															</button>
															<input type="hidden" value="${dto.getMain_idx()}" id="date_idx">

														</div>
														<a class="btn box-shadow-0 nav-link-inline my-2" href="#"><i
															class="align-middle mr-1" data-feather="heart"
															style="width: 1.1rem; height: 1.1rem;"></i>찜하기</a>

													</div>
												</form>
												<div class="card">
													<div class="card-header py-3 bg-0">
														<h3 class="h6 mb-0">
															<span
																class="d-inline-block pr-2 border-right mr-2 align-middle mt-n1"><i
																data-feather="info"
																style="width: 1.1rem; height: 1.1rem;"></i></span>레스토랑 상세 정보
														</h3>
													</div>
													<div class="card-body">
														<ul class="mb-0" style="font-family: 'GmarketSansMedium';">
															<li>주소 : ${dto.getMain_addr() }
																${dto.getMain_detailaddr() }<br> 우편번호 :
																${dto.getMain_post() }
															</li>
															<br>
															<li>전화 : ${dto.getMain_phone() }</li>
															<br>
															<li>=======정보=======<br>${dto.getMain_info()}</li>
															<br>
															<li>음식 종류 : ${dto.getMain_type() }</li>
															<br>
															<li>오픈시간 : ${dto.getMain_opentime()} ~ 마감시간 :
																${dto.getMain_endtime() }</li>
														</ul>
													</div>
												</div>
											</div>
											=================================================모달 추가 정보
											구분칸===================================================

										</div>
									</div>
								</div>
							</div>
						</div>


					</c:forEach>
				</c:if>

				<c:if test="${empty list }">
					<div class="pb-md-6 py-md-6">
						<h1>😢검색 내용이 없습니다.😢</h1>
					</div>
				</c:if>
			</div>
		</div>
	</div>


	<!-- 레스토랑-->

	<hr class="pb-4 mb-2">
	<!-- 페이지 기능-->

	<nav aria-label="Page navigation">
		<ul
			class="pagination justify-content-center justify-content-sm-center mb-0">
			<li class="page-item"><a class="page-link"
				href="LoadRestaurantList.do?page=1">처음</a></li>
			<li class="page-item"><a class="page-link"
				href="LoadRestaurantList.do?page=${page - 1 }">이전</a></li>

			<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
				<c:if test="${i == page }">
					<li class="page-item active" aria-current="page"><a
						class="page-link" href="LoadRestaurantList.do?page=${i }">${i }</a></li>
				</c:if>

				<c:if test="${i != page }">
					<li class="page-item"><a class="page-link"
						href="LoadRestaurantList.do?page=${i }">${i }</a></li>
				</c:if>
			</c:forEach>

			<c:if test="${endBlock < allPage }">
				<li class="page-item"><a class="page-link"
					href="LoadRestaurantList.do?page=${page + 1 }">다음</a></li>

				<li class="page-item"><a class="page-link"
					href="LoadRestaurantList.do?page=${allPage }">마지막</a></li>
			</c:if>

		</ul>
	</nav>

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
							<p class="icon-box-text">We posess SSL / Secure Ñertificate</p>
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
							<a class="d-inline-block" href="index.jsp"><img width="100"
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
											<option value="usd">â¬ EUR</option>
											<option value="usd">Â£ UKP</option>
											<option value="usd">Â¥ JPY</option>
									</select></li>
									<li><a class="dropdown-item" href="index.jsp"><img
											class="mr-2" width="20" src="img/flags/fr.png"
											alt="FranÃ§ais" />FranÃ§ais</a></li>
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
				<span class="text-white opacity-60 mr-1">Â© All rights
					reserved. Made by</span><a class="nav-link-inline nav-link-light"
					href="https://createx.studio/" target="_blank">Createx Studio</a>
			</div>
		</div>
	</footer>
	<!-- Back To Top Button-->
	<a class="scroll-to-top-btn" href="#"><i
		class="scroll-to-top-btn-icon" data-feather="chevron-up"></i></a>

	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->

	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="js/vendor.min.js"></script>
	<script src="js/theme.min.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="js/sign_upChk.js"></script>
	<script src="js/LoginChk.js"></script>
	<script src="js/Board_Main.js"></script>
	<script src="js/StoreMarked.js"></script>
	<script src="js/reservation.js"></script>
	<script>
		$('.toast').toast({
			delay : 3000
		});
	</script>

</body>
</html>