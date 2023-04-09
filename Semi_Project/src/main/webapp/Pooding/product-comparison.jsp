<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>MStore | Modern Bootstrap E-commerce Template
    </title>
    <!-- SEO Meta Tags-->
    <meta name="description" content="MStore - Modern Bootstrap E-commerce Template">
    <meta name="keywords" content="bootstrap, shop, e-commerce, market, modern, responsive,  business, mobile, bootstrap 4, html5, css3, jquery, js, gallery, slider, touch, creative, clean">
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
    <!-- Vendor Styles including: Font Icons, Plugins, etc.-->
    <link rel="stylesheet" media="screen" href="css/vendor.min.css">
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" id="main-styles" href="css/theme.min.css">
    <!-- Customizer styles and scripts-->
  </head>
  <!-- Body-->
  <body>

	<%
	String userID = null; // 로그인이 된 사람들은 로그인정보를 담을 수 있도록한다
	if (session.getAttribute("id") != null) {
		userID = (String) session.getAttribute("id");
	}
	%>
	<!-- Off-canvas search-->
	<div class="offcanvas offcanvas-reverse" id="offcanvas-search">
		<div
			class="offcanvas-header d-flex justify-content-between align-items-center">
			<h3 class="offcanvas-title">Search site</h3>
			<button class="close" type="button" data-dismiss="offcanvas"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="offcanvas-body">
			<div class="offcanvas-body-inner">
				<div class="input-group pt-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="search-icon"><i
							data-feather="search"></i></span>
					</div>
					<input class="form-control" type="text" id="site-search"
						placeholder="Search site" aria-label="Search site"
						aria-describedby="search-icon" />
				</div>
				<small class="form-text pt-1">Type A or C to see
					suggestions. Powered by Easy autocomplete plugin via separate JSON
					file.</small>
			</div>
		</div>
	</div>



	<%
	// 접속하기는 로그인이 되어있지 않은 경우만 나오게한다
	if (userID == null) {
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
					<div class="tab-pane fade" id="signup" role="tabpanel">
						<form class="needs-validation" novalidate>
							<div class="form-group">
								<label class="sr-only" for="signup-name">Full name</label> <input
									class="form-control" type="text" id="signup-name"
									placeholder="이름" aria-label="Full name" required />
								<div class="invalid-feedback">이름을 작성해주세요</div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-email">이메일</label> <input
									class="form-control" type="email" id="signup-email"
									placeholder="Email" aria-label="Email address" required />
								<div class="invalid-feedback">이메일을 작성해주세요</div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-password">Password</label> <input
									class="form-control" type="password" id="signup-password"
									placeholder="Password" aria-label="Password" required />
								<div class="invalid-feedback">비밀번호를 작성해주세요</div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-password-confirm">비밀번호
									확인</label> <input class="form-control" type="password"
									id="signup-password-confirm" placeholder="Confirm password"
									aria-label="Confirm password" required />
								<div class="invalid-feedback">비밀번호 확인을 작성해주세요</div>
							</div>
							<button class="btn btn-primary btn-block" type="submit">
								가입하기</button>
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

	<%
	// 로그인이 되어있는 사람만 볼수 있는 화면
	} else {
	%>
	<div class="offcanvas offcanvas-reverse" id="offcanvas-account">
		<div
			class="offcanvas-header d-flex justify-content-between align-items-center">
			<h3 class="offcanvas-title">로그인 / 회원가입</h3>
			<button class="close" type="button" data-dismiss="offcanvas"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
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
							<button class="btn btn-primary btn-block" type="button"
								onclick="location.href='../member/logout.jsp'">로그아웃</button>
						</form>
					</div>
					<div class="tab-pane fade" id="signup" role="tabpanel">
						<form class="needs-validation" novalidate>
							<div class="form-group">
								<label class="sr-only" for="signup-name">Full name</label> <input
									class="form-control" type="text" id="signup-name"
									placeholder="이름" aria-label="Full name" required />
								<div class="invalid-feedback">이름을 작성해주세요</div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-email">이메일</label> <input
									class="form-control" type="email" id="signup-email"
									placeholder="Email" aria-label="Email address" required />
								<div class="invalid-feedback">이메일을 작성해주세요</div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-password">Password</label> <input
									class="form-control" type="password" id="signup-password"
									placeholder="Password" aria-label="Password" required />
								<div class="invalid-feedback">비밀번호를 작성해주세요</div>
							</div>
							<div class="form-group">
								<label class="sr-only" for="signup-password-confirm">비밀번호
									확인</label> <input class="form-control" type="password"
									id="signup-password-confirm" placeholder="Confirm password"
									aria-label="Confirm password" required />
								<div class="invalid-feedback">비밀번호 확인을 작성해주세요</div>
							</div>
							<button class="btn btn-primary btn-block" type="submit">
								가입하기</button>
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

	<%
	}
	%>
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
				width="100" src="img/logo-dark.png" alt="MStore" /></a>
			<!-- navbar collapse area-->
			<div class="collapse navbar-collapse" id="menu">
				<!-- Site menu-->
				<ul class="navbar-nav">
					<li class="nav-item dropdown mega-dropdown dropdown-more"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Categories<i
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
													data-feather="chevron-right"></i><span class="font-size-sm">수원</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">충남</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">부산</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">광주</span></a></li>
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
													data-feather="chevron-right"></i><span class="font-size-sm">Computers
														&amp; Accessories</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">TV,
														Video &amp; Audio</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Smartphones
														&amp; Tablets</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Cameras,
														Photo &amp; Video</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Headphones</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Wearable
														Electronics</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Video
														Games</span></a></li>
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
													data-feather="chevron-right"></i><span class="font-size-sm">Lounge
														Seating</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">File
														Cabinets</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Tables</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Indoor
														Lighting</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Office
														Chairs</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Adjustable
														Height Desks</span></a></li>
											<li><a href="#"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Storage
														Units</span></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div></li>
					<li class="nav-item dropdown mega-dropdown"><a
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Shop</a>
						<div class="dropdown-menu">
							<div class="dropdown-inner">
								<div class="dropdown-column">
									<div class="widget widget-links">
										<h3 class="widget-title">Shop layouts</h3>
										<ul>
											<li><a href="shop-style1-ls.jsp"> <i
													class="widget-categories-indicator"
													data-feather="chevron-right"> </i><span
													class="font-size-sm">Shop Style 1 - Left Sidebar</span></a></li>
										</ul>
									</div>
								</div>
								<div class="dropdown-column">
									<div class="widget widget-links">
										<h3 class="widget-title">Shop pages</h3>
										<ul>
											<li><a href="shop-categories-apparel.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Shop
														Categories - Apparel</span></a></li>

											<li><a href="shop-single-apparel.jsp"><i
													class="widget-categories-indicator"
													data-feather="chevron-right"></i><span class="font-size-sm">Product
														Page #1 - Apparel</span></a></li>

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
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Pages</a>
						<ul class="dropdown-menu">
							<li class="dropdown"><a
								class="dropdown-item dropdown-toggle" href="#"
								data-toggle="dropdown">User Account</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="account-orders.jsp">Orders
											History</a></li>
									<li class="dropdown-divider"></li>
									<li><a class="dropdown-item" href="account-profile.jsp">Profile
											Settings</a></li>
									<li class="dropdown-divider"></li>
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
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Blog</a>
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
						class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"><i
							class="mr-1" data-feather="file-text"></i>Docs</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="docs/dev-setup.jsp">
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="file-text"
											style="width: 1.4375rem; height: 1.4375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">Documentation</span><small
												class="text-muted">Kick-start customization</small>
										</div>
									</div>
							</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="components/alerts.jsp">
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="grid"
											style="width: 1.375rem; height: 1.375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">Components <span
												class="badge badge-pill badge-success">40+</span>
											</span><small class="text-muted">Faster page building</small>
										</div>
									</div>
							</a></li>
							<li class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="docs/changelog.jsp">
									<div class="d-flex py-1">
										<i class="mt-1 ml-n2" data-feather="edit"
											style="width: 1.375rem; height: 1.375rem"></i>
										<div class="ml-2">
											<span class="d-block mb-n1">Changelog <span
												class="badge badge-pill badge-warning">v2.0</span>
											</span><small class="text-muted">Regular updates</small>
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
					<a class="navbar-btn" href="#offcanvas-search"
						data-toggle="offcanvas"><i class="mx-auto mb-1"
						data-feather="search"></i>Search</a>
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
						href="#offcanvas-account" data-toggle="offcanvas"><i
						class="mx-auto mb-1" data-feather="log-out"></i>내정보</a>

					<% } %>
					<a class="navbar-btn" href="#offcanvas-cart"
						data-toggle="offcanvas"><span
						class="d-block position-relative"><span
							class="navbar-btn-badge bg-primary text-light">4</span><i
							class="mx-auto mb-1" data-feather="shopping-cart"></i>$325.00</span></a>
				</div>
			</div>
		</div>
	</header>
    <!-- Third line: Navigation-->
    <div class="navbar navbar-expand-lg navbar-light bg-light px-0">
      <div class="container px-3">
        <!-- navbar collapse area-->
        <div class="collapse navbar-collapse" id="menu">
          <!-- language/currency switcher-->
          <div class="navbar-lang-switcher dropdown pr-2">
            <div class="dropdown-toggle" data-toggle="dropdown"><img width="20" src="img/flags/en.png" alt="English"/><span>USD</span>
            </div>
            <ul class="dropdown-menu dropdown-menu-left">
              <li class="dropdown-item">
                <select class="custom-select custom-select-sm">
                  <option value="usd">$ USD</option>
                  <option value="usd">â¬ EUR</option>
                  <option value="usd">Â£ UKP</option>
                  <option value="usd">Â¥ JPY</option>
                </select>
              </li>
              <li><a class="dropdown-item" href="index.html"><img class="mr-2" width="20" src="img/flags/fr.png" alt="FranÃ§ais"/>FranÃ§ais</a></li>
              <li class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#"><img class="mr-2" width="20" src="img/flags/de.png" alt="Deutsch"/>Deutsch</a></li>
              <li class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#"><img class="mr-2" width="20" src="img/flags/it.png" alt="Italiano"/>Italiano</a></li>
            </ul>
          </div>
          <!-- Site menu-->
          <ul class="navbar-nav">
            <li class="nav-item dropdown mega-dropdown dropdown-more"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Categories<i data-feather="more-horizontal"></i></a>
              <div class="dropdown-menu">
                <div class="dropdown-inner">
                  <div class="dropdown-column">
                    <div class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3" style="background-image: url(img/megamenu/cat_bg02.jpg);">
                      <h3 class="h5 text-white text-shadow my-3">Apparel</h3>
                    </div>
                    <div class="widget widget-links">
                      <ul>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Clothing</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Shoes</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Handbags &amp; Backpacks</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Hats &amp; Caps</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Sunglasses</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Watches</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Accessories</span></a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="dropdown-column">
                    <div class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3" style="background-image: url(img/megamenu/cat_bg01.jpg);">
                      <h3 class="h5 text-white text-shadow my-3">Electronics</h3>
                    </div>
                    <div class="widget widget-links">
                      <ul>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Computers &amp; Accessories</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">TV, Video &amp; Audio</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Smartphones &amp; Tablets</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Cameras, Photo &amp; Video</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Headphones</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Wearable Electronics</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Video Games</span></a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="dropdown-column">
                    <div class="bg-position-center bg-no-repeat bg-size-cover text-center px-3 py-4 mb-3" style="background-image: url(img/megamenu/cat_bg03.jpg);">
                      <h3 class="h5 text-white text-shadow my-3">Furniture &amp; Decor</h3>
                    </div>
                    <div class="widget widget-links">
                      <ul>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Lounge Seating</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">File Cabinets</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Tables</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Indoor Lighting</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Office Chairs</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Adjustable Height Desks</span></a></li>
                        <li><a href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Storage Units</span></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </li>
            <li class="nav-item dropdown mega-dropdown"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Home</a>
              <div class="dropdown-menu">
                <div class="dropdown-inner"><a class="dropdown-column text-decoration-0" href="home-apparel.html"><img class="d-block img-thumbnail mb-2" src="img/megamenu/home-apparel.jpg" alt="Home Apparel Shop">
                    <div class="text-center font-weight-semibold text-dark">Home Apparel Shop</div></a><a class="dropdown-column text-decoration-0" href="home-electronics.html"><img class="d-block img-thumbnail mb-2" src="img/megamenu/home-electronics.jpg" alt="Home Electronics Store">
                    <div class="text-center font-weight-semibold text-dark">Home Electronics Store</div></a></div>
              </div>
            </li>
            <li class="nav-item dropdown mega-dropdown"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Shop</a>
              <div class="dropdown-menu">
                <div class="dropdown-inner">
                  <div class="dropdown-column">
                    <div class="widget widget-links">
                      <h3 class="widget-title">Shop layouts</h3>
                      <ul>
                        <li><a href="shop-style1-ls.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Shop Style 1 - Left Sidebar</span></a></li>
                        <li><a href="shop-style1-rs.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Shop Style 1 - Right Sidebar</span></a></li>
                        <li><a href="shop-style1-ft.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Shop Style 1 - Filters Top</span></a></li>
                        <li><a href="shop-style2-ls.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Shop Style 2 - Left Sidebar</span></a></li>
                        <li><a href="shop-style2-rs.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Shop Style 2 - Right Sidebar</span></a></li>
                        <li><a href="shop-style2-ft.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Shop Style 2 - Filters Top</span></a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="dropdown-column">
                    <div class="widget widget-links">
                      <h3 class="widget-title">Shop pages</h3>
                      <ul>
                        <li><a href="shop-categories-apparel.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Shop Categories - Apparel</span></a></li>
                        <li><a href="shop-categories-electronics.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Shop Categories - Electronics</span></a></li>
                        <li><a href="shop-single-apparel.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Product Page #1 - Apparel</span></a></li>
                        <li><a href="shop-single-electronics.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Product Page #2 - Electronics</span></a></li>
                        <li><a href="cart.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Cart</span></a></li>
                        <li><a href="checkout-details.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Checkout - Details</span></a></li>
                        <li><a href="checkout-shipping.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Checkout - Shipping</span></a></li>
                        <li><a href="checkout-payment.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Checkout - Payment</span></a></li>
                        <li><a href="checkout-review.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Checkout - Review</span></a></li>
                        <li><a href="checkout-complete.html"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Checkout - Complete</span></a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="dropdown-column"><a class="d-block mx-auto" href="#" style="max-width: 228px;"><img class="d-block" src="img/megamenu/promo-banner.jpg" alt="Promo banner"></a></div>
                </div>
              </div>
            </li>
            <li class="nav-item dropdown active"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Pages</a>
              <ul class="dropdown-menu">
                <li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-toggle="dropdown">User Account</a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="account-orders.html">Orders History</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="account-profile.html">Profile Settings</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="account-address.html">Account Addresses</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="account-payment.html">Payment Methods</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="account-wishlist.html">Wishlist</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="account-tickets.html">My Tickets</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="account-single-ticket.html">Single Ticket</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="account-signin.html">Sign In / Sign Up Page</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="account-password-recovery.html">Password Recovery</a></li>
                  </ul>
                </li>
                <li class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="about.html">About Us</a></li>
                <li class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="contacts.html">Contacts</a></li>
                <li class="dropdown-divider"></li>
                <li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-toggle="dropdown">Help Center</a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="help-topics.html">Help Topics</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="help-single-topic.html">Single Topic</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="help-submit-request.html">Submit a Request</a></li>
                  </ul>
                </li>
                <li class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="product-comparison.html">Product Comparison</a></li>
                <li class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="order-tracking.html">Order Tracking</a></li>
                <li class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="404.html">404 Not Found</a></li>
              </ul>
            </li>
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">Blog</a>
              <ul class="dropdown-menu">
                <li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-toggle="dropdown">Blog Layout</a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="blog-rs.html">Blog Right Sidebar</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="blog-ls.html">Blog Left Sidebar</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="blog-ns.html">Blog No Sidebar</a></li>
                  </ul>
                </li>
                <li class="dropdown-divider"></li>
                <li class="dropdown"><a class="dropdown-item dropdown-toggle" href="#" data-toggle="dropdown">Single Post Layout</a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="blog-single-rs.html">Post Right Sidebar</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="blog-single-ls.html">Post Left Sidebar</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="blog-single-ns.html">Post No Sidebar</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"><i class="mr-1" data-feather="file-text"></i>Docs</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="docs/dev-setup.html">
                    <div class="d-flex py-1"><i class="mt-1 ml-n2" data-feather="file-text" style="width: 1.4375rem; height: 1.4375rem;"></i>
                      <div class="ml-2"><span class="d-block mb-n1">Documentation</span><small class="text-muted">Kick-start customization</small></div>
                    </div></a></li>
                <li class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="components/alerts.html">
                    <div class="d-flex py-1"><i class="mt-1 ml-n2" data-feather="grid" style="width: 1.375rem; height: 1.375rem;"></i>
                      <div class="ml-2"><span class="d-block mb-n1">Components <span class='badge badge-pill badge-success'>40+</span></span><small class="text-muted">Faster page building</small></div>
                    </div></a></li>
                <li class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="docs/changelog.html">
                    <div class="d-flex py-1"><i class="mt-1 ml-n2" data-feather="edit" style="width: 1.375rem; height: 1.375rem;"></i>
                      <div class="ml-2"><span class="d-block mb-n1">Changelog <span class='badge badge-pill badge-warning'>v2.0</span></span><small class="text-muted">Regular updates</small></div>
                    </div></a></li>
                <li class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="mailto:contact@createx.studio">
                    <div class="d-flex py-1"><i class="mt-1 ml-n2" data-feather="life-buoy" style="width: 1.4375rem; height: 1.4375rem;"></i>
                      <div class="ml-2"><span class="d-block mb-n1">Support</span><small class="text-muted">contact@createx.studio</small></div>
                    </div></a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- Page Title-->
    <div class="page-title-wrapper" aria-label="Page title">
      <div class="container">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb">
            <li class="mt-n1 mr-1"><i data-feather="home"></i></li>
            <li class="breadcrumb-item"><a href="index.html">Home</a>
            </li>
            <li class="breadcrumb-item"><a href="#">Pages</a>
            </li>
          </ol>
        </nav>
        <h1 class="page-title">Product comparison</h1><span class="d-block mt-2 text-muted"></span>
        <hr class="mt-4">
      </div>
    </div>
    <!-- Page Content-->
    <!-- Toast notifications-->
    <div class="toast-container toast-bottom-center">
      <div class="toast mb-3" id="cart-toast" data-delay="5000" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header bg-success text-white"><i class="mr-2" data-feather="check-circle" style="width: 1.25rem; height: 1.25rem;"></i><span class="font-weight-semibold mr-auto">Added to cart!</span>
          <button class="close text-white ml-2 mb-1" type="button" data-dismiss="toast" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="toast-body">This item was added to your cart.</div>
      </div>
      <div class="toast mb-3" id="compare-toast" data-delay="5000" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header bg-info text-white"><i class="mr-2" data-feather="info" style="width: 1.25rem; height: 1.25rem;"></i><span class="font-weight-semibold mr-auto">Added to comparison!</span>
          <button class="close text-white ml-2 mb-1" type="button" data-dismiss="toast" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="toast-body">This item was added to comparison table.</div>
      </div>
      <div class="toast mb-3" id="wishlist-toast" data-delay="5000" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header bg-info text-white"><i class="mr-2" data-feather="info" style="width: 1.25rem; height: 1.25rem;"></i><span class="font-weight-semibold mr-auto">Added to wishlist!</span>
          <button class="close text-white ml-2 mb-1" type="button" data-dismiss="toast" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="toast-body">This item was added to your wishlist.</div>
      </div>
      <div class="toast mb-3" id="profile-toast" data-delay="5000" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header bg-success text-white"><i class="mr-2" data-feather="check-circle" style="width: 1.25rem; height: 1.25rem;"></i><span class="font-weight-semibold mr-auto">Updated!</span>
          <button class="close text-white ml-2 mb-1" type="button" data-dismiss="toast" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="toast-body">Your profile info updated successfuly.</div>
      </div>
      <div class="toast mb-3" id="address-toast" data-delay="5000" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header bg-success text-white"><i class="mr-2" data-feather="check-circle" style="width: 1.25rem; height: 1.25rem;"></i><span class="font-weight-semibold mr-auto">Updated!</span>
          <button class="close text-white ml-2 mb-1" type="button" data-dismiss="toast" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="toast-body">Your addresses info updated successfuly.</div>
      </div>
    </div>
    <div class="container pb-5 mb-2">
      <div class="comparison-table">
        <table class="table table-bordered">
          <thead class="bg-secondary">
            <tr>
              <td class="align-middle">
                <select class="form-control custom-select" id="compare-criteria" data-filter="trigger">
                  <option value="all">Comparison criteria *</option>
                  <option value="summary">Summary</option>
                  <option value="general">General</option>
                  <option value="multimedia">Multimedia</option>
                  <option value="performance">Performance</option>
                  <option value="design">Design</option>
                  <option value="display">Display</option>
                  <option value="storage">Storage</option>
                  <option value="camera">Camera</option>
                  <option value="battery">Battery</option>
                  <option value="price">Price &amp; rating</option>
                </select><small class="form-text text-muted">* Choose criteria to filter table below.</small>
                <div class="pt-3">
                  <div class="custom-control custom-checkbox">
                    <input class="custom-control-input" type="checkbox" id="differences">
                    <label class="custom-control-label" for="differences">Show differences only</label>
                  </div>
                </div>
              </td>
              <td>
                <div class="comparison-item"><span class="remove-item"><i data-feather="x"></i></span><a class="comparison-item-thumb" href="shop-single.html"><img src="img/shop/comparison/01.jpg" alt="Apple iPhone Xs Max"></a><a class="comparison-item-title" href="shop-single.html">Apple iPhone Xs Max</a>
                  <button class="btn btn-pill btn-outline-primary btn-sm" type="button" data-toggle="toast" data-target="#cart-toast">Add to Cart</button>
                </div>
              </td>
              <td>
                <div class="comparison-item"><span class="remove-item"><i data-feather="x"></i></span><a class="comparison-item-thumb" href="shop-single.html"><img src="img/shop/comparison/02.jpg" alt="Google Pixel 3 XL"></a><a class="comparison-item-title" href="shop-single.html">Google Pixel 3 XL</a>
                  <button class="btn btn-pill btn-outline-primary btn-sm" type="button" data-toggle="toast" data-target="#cart-toast">Add to Cart</button>
                </div>
              </td>
              <td>
                <div class="comparison-item"><span class="remove-item"><i data-feather="x"></i></span><a class="comparison-item-thumb" href="shop-single.html"><img src="img/shop/comparison/03.jpg" alt="Samsung Galaxy S10+"></a><a class="comparison-item-title" href="shop-single.html">Samsung Galaxy S10+</a>
                  <button class="btn btn-pill btn-outline-primary btn-sm" type="button" data-toggle="toast" data-target="#cart-toast">Add to Cart</button>
                </div>
              </td>
            </tr>
          </thead>
          <tbody id="summary" data-filter="target">
            <tr class="bg-secondary">
              <th class="text-uppercase">Summary</th>
              <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
              <td><span class="text-dark font-weight-semibold">Google Pixel 3 XL</span></td>
              <td><span class="text-dark font-weight-semibold">Samsung Galaxy S10+</span></td>
            </tr>
            <tr>
              <th>Performance</th>
              <td>Hexa Core</td>
              <td>Octa Core</td>
              <td>Octa Core</td>
            </tr>
            <tr>
              <th>Display</th>
              <td>6.5-inch</td>
              <td>6.3-inch</td>
              <td>6.4-inch</td>
            </tr>
            <tr>
              <th>Storage</th>
              <td>64 GB</td>
              <td>64 GB</td>
              <td>128 GB</td>
            </tr>
            <tr>
              <th>Camera</th>
              <td>Dual 12-megapixel</td>
              <td>12.2-megapixel</td>
              <td>12,16,12-megapixel</td>
            </tr>
            <tr>
              <th>Battery</th>
              <td>3,174 mAh</td>
              <td>3,430 mAh</td>
              <td>4,100 mAh</td>
            </tr>
          </tbody>
          <tbody id="general" data-filter="target">
            <tr class="bg-secondary">
              <th class="text-uppercase">General</th>
              <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
              <td><span class="text-dark font-weight-semibold">Google Pixel 3 XL</span></td>
              <td><span class="text-dark font-weight-semibold">Samsung Galaxy S10+</span></td>
            </tr>
            <tr>
              <th>Quick charging</th>
              <td>Yes</td>
              <td>Yes</td>
              <td>Yes</td>
            </tr>
            <tr>
              <th>Operating system</th>
              <td>iOS v12</td>
              <td>Android v9.0 Pie	</td>
              <td>Android v9.0 with Samsung One UI	</td>
            </tr>
            <tr>
              <th>Sim slots</th>
              <td>Single SIM, GSM</td>
              <td>Single SIM, GSM</td>
              <td>Hybrid SIM slot, GSM</td>
            </tr>
            <tr>
              <th>Launch date</th>
              <td>September 12, 2018 (Official)</td>
              <td>November 1, 2018 (Official)</td>
              <td>February 20, 2019 (Official)</td>
            </tr>
            <tr>
              <th>Sim size</th>
              <td>SIM1: Nano</td>
              <td>SIM1: Nano</td>
              <td>SIM1: Nano SIM2: Nano (Hybrid)</td>
            </tr>
            <tr>
              <th>Network</th>
              <td>4G: Available (supports Indian bands) 3G: Available, 2G: Available</td>
              <td>4G: Available (supports Indian bands) 3G: Available, 2G: Available</td>
              <td>4G: Available (supports Indian bands) 3G: Available, 2G: Available</td>
            </tr>
            <tr>
              <th>Fingerprint sensor</th>
              <td>None (Face ID)</td>
              <td>Back cover</td>
              <td>In-screen</td>
            </tr>
          </tbody>
          <tbody id="multimedia" data-filter="target">
            <tr class="bg-secondary">
              <th class="text-uppercase">Multimedia</th>
              <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
              <td><span class="text-dark font-weight-semibold">Google Pixel 3 XL</span></td>
              <td><span class="text-dark font-weight-semibold">Samsung Galaxy S10+</span></td>
            </tr>
            <tr>
              <th>Loudspeaker</th>
              <td>Yes</td>
              <td>Yes</td>
              <td>Yes</td>
            </tr>
            <tr>
              <th>FM radio</th>
              <td>No</td>
              <td>No</td>
              <td>No</td>
            </tr>
            <tr>
              <th>Headphone jack</th>
              <td>No</td>
              <td>No</td>
              <td>Yes</td>
            </tr>
          </tbody>
          <tbody id="performance" data-filter="target">
            <tr class="bg-secondary">
              <th class="text-uppercase">Performance</th>
              <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
              <td><span class="text-dark font-weight-semibold">Google Pixel 3 XL</span></td>
              <td><span class="text-dark font-weight-semibold">Samsung Galaxy S10+</span></td>
            </tr>
            <tr>
              <th>Processor</th>
              <td>Apple A12 Bionic</td>
              <td>Qualcomm Snapdragon 845 (2.5GHz octa-core)</td>
              <td>Octa-core Qualcomm Snapdragon 855</td>
            </tr>
            <tr>
              <th>Graphics</th>
              <td>Apple GPU (4-core graphics)</td>
              <td>Adreno 630</td>
              <td>Mali-G72 MP18</td>
            </tr>
            <tr>
              <th>Architecture</th>
              <td>64 bit</td>
              <td>64 bit</td>
              <td>64 bit</td>
            </tr>
            <tr>
              <th>RAM</th>
              <td>4 GB</td>
              <td>4 GB</td>
              <td>8 GB</td>
            </tr>
          </tbody>
          <tbody id="design" data-filter="target">
            <tr class="bg-secondary">
              <th class="text-uppercase">Design</th>
              <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
              <td><span class="text-dark font-weight-semibold">Google Pixel 3 XL</span></td>
              <td><span class="text-dark font-weight-semibold">Samsung Galaxy S10+</span></td>
            </tr>
            <tr>
              <th>Build material</th>
              <td>Case: AluminiumBack: Mineral Glass</td>
              <td>Case: AluminiumBack: Aluminium</td>
              <td>Case: AluminiumBack: Mineral Glass</td>
            </tr>
            <tr>
              <th>Thickness</th>
              <td>7.7 mm</td>
              <td>7.9 mm</td>
              <td>8.5 mm</td>
            </tr>
            <tr>
              <th>Width</th>
              <td>70.9 mm</td>
              <td>76.7 mm</td>
              <td>73.8 mm</td>
            </tr>
            <tr>
              <th>Height</th>
              <td>143.6 mm</td>
              <td>157.9 mm</td>
              <td>158.1 mm</td>
            </tr>
            <tr>
              <th>Weight</th>
              <td>174 grams</td>
              <td>175 grams</td>
              <td>189 grams</td>
            </tr>
            <tr>
              <th>Waterproof</th>
              <td>Yes Water resistant (up to 30 minutes in a depth of 1 meter), IP67</td>
              <td>Yes Water resistant (up to 30 minutes in a depth of 1 meter), IP67</td>
              <td>Yes Water resistant (up to 30 minutes in a depth of 1.5 meter), IP68</td>
            </tr>
            <tr>
              <th>Colors</th>
              <td>Silver, Space Grey</td>
              <td>Black, Black and White</td>
              <td>Midnight Black, Coral Blue, Lilac Purple</td>
            </tr>
          </tbody>
          <tbody id="display" data-filter="target">
            <tr class="bg-secondary">
              <th class="text-uppercase">Display</th>
              <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
              <td><span class="text-dark font-weight-semibold">Google Pixel 3 XL</span></td>
              <td><span class="text-dark font-weight-semibold">Samsung Galaxy S10+</span></td>
            </tr>
            <tr>
              <th>Display type</th>
              <td>Super Retina OLED</td>
              <td>'flexible' OLED</td>
              <td>Super AMOLED</td>
            </tr>
            <tr>
              <th>Pixel density</th>
              <td>458 ppi</td>
              <td>522 ppi</td>
              <td>522 ppi</td>
            </tr>
            <tr>
              <th>Screen protection</th>
              <td>Yes</td>
              <td>Corning Gorilla Glass v5</td>
              <td>Corning Gorilla Glass v5</td>
            </tr>
            <tr>
              <th>Screen size</th>
              <td>6.5 inches</td>
              <td>6.3 inches</td>
              <td>6.4 inches</td>
            </tr>
            <tr>
              <th>Screen resolution</th>
              <td>1125 x 2436 pixels</td>
              <td>1440 x 2880 pixels</td>
              <td>1440 x 2960 pixels	</td>
            </tr>
            <tr>
              <th>Touch screen</th>
              <td>Yes, 3D Touch Touchscreen, Multi-touch</td>
              <td>Yes, Capacitive Touchscreen, Multi-touch</td>
              <td>Yes, Capacitive Touchscreen, Multi-touch</td>
            </tr>
          </tbody>
          <tbody id="storage" data-filter="target">
            <tr class="bg-secondary">
              <th class="text-uppercase">Storage</th>
              <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
              <td><span class="text-dark font-weight-semibold">Google Pixel 3 XL</span></td>
              <td><span class="text-dark font-weight-semibold">Samsung Galaxy S10+</span></td>
            </tr>
            <tr>
              <th>Internal memory</th>
              <td>64 GB</td>
              <td>64 GB</td>
              <td>128 GB</td>
            </tr>
            <tr>
              <th>Expandable memory</th>
              <td>No</td>
              <td>No</td>
              <td>Yes Up to 1 TB</td>
            </tr>
          </tbody>
          <tbody id="camera" data-filter="target">
            <tr class="bg-secondary">
              <th class="text-uppercase">Camera</th>
              <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
              <td><span class="text-dark font-weight-semibold">Google Pixel 3 XL</span></td>
              <td><span class="text-dark font-weight-semibold">Samsung Galaxy S10+</span></td>
            </tr>
            <tr>
              <th>Settings</th>
              <td>Exposure compensation, ISO control</td>
              <td>Exposure compensation, ISO control</td>
              <td>Exposure compensation</td>
            </tr>
            <tr>
              <th>Aperture</th>
              <td>F2.2</td>
              <td>F2.4</td>
              <td>F1.7</td>
            </tr>
            <tr>
              <th>Camera features</th>
              <td>10 x Digital zoom, Optical zoom, Auto flash, Face detection, Touch to focus</td>
              <td>Fixed zocus</td>
              <td>Wide angle selfie</td>
            </tr>
            <tr>
              <th>Image resolution</th>
              <td>4000 x 3000 pixels</td>
              <td>4000 x 3000 pixels</td>
              <td>4000 x 3000 pixels</td>
            </tr>
            <tr>
              <th>Sensor</th>
              <td>BSI sensor</td>
              <td>CMOS image sensor</td>
              <td>CMOS image sensor</td>
            </tr>
            <tr>
              <th>Autofocus</th>
              <td>Yes</td>
              <td>No</td>
              <td>Yes</td>
            </tr>
            <tr>
              <th>Shooting modes</th>
              <td>Continuos shooting, High dynamic range mode (HDR), Burst mode</td>
              <td>Continuos shooting, High dynamic range mode (HDR)</td>
              <td>Continuos shooting, High dynamic range mode (HDR)</td>
            </tr>
            <tr>
              <th>Optical image stabilisation</th>
              <td>Yes, Dual optical image stabilization</td>
              <td>Yes</td>
              <td>Yes</td>
            </tr>
            <tr>
              <th>Flash</th>
              <td>Yes, Retina flash</td>
              <td>Yes, Dual LED flash</td>
              <td>Yes, LED flash</td>
            </tr>
          </tbody>
          <tbody id="battery" data-filter="target">
            <tr class="bg-secondary">
              <th class="text-uppercase">Battery</th>
              <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
              <td><span class="text-dark font-weight-semibold">Google Pixel 3 XL</span></td>
              <td><span class="text-dark font-weight-semibold">Samsung Galaxy S10+</span></td>
            </tr>
            <tr>
              <th>Talktime</th>
              <td>Up to 21 hours(4G)</td>
              <td>Up to 24 hours(4G)</td>
              <td>Up to 25 hours(4G)</td>
            </tr>
            <tr>
              <th>Quick charging</th>
              <td>Yes, fast, 50 % in 30 minutes</td>
              <td>Yes</td>
              <td>Yes</td>
            </tr>
            <tr>
              <th>Wireless charging</th>
              <td>Yes</td>
              <td>Yes</td>
              <td>Yes</td>
            </tr>
            <tr>
              <th>Type</th>
              <td>Li-ion</td>
              <td>Li-ion</td>
              <td>Li-ion</td>
            </tr>
            <tr>
              <th>Capacity</th>
              <td>3,174 mAh</td>
              <td>3,430 mAh</td>
              <td>4,100 mAh</td>
            </tr>
          </tbody>
          <tbody id="price" data-filter="target">
            <tr class="bg-secondary">
              <th class="text-uppercase">Price &amp; rating</th>
              <td><span class="text-dark font-weight-semibold">Apple iPhone Xs Max</span></td>
              <td><span class="text-dark font-weight-semibold">Google Pixel 3 XL</span></td>
              <td><span class="text-dark font-weight-semibold">Samsung Galaxy S10+</span></td>
            </tr>
            <tr>
              <th>Price</th>
              <td>$1,099</td>
              <td>$899</td>
              <td>$1,000</td>
            </tr>
            <tr>
              <th>Rating</th>
              <td>4.5/5</td>
              <td>4.5/5</td>
              <td>4.5/5</td>
            </tr>
            <tr>
              <th></th>
              <td>
                <button class="btn btn-outline-primary btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to Cart</button>
              </td>
              <td>
                <button class="btn btn-outline-primary btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to Cart</button>
              </td>
              <td>
                <button class="btn btn-outline-primary btn-block" type="button" data-toggle="toast" data-target="#cart-toast">Add to Cart</button>
              </td>
            </tr>
          </tbody>
        </table>
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
                <h3 class="widget-title text-white border-light">Shop departments</h3>
                <ul>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Apparel &amp; Shoes</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Glasses &amp; Accessories</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Handbags &amp; Backpacks</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Computers &amp; Accessories</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Smartphones &amp; Tablets</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">TV, Video &amp; Audio</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Cameras, Photo &amp; Video</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Headphones</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Wearable Electronics</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Printers &amp; Ink</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Video Games</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Car Electronics</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Smart Home, IoT</span></a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-3 col-sm-6">
              <div class="widget widget-links pb-4">
                <h3 class="widget-title text-white border-light">Account &amp; shipping info</h3>
                <ul>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Your account</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Shipping rates &amp; policies</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Refunds &amp; replacements</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Taxes</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Delivery info</span></a></li>
                </ul>
              </div>
              <div class="widget widget-links pb-4">
                <h3 class="widget-title text-white border-light">About us</h3>
                <ul>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Careers</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">About shop</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Our stores</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">Services</span></a></li>
                  <li><a class="nav-link-inline nav-link-light" href="#"><i class="widget-categories-indicator" data-feather="chevron-right"></i><span class="font-size-sm">News</span></a></li>
                </ul>
              </div>
            </div>
            <div class="col-xl-4 offset-xl-1 col-md-5">
              <div class="widget">
                <!-- Subscription form (MailChimp)-->
                <h3 class="widget-title text-white border-light">Stay informed</h3>
                <form class="validate pb-4" action="https://studio.us12.list-manage.com/subscribe/post-json?u=c7103e2c981361a6639545bd5&amp;amp;id=29ca296126&amp;c=?" method="get" name="mc-embedded-subscribe-form" id="mc-embedded-subscribe-form">
                  <div class="input-group mb-2">
                    <div class="input-group-prepend"><span class="input-group-text" style="background-color: #e8e8e8;"><i data-feather="mail"></i></span></div>
                    <input class="form-control border-0 box-shadow-0 bg-secondary" type="email" name="EMAIL" id="mce-EMAIL" value="" placeholder="Your email" required>
                  </div>
                  <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                  <div style="position: absolute; left: -5000px;" aria-hidden="true">
                    <input type="text" name="b_c7103e2c981361a6639545bd5_29ca296126" tabindex="-1">
                  </div>
                  <button class="btn btn-primary btn-block" type="submit" name="subscribe" id="mc-embedded-subscribe">Subscribe*</button>
                  <p class="font-size-xs text-white opacity-60 pt-2 mb-2" id="mc-helper">*Subscribe to our newsletter to receive early discount offers, updates and new products info.</p>
                  <!-- Subscription status-->
                  <div class="subscribe-status"></div>
                </form>
                <!-- Mobile app download-->
                <div class="widget pb-4">
                  <h3 class="widget-title text-white border-light">Download our app</h3><a class="market-btn market-btn-light apple-btn mr-2 mb-2" href="#" role="button"><span class="market-button-subtitle">Download on the</span><span class="market-button-title">App Store</span></a><a class="market-btn market-btn-light google-btn" href="#" role="button"><span class="market-button-subtitle">Download on the</span><span class="market-button-title">Google Play</span></a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- shop features-->
      <div class="pt-5 pb-0 pb-md-5 border-bottom border-light" id="shop-features" style="background-color: #1f1f1f;">
        <div class="container">
          <div class="row">
            <div class="col-md-3 col-sm-6 border-right border-light">
              <div class="icon-box text-center mb-5 mb-md-0">
                <div class="icon-box-icon"><i data-feather="truck"></i></div>
                <h3 class="icon-box-title font-weight-semibold text-white">Free local delivery</h3>
                <p class="icon-box-text">Free delivery for all orders over $100</p>
              </div>
            </div>
            <div class="col-md-3 col-sm-6 border-right border-light">
              <div class="icon-box text-center mb-5 mb-md-0">
                <div class="icon-box-icon"><i data-feather="refresh-cw"></i></div>
                <h3 class="icon-box-title font-weight-semibold text-white">Money back guarantee</h3>
                <p class="icon-box-text">Free delivery for all orders over $100</p>
              </div>
            </div>
            <div class="col-md-3 col-sm-6 border-right border-light">
              <div class="icon-box text-center mb-5 mb-md-0">
                <div class="icon-box-icon"><i data-feather="life-buoy"></i></div>
                <h3 class="icon-box-title font-weight-semibold text-white">24/7 customer support</h3>
                <p class="icon-box-text">Friendly 24/7 customer support</p>
              </div>
            </div>
            <div class="col-md-3 col-sm-6">
              <div class="icon-box text-center mb-5 mb-md-0">
                <div class="icon-box-icon"><i data-feather="credit-card"></i></div>
                <h3 class="icon-box-title font-weight-semibold text-white">Secure online payment</h3>
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
              <div class="mb-4 mb-sm-0"><a class="d-inline-block" href="index.html"><img width="100" src="img/logo-light.png" alt="MStore"/></a>
                <div class="navbar-lang-switcher dropdown border-light mt-3 mb-0 mt-sm-0">
                  <div class="dropdown-toggle text-white" data-toggle="dropdown"><img width="20" src="img/flags/en.png" alt="English"/><span>USD</span>
                  </div>
                  <ul class="dropdown-menu" style="width: 150px;">
                    <li class="dropdown-item">
                      <select class="custom-select custom-select-sm">
                        <option value="usd">$ USD</option>
                        <option value="usd">â¬ EUR</option>
                        <option value="usd">Â£ UKP</option>
                        <option value="usd">Â¥ JPY</option>
                      </select>
                    </li>
                    <li><a class="dropdown-item" href="index.html"><img class="mr-2" width="20" src="img/flags/fr.png" alt="FranÃ§ais"/>FranÃ§ais</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#"><img class="mr-2" width="20" src="img/flags/de.png" alt="Deutsch"/>Deutsch</a></li>
                    <li class="dropdown-divider"></li>
                    <li><a class="dropdown-item" href="#"><img class="mr-2" width="20" src="img/flags/it.png" alt="Italiano"/>Italiano</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-sm-6 text-center text-sm-right"><a class="social-btn sb-facebook sb-light mx-1 mb-2" href="#"><i class="flaticon-facebook"></i></a><a class="social-btn sb-twitter sb-light mx-1 mb-2" href="#"><i class="flaticon-twitter"></i></a><a class="social-btn sb-instagram sb-light mx-1 mb-2" href="#"><i class="flaticon-instagram"></i></a><a class="social-btn sb-vimeo sb-light mx-1 mb-2" href="#"><i class="flaticon-vimeo"></i></a></div>
          </div>
          <div class="row pt-4">
            <div class="col-sm-6 text-center text-sm-left">
              <ul class="list-inline font-size-sm">
                <li class="list-inline-item mr-3"><a class="nav-link-inline nav-link-light" href="#">Outlets</a></li>
                <li class="list-inline-item mr-3"><a class="nav-link-inline nav-link-light" href="#">Affiliates</a></li>
                <li class="list-inline-item mr-3"><a class="nav-link-inline nav-link-light" href="#">Support</a></li>
                <li class="list-inline-item mr-3"><a class="nav-link-inline nav-link-light" href="#">Privacy</a></li>
                <li class="list-inline-item mr-3"><a class="nav-link-inline nav-link-light" href="#">Terms of use</a></li>
              </ul>
            </div>
            <div class="col-sm-6 text-center text-sm-right">
              <div class="d-inline-block"><img width="187" src="img/cards.png" alt="Payment methods"/>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="py-3" style="background-color: #1a1a1a;">
        <div class="container font-size-xs text-center" aria-label="Copyright"><span class="text-white opacity-60 mr-1">Â© All rights reserved. Made by</span><a class="nav-link-inline nav-link-light" href="https://createx.studio/" target="_blank">Createx Studio</a></div>
      </div>
    </footer>
    <!-- Back To Top Button--><a class="scroll-to-top-btn" href="#"><i class="scroll-to-top-btn-icon" data-feather="chevron-up"></i></a>
    <!-- JavaScript (jQuery) libraries, plugins and custom scripts-->
    <script src="js/vendor.min.js"></script>
    <script src="js/theme.min.js"></script>
  </body>
</html>