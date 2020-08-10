<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css">

<jsp:include page="../header.jsp"/> 


<html>
<head>
	<script src="/resources/js/summernote-ko-KR.js"></script>
	<!-- include libraries(jQuery, bootstrap) -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
	<!-- include Summernote css/js-->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
	<!-- include Summernote-ko-KR -->
<title>글쓰기</title>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: '병원 소개를 입력해 주세요',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR',
	        callback:{
	        	onImageUpload : function(files){
	        		uploadSummernoteImageFile(Files[0],this);
	        	}
	        }
	  });
});

function uploadSummernoteImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	$.ajax({
		data : data,
		type : "POST",
		url : "/uploadSummernoteImageFile",
		contentType : false,
		processData : false,
		success : function(data) {
        	//항상 업로드된 파일의 url이 있어야 한다.
			$(editor).summernote('insertImage', data.url);
		}
	});
}
</script>
</head>
<!-- 출력  -->
<body>
<h2 style="text-align: center;">병원 소개</h2><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post">
		<textarea id="summernote" name="h_about"></textarea>
		<br>
		<input id="subBtn" type="button" value="글 작성" style="float: right; height: 60px; width: 100px;" onclick="goWrite(this.form)"/>
	</form>
</div>

</body>
</html>

<!-- Insert -->
<script>
function goWrite(frm) {
	var h_about = frm.h_about.value;
	
	if (h_about.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>
<!-- Insert End -->
<%@ include file="../footer.jsp"%>