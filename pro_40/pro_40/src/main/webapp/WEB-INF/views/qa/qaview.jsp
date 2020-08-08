<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-view-title">질문 제목 출력</h2>
		<p class="sub-view-wd">글쓴이 | 2019-06-11</p>
	</div>
	<div class="sub-view-contnet">
		<p>질문 내용이 출력되는 부분입니다</p>
		<p>자바 프로그램을 하고 싶습니다<br>
		개발환경과 책 추천을 받고 싶습니다.<br>
		그래서 일본 취업하는 방법즘 알려 주세요</p>
		<p></p>
	</div>
	
	<div class="sub-view-bottom">
		<a href="qareply.do" class="btn-modify">답변</a>&nbsp;&nbsp;
		<a href="javascript:void(0)" class="btn-delete" onclick="avent();">삭제</a>&nbsp;&nbsp;
		<a href="qa.do" class="btn-list">목록</a>&nbsp;&nbsp;
	</div>
		
</div>
<script>
function avent(){
	if(confirm("후회안해? 삭제?") == true) {
		location.href="qadelete.do";
	}else {
		return;
	}
}
</script>


<%@ include file="../footer.jsp"%>















