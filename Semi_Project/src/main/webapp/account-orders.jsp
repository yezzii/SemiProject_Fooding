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


</head>
<!-- Body-->
<body>
	<%--   ======================================상단 네비바 <<START>>======================================= --%>
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
					<input type="image" style="width: 320px;" id="kakaoAjax"
						src="main_img/kakao_login.jpg" value="카카오 로그인 kakaoLogin();">
					<br> <br> <a class="social-btn sb-facebook mx-2 mb-3"
						href="https://www.facebook.com/" data-toggle="tooltip"
						title="Facebook"><i class="flaticon-facebook"></i></a> <a
						class="social-btn sb-google-plus mx-2 mb-3"
						href="https://www.google.com/" data-toggle="tooltip"
						title="Google"><i class="flaticon-google-plus"></i></a> <a
						class="social-btn sb-twitter mx-2 mb-3"
						href="https://twitter.com/" data-toggle="tooltip" title="Twitter"><i
						class="flaticon-twitter"></i></a>
				</div>
			</div>
		</div>
	</div>


	<!-- Off-canvas cart-->
	<div class="offcanvas offcanvas-reverse" id="offcanvas-cart">
		<div
			class="offcanvas-header d-flex justify-content-between align-items-center">
			<h3 class="offcanvas-title"
				style="font-family: 'GmarketSansMedium'; font-size: 23px;">찜한
				레스토랑</h3>
			<button class="close" type="button" data-dismiss="offcanvas"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="offcanvas-body">
			<div class="offcanvas-body-inner">

				<div class="widget widget-featured-entries pt-3" id="marked-list">

					<%--찜 목록 리스트 (가게정보 출력란) --%>

					<div class="media">
						<div class="featured-entry-thumb mr-3">
							<a href="#"><img src="" width="64" alt="" /></a>
						</div>
						<div class="media-body">
							<h6 class="featured-entry-title">
								<a href="#"
									style="font-family: 'GmarketSansMedium'; font-size: 18px;">찜한
									가게 목록 불러오는중...</a>
							</h6>
							<p cxlass="featured-entry-meta">
								<span class="text-muted"></span>
							</p>
						</div>
					</div>
					<hr />
				</div>
			</div>
		</div>
	</div>

	<%--찜 목록 리스트 END  --%>



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
										<h3 class="widget-title">리뷰 남기기</h3>
										<ul>

											<li><a href="board_write.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">리뷰
														작성 </span></a></li>
										</ul>
									</div>
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
					<%
					if (session.getAttribute("id") != null) {
					%>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle"
						href="<%=request.getContextPath()%>/member_profile.do"><i
							class="mr-1"></i>마이페이지</a></li>

					<%
					}
					%>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="LoadRestaurantList.do"><i
							class="mr-1"></i>레스토랑</a></li>
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
					<a class="navbar-btn" href="#offcanvas-cart" onclick="loadMark();"
						data-toggle="offcanvas"><span
						class="d-block position-relative"><span
							class="navbar-btn-badge bg-primary-Mark text-light"
							id="totalMarkCount"></span><i class="mx-auto mb-1"
							data-feather="heart"></i>찜한 레스토랑</span></a> <a
						class="navbar-btn navbar-collapse-hidden" href="member/logout.jsp">
						<i class="mx-auto mb-1" data-feather="log-out"></i>로그아웃
					</a>

					<%-- 프로필 정보란 --%>
					<div class="navbar-btn navbar-collapse-hidden">
						<div class="kakao_img mx-auto mb-1">
							<a href="<%=request.getContextPath()%>/member_profile.do"> <img
								class="profile_img"
								src="${empty sessionScope.img ? Thumnail : sessionScope.img}">
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




	<!-- Page Content-->
	<div class="container pt-lg-3 pb-5 mb-sm-3">

		<form method="post" enctype="multipart/form-data"
			action="<%=request.getContextPath()%>/MemberProfileUpdate.do">
			<div class="row pt-5">

				<!-- Sidebar-->

				<div class="col-xl-3 col-lg-4">

					<c:set var="dto" value="${List }" />


					<!-- Customer picture-->
					<!-- 일반 프로필 -->

					<a class="gallery-item mb-grid-gutter mx-auto"
						style="max-width: 18.75rem;"> <img
						src="${empty sessionScope.img ? Thumnail : sessionScope.img}"
						id="current-image">
						<div id="image_container"></div>
						<div class="gallery-caption">
							<div class="gallery-indicator">
								<i class="gallery-indicator-icon" data-feather="refresh-ccw"></i>
							</div>
							<span id="Change_Profile">프로필 사진 변경</span>
						</div>
					</a> <input type="file" name="fileProfile" style="display: none;"
						onchange="setThumbnail(event);">


					<!-- Technical support + Tickets (visible Desktop)-->
					<div class="d-none d-lg-block" align="center">
						<h6 class="font-size-sm mb-3 pb-2 border-bottom">
							<span>${sessionScope.name} 님의 프로필</span>
							<c:if test="${sessionScope.type == 0}">
           					(Manager)
            			</c:if>

							<c:if test="${sessionScope.type == 1}">
           					(General Member)
            			</c:if>

							<c:if test="${sessionScope.type == 2}">
            				(Business Member)
            			</c:if>

							<c:if test="${sessionScope.type == 3}">
            				(Kakako Member)
            			</c:if>


						</h6>


						<ul class="list-unstyled">
							<li class="font-size-sm mb-2"><i class="text-muted mr-2"
								data-feather="mail" style="width: .875rem; height: .875rem;"></i><a
								class="nav-link-inline">${sessionScope.email}</a></li>
							<li class="font-size-sm mb-2"><i class="text-muted mr-2"
								data-feather="phone" style="width: .875rem; height: .875rem;"></i><a
								class="nav-link-inline">${sessionScope.phone}</a></li>

						</ul>
					</div>
				</div>
				<!-- Main content-->




				<div class="col-lg-8 offset-xl-1">
					<!-- Customer details-->
					<div class="d-flex flex-wrap justify-content-between pb-4">
						<div class="pt-3 mr-3">

							<h3 class="mb-0">${sessionScope.name}</h3>
							<span class="font-size-sm text-warning">${sessionScope.email}</span>
						</div>
						<div class="pt-3">
							<a class="btn btn-outline-primary btn-sm" data-toggle="modal"
								href="#modalCentered"
								onclick="location.href='#modalCentered?id=${sessionScope.id}'">
								<i class="mr-1" data-feather="log-out"></i>회원 탈퇴
							</a>
						</div>

					</div>
					<c:set var="join" value="${sessionScope.date}" />

					<ul class="list-unstyled border p-3 mb-4">
						<li class="pb-1"><span class="opacity-80">&ndash; 회원
								가입일 :</span><span class="font-weight-semibold ml-1">${sessionScope.date.substring(0,10)}</span></li>
						<li class="pb-1"><span class="opacity-80">&ndash; 총 예약
								: </span><span class="font-weight-semibold ml-1">${totalReservation}
								회</span></li>
					</ul>
					<!-- Navigation (visible sm-up)-->

					<c:set var="res_count" value="${totalReservation}"></c:set>
					<c:if test="${sessionScope.type != 2}">
						<ul class="nav nav-tabs d-none d-sm-flex">
							<li class="nav-item"><a class="nav-link active"
								href="<%=request.getContextPath()%>/reservation_list.do"> <i
									data-feather="shopping-bag"></i>&nbsp;예약내역 <span
									class="badge badge-pill badge-secondary bg-0 border ml-2">
										<span class="text-primary">${dayOverReservation}</span>
								</span></a></li>
							<li class="nav-item" onclick="loadMark();"><a
								class="nav-link" href="#offcanvas-cart" data-toggle="offcanvas">
									<i data-feather="heart"></i> &nbsp;찜한 레스토랑 <span
									class="badge badge-pill badge-second ary bg-0 border ml-2">
										<span class="text-primary" id="totalMarkCount1"></span>
								</span>
							</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/member_profile.do"><i
									data-feather="settings"></i>&nbsp;회원 수정</a></li>
						</ul>
					</c:if>

					<c:if test="${sessionScope.type == 2}">
						<ul class="nav nav-tabs d-none d-sm-flex">
							<li class="nav-item"><a class="nav-link"
								href="account-orders.html"> <i data-feather="shopping-bag"></i>&nbsp;
									가게 예약 현황 <span
									class="badge badge-pill badge-secondary bg-0 border ml-2">
										<span class="text-primary">1</span>
								</span></a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="modal"
								href="#modalLong"> <i data-feather="shopping-bag"></i>&nbsp;가게
									등록 <span
									class="badge badge-pill badge-secondary bg-0 border ml-2"></span></a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="modal"
								href="#Board_MainModify"> <i data-feather="shopping-bag"></i>&nbsp;가게
									정보 수정 <span
									class="badge badge-pill badge-secondary bg-0 border ml-2"></span></a></li>
							<li class="nav-item"><a class="nav-link" data-toggle="modal"
								data-target="#MenuInsert" href=""> <i
									data-feather="shopping-bag"></i>&nbsp;메뉴 등록 <span
									class="badge badge-pill badge-secondary bg-0 border ml-2"></span></a></li>
							<li class="nav-item"><a
								class="nav-link dropdown-toggle active" href="#"><i
									data-feather="settings"></i>&nbsp;회원 수정</a></li>
						</ul>
					</c:if>


					<!-- Orders table-->
					<c:set var="List" value="${ReservationList }" />
					<div class="table-responsive font-size-sm">
						<table class="table table-hover mb-0">
							<thead>
								<tr align="center">
									<th>예약번호</th>
									<th>가게이름</th>
									<th>요청사항</th>
									<th>인원</th>
									<th>예약날짜</th>
									<th>예약현황</th>
								</tr>
							</thead>
							<c:set var="now" value="<%=java.time.LocalDate.now()%>" />
							<tbody>
								<c:forEach items="${List }" var="booking">
									<c:if test="${booking.getD_day() < now }">
										<tr align="center">
											<td>${booking.getBooking_idx() }</td>
											<td><a class="nav-link-inline" href="#order-details"
												data-toggle="modal">${booking.getStore_name() }</a></td>
											<td>${booking.getRequest_text() }</td>
											<td>${booking.getMember_cnt() }명</td>
											<td>${booking.getD_day().substring(2,11) }&nbsp;${booking.getD_day().substring(11,13) }시
												${booking.getD_day().substring(14,16) }분</td>
											<td><span class="badge badge-success m-0">완료</span></td>
										</tr>
									</c:if>
									<c:if test="${booking.getD_day() > now }">
										<tr align="center">
											<td>${booking.getBooking_idx() }</td>
											<td><a class="nav-link-inline" href="#order-details"
												data-toggle="modal">${booking.getStore_name() }</a></td>
											<td>${booking.getRequest_text() }</td>
											<td>${booking.getMember_cnt() }명</td>
											<td>${booking.getD_day().substring(2,11) }&nbsp;${booking.getD_day().substring(11,13) }시
												${booking.getD_day().substring(14,16) }분</td>
											<td><span class="badge badge-info m-0">대기</span></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<hr class="pb-4">

					<!-- Pagination-->
					<nav aria-label="Page navigation">
						<ul
							class="pagination justify-content-center justify-content-sm-center mb-0">
							<li class="page-item"><a class="page-link"
								href="reservation_list.do?page=1">처음</a></li>
							<li class="page-item"><a class="page-link"
								href="reservation_list.do?page=${page - 1 }">이전</a></li>

							<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
								<c:if test="${i == page }">
									<li class="page-item active" aria-current="page"><a
										class="page-link" href="reservation_list.do?page=${i }">${i }</a></li>
								</c:if>

								<c:if test="${i != page }">
									<li class="page-item"><a class="page-link"
										href="reservation_list.do?page=${i }">${i }</a></li>
								</c:if>
							</c:forEach>

							<c:if test="${endBlock < allPage }">
								<li class="page-item"><a class="page-link"
									href="reservation_list.do?page=${page + 1 }">다음</a></li>

								<li class="page-item"><a class="page-link"
									href="reservation_list.do?page=${allPage }">마지막</a></li>
							</c:if>

						</ul>
					</nav>
					<div class="modal modal-quick-view fade"
						id="quick-view${detail.getMain_idx()}" tabindex="-1" role="dialog">
						<div class="modal-dialog" role="document">
							<input type="hidden" id="detail_idx"
								value="${detail.getMain_idx()}">
							<div class="modal-content">
								<input type="hidden" id="store_name"
									value="${detail.getMain_name()}">
								<div class="modal-header">
									<div>
										<h2 class="h2 modal-title mb-1"
											style="font-family: 'GmarketSansMedium';">${detail.getMain_name()}</h2>
										<h5 class="text-primary font-weight-light mb-0"
											style="font-family: 'GmarketSansMedium';">${detail.getMain_info() }</h5>
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
												<img src="${detail.getMain_img()}"
													alt="${detail.getMain_img()}"> <img
													src="${detail.getMain_img()}" alt="${detail.getMain_img()}">
												<img src="${detail.getMain_img()}"
													alt="${detail.getMain_img()}"> <img
													src="${detail.getMain_img()}" alt="${detail.getMain_img()}">
											</div>
										</div>
										<!-- Product details-->
										<div class="col-lg-5 pt-4 pt-lg-0">
											<form class="pb-4" method="post">
												<label for="resvation_date">예약날짜</label>

												<%-- 예약 시간 옵션 설정 예약 시간 옵션 설정 예약 시간 옵션 설정 예약 시간 옵션 설정  --%>

												<c:set var="opentime" value="${detail.getMain_opentime()}" />
												<c:set var="endtime" value="${detail.getMain_endtime()}" />
												<div class="form-group">
													<div class="form-inline pb-3" style="float: left;">
														<input class="form-control" type="date"
															id="resvation_date${detail.getMain_idx()}"
															name="resvation_date"
															min="<%=java.time.LocalDate.now()%>"
															value="<%=java.time.LocalDate.now()%>">
													</div>
													<div class="form-inline pb-3" style="float: left;">
														<select class="form-control custom-select"
															id="resvation_time${detail.getMain_idx()}"
															name="resvation_time" required>
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
															id="people-num${detail.getMain_idx()}" name="people-num"
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
												<textarea class="form-control"
													id="request-text${detail.getMain_idx()}" rows="3"
													name="request-text" style="resize: none;"
													placeholder="요청사항 혹은 알러지 음식을 작성해주세요"></textarea>
												<div class="d-flex flex-wrap align-items-center pt-1">

													<div>
														<button class="reservation-btn btn btn-primary px-5 mr-2"
															type="button">
															<i class="mr-2" data-feather="shopping-cart"
																style="font-family: 'GmarketSansMedium';"></i>예약하기
														</button>

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
														<li>주소 : ${detail.getMain_addr() }
															${detail.getMain_detailaddr() }<br> 우편번호 :
															${detail.getMain_post() }
														</li>
														<br>
														<li>전화 : ${detail.getMain_phone() }</li>
														<br>
														<li>=======정보=======<br>${detail.getMain_info()}</li>
														<br>
														<li>음식 종류 : ${detail.getMain_type() }</li>
														<br>
														<li>오픈시간 : ${detail.getMain_opentime()} ~ 마감시간 :
															${detail.getMain_endtime() }</li>
													</ul>
												</div>
											</div>
										</div>


										<div class="input-group">

											<div class="starRev" id="starRev">
												<span class="starR on">⭐</span> <span class="starR">⭐</span>
												<span class="starR">⭐</span> <span class="starR">⭐</span> <span
													class="starR">⭐</span>
											</div>
											<div class="input-group starInsert-idx">
												<input type="hidden" id="detail_idx"
													value="${detail.getMain_idx()}">
												<textarea name="review" class="form-control" type="text"
													id="reviewContents${detail.getMain_idx()}"
													placeholder="리뷰 작성"></textarea>

												<br>
												<button class="btn btn-primary starInsert" type="button"
													id="starInsert">등록</button>
											</div>
										</div>



									</div>
								</div>
							</div>
						</div>
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
											<input name="main_post" id="post" type="text"
												class="location" placeholder="우편번호" readonly
												onclick="findAddr()"> <input name="main_addr"
												id="addr" type="text" class="location" placeholder="주소"
												readonly> <input name="main_detailaddr" type="text"
												class="location" placeholder="상세 주소">
										</div>

										<div class="textForm">
											<input name="main_phone" type="text" class="phone"
												placeholder="전화번호">
										</div>

										<div class="image">
											<span class="pic_txt">가게등록 사진</span> <input class="main_file"
												type="file" name="main_img">
										</div>
										<br>

										<div class="modal-footer">
											<button type="button" class="btn btn-secondary btn-sm"
												data-dismiss="modal">Close</button>
											<input type="submit" class="btn btn-primary btn-sm"
												value="가입하기" />
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- modal end -->

					<!-- 가게 수정 Modal markup -->
					<c:set var="main" value="${boardmain }" />
					<div class="modal" tabindex="-1" role="dialog"
						id="Board_MainModify">
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
										<input type="hidden" class="main_idx" id="main_idx"
											value="${main.getMain_idx() }">
										<div class="select-box">
											<label for="select-box1" class="label select-box2"> <span
												class="label-desc">가게 타입</span>
											</label> <select id="select-box1" class="select" name="main_type"
												value="${main.getMain_type()}">
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
											</label> <select id="select-box2" class="select1" name="main_thema"
												value="${main.getMain_thema()}">
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
											<input name="main_post" id="post" type="text"
												class="location" value="${main.getMain_post() }" readonly
												onclick="findAddr()"> <input name="main_addr"
												id="addr" type="text" class="location"
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
											<input type="submit" class="btn btn-primary btn-sm"
												value="수정하기" />
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- modal end -->



					<!-- 메뉴 Modal markup -->
					<div class="modal" tabindex="-1" role="dialog" id="MenuInsert">
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

									<form method="post" enctype="multipart/form-data" name="inForm"
										id="inForm" width="100%">
										<table cellspacing="0" align="center" width="90%">
											<tr class="table_bg">
												<th></th>
												<th></th>
												<th></th>
											</tr>

											<tr>
												<td class="1"><input type="text" name="menu_name"
													id="menu_name" placeholder="메뉴 이름"></td>

												<td class="menu_price1"><input type="text" required
													name="menu_price" id="menu_price" placeholder="메뉴 가격">
												</td>


												<td><img id="menu_img_preview" style="width: 100px;"></td>
												<td><label class='btn btn-secondary btn-sm'
													for="menu_img" name="menu_img" style="margin-top: 7px">
														사진 선택 </label>
												<td><input type="file" id="menu_img" name="menu_img"
													style="display: none" accept="image/*"
													onchange="previewImage(event)"></td>
												<input type="hidden" name="main_idx" id="main_idx"
													value="${main.getMain_idx() }">
												<td align="center"><input type="button"
													class="btn btn-primary btn-sm" value="등록하기" id="menubtn">
												</td>

											</tr>

										</table>
									</form>

									<br>
									<form method="post" enctype="multipart/form-data" name="upForm"
										id="upForm" width="100%">
										<br> <span align="center"><h5>메뉴 리스트</h5></span>
										<table id="listTable" border="1" cellspacing="0" width="90%"
											bordercolor="#e3e3e3">
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
								<form method="post"
									action="<%=request.getContextPath()%>/member_delete_ok.do">
									<div class="modal-header">
										<h5 class="modal-title">회원 탈퇴</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">

										<input type="hidden" name="member_id"
											value="${dto.getMember_id()}"> <br>
										<p align="center">회원 탈퇴를 위해 ${dto.getMember_name()}님의
											비밀번호를 입력해주세요.</p>
										<div class="textForm">
											<input name="member_pwd" type="text" class="phone"
												placeholder="비밀번호">
										</div>
										<div align="right">
											<button type="submit" class="btn btn-primary btn-md"
												id="member_del">회원 탈퇴</button>
										</div>
									</div>

								</form>
							</div>
						</div>
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
								<li><a class="nav-link-inline nav-link-light"
									href="LoadRestaurantList.do"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">가게
											검색</span></a></li>
								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">가게
											등록(사장님)</span></a></li>
								<li><a class="nav-link-inline nav-link-light"
									href="LoadRestaurantList.do"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">가격으로
											검색</span></a></li>
								<li><a class="nav-link-inline nav-link-light"
									href="#quick-view-kakako" data-toggle="modal"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">문의</span></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-3 col-sm-6">
						<div class="widget widget-links pb-4">
							<h3 class="widget-title text-white border-light">계정 관리</h3>
							<ul>
								<li><a class="nav-link-inline nav-link-light"
									href="<%=request.getContextPath()%>/member_profile.do"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">계정
											자세히</span></a></li>
								<li><a class="nav-link-inline nav-link-light"
									href="<%=request.getContextPath()%>/member_profile.do"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">회원탈퇴</span></a></li>
							</ul>
						</div>
						<div class="widget widget-links pb-4">
							<h3 class="widget-title text-white border-light">Fooding
								Info</h3>
							<ul>

								<li><a class="nav-link-inline nav-link-light" href="#"><i
										class="widget-categories-indicator"
										data-feather="chevron-right"></i><span class="font-size-sm">About_
											Project</span></a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-4 offset-xl-1 col-md-5">
						<div class="widget">

							<!-- Mobile app download-->
							<div class="widget pb-4">
								<h3 class="widget-title text-white border-light">다운로드
									Fooding 앱</h3>
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
								class="nav-link-inline nav-link-light"
								href="LoadRestaurantList.do">가게</a></li>
							<li class="list-inline-item mr-3"><a
								class="nav-link-inline nav-link-light" href="#brandSlide">브랜드관</a></li>
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

	<!-- 카카오 문의하기 모달 -->
	<div class="modal modal-quick-view fade" id="quick-view-kakako"
		tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<div>
						<h1 class="h1 modal-title mb-1">카카오톡 문의하기</h1>
					</div>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Product gallery-->
					<div class="col-cg-10" align="center">
						<a href="https://open.kakao.com/o/sStYAar"><img
							src="main_img/카카오상담.png" alt="Product"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 카카오 문의하기 모달 끝 -->


	<!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="js/loadMarkedRstAjax.js"></script>
	<script src="js/sign_upChk.js"></script>
	<script src="js/Board_Main.js"></script>
	<script src="js/kakao_login.js"></script>
	<script src="js/StoreMarked.js"></script>
	<script src="js/main_card.js"></script>
	<script src="js/LoginChk.js"></script>
	<script src="js/vendor.min.js"></script>
	<script src="js/theme.min.js"></script>
	<script>
		$('.toast').toast({
			delay : 3000
		});
	</script>
</body>
</html>