<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-view-title">포트폴리오 제목 출력</h2>
		<p class="sub-view-wd">글쓴이 | 2019-06-11</p>
	</div>
	<div class="sub-view-contnet">
		<p>글쓴내용이 출력되는 부분입니다</p>
		<p>웹문서를 만드는 언어는 html5언어입니다<br>
		멍텅구리 언어라 오류가 나와도 오류무시하고 출력을 시켜요</p>
		<p></p>
		<img src="../images/jsl.jpg" alt="">
	</div>
	
	<div class="sub-view-bottom">
		<a href="portfoliowrite.do" class="btn-modify">수정</a>&nbsp;&nbsp;
		<a href="javascript:void(0)" class="btn-delete" onclick="avent();">삭제</a>&nbsp;&nbsp;
		<a href="portfolio.do" class="btn-list">목록</a>&nbsp;&nbsp;
	</div>
		
</div>
<script>
function avent(){
	if(confirm("후회안해? 삭제?") == true) {
		location.href="portfoliodelete.do";
	}else {
		return;
	}
}
</script>


<%@ include file="../footer.jsp"%>















