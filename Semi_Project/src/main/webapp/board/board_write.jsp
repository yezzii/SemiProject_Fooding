<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check() {
		
		if (f.title.value == "") {
			alert("글 제목을 입력하세요")
			f.board_title.focus();
			return false;
		}
		if (f.cont.value == "") {
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
			onsubmit="check()">
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
					<td><textarea rows="7" cols="25" name="board_content"></textarea></td>
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