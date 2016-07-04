<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="//code.jquery.com/jquery-1.12.0.min.js"></script> -->
<!-- <script src="resources/js/jquery-2.2.4.min.js"></script> -->
<!-- <script src="resources/js/previewImage.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->


<link rel="stylesheet" href="css/jquery.fileupload.css">
 <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<title>글쓰기</title>

<script>
   function previewFiles() {

	  var preview = document.querySelector('#preview');
	  var files   = document.querySelector('input[type=file]').files;

	  function readAndPreview(file) {

	    // Make sure `file.name` matches our extensions criteria
	    if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
	      var reader = new FileReader();

	      reader.addEventListener("load", function () {
	        var image = new Image();
	        var cancel="<img src='/img/blank.PNG' id='cancel' width='20' height='20'><br/>";
	        image.height = 100;
	        image.title = file.name;
	        image.src = this.result;
	        preview.appendChild( image );		// div에 image 객체 넣음
	        preview.append( cancel );		// div에 x 객체 넣음
	      }, false);

	      reader.readAsDataURL(file);
	    }

	  }

	  if (files) {
	    [].forEach.call(files, readAndPreview);
	  }

	}
</script>

<script type="text/javascript">
	$("input[type=reset]").on("click", function(){
		$.each($("input[type=hidden]"), function(index, item){
// 		$("input[type=hidden]").each function(index, item){
			
// 		})
	});

</script>


</head>
<body>
<%@ include file="navbar.jsp" %>
<form action="/bbs/write.bbs" method="post">
<div class="container">
<br/><br/><br/><br/>
	<table class="responsive" border="2" style="min-width:650;" align="center">
		<tr>
 			 <td>글쓴이 :</td>
 			 <td>${id}</td>
 		</tr>
 		<tr>	 
		 <td>제목 : </td>
		 <td><input type="text" name="title"></td>			 
		</tr>
		<tr>
		  <td colspan="2">
		  <textarea cols="70" rows="20" name="content" ></textarea>
		  </td>
	    </tr> 	    
	    <tr>
	      <td>파일 첨부(드래그 됨~)</td>
	      <td>
<!--  			 	<input id="browse" type="file" onchange="previewFiles()" name="fname" multiple> -->
<!-- 				<div id="preview"></div> -->
	      </td>
	    </tr>
	    <tr >
	    </tr>
	    <tr>
	      <td><input type="submit" value="글쓰기"></td>
	      <td><input type="reset" value="글쓰기취소" class="fileClear">  &nbsp;&nbsp;<input type="button" value="목록으로" onclick="href='/bbs/list.bbs?pageNum=1'"></td>	      	 
	    </tr>		
	</table>	
	    <center><%@ include file="uploadAjax.jsp" %></center>
	</div>
    
	</form>
	
</body>
</html>