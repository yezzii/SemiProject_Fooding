<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Semi Project - 01</title>

<script type="text/javascript">


</script>

<style>

.flexTop {
	display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: space-around;
    justify-content: space-between;
    align-items: center;
}

</style>
</head>
<body>
<div>
	<div class="flexTop">	<!-- 네비바 container -->
		<div><a href="#">	
		
		</a></div>	<!-- 로고 -->
		
		
		<div><a href="#">	
		커뮤니티
		</a></div>	<!-- 항목1 -->
		
		
		<div><a href="#">	
		예약
		</a></div>	<!-- 항목2 -->
		
		
		<div><a href="#">	
		<span class=""><input type="text" class="top_search" value="지역,음식,레스토랑명 검색"></span>
		</a></div>  <!-- 검색 -->
		
		
		<div><a href="<%=request.getContextPath() %>/로그인.go">	
		<button type="button" class="login"><span class="">로그인</span></button>
		</a></div> <!--  로그인 -->
		
		
		<div><a href="<%=request.getContextPath() %>/insert.go">	
		<button type="button" class="join"><span class="">회원가입</span></button>
		</a></div>  <!-- 회원가입 -->
		
		
		<div><a href="<%=request.getContextPath() %>/insert_main.go">	
		<button type="button" class="write"><span class="">글쓰기</span></button>
		</a></div>  <!-- 글쓰기 -->
	</div> 
	
	
		<div>  <!-- 메인섹션1 -->
		
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