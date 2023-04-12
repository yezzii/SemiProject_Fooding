<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>









		<div id="successPwdToast">
			<div class="toast mb-3" id="profile-toast" data-delay="5000"
				role="alert" aria-live="assertive" aria-atomic="true">
				<div class="toast-header bg-success text-white">		<%-- 초록창 --%>
					<i class="mr-2" data-feather="check-circle"
						style="width: 1.25rem; height: 1.25rem;"></i><span
						class="font-weight-semibold mr-auto">완료!</span>		<%-- 안내메세지 --%>
					<button class="close text-white ml-2 mb-1" type="button"
						data-dismiss="toast" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<div id="toast-body" class="toast-body">비밀번호 변경이 완료되었습니다.</div>	<%-- 텍스트 출력 --%>
			</div>
		</div>	
			
			<!-- Warning toast -->
			<div id="failPwdToast">
				<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" id="my-toast">
					<div class="toast-header bg-warning text-white">
						<i class="mr-2" data-feather="alert-circle"style="width: 1.25rem; height: 1.25rem;"></i>
						 <span class="font-weight-semibold mr-auto">변경 오류</span>
							<button type="button" class="close text-white ml-2 mb-1"data-dismiss="toast" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				<div id="toast-body2"class="toast-body text-warning" >
					비밀번호 변경이 실패, 비밀번호를 확인해주세요.
				</div>
			</div>
		</div>

			








</body>
</html>