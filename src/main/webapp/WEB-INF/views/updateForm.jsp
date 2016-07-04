<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>'${articleNum}'번 글 수정하기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
$(document).ready(function() {
//		id 값으로 읽어 올려면 하나만 선택되어짐..클래스 사용
	$(".delFile").on("click", function() {
		var fileNum=$(this).attr("fileNum");			
		$(this).parent().remove();
		var delFileNum ="<input type='hidden' name='fileNumList' value='"+fileNum+"'>";		
		$(delFileNum).appendTo("form");	
			
	});

});
</script>
</head>
<body> 
<form action="/bbs/update.bbs" method="post" enctype="multipart/form-data">
<input type="hidden" name="articleNum" value="${articleNum}">
<input type="hidden" name="fileStatus" value="${fileStatus}">
<input type="hidden" name="pageNum" value="${pageNum}">
<table border="2" width="500" align="center"  style="border-style:outset;border-color:saddlebrown;
			border-width=10;" border="1" width="700" cellpadding="0" cellspacing="0" align="center" bgcolor="EEEEA4">  
	<tr>
		 <td align="center">작성자 :</td> <td align="center">${id}</td> 
	</tr>
	<tr>	 
		 <td align="center">제 목 : </td>
		 <td><input type="text" name="title" value="${article.title}"></td>			 
	</tr>
	<tr>
		  <td colspan="4">
		  <textarea cols="50" rows="20" name="content">${article.content}</textarea>
		  </td>
    </tr> 
    <tr>
		  <td>첨부된 파일 : </td>
		  <td>
		  	<c:if test="${fileList!=null}">
			 	<ul id="delGroup">		 	
					<c:forEach var="file" items="${fileList}">
	<!-- 				JQuery 함수 사용				 -->
					 <li>${file.originFname}
					 <input type="button" fileNum="${file.fileNum}" 
					 value="삭제" class="delFile">					
					 </li>				
					</c:forEach>
				</ul>
			</c:if>
		  </td>
    </tr> 
     <tr>
		  <td colspan="2"><input type="file" name="fname" multiple value="파일 첨부"></td>		  
    </tr>
    <tr>
          <td align="center"><input type="submit" value="수정하기"></td>
      	  <td align="center"><input type="reset" value="수정하기취소"></td>	      	 
    </tr>		
</table>	
</form>
</body>
</html>
