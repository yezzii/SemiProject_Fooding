function loadMark() {

  var id = '<%= session.getAttribute("id") %>';

  $.ajax({
    type: 'POST',
    url: 'memMarkLoad.do',
    dataType: "json",
    data: {
      id: id,
    },
    success: function (data) {
     // console.log("AJAX호출 성공");
    //  console.log("데이터 송신완료 값:" + data);
      var List = JSON.parse(data.List); // 문자열을 JavaScript 객체로 파싱
      var name = List.map(obj => obj.name);
      var info = List.map(obj => obj.info);
      var addr = List.map(obj => obj.addr);
      var detailAddr = List.map(obj => obj.detailAddr);
      var marked_storeidx = List.map(obj => obj.marked_storeidx);
      

      var markedListElem = document.querySelector('#marked-list');
      markedListElem.innerHTML = ''; // 기존 내용 지우기

      if (List.length > 0) {
        List.forEach(function (obj) {
          var elem = document.createElement('div');
          var hr = document.createElement('hr');
          var br = document.createElement('br');
          
	          elem.classList.add('media');
	          elem.classList.add('pt-3');
		         elem.innerHTML = `
					    <div class="featured-entry-thumb mr-3 ">
					      <a href="#"><img src="${obj.main_img}" width="70" alt="${obj.name}" /></a>
					      <span class="item-remove-btn" >x<i data-feather="x"></i></span>
					    </div>
					    <div class="media-body">
					      <h6 class="featured-entry-title">
					        <a href="#" style="font-family:'GmarketSansMedium'; font-size: 15px; ">${obj.name}</a>
					      </h6>
					      <p class="featured-entry-meta" style="font-family:'GmarketSansMedium'; font-size: 12px; ">
					        ${obj.addr}<br>${obj.detailAddr}
					      </p>
					    </div>
					    
					  </div>  
					`;

          markedListElem.appendChild(elem);
          markedListElem.appendChild(hr);
          
			
        });
      }
    },
    error: function (request, status, error) {
      console.log(error); // 오류 발생시 콘솔에 출력
    }

  });
};
