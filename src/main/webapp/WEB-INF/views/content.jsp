<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html5>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> -->
<title>글읽기</title>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="resources/js/passwordCheck.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script>
$.ajaxSetup({
	type : "POST",
	async : true,
	dataType : "json",
	error : function(xhr){
		alert("error html = " + xhr.statusText);
	}
});

$(document).ready(function(){
	$("#commentWrite").on("click",function(){		
		$.ajax({	
			url:"/bbs/commentWrite.comment",
// 			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
			data:{				
				commentContent:$("#commentContent").val(),
				articleNum:"${article.articleNum}"
			},
			beforeSend : function(){
// 				alert("시작전");
			},
			complete: function(){
				alert("comment가 정성적으로 입력되었습니다");
			},
			success:function(data){
				if(data.result==1){
					$("#commentContent").val("");
					showHtml(data,1);
				}
			}					
		}); 
	});	
});

$(document).ready(function(){		// 추천 버튼 클릭 시 +1
	$("#good").on("click",function(){		
		$.ajax({	
			url:"/bbs/good.bbs",
// 			data{}에서는 EL을 ""로 감싸야함..그외에는 그냥 사용
			data:{				
// 				commentContent:$("#commentContent").val(),
				articleNum:"${article.articleNum}"		// 글번호 보내서 그 글 추천+1되도록
			},
			beforeSend : function(){
// 				alert("시작전");
			},
			complete: function(){
				$("#goodText").val("1민영 드립니다");
			},
			success:function(data){
				if(data.result==1){
					$("#goodTest").val("");
// 					showHtml(data,1);
				}
			}					
		}); 
	});	
});

function getComment(commPageNum, event){
// 	event.preventDefault();
	$.ajax({			
		url:"/bbs/commentRead.comment",	
		data:{
			articleNum:"${article.articleNum}",
// 			숫자와 문자연산에서 +를 제외하고는 숫자 우선
			commentRow:commPageNum*10
		},
		success:function(data){
			showHtml(data,commPageNum,event);
		}				
	}); 	
}

