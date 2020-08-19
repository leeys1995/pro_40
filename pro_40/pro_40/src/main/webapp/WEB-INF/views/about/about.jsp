<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ---------------------------------------------------2020/08/14수정------------- -->
<jsp:include page="../header.jsp" />

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="https://raw.githubusercontent.com/ganapativs/bttn.css/master/dist/standalone/jelly.css">
<link href="/css/mystyle.css" rel="stylesheet">
<html>
<head>
<style type="text/css">
.border{width: 800px; height: auto; margin: auto;}
.input_btn{
text-align: center; padding: 20px;
}
/* 버튼 스타일 */
.pushy__btn {
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
  display: inline-block;
  border: none;
  border-radius: .3em;
  -webkit-box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05);
          box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.1), inset 0 -0.25em 0 rgba(0, 0, 0, 0.25), 0 0.25em 0.25em rgba(0, 0, 0, 0.05);
  color: #fff;
  cursor: pointer;
  font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto, Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji", "Segoe UI Symbol";
  font-weight: 400;
  line-height: 1.5;
  padding: .5em 1.5em .75em;
  position: relative;
  vertical-align: middle;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none; }
  .pushy__btn:active {
    -webkit-box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
            box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.2), inset 0 2px 0 rgba(255, 255, 255, 0.1), inset 0 0.25em 0.5em rgba(0, 0, 0, 0.05);
    margin-top: .25em;
    padding-bottom: .5em; }
  .pushy__btn:active, .pushy__btn:focus {
    outline: none; }
  .pushy__btn--blue {
    background-color: #1199EE; }
  .pushy__btn--green {
    background-color: #10ac84; }
  .pushy__btn--red {
    background-color: #EE4444; }
  .pushy__btn--lg {
    font-size: 1.5em; }
  .pushy__btn--df {
    font-size: 1.25em; }
  .pushy__btn--md {
    font-size: 1em; }
  .pushy__btn--sm {
    font-size: 0.75em; }
</style>

<script type="text/javascript">

$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: "/smarteditor2/SmartEditor2Skin.html", 
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : false, 
        }
    });
    //전송버튼 클릭이벤트
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#frm").submit();
    })
})

function about_input() {
	alert("test!!!");
	about_form.action="about_pro";
	about_form.submit();
}
</script>
</head>

<body>
<br><br>
	<h1 style="text-align: center;">병원 소개</h1><br><br>
	<div class="border">
		<form method="post" id="frm" name="about_form">
			<textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
			<!-- <input type="button" id="savebutton" value="저장하기" style="width: 100px; height: 50px; background:#FA5858; padding:10px 16px; color:#fff;"/> -->
			<div class="input_btn">
			<button class="pushy__btn pushy__btn--md pushy__btn--blue" id="savebutton" onclick="javascript:about_input()">저장하기</button>&emsp;
			<button class="pushy__btn pushy__btn--md pushy__btn--red" >취소하기</button><br>
			</div>
		</form>
	</div>
</body>
</html>

<%@ include file="../footer.jsp"%>