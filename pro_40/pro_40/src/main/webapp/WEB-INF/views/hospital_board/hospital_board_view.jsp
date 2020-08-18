<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet">
<header>
	<div class="topnav">
		<ul>
			<li><a href="login.do">로그인</a></li>
			<li><a href="member.do">회원가입</a></li>
			<li><a href="javascript:void(0)" class="sitemap">사이트맵</a></li>
		</ul>
	</div>
	<div class="navigation">
		<h1 class="logo">
			<a href="./../hospital/hospital_view?idx=${idx2 }"><img height="100px"
				src="/resources/upload/hosp/banner/${h_banner }" alt="모집사진"></a>
		</h1>
		<div class="nav">
			<nav>
				<ul class="navi">
						<li><a href="../hospital/hospital_about?idx=${idx2 }">병원소개</a></li>
					<li><a href="../hospital/hospital_guidance?idx=${idx2 }">진료안내</a></li>
					<li><a href="hospital_board?idx=${idx2 }&page=1">공지</a></li>
					<li><a href="../hospital/hospital_reservation?idx=${idx2 }">예약</a></li>				
					<li><a href="../hospital/hospital_modify?idx=${idx2 }">홈페이지 <br> 수정</a></li>
					<li><a href="../hospital/reservation?idx=${idx2 }">예약관리</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>



<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">장수하늘소 갤러리</h2>
	</div>
	
	<div class="write-form">
		<table summery="갤러리 글쓰기 테이블 입니다">
			<caption class="readonly">갤러리 입력폼</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
					 		
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" value="${board.subject }" readonly>				
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="contents" readonly>${board.contents }</textarea></td>
					</tr>	
						
					<tr>
						<th>파일첨부</th>
						<c:if test="${!empty board.filename }">
						<td><a href="/resources/upload/hosp_board/file/${board.filename }">${board.filename }</a>
						</td>
						</c:if>
						
						<c:if test="${empty board.filename }">
						<td>파일이 존재하지 않아요
						</td>
						</c:if>
					</tr>	
				</form>				
					<tr>
						<td colspan="2">
							<a href="hospital_board_modify?idx=${board.idx }&idx2=${idx2}"><input type="button" value="수정하기" class="btn-write"></a>
							<a href="hospital_board_delete?idx=${board.idx }&idx2=${idx2}"><input type="button" value="삭제하기" class="btn-write"></a>
							<a href="javascript:home()">"<input type="button" value="뒤로가기" class="btn-reset"></a>
						</td>
					</tr>
				
			</tbody>
		</table>
	</div>
		
</div>

<script>

	
	function home(){
		
		history.back();
	}
</script>

<div class="footer">
	<footer>
		<p>&copy; JANGSU. All &nbsp;&nbsp;&nbsp;Rights Reserved.</p>
	</footer>
	<!-- &copy; &nbsp; &gt; > &lt;< -->
</div>















