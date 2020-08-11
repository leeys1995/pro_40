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
<script type="text/javascript">
    $(document).ready(function() {
      $('#summernote').summernote({
        height: 300,
        minHeight: null,
        maxHeight: null,
        focus: true,
        callbacks: {
          onImageUpload: function(files, editor, welEditable) {
            for (var i = files.length - 1; i >= 0; i--) {
              sendFile(files[i], this);
            }
          }
        }
      });
    });
    
    function sendFile(file, el) {
      var form_data = new FormData();
      form_data.append('file', file);
      $.ajax({
        data: form_data,
        type: "POST",
        url: '/image',
        cache: false,
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function(url) {
          $(el).summernote('editor.insertImage', url);
          $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
        }
      });
    }
</script>

</head>
<!-- 출력  -->
<body>
<h2 style="text-align: center;">병원 소개</h2><br><br>
<div style="width: 60%; margin: auto;">
	<form name="about" method="post">
		<textarea id="summernote" name="main_about"></textarea>
		<br>
		<input id="subBtn" type="button" value="글 작성" style="float: right; height: 60px; width: 100px;" onclick="goWrite(this.form)"/>
	</form>
</div>
</form>
</body>
</html>

<!-- Insert -->
<script>
function goWrite(frm) {
	var main_about = frm.main_about.value;
	
	if (main_about.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>
<!-- Insert End -->
<%@ include file="../footer.jsp"%>