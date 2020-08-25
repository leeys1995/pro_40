<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- Ajax 스크립트 추가			
			---------------------2020/08/21수정------------- -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="/smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="https://raw.githubusercontent.com/ganapativs/bttn.css/master/dist/standalone/jelly.css">
<link href="/css/mystyle.css" rel="stylesheet">
<html>
<head>
<style type="text/css">
.border{width: 850px; height: auto; margin: auto;}
.border p{max-width: 150px; max-height: 150px;}
.re{width: 800px; height: auto; text-align:center; margin: auto; padding: 20px;}

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

<script>
//글 저장하기
function about_input() {
	about_form.action="about_pro";
	about_form.submit();
}

//취소 버튼 클릭시 				-2020/08/21 수정-
$(document).ready(function(){
	$('#cal').click(function() {
		$('#view').slideUp("slow");  //view값 숨기기
		$("#start_view").slideDown("slow");	//smarteditor 보여주기
	});
});
</script>

</head>
<body>
<%@ include file="../header.jsp"%>
<br><br>
	<h1 style="text-align: center;">サイト紹介</h1><br><br>
	<!-- 기본 View 부분
					-2020/08/21 수정- -->
	<div class="border" id="start_view">
	${about_view }
	</div>
	
	<!-- 관리자만 입력 및 보기가능 (관리자 세션처리 필요)
							-2020/08/21 수정- -->
	<div class="border" id="view">
		<form method="post" id="frm" name="about_form">
			<textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:800px; height:400px;">${about_view }</textarea>
			<!-- <input type="button" id="savebutton" value="저장하기" style="width: 100px; height: 50px; background:#FA5858; padding:10px 16px; color:#fff;"/> -->
		</form>
		<div class="input_btn">
			<button class="pushy__btn pushy__btn--md pushy__btn--blue" id="savebutton" onclick="javascript:about_input()">セーブする</button>&emsp;
			<button class="pushy__btn pushy__btn--md pushy__btn--red" id="cal">キャンセル</button><br>
		</div>
	</div>
	<!-- 관리자만 보이게 처리하기
					-2020/08/21 수정- -->
					
					
	<c:if test="${user.userid=='admin' }">				
	<c:if test="${!empty about_view }">				
	<div class="re" id="about_modify">
		<button class="pushy__btn pushy__btn--df pushy__btn--green" id="test">修正する</button>
	</div>
	</c:if>
	</c:if>
</body>
</html>

<!-- 기본값일때 출력(null값일 때) 
					-2020/08/21 수정- -->
<c:if test="${empty about_view}">
	<script type="text/javascript">
	$(document).ready(function(){
		var oEditors = [];
	
		var sLang = "ja_JP";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR
		var aDefaultFontSet = [];
		switch(sLang){
			case "ja_JP" :
				aDefaultFontSet = [["MS UI Gothic", "MS UI Gothic"], ["MS Pゴシック", "MS Pゴシック"], ["MS ゴシック", "MS ゴシック"], ["MS P明朝", "MS P明朝"], ["MS 明朝", "MS 明朝"], ["Arial", "Arial"], ["Arial Black", "Arial Black"], ["Comic Sans MS", "Comic Sans MS"], ["Courier New", "Courier New"], ["Times New Roman", "Times New Roman"], ["Verdana", "Verdana"]];
				break;
			default :
				break;
		}
	    //전역변수선언
	    nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "smarteditor",
		sSkinURI: "/smarteditor2/SmartEditor2Skin_ja_JP.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : false,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			SE2M_FontName: {
				aDefaultFontList: aDefaultFontSet
			},
			fOnBeforeUnload : function(){
				//alert("완료!");
			},
			I18N_LOCALE : sLang
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	    
	    //전송버튼 클릭이벤트
	    $("#savebutton").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	        // 이부분에 에디터 validation 검증
	         
	        //폼 submit
	        $("#frm").submit();
	    })
	});
	</script>
</c:if>

<!-- DB에 값이 있을때 SmartEditor 숨기기	
					-2020/08/21 수정- -->
<c:if test="${!empty about_view}">
	<script>
	$(document).ready(function() {
	    $("#view").hide(); //more...숨기기
	}); 
	</script>
</c:if>

<!-- 수정버튼 클릭시	SmartEditor 표시	
					-2020/08/21 수정- -->
<script>
 $(document).ready(function() {
	  $("#test").one('click',function(){
	    //smarteditor 출력
		var oEditors = [];
		var sLang = "ja_JP";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR
		var aDefaultFontSet = [];
		switch(sLang){
			case "ja_JP" :
				aDefaultFontSet = [["MS UI Gothic", "MS UI Gothic"], ["MS Pゴシック", "MS Pゴシック"], ["MS ゴシック", "MS ゴシック"], ["MS P明朝", "MS P明朝"], ["MS 明朝", "MS 明朝"], ["Arial", "Arial"], ["Arial Black", "Arial Black"], ["Comic Sans MS", "Comic Sans MS"], ["Courier New", "Courier New"], ["Times New Roman", "Times New Roman"], ["Verdana", "Verdana"]];
				break;
			default :
				break;
		}
	    //전역변수선언
	    nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "smarteditor",
		sSkinURI: "/smarteditor2/SmartEditor2Skin_ja_JP.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			SE2M_FontName: {
				aDefaultFontList: aDefaultFontSet
			},
			fOnBeforeUnload : function(){
				//alert("완료!");
			},
			I18N_LOCALE : sLang
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	    
	  //전송버튼 클릭이벤트
	    $("#savebutton").click(function(){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	        // 이부분에 에디터 validation 검증
	         
	        //폼 submit
	        $("#frm").submit();
	    })
	    //슬라이드 출력
	    $('#start_view').slideUp("slow");  //view값 숨기기
	    $("#view").slideDown("slow");	//smarteditor 보여주기
	});
	  });
</script>

<%@ include file="../footer.jsp"%>