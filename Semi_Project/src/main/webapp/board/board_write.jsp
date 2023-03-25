<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- JQury 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap-theme.min.css"
	integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/js/bootstrap.min.js"
	integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
	crossorigin="anonymous"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css">
<!-- summernote 자바스크립트 관련 cdn -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>
<!-- summernote 한글 처리 관련 cnd -->
<script
	type="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/lang/summernote-ko-KR.js"></script>

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
</head>
<body>
	<div align="center">
		<hr width="50%" color="marmoon">
		<h3>BOARD 테이블 게시판 글쓰기 폼 페이지</h3>
		<hr width="50%" color="marmoon">
		<br>

		<form method="post"
			action="<%=request.getContextPath()%>/write_boardOk.do"
			onsubmit="return check()" name="f">
			<select name="board_type">
				<option value="1">후기</option>
				<option value="0">자유게시판</option>
			</select>
			<table border="1" cellspacing="0" width="300">

				<tr>
					<th>작성자</th>
					<td><input type="text" name="board_writer" value ="<%=session.getAttribute("id")%>"></td>
				</tr>
				<tr>
					<th>글제목</th>
					<td><input type="text" name="board_title"></td>
				</tr>
				<tr>
					<th>글내용</th>
					<td><textarea id="myEditor" rows="10" cols="30" class="form-control" name="board_content"></textarea></textarea></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="글쓰기">&nbsp;&nbsp; <input type="reset" value="다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>