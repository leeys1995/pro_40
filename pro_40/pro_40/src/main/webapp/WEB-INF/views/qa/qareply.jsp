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
	
	<div class="qareply" style="padding-bottom:30px;">
		<h2 style="padding-bottom:16px;">답변</h2>
		<textarea name="reply" style="width:100%; height:300px;">
		</textarea>
	</div>
	
	
	
	<div class="sub-view-bottom">
		<a href="qareply.do" class="btn-modify">답변저장</a>&nbsp;&nbsp;
		<a href="qa.do" class="btn-list">목록</a>&nbsp;&nbsp;
	</div>
		
</div>



<%@ include file="../footer.jsp"%>