function showHtml(data,commPageNum){	
	var html="<table border='1' width='650' align='center'>";
// 	@ResponseBody 사용시
// 	$.each(data, function(index,item){
// 	MappingJacksonJsonView 사용시		
	$.each(data.comment, function(index,item){
		var formatted_date = new Date(item.commentDate);	// 날짜 읽어올라고
		html +="<tr>";
		html +="<td>"+(index+1)+"</td>";
		html +="<td>"+item.id+"</td>";
		html +="<td width='250'>"+item.commentContent+"</td>";
// 		html +="<td>"+item.commentDate+"</td>";					
		html +="<td>"+formatted_date.toLocaleString()+"</td>";					
// 		html +="<td>"+item.articleNum+"</td>";					
		html +="</tr>";					
	});		
	html +="</table>";
	commPageNum=parseInt(commPageNum);
	if("${article.commentCount}">commPageNum*10){			
		nextPageNum=commPageNum+1;				
		html +="<br /><input type='button' onclick='getComment(nextPageNum,event)' value='다음comment보기'><br>";
	}
	$("#showComment").html(html);	
	$("#commentContent").val("");
	$("#commentContent").focus();
}
</script>
</head>
<body>   
<%@include file="navbar.jsp" %>
<div class="container">
<br/><br/><br/><br/>


   <form action="/bbs/replyForm.bbs" method="post">      
    <input type="hidden" name="pageNum" value="${pageNum}">                 
    <input type="hidden" name="depth" value="${article.depth}">
    <input type="hidden" name="groupId" value="${article.articleNum}">
    <input type="hidden" name="fileNum" value="${file.fileNum}">
	<table border="1" width="650" align="center"  style="border-style:outset;border-color:saddlebrown;
			border-width=10;" border="1" width="700" cellpadding="0" cellspacing="0" align="center" bgcolor="EEEEA4">  
		<tr align="center">
 			 <td width="80" >글쓴이</td> <td width="200">${article.id}</td> 			 
 			 <td width="80">민영수치</td> <td>${article.hit}</td>
 		</tr>
 		<tr align="center">	 
			<td>날짜</td><td>${fn:substringBefore(article.writeDate, ".")}</td>
			<td>다운로드</td>
			<td align="left">
			<c:if test="${article.fileStatus !=0}">
			 <c:if test="${fileList!=null }">
			 <ul>
			  <c:forEach var="storedFname" items="${fileList}">
				<li>
				<a  href="/bbs/download.bbs?&storedFname=${storedFname}">${fn:substringAfter(storedFname.storedFname, "_")}</a>
			  	</li>
				<li>
				<img src="/file${storedFname.storedFname}">
			  	</li>
			  </c:forEach>
			 </ul>
			 </c:if>
			</c:if>
			</td>
		 </tr>	 
		 <tr align="center">
			 <td>제목</td><td colspan="4">${article.title}</td>
		 </tr>		
		 <tr>			 
			  <td colspan="4" align="left" height="250"><xmp>${article.content}</xmp></td>
	     </tr>

			<tr>
				<td colspan="4" align="center">
					<button id="1minddal" >

						<div align="center">
							<img src="/img/2민영척.jpg" id="good" width="60" height="80">
							<br /> <p id="goodText">1민영</p>
						</div>
					</button>
				</td>
			</tr>

			<tr>
	      <c:if test="${id !=null}">
	    	  <td colspan="4" align="right">	    	
	    	  <input type="submit" value="답글달기">
	    	  <c:if test="${id ==article.id}">
	    	  <input type="button" value="수정하기" onclick="document.location.href='/bbs/update.bbs?articleNum=${article.articleNum}&pageNum=${pageNum}&title=${article.title}&content=${article.content}&fileStatus=${article.fileStatus}&storedFname=${file.storedFname}'">
	    	  <input type="button" value="삭제하기" onclick="document.location.href='/bbs/delete.bbs?articleNum=${article.articleNum}&pageNum=${pageNum}'">
	    	  </c:if>
	    	  <c:if test="${id !=article.id}">
	    	  <input type="button" value="수정하기" disabled="disabled">
	    	  <input type="button" value="삭제하기" disabled="disabled">
	    	  </c:if>
	    	  <input type="button" value="목록으로" onclick="document.location.href='/bbs/list.bbs?pageNum=${pageNum}'">
	    	  </td>
	      </c:if>
	      		    	
	      <c:if test="${id ==null}">
	    	  <td colspan="4" align="right">
	    	  <input type="submit" value="답글달기" disabled="disabled">
	    	  <input type="button" value="수정하기" disabled="disabled">
	    	  <input type="button" value="삭제하기" disabled="disabled">
	    	  <input type="button" value="목록으로" onclick="document.location.href='/bbs/list.bbs?pageNum=${pageNum}'">
	    	  </td>   
	      </c:if>      	 	      	 
	     </tr>
	     <tr>
	     	<td colspan="4" align="center">↓comment 달기</td>
	     </tr>
	     <tr>
	     
		     <td colspan="4">
		   	   <textarea rows="5" cols="80" id="commentContent"></textarea><br><br>
			   <c:if test="${id ==null}">
		    	  <input type="button" value="comment 쓰기" disabled="disabled">    	  
		       </c:if> 
		       <c:if test="${id !=null}">
	    	 	 <input type="button" value="comment 쓰기" id="commentWrite">
	     	   </c:if>	     	  
	     	   <input type="button" value="comment 읽기(${article.commentCount })" onclick="getComment(1,event)" id="commentRead">	     	       
		   </td> 
		 </tr> 		
		 </table>	
	</form>
	
	<form>
	<div>
		<div id="showComment" align="center">
		</div>
		<input type="hidden" id="commPageNum" value="1">
	</div>	
	</form>
	</div>
</body>
</html>