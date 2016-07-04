$.ajaxSetup({
	type : "POST",
	async : true,
	dataType : "json",
	error : function(xhr){
		alert("error html=" + xhr.statusText);
	}
});


$(function(){
	$("#secondPass").on("blur",function(){
		
				var html;
				if($("#pass").val()==""||$("#secondPass").val()==""){
					html="<b>비밀번호를 입력하세요</b>"
					$("#pwCheckStatus").html(html).css("color","blue");
					
				}else{ if($("#pass").val()==$("#secondPass").val()){
						html="<b>비밀번호가 일치합니다.</b>"
						$("#pwCheckStatus").html(html).css("color","green");
					}else{
						html="<b>비밀번호가 불일치!!</b>"
						$("#pwCheckStatus").html(html).css("color","red");
						}
				}
				
			});
		
	
});

$(function(){
	$("#pass").on("blur",function(){
		
				var html;
				if($("#pass").val()==""||$("#secondPass").val()==""){
					html="<b>비밀번호를 입력하세요</b>"
					$("#pwCheckStatus").html(html).css("color","blue");
					
				}else{ if($("#pass").val()==$("#secondPass").val()){
						html="<b>비밀번호가 일치합니다.</b>"
						$("#pwCheckStatus").html(html).css("color","green");
					}else{
						html="<b>비밀번호가 불일치!!</b>"
						$("#pwCheckStatus").html(html).css("color","red");
						}
				}
				
			});
		
	
});


$(function(){
	$("#1minddal").on("click",function(){
		
				var html;
//				if($("#pw").val()==""||$("#secondPass").val()==""){
					html="1민영 드립니다"
					$("#pwCheckStatus").html(html).css("color","blue");
//					
//				}else{ if($("#pw").val()==$("#secondPass").val()){
//						html="<b>비밀번호가 일치합니다.</b>"
//						$("#pwCheckStatus").html(html).css("color","green");
//					}else{
//						html="<b>비밀번호가 불일치!!</b>"
//						$("#pwCheckStatus").html(html).css("color","red");
//						}
//				}
				
			});
		
	
});