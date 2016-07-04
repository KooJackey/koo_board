<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    
    <link rel="shortcut icon" type="image/x-icon" href="resources/images/image3.png" />
    
    
    <title>회원가입</title>
    
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="resources/js/joinMember.js"></script>
    <script src="resources/js/passwordCheck.js"></script>
	
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- font awesome -->
    <link rel="stylesheet" href="resources/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="resources/css/style.css" media="screen" title="no title" charset="utf-8">

	<script>
	  function moveMain() {
		document.location.href="main.main";
	}
  </script>
  </head>
  <body>

	<%@ include file="../navbar.jsp" %>
	<br/><br/>
      <article class="container">

        <div class="col-md-12">
        <div class="page-header">
    	    	<h1>회원가입 <small>Register</small></h1>
    	    	
     
        </div>
        <form role="form" class="form-horizontal" action="/bbs/joinMember.bbs" method="POST">
        <div class="form-group">
          <label class="col-sm-3 control-label" for="id">아이디</label>
        <div class="col-sm-6">
          <input class="form-control" id="id" name="id" type="text" placeholder="아이디">
          <div id="idCheckStatus"></div>
        </div>
        </div>

        <div class="form-group">
          <label class="col-sm-3 control-label" for="pass">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="pass" name="pass" type="password" placeholder="비밀번호">
        <p class="help-block">숫자, 특수문자 포함 8자 이상</p>
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="secondPass">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="secondPass" type="password" placeholder="비밀번호 확인">
                <p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
                <div id="pwCheckStatus"></div>
             </div>
          </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="name">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="name" name="name" type="text" placeholder="이름">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="nickname">닉네임</label>
        <div class="col-sm-6">
          <input class="form-control" id="nickname" name="nickname" type="text" placeholder="닉네임">
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="phonenumber">전화번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="phonenumber" name="phonenumber" type="text" placeholder="전화번호">
        </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="email">이메일</label>
        <div class="col-sm-6">
          <input class="form-control" id="email" name="email" type="email" placeholder="이메일">
        </div>
        </div>
 	    
 	    
<!--  	    <div class="form-group"> -->
<!--           <label class="col-sm-3 control-label" for="sex">성별</label> -->
<!--         <div class="col-sm-6"> -->
<!--           <select id="sex" name="sex" class="form-control"> -->
<!--             	<option value="male">male</option> -->
<!--             	<option value="female">female</option> -->
<!--           </select> -->
<!--         </div> -->
<!--         </div> -->
        
 	    <div class="form-group">
          <label class="col-sm-3 control-label" for="birth">생년월일</label>
        <div class="col-sm-6">
          <input class="form-control" id="birth" name="birth" type="text" placeholder="생년월일">
        </div>
        </div>        
        
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="memo">자기소개</label>
        <div class="col-sm-6">
          <textarea class="form-control" id="memo" name="memo" type="text" placeholder="자기소개"></textarea>
        </div>
        </div> 
        


        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">회원가입<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="button" onclick="moveMain()">가입취소<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>
    
      

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   
  </body>
</html>
