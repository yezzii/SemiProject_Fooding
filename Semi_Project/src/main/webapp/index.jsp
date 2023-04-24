<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<script type="text/javascript" src="js/loadMarkedRstAjax.js"></script>

</head>
<!-- Body-->
<body>


	<!-- Success toast -->
	<div class="toast-container toast-top-center">
		<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" id="login_success">
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
	
	String thumnail =  (String)session.getAttribute("Thumnail");
	String profile =  (String)session.getAttribute("member_profile");
	String name = (String)session.getAttribute("name");
	String totalMark = (String)session.getAttribute("totalMark");
	
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
										placeholder="ID" aria-label="ID" name="id"
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
							<button class="btn btn-primary btn-block" type="button" id="ImLogin"
								>로그인</button>

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
									name="member_pwd" placeholder="Password" aria-label="Password" />
								<span class="feedback" id="signup-pwdchk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-password-confirm">비밀번호
									확인</label> <input class="form-control" type="password"
									name="member_pwdchk" id="signup-password-confirm"
									placeholder="Confirm password" aria-label="Confirm password" />
								<span class="feedback" id="signup-pwdconfirm-chk"></span>
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
									name="member_email" placeholder="Email"
									aria-label="Email address" /> <span class="feedback"
									id="signup-emailchk"></span>
								<div class="invalid-feedback"></div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-phone">연락처 확인</label> <input
									class="form-control" type="text" name="member_phone"
									id="signup-phone" placeholder="Phone" aria-label="Phone" /> <span
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
					<input type="image" style="width: 320px;" id="kakaoAjax"
						src="main_img/kakao_login.jpg" 
						value="카카오 로그인 kakaoLogin();"> <br>
					<br> <a class="social-btn sb-facebook mx-2 mb-3" href="#"
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
			<h3 class="offcanvas-title" style="font-family:'GmarketSansMedium'; font-size: 23px; ">찜한 레스토랑</h3>
			<button class="close" type="button" data-dismiss="offcanvas"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="offcanvas-body">
			<div class="offcanvas-body-inner">
				
				<div class="widget widget-featured-entries pt-3" id="marked-list">
				
				<%--찜 목록 리스트 (가게정보 출력란) --%>
				
						<div class="media" >
							<div class="featured-entry-thumb mr-3">
								<a href="#"><img src="" width="64"
									alt="" /></a>
							</div>
							<div class="media-body">
								<h6 class="featured-entry-title">
									<a href="#" style="font-family:'GmarketSansMedium'; font-size: 18px; ">찜한 가게 목록 불러오는중...</a>
								</h6>
								<p cxlass="fe$125.00atured-entry-meta">
									<span class="text-muted"></span> 
								</p>
							</div>
						</div>
				<hr />
			
					<%--찜 목록 리스트 END  --%>
					
					
					
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
						class="nav-link dropdown-toggle" href="LoadRestaurantList.do" ><i
							class="mr-1" ></i>레스토랑</a>
						</li>
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
					<a class="navbar-btn" href="#offcanvas-cart"	onclick="loadMark();"
						data-toggle="offcanvas"><span
						class="d-block position-relative"><span
							class="navbar-btn-badge bg-primary-Mark text-light" id="totalMarkCount"></span><i
							class="mx-auto mb-1" data-feather="heart" ></i>찜한 레스토랑</span></a>
					
					<a class="navbar-btn navbar-collapse-hidden"
						href="member/logout.jsp">
						<i class="mx-auto mb-1" data-feather="log-out"></i>로그아웃</a>

					<%-- 프로필 정보란 --%>
				<div class="navbar-btn navbar-collapse-hidden">
					<div class="kakao_img mx-auto mb-1">
						<a href="<%=request.getContextPath()%>/member_profile.do"> <img
							class="profile_img" src="<%=thumnail%>">
						</a>
					</div>
						<span class="mx-auto mb-1" style="font-family:'GmarketSansMedium'; font-size: 12px; "><%=name%> 님 </span>
					<img src="${profile }">
				</div>

				<%-- 프로필 정보란 --%>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</header>
	<!--   ==============================  네비바  ================================= -->

	<!-- Hero slider-->
	<section class="container-fluid bg-secondary px-0">
		<div class="row no-gutters align-items-center">
			<div class="col-md-6">
				<div class="mx-auto bg-light my-sm-4" style="max-width: 37rem">
					<div class="owl-carousel trigger-carousel"
						data-owl-carousel='{ "nav": true, "dots": false, "loop": true, "autoHeight": true }'
						data-target-carousel="#target-carousel">

						<div class="py-4 px-3 px-sm-5">
							<img class="d-block mb-2" src="img/photo/FeiLogo.png" width="130"
								alt="서울드래곤시티 페이" />
							<h2 class="mb-1" style="font-family: 'GmarketSansMedium';">서울드래곤시티
								페이</h2>
							<h5 class="font-weight-light opacity-70 pb-3"
								style="font-family: 'GmarketSansMedium';">
								서울 용산구 청파로20길 95 <br>서울드래곤시티 그랜드 머큐어 2F
							</h5>
							<a class="btn btn-primary" href="shop-style1-ls.jsp"
								style="font-family: 'GmarketSansMedium';">예약 하기<i
								class="ml-2" data-feather="arrow-right"></i>
							</a>
						</div>

						<div class="py-4 px-3 px-sm-5">
							<img class="d-block mb-2" src="img/photo/gordon.jpg" width="125"
								alt="고든램지 버거" />
							<h2 class="mb-1" style="font-family: 'GmarketSansMedium';">고든램지
								버거</h2>
							<h5 class="font-weight-light opacity-70 pb-3"
								style="font-family: 'GmarketSansMedium';">
								주소: 서울 송파구 올림픽로 300<br> 롯데월드몰 지하1층
							</h5>
							<a class="btn btn-primary" href="shop-style1-ls.jsp"
								style="font-family: 'GmarketSansMedium';">예약 하기<i
								class="ml-2" data-feather="arrow-right"></i>
							</a>
						</div>

						<div class="py-4 px-3 px-sm-5">
							<img class="d-block mb-2" src="img/photo/KimSS_logo.png"
								width="130" alt="서촌김씨 오스테리아" />
							<h2 class="mb-1" style="font-family: 'GmarketSansMedium';">서촌김씨
								오스테리아</h2>
							<h5 class="font-weight-light opacity-70 pb-3"
								style="font-family: 'GmarketSansMedium';">
								서울 강서구 공항대로 209 <br>지엠지 엘스타 2층 208호
							</h5>
							<a class="btn btn-primary" href="shop-style1-ls.jsp"
								style="font-family: 'GmarketSansMedium';">예약하기<i
								class="ml-2" data-feather="arrow-right"></i>
							</a>
						</div>
						<div class="py-4 px-3 px-sm-5">
							<img class="d-block mb-2" src="img/photo/amberserder.png"
								width="130" alt="스펙트럼 앰배서더 서울" />
							<h2 class="mb-1" style="font-family: 'GmarketSansMedium';">스펙트럼
								앰배서더 서울</h2>
							<h5 class="font-weight-light opacity-70 pb-3"
								style="font-family: 'GmarketSansMedium';">
								서울 영등포구 여의대로 108<br> 페어몬트 앰배서더 서울 5층
							</h5>
							<a class="btn btn-primary" href="shop-style1-ls.jsp"
								style="font-family: 'GmarketSansMedium';">예약하기<i
								class="ml-2" data-feather="arrow-right"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="owl-carousel" id="target-carousel"
					data-owl-carousel='{ "nav": false, "dots": false, "loop": true, "mouseDrag": false, "touchDrag": false, "pullDrag": false, "animateOut": "fadeOut" }'>
					<img class="ml-auto mr-0" src="img/photo/Fei.jpg" alt="서울드래곤시티 페이" />
					<img class="ml-auto mr-0" src="img/photo/GordonRamsayBuerger.jpg"
						alt="고든램지 버거" /> <img class="ml-auto mr-0"
						src="img/photo/KimSS.jpeg" alt="서촌김씨 오스테리아" /> <img
						class="ml-auto mr-0" src="img/photo/spectrum.png"
						alt="스펙트럼 앰배서더 서울" />
				</div>
			</div>
		</div>
	</section>

	<!-- Popular categories (carousel)-->
	<section class="container py-5 mt-3">
		<h5 class="h3 text-center pb-4"
			style="font-family: 'GmarketSansMedium';">상황별·주제별 BEST</h5>
		<div class="owl-carousel"
			data-owl-carousel='{ "nav": false, "dots": true, "margin": 30, "responsive": {"0":{"items":1},"460":{"items":2}, "768":{"items":3}} }'>
			<div class="card border-0">
				<a class="card-img-tiles" href="shop-style1-ls.jsp">
					<div class="main-img">
						<img src="img/photo/Date.png" alt="GoodDate" />
					</div>
					<div class="thumblist">
						<img src="img/photo/steak.jpg" alt="GoodDate" /><img
							src="img/photo/food1.jpeg" alt="GoodDate" />
					</div>
				</a>
				<div class="card-body border mt-n1 py-4 text-center">
					<h2 class="h5 mb-1">미식 데이트</h2>
					<span class="d-block mb-3 font-size-s text-muted">특별한 날, 소중한
						추억을 남기고 싶다면?</span> </span><a class="btn btn-pill btn-outline-primary btn-sm"
						href="SearchKeyRestaurant.do?keyword=데이트">자세히</a>
				</div>
			</div>
			<div class="card border-0">
				<a class="card-img-tiles" href="shop-style1-ls.jsp">
					<div class="main-img">
						<img src="img/photo/GoodView.png" alt="GoodView" />
					</div>
					<div class="thumblist">
						<img src="img/photo/centro.png" alt="GoodView" /><img
							src="img/photo/GoodView2.jpg" alt="GoodView" />
					</div>
				</a>
				<div class="card-body border mt-n1 py-4 text-center">
					<h2 class="h5 mb-1">뷰와 맛을 한번에</h2>
					<span class="d-block mb-3 font-size-s text-muted"> 전망 좋은
						레스토랑에서의 식사 어때요? </span><a class="btn btn-pill btn-outline-primary btn-sm"
						href="SearchKeyRestaurant.do?keyword=뷰">자세히</a>
				</div>
			</div>
			<div class="card border-0">
				<a class="card-img-tiles" href="shop-style1-ls.jsp">
					<div class="main-img">
						<img src="img/photo/Adult.png" alt="WithAdult" />
					</div>
					<div class="thumblist">
						<img src="img/photo/Adult2.jpg" alt="WithAdult" /><img
							src="img/photo/Adult3.jpeg" alt="WithAdult" />
					</div>
				</a>
				<div class="card-body border mt-n1 py-4 text-center">
					<h2 class="h5 mb-1">하루를 선물해보세요</h2>
					<span class="d-block mb-3 font-size-s text-muted">부모님께 색다른
						하루를 선물해보세요! </span><a class="btn btn-pill btn-outline-primary btn-sm"
						href="SearchKeyRestaurant.do?keyword=가족">자세히</a>
				</div>
			</div>
		</div>
	</section>
	<!-- Brands carousel-->
	<section class="container pb-4 mt-md-3">
		<h5 class="h3 text-center pb-4"
			style="font-family: 'GmarketSansMedium';">브랜드 관</h5>
		<div class="owl-carousel"
			data-owl-carousel='{ "nav": false, "dots": true, "loop": true, "margin": 30, "autoplay": true, "autoplayTimeout": 4000, "responsive": {"0":{"items":2, "margin": 15},"460":{"items":3, "margin": 15}, "768":{"items":4}} }'>
			<a class="d-block bg-white border py-3 py-sm-4" href="#"><img
				class="d-block mx-auto" src="img/photo/amberserder.png"
				style="width: 150px" alt="Brand" /></a><a
				class="d-block bg-white border py-3 py-sm-4" href="#"><img
				class="d-block mx-auto" src="img/photo/01.png" style="width: 150px"
				alt="Brand" /></a><a class="d-block bg-white border py-3 py-sm-4"
				href="#"><img class="d-block mx-auto" src="img/photo/02.jpeg"
				style="width: 150px" alt="Brand" /></a><a
				class="d-block bg-white border py-3 py-sm-4" href="#"><img
				class="d-block mx-auto" src="img/photo/03.png" style="width: 150px"
				alt="Brand" /></a><a class="d-block bg-white border py-3 py-sm-4"
				href="#"><img class="d-block mx-auto" src="img/photo/04.jpg"
				style="width: 150px" alt="Brand" /></a><a
				class="d-block bg-white border py-3 py-sm-4" href="#"><img
				class="d-block mx-auto" src="img/photo/05.jpg" style="width: 150px"
				alt="Brand" /></a><a class="d-block bg-white border py-3 py-sm-4"
				href="#"><img class="d-block mx-auto" src="img/photo/06.jpg"
				style="width: 150px" alt="Brand" /></a><a
				class="d-block bg-white border py-3 py-sm-4" href="#"><img
				class="d-block mx-auto" src="img/photo/07.jpeg" style="width: 150px"
				alt="Brand" /></a><a class="d-block bg-white border py-3 py-sm-4"
				href="#"><img class="d-block mx-auto" src="img/photo/08.jpg"
				style="width: 150px" alt="Brand" /></a><a
				class="d-block bg-white border py-3 py-sm-4" href="#"><img
				class="d-block mx-auto" src="img/photo/gordon.jpg"
				style="width: 150px" alt="Brand" /></a><a
				class="d-block bg-white border py-3 py-sm-4" href="#"><img
				class="d-block mx-auto" src="img/photo/09.png" style="width: 150px"
				alt="Brand" /></a><a class="d-block bg-white border py-3 py-sm-4"
				href="#"><img class="d-block mx-auto" src="img/photo/10.png"
				style="width: 150px" alt="Brand" /></a>
		</div>
	</section>

	<!-- Featured products grid-->
	<section class="container pt-3 pb-4">
		<h2 class="h3 text-center pb-4">요즘 뜨는 레스토랑</h2>
		<div class="row" id="CardLoad">
			<!-- Product-->
			
		<c:set var="list" value="${List}" />
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<!-- DB데이터만큼 리스트 출력되는 가게목록. -->
						<div class="col-md-4 col-sm-6">
							<div class="product-card mb-4">
								<div class="product-thumb">
									 <span	class="product-wishlist-btn" data-toggle="tooltip"
										data-placement="left" title="찜하기" id="Heart${dto.getMain_idx() }"> 
										
										<svg
					                        xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					                        fill="currentColor" class="bi bi-suit-heart" 
					                        viewBox="0 0 16 16">
					                          <path
					                            d="M8 6.236l-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595L8 6.236zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.55 7.55 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
					                        </svg>
										
										</span>
									 <input type="hidden" id="main_idx" value="${dto.getMain_idx()}"> 
									 <img src="${dto.getMain_img()}" alt="${dto.getMain_name()}">
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

									
									<a class="quick-view-btn"
										href="#quick-view${dto.getMain_idx()}" data-toggle="modal"
										style="color: black;"><button class="btn btn-primary btn-sm btn-block" type="button"
										style="font-family: 'GmarketSansMedium';">자세히</button></a>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:if>
				
		</div>
	</section>
	
	<div class="btn-center pb-4" align="center">
	<a  href="LoadRestaurantList.do" style="color: black;">
	<button class="btn btn-primary btn-sm btn-block" type="button"style="font-family: 'GmarketSansMedium'; width: 500px;">
	자세한 내용, 더 많은 레스토랑이 궁금하다면?
	</button>
	</a>
	</div>
	<%--    ++++++++++++++++++++++++++++++++++++++++++++++++가게추가++++++++++++++++++++++++++++++++++++++++++++++++++ --%>

	

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

  
  
  
	<!-- Footer-->
	<footer class="page-footer bg-dark">
		<!-- first row-->
		<div class="pt-5 pb-0 pb-md-4">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-6">
						<div class="widget widget-links pb-4">
							<h3 class="widget-title text-white border-light">Fooding 기능</h3>
							<ul>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">가게 찾기</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">가게 검색</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">가게 등록</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">가격으로 검색</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">문의</span></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="widget widget-links pb-4">
							<h3 class="widget-title text-white border-light">계정 관리</h3>
							<ul>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">계정 자세히</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">회원탈퇴</span></a></li>
							</ul>
						</div>
						<div class="widget widget-links pb-4">
							<h3 class="widget-title text-white border-light">Fooding Info</h3>
							<ul>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">제작자</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">세미프로젝트</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">About_ Project</span></a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-4 offset-xl-1 col-md-5">
						<div class="widget">

							<!-- Mobile app download-->
							<div class="widget pb-4">
								<h3 class="widget-title text-white border-light">다운로드 Fooding 앱</h3>
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
		
		<!-- third row-->
		<div class="pt-5 pb-4" style="background-color: #1f1f1f;">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 text-center text-sm-left">
						<div class="mb-4 mb-sm-0">
							<a class="d-inline-block" href="index.jsp"><img width="200"
								src="img/logo-fooding.png" alt="Fooding" /></a>

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
								class="nav-link-inline nav-link-light" href="#">가게</a></li>
							<li class="list-inline-item mr-3"><a
								class="nav-link-inline nav-link-light" href="#">브랜드관</a></li>
							<li class="list-inline-item mr-3"><a
								class="nav-link-inline nav-link-light" href="#">고객센터</a></li>
							<li class="list-inline-item mr-3"><a
								class="nav-link-inline nav-link-light" href="#">개인정보 보호</a></li>
							<li class="list-inline-item mr-3"><a
								class="nav-link-inline nav-link-light" href="#">이용약관</a></li>
						</ul>
					</div>
					<div class="col-sm-6 text-center text-sm-right"></div>
				</div>
			</div>
		</div>
		<div class="py-3" style="background-color: #1a1a1a;">
			<div class="container font-size-xs text-center"
				aria-label="Copyright">
				<span class="text-white opacity-60 mr-1">© All rights
					reserved. Made by</span><a class="nav-link-inline nav-link-light"
					href="https://createx.studio/" target="_blank">Fooding .co</a>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript" src="js/sign_upChk.js"></script>
	<script src="js/Board_Main.js"></script>
	<script src="js/LoginChk.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="js/kakao_login.js"></script>
	<script src="js/StoreMarked.js"></script>
	<script src="js/main_card.js"></script>
	<script>
		$('.toast').toast({
			delay : 5000
		});
	</script>
</body>
</html>