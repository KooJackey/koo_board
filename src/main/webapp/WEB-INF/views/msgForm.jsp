<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html5>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쪽지보내기 500원ㅍㅍㅍ</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<script type="text/javascript">
function close(){
	window.close();
}
</script>

</head>
<body>
<!-- 	<form id="form1"> -->
<!-- 		<input type="text" name="ddd" size="10" maxlength="10" value="sss" /> -->
<!-- 		<a href="javascript:OpenPop('', '', '', '');"> Click!!</a> -->
<!-- 	</form> -->
<!-- 	<form id="form2" name="form2"> -->
<!-- 		<input type="text" name="postdata" size="10" maxlength="10" -->
<!-- 			value="data" /> -->
<!-- 	</form> -->
	<!-- form1에서 팝업으로 넘길 값을 form2의 개체에 담아 놓고 -->
	<!-- 팝업 띄우기 함수를 클릭했을때 form2의 action과 target을 정해서 form2를 submit 시킨다. -->
	<font color="white">
	쪽지를 보낼 수 있는 ID 목록<br/>
	<ul>
		<c:forEach var="article" items="${idList}">
			<li><c:out value="${article.id}"></c:out></li>
		</c:forEach>
	</ul>
	</font>
<body bgcolor="black">
<form action="/bbs/send.msg" method="post">
	<input type="hidden" name="subID" value="${subID}">
	<table border="2" width="350" align="center"  style="border-style:outset;border-color:saddlebrown;
			border-width=10;" border="1" width="350" cellpadding="0" cellspacing="0" align="center" bgcolor="EEEEA4">  
		<tr>
 			 <td>보내는놈 :</td>
 			 <td>${id}</td>
 		</tr>
 		<tr>	 
		 <td>받는사람 : </td>
		 <td>${subID}</td>			 
		</tr>
		<tr>
		  <td colspan="2">
		  <textarea cols="70" rows="20" name="msg" ></textarea>
		  </td>
	    </tr> 	    
	    <tr>
	      <td><input type="submit" value="보내버리기"></td>
	      <td><input type="button" value="닫아버리기" id="close" onclick="javascript:close();"></td>	      	 
	      <td></td>	      	 
	    </tr>		
	</table>	
</form>
	
	
</body>
</html>