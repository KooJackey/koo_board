<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ajax 멀티 업로드</title>
<style>
.fileDrop {
	width: 50%;
	height: 100px;
	border: 1px solid blue;
	margin: auto,0;
}

small {
	margin-left: 3px;
	font-weight: bold;
	color: gray;
}
</style>
<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
</head>
<body>
<h3>Ajax File Upload</h3>
	<div class='fileDrop'></div>
	<div class='uploadedList'></div>
	<input type="button" value="다지우기" id="fileClear" class="fileClear">
<script>
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();		
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();	
// 		event.originalEvent는 순수한 원래의 DOM이벤트를 가지고 옮
//		JQuery를 사용할경우  순수한 DOM이벤트가 아님
//		dataTransfer는 이벤트와 같이 전달된 데이터를 의미
//		그 안에 포함된 파일 데이트를 찾아내기 위해 dataTransfer.files를 사용함	

		/* var files = event.originalEvent.dataTransfer.files;			
		var file = files[0];		
		var formData = new FormData();	 단일 업로드 */
		
		var files = event.originalEvent.dataTransfer.files;				
		var formData = new FormData();
		$.each(files,function(index,item){
			formData.append("multiFile", item);		// formData에 item을 "multiFile"객체명으로 보냄
		});
// 		alert(fileName);
		$.ajax({
			  url: '/bbs/uploadAjax.upload',
			  data: formData,
// 			  dataType:'text',	// 단일 업로드
			  dataType:'json',	// 멀티 업로드
//			   데이터를 일반적인 query string으로 변환할 것인지 결정
//			   디폴트는 true..application/x-www-from-urlencoded를 의미
//			   다른 형식으로 데이터를 보내기 위하여 false
			  processData: false,
//			   파일 업로드 이므로 contentType는
//			  multipart/form-data 사용을 위해서 false
			  contentType: false,
			  type: 'POST',
			  success: function(data){
				  var str ="";				 
// 				  alert("데이타 -> "+data);				  
				  $.each(data,function(index, fileName){					  					 
					  if(checkImageType(fileName)){						 
						  str ="<div><img src='displayFile.upload?fileName="+fileName+"'/>"	
								  +"<small class='x' data-src='"+fileName+"'>X</small></div>"
								  +"<input type='hidden' name='fileNames' value='"+getImageLink(fileName)+"'>";
					  }else{
						  str = "<div>"+ getOriginalName(fileName)
								  +"<small class='x' data-src='"+fileName+"'>X</small></div>";
								  +"<input type='hidden' name='fileNames' value='"+fileName+"'>";
					  }
					  
					  $(".uploadedList").append(str);
				  });				 
			  },
			error:function(xhr){
				alert("error html = " + xhr.statusText);
			}
		});	
	});
	
	// small 버튼 X 눈지면 파일 삭제함
	$(".uploadedList").on("click", "small", function(event){
		var that=$(this);
		$.ajax({
			url:"/bbs/deleteFile.upload",
			type:"post",
			data:{
				fileName:$(this).attr("data-src")
			},
			dataType:"text",
			success:function(result){
				if(result=='deleted'){
					that.parent("div").remove();
				}
			}
		});
	});
	
	// 전부 삭제
	$("input[id=fileClear]").on("click", function(evnet){
		var files=[];
		$.each($(".x"), function(index, item){
// 			files[index]=$(this).attr("data-src");
			files.push($(this).attr("data-src"));
		});
		
		$.ajax({
			url:"/bbs/deleteAllFiles.upload",
			type:"post",
			   data: {files: files},
			   dataType:"text",		  
			   success:function(result){
				   if(result == 'deleted'){
					   $(".uploadedList").children().remove();
					   alert("삭제성공");
				   }
			   }
		   });
		});
	
	function checkImageType(fileName){	
// 		/i는 대소문자 구분 하지 말라는 뜻임
		var pattern = /.jpg|.gif|.png/i;		
		return fileName.match(pattern);		
	}
	function getImageLink(fileName){
		if(!checkImageType(fileName)){	// 이미지 파일이 아니면 땡
			return;
		}
		var front = fileName.substr(0,12);
		var end = fileName.substr(14);
		return front + end;	
	}
	
	function getOriginalName(fileName){
		if(checkImageType(fileName)){
			return;
		}
		
		var idx = fileName.indexOf("_") + 1 ;
		return fileName.substr(idx);	
	}


</script>


	
</body>
</html>