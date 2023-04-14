<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro);

body {
  background: #ffffff; 
  color: #414141;
  font: 400 17px/2em 'Source Sans Pro', sans-serif;
}

.select-box {
  cursor: pointer;
  position : relative;
  max-width:  20em;
  margin: 5em auto;
  width: 100%;
}

.select,
.label {
  color: #414141;
  display: block;
  font: 400 17px/2em 'Source Sans Pro', sans-serif;
}


.select {
  width: 100%;
  position: absolute;
  top: 0;
  padding: 5px 0;
  height: 40px;
  opacity: 0;
  -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
  background: none transparent;
  border: 0 none;
}
.select-box1 {
  background: #ececec;
}

.label {
  position: relative;
  padding: 5px 10px;
  cursor: pointer;
}
.open .label::after {
   content: "▲";
}
.label::after {
  content: "▼";
  font-size: 12px;
  position: absolute;
  right: 0;
  top: 0;
  padding: 5px 15px;
  border-left: 5px solid #fff;
}

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function() {
  $('#select-box1').on('change', function() {
    var selectedValue = $(this).val();
    // 선택된 값에 따른 동작 수행
    console.log('Selected value: ' + selectedValue);
    // 선택된 값에 따라 동작을 수행하거나 서버로 데이터를 전송하는 등의 로직을 추가할 수 있음
  });
});
</script>
</style>
</head>
<body>
<form action="#">
 
  <div class="select-box">
    
    <label for="select-box1" class="label select-box1"><span class="label-desc">Choose your country</span> </label>
    <select id="select-box1" class="select">
      <option value="Choice 1">Falkland Islands</option>
      <option value="Choice 2">Germany</option>
      <option value="Choice 3">Neverland</option>
    </select>
    
  </div>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">

</script>
</form>  
</html>
