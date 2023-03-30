<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function check(){
	   
	   if(f.main_name.value =="main_name"){
	      alert("가게이름입력");
	      f.main_name.focus();
	      return false;
	   }  
	   
	   if(f.main_content.value =="main_content"){
	      alert("소개입력");
	      f.main_content.focus();
	      return false;
	   }   
	   
	   if(f.main_addr.value =="main_addr"){
	      alert("주소입");
	      f.main_addr.focus();
	      return false;
	   }   
	   
	   if(f.main_location.value =="main_location"){
	      alert("위치");
	      f.main_location.focus();
	      return false;
	   }  
	   
	}
</script>

</head>
<body>
     
     <div align="center">
<hr width="50%" color="pink">
	<h3></h3>
<hr width="50%" color="pink">

<form method="post" name="f"
	action="<%=request.getContextPath() %>/board_main.do" onsubmit="return check();">
<table border="1" cellspacing="0" width="300">



<tr>
	<th>가게이름</th>
	<td><input type="text" name="main_name"></td>
</tr>
<tr>
	<th>가게소개</th>
	<td><input type="text" name="main_content"></td>
</tr>
<tr>
	<th>주소</th>
	<td><input type="text" name="main_addr"></td>
</tr>
<tr>
	<th>위치</th>
	<td><input type="text" name="main_location"></td>
</tr>

<tr>
	<td colspan="2" align="center">
	<input type="submit" value="가게등록">
	<input type="reset" value="다시작성">
	</td>
</tr>
</table>	
</form>
</div>     
</body>
</html>