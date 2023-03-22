<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function check() {
		if(f.writer.value == ""){
			alert("작성자를 입력하세요")
			f.writer.focus();
			return false;
		}
		if(f.title.value == ""){
			alert("글 제목을 입력하세요")
			f.title.focus();
			return false;
		}
		if(f.cont.value == ""){
			alert("내용을 입력하세요")
			f.cont.focus();
			return false;
		}
		if(f.pwd.value == ""){
			alert("비밀번호를 입력하세요")
			f.pwd.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div align="center">
		<hr width="50%" color = "marmoon">
			<h3>BOARD 테이블 게시판 글쓰기 폼 페이지</h3>
		<hr width="50%" color = "marmoon">
		<br>
		
		<form method="post" action="<%=request.getContextPath() %>/insert_ok.do" onsubmit="">
			<table border="1" cellspacing="0" width="300">
				<tr>
					<th>작성자</th>
					<td> <input type="text" name="writer"></td>
				</tr>
				<tr>
					<th>글제목</th>
					<td> <input type="text" name="title"></td>
				</tr>
				<tr>
					<th>글내용</th>
					<td> <textarea rows="7" cols="25" name="cont"></textarea></td>
				</tr>
				<tr>
					<th>글 비밀번호</th>
					<td> <input type="password" name="pwd"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center"> 
					<input type="submit" value = "글쓰기">&nbsp;&nbsp;
					<input type="reset" value = "다시작성">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>