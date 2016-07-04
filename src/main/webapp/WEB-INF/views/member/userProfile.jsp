<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link rel="shortcut icon" type="image/x-icon" href="resources/images/w_r.JPG" />


    <title>(별 볼일 없는)너님 정보</title>

    <!-- Bootstrap Core CSS -->

<!-- 글씨 크기 조정 -->
<style type="text/css">
	@media (max-width: 479px){
	.text-resp{
	font-size: 15px}
	}
	@media(min-width: 480px){
	.text-resp{
	font-size:20px}
	}
	
div{
	clear: both;
}
</style>

<script type="text/javascript">
	function complete(){	// 수정버튼 submit 시 출력
		alert("정상적으로 처리되었습니다");
	}
</script>
<style type="text/css">
.form-control{
	max-width: 150px;
}

#profile_image{
	height: 150px;
	width: 150px;
}
#info_col{
	max-width: 400px;
}
#updateButtonDiv{
 	margin-right: 5%;
}
#introduce{
	max-width: 300px;
}

</style>




</head>

<body>

	<%@ include file="../navbar.jsp" %>

    <div class="container" id="wrapper" style="position: static;" align="center">
		<br/><br/><br/><br/>
		<div id="page-wrapper" >
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">너님 정보염<small >(수정가능하셈!!)</small></h1>
                </div>
            </div>
            <div class="row" style="max-width: 800px;">
                <div class="col-lg-9" >
                    <div class="panel panel-default">
<!--                         <div class="panel-heading"> -->
<!--                             Striped Rows -->
<!--                         </div> -->
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<form action="/bbs/userProfileUpdate.bbs" id="profileUpdateSuccess"  method="post" enctype="multipart/form-data">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <colgroup>
                                    	<col width="30%" />
                                    	<col width="*%" id="info_col"/>
                                    </colgroup>	
                                    <tbody>
                                           
                                        <tr height="200px">
                                            
                                            <td colspan="2">
                                            		프로필 사진<br/>
<!-- 												<div  class="col-lg-2 col-md-2"> -->
                                            		<img alt="이미지가 없습니다." 
                                            		src="/profile/${userInfo.picture}" 
                                            		class="img-thumbnail"
                                            		id="profile_image">
<!--                                             	</div> -->
												<br/>
                                            <label>프로필 수정</label>
                                            <input type="file" name="profile">
                                        	</td>
                                        </tr>
                                        <tr>
                                            <td>아이디</td> <td>${userInfo.id}</td>
                                        </tr>
                                        <tr>
                                            <td>비밀번호</td> <td><input class="form-control" type="password" name="pass" id="pass"  maxlength="16"></td>
                                        </tr>
                                        <tr>
                                            <td>비밀번호 확인</td> <td><input class="form-control" type="password" id="secondPass"  maxlength="16"></td>
                                        </tr>
                                        <tr>
                                            <td>이름</td> <td>${userInfo.name }</td>
                                        </tr>
                                        <tr>
                                            <td>닉네임</td> <td><input class="form-control" type="text" name="nickname" id="nickname"  maxlength="16" value="${userInfo.nickname}"></td>
                                        </tr>
                                        <tr>
                                            <td>H.P</td> <td><input class="form-control" type="text" name="phonenumber" id="phonenumber"  maxlength="16" value="${userInfo.phonenumber}"></td>
                                        </tr>
                                        <tr>
                                            <td>E-Mail</td> <td><input class="form-control" type="text" name="email" id="email"  maxlength="16" value="${userInfo.email}"></td>
                                        </tr>
                                        <tr>
                                            <td>생일</td> <td><input class="form-control" type="text" name="birth" id="birth"  maxlength="16" value="${userInfo.birth}"></td>
                                        <tr>
                                            <td>자기소개(최대 100Bytes)</td> <td><textarea class="form-control" name="memo" rows="3" maxlength="100" id="memo">${userInfo.memo}</textarea></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div id="updateButtonDiv" align="right">
                                    <input type="submit" onclick="complete()" class="btn btn-primary" id="updateButton" value="수정">
                                </div>
                            </div>
                            </form>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
</div></div>
<!--          div 바디   절취선 ----------------------------------------------------------------------------- -->
    </div>



        
        
        
        
        



<!-- back to TOP -->
		<a id="back-to-top" href="#"
			class="btn btn-primary btn-lg back-to-top" role="button"
			title="Click to return on the top page" data-toggle="tooltip"
			data-placement="left"><span
			class="glyphicon glyphicon-chevron-up"></span></a>

	</div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="resources/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="resources/js/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
<!--     <script src="resources/js/raphael-min.js"></script> -->
<!--     <script src="resources/js/morris.min.js"></script> -->
<!--     <script src="resources/js/morris-data.js"></script> -->

    <!-- Custom Theme JavaScript -->
    <script src="resources/js/sb-admin-2.js"></script>


<!-- back to TOP -->
	<script type="text/javascript">
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 50) {
					$('#back-to-top').fadeIn();
				} else {
					$('#back-to-top').fadeOut();
				}
			});
			// scroll body to 0px on click
			$('#back-to-top').click(function() {
				$('#back-to-top').tooltip('hide');
				$('body,html').animate({
					scrollTop : 0
				}, 800);
				return false;
			});

			$('#back-to-top').tooltip('show');

		});
	</script>
</body>
</html>