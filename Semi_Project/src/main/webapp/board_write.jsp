<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>MStore | Modern Bootstrap E-commerce Template
    </title>
    <!-- JQury 라이브러리 -->


<script>
	function check() {
		
		if (f.board_title.value == "") {
			alert("글 제목을 입력하세요")
			f.board_title.focus();
			return false;
		}
		if (f.board_content.value == "") {
			alert("내용을 입력하세요")
			f.board_content.focus();
			return false;
		}
	}
</script>
    <style>
  #text-input {
    width: 893px;
  }
  #file-input {
    width: 893px;
  }
  #button-input {
  text-align: center;
  }
  
  
</style>
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
							<button class="btn btn-primary btn-block" type="button" onclick="location.href='../member/logout.jsp'">
								로그아웃</button>
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
										<h3 class="widget-title">Shop pages</h3>
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
					<a
						class="navbar-btn" href="#offcanvas-cart" data-toggle="offcanvas"><span
						class="d-block position-relative"><span
							class="navbar-btn-badge bg-primary text-light">4</span><i
							class="mx-auto mb-1" data-feather="shopping-cart"></i>$325.00</span></a>
				</div>
			</div>
		</div>
	</header>
    <!-- Page Content-->
    <div class="container pb-5">
      <div class="row justify-content-center">
        <div class="col-lg-9">
          <!-- Post meta-->
          <div class="post-meta d-flex flex-wrap justify-content-between pb-3">
            <div class="mr-2">by&nbsp;<a href="#">Olivia Reyes</a><span class="meta-divider"></span>in&nbsp;<a href="#">Aerial photo</a><span class="meta-divider"></span><span>Apr 20</span></div><a href="#"><i class="mr-1" data-feather="message-square"></i>13</a>
          </div>
          <!-- Gallery-->
          <div class="row pb-2">
            
        <form method="post" action="<%=request.getContextPath()%>/write_boardOk.do"
			onsubmit="return check()" name="f" enctype="multipart/form-data">
			
			
			
<div class="btn-group dropright">
 
  
  <select name="board_type" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <option value="1">후기</option>
    <option value="0">자유</option>
  </select>
</div>


<br><br>


<div class="row">
  <div class="col">
      <div class="form-group">
      <label for="text-input">작성자</label>
      <input class="form-control" name="board_writer" type="text" id="text-input" value="<%=session.getAttribute("id")%>">  <%-- --%>   
    </div>
    <div class="form-group">
      <label for="text-input">글제목</label>
      <input class="form-control" name="board_title" type="text" id="text-input">
    </div>
  </div>
</div>

<div class="row">
  <div class="col">
    <div class="form-group">
      <label for="textarea-input">본문작성</label>
      <textarea class="form-control" name="board_content" id="textarea-input" cols="860" rows="15" ></textarea>
    </div>
  </div>
</div>

<div class="row">
  <div class="col">
    <div class="form-group">
      <label for="file-input">File</label>
      <div class="custom-file">
        <input class="custom-file-input" name="board_image" type="file" id="file-input">
        <label class="custom-file-label" for="file-input">Choose file...</label>
      </div>
    </div>
  </div>
</div>

<div class="row">
  <div class="col text-center">
    <input type="submit" value="작성" id="button-input" class="btn btn-primary mx-auto">
  </div>
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
              <div class="mb-4 mb-sm-0"><a class="d-inline-block" href="index.jsp"><img width="100" src="img/logo-light.png" alt="MStore"/></a>
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
                    <li><a class="dropdown-item" href="index.jsp"><img class="mr-2" width="20" src="img/flags/fr.png" alt="FranÃ§ais"/>FranÃ§ais</a></li>
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