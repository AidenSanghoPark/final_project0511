<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html> 
<head> 
<title>File upload check</title> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.3.min.js"></script> 
<script type="text/javascript"> 
// 첨부파일 확장자 확인 
function checkImg(obj, ext){
	var check = false; 
	var extName = $(obj).val().substring($(obj).val().lastIndexOf(".")+1).toUpperCase(); 
	var str = ext.split(","); 
	for (var i=0;i<str.length;i++) { 
		if(extName == $.trim(str[i])) { 
			check = true; break; 
		} else 
			check = false; 
		} if(!check) {
			alert(ext+" 파일만 업로드 가능합니다."); 
		} return check; 
		} 
		
// 첨부파일 용량 확인 
function checkImgSize(obj, size) { 
	var check = false; 
	if(window.ActiveXObject) {
		//IE용인데 IE8이하는 안됨... 
		var fso = new ActiveXObject("Scripting.FileSystemObject");
		//var filepath = document.getElementById(obj).value;
		var filepath = obj[0].value;
		var thefile = fso.getFile(filepath); sizeinbytes = thefile.size;
	} else {//IE 외
		//sizeinbytes = document.getElementById(obj).files[0].size;
		sizeinbytes = obj[0].files[0].size;
	} 
	
	var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
	var i = 0;
	var checkSize = size; 
	while(checkSize>900) {
		checkSize/=1024;
		i++; 
	} checkSize = (Math.round(checkSize*100)/100)+' '+fSExt[i]; 
	var fSize = sizeinbytes; 
	if(fSize > size) { 
		alert("첨부파일은 "+ checkSize + " 이하로 등록가능합니다."); check = false; 
	} else 
	
	{ check = true; } return check; } 
	
	// 이미지 선택 
	document.getElementById("fileName").onchange = function () { 
		if(this.value != "") { 
			var extPlan = "JPG, PNG"; 
			var checkSize = 1024*1024*5; // 5MB 
			if(!checkImg($('#fileName'), extPlan) | !checkImgSize($('#fileName'), checkSize)) { 
				this.value = ""; return; 
			} 
		} 
	}; 
	
	</script> 
	</head> 
	<body> 
	<input id="fileName" type="file" name="fileName" accept="image/*"> 
	</body> 
	</html>
		

