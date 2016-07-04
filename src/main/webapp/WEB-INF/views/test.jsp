<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>

<script type="text/javascript">
function ajaxUpload() {
    var objForm = document.f;
    var sf = objForm.file.files;
    if (objForm.file.value == "") {
        alert("파일을 선택해 주십시오.");
        return;
    } else {
        try {
            for (var i = 0; i < sf.length; i++) {
                objForm.strFileName.value = sf[i].name.substr(sf[i].name.lastIndexOf("\\") + 1);
                var formData = new FormData(objForm);
                var xhr = initAjax();
                xhr.open("POST", "/bbs/asynFile.bbs", false);
                xhr.send(formData);
            }
        } catch (e) {
            console.log("Upload Error : "+e);
            alert("업로드 중 오류가 발생하였습니다.");
            return;
        } finally {
            alert("업로드가 완료되었습니다.");
            opener.location.reload();
            self.close();
        }
    }
}

function initAjax() { // 브라우저에 따른 AjaxObject 인스턴스 분기 처리
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}

function limitFileChk() { //    파일 업로드 제한 
    var objForm = document.f;
    var sf = objForm.file.files;
    var fileLimit = sf.length;
    
    if (fileLimit > 10) {
        reloadDialog("eml 파일 업로드는 10개를 넘길 수 없습니다. zip 으로 업로드  해주시기 바랍니다.", objForm);
        return;
    }
    if (!multiFileChk(objForm)) { // 다중 업로드시 확장자 체크
        return;
    }
}

function reloadDialog(msg, objForm) { // 팝업창 갱신
    alert(msg);
    objForm.file.value = null; //    firefox multi-file Form flush code
    location.reload();
}

function multiFileChk(objForm) {// 다중 업로드시 eml 외에 다른 확장자 올라가는것을 방지
    var sf = objForm.file.files;
    if (sf.length == 1 && sf[0].name.lastIndexOf(".zip") != -1) // .zip 은 한개만 업로드가능
        return true;
//     for (var i = 0; i < sf.length; i++) {
//         if (sf[i].name.lastIndexOf(".eml") < 0) {
//             reloadDialog("다중 업로드는 .eml 파일만 지원합니다.", objForm);
//             return false;
//         }
//     }
    return true;
}
</script>
</head>
<body>
<form name="f" method="post" enctype="multipart/form-data">
        <input type="hidden" name="strFileName" value="">
        <table class="h2">
            <tr>
                <td>파일 업로드</td>
            </tr>
        </table>
        <div class="k_puAdmin_box">
            <table>
                <tr>
                    <td width="80" align="right"><strong>파일 선택</strong></td>
                    <td><input name="file" type="file" style="width: 350px;"
                             onchange="limitFileChk();" multiple/></td>
                </tr>
            </table>
        </div>
        <div style="text-align: center">
            <a href="javascript:ajaxUpload()"><img src="/img/cut.gif" /></a>
             &nbsp;
            <a href="javascript:window.close()"><img src="/img/슬쩍.png" /></a>
        </div>
    </form>
</body>
</html>