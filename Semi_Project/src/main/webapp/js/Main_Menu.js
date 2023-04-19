$(function(){
	
	$.ajaxSetup({
		ContentType : "application/x-www-form-urlencoded; charset=UTF-8",
		type : "post"
	});
	
	function getData(){
		$.ajax({
			url : "/Semi_Project/select.do",
			datatype : "xml",
			success : function(data){
				
				$("#listTable re:gt(0)").remove();
				
				let table = "";
				
				$(data).find("main_menu").each(function(){
					table +="<tr>";
					table +="<td>"+$(this).find("menu_no").text()+"</td>";
					table +="<td>"+$(this).find("menu_name").text()+"</td>";
					table +="<td>"+$(this).find("menu_price").text()+"</td>";
					table +="<td>"+$(this).find("menu_pic").text()+"</td>";
					table +="<td>"+$(this).find("menu_no").text()+"</td>";
					//table += "<td td='tdDel'><input type='button value='삭제'"+"id='del' num='"+$(this)find("menu_no").text()+"'></td>";
					//table += "<td td='tdMod'><input type='button value='수정'"+"id='mod' num='"+$(this)find("menu_no").text()+"'></td>";
					table += "</tr>";
				});
				$("#listTable tr:eq(0)").after(table);
			},
			error : function(data){
				alert("데이터 통신 오류")
			}
		});
		
	}// getData() 함수 end
	
	//DB에 저장하기
	$("#btn").click(function(){
		$.ajax({
			url : "/Semi_Project/insert.do",
		  	data : $("#inForm").serialize(),
		  	datatype : "text",
		  	success : function(data){
				  if(data > 0){
					  alert("메뉴 추가 완료");
					  getData();
					  $("input[type=text]").each(function(){
						  $(this).val("");
					  });
				  }else{
					  alert("메뉴 추가 실패")
				  }
			  },
			  error:function(){
				  alert("데이터 통신 오류")
			  }
		})
	});
	
});