<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet">
</head>

<body>

<div class="header">
<header>
	<div class="topnav">
		<ul>
			<li><a href="../member/login">로그인</a></li>
			<li><a href="../member/insert">회원가입</a></li>
			<li><a href="/" ">홈으로</a>
		</ul>
	</div>
	<div class="navigation">
		<div style="height:100px; width:200px;">
			<a href="../hospital/hospital_view?idx=${idx }"><img 
				src="/resources/upload/hosp/banner/${h_banner }" alt="모집사진"></a>
		</div>
		<div class="nav">
			<nav>
				<ul class="navi">
						<li><a href="../hospital/hospital_about?idx=${idx }">병원소개</a></li>
					<li><a href="../hospital/hospital_guidance?idx=${idx }">진료안내</a></li>
					<li><a href="hospital_board?idx=${idx }&page=1">공지</a></li>
					<li><a href="../hospital/hospital_reservation?idx=${idx }">예약</a></li>				
					<li><a href="../hospital/hospital_modify?idx=${idx }">홈페이지 <br> 수정</a></li>
					<li><a href="../hospital/reservation?idx=${idx }">예약관리</a></li>


				</ul>
			</nav>
		</div>
	</div>
</header>

</div>

<div class="line"></div>

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
			<form name="input" method="post" action="hospital_board_write" enctype="multipart/form-data">
			
			 		<input type="hidden" name="idx2" value="${idx }">
			 		
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject">				
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="contents"></textarea></td>
					</tr>	
						
					<tr>
						<th>파일첨부</th>
						<td><input type="file" name="filename">
						</td>
					</tr>	
				</form>				
					<tr>
						<td colspan="2">
							<a href="javascript:send()"><input type="button" value="등록" class="btn-write"></a>
							<a href="javascript:home()">"<input type="button" value="뒤로가기" class="btn-reset"></a>
						</td>
					</tr>
				
			</tbody>
		</table>
	</div>
		
</div>
</body>
<script>
	function send() {
		
		if(input.subject.value=="") {
			alert("제목을 입력해주세요");
			input.subject.focus();
			return;
		}
		if(input.contents.value=="") {
			alert("내용을 입력해주세요");
			input.contents.focus();
			return;
		}
		
	
	
		alert("등록합니다.");
		input.submit();
	}
	
	function home(){
		
		history.back();
	}
</script>

<footer class="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">병원</p>
				<p>주소 : ${hosp.h_addr1 } ${hosp.h_addr2 }/고객센터: ${hosp.h_tel } 	사업자등록번호: ${hosp.h_code }</p><br>
			</address>
			<p class="copyright">Copyright &copy ${hosp.h_name }. All rights reserved.</p>
		</div>
</footer>














