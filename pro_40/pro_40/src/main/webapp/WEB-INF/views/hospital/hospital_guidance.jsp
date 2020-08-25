<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet" type="text/css">

<style>
.container {
	width: 1100px;
	margin: 0 auto;
}

.text_center {
	text-align: center;
	margin-top: 100px;
}

.text_center p {
	font-size: 40px;
	color: #000;
	line-height: 1.4;
}

.text_center .support_text {
	color: #0067b3;
	font-size: 25px;
}

.greeting_cont {
	overflow: hidden;
}

.greeting_cont .text_wrap {
	line-height: 1.8;
	letter-spacing: -1px;
}

.greeting_cont .text_wrap p {
	margin-bottom: 27px;
}

.greeting_cont .text_wrap .sign {
	font-size: 18px;
	padding-top: 72px;
}

.footer {
	clear: both;
	background: #42464d;
	padding-top: 80px;
	padding-bottom: 65px;
	margin-top: 60px;
}

.footer .address {
	font-style: normal;
	color: #ababb1;
	margin-bottom: 20px;
}

.footer .address .title {
	font-size: 14px;
	margin-bottom: 8px;
	color: #fff;
}

.footer  .copyright {
	color: #fff;
}
</style>

<title>Insert title here</title>
</head>
<body>
	<!-- 
 웹문서 만들기 기본 공식
 1. 요소를 어떻게 묶을 것인가? 그룹만들기
 2. 그룹안에 적절한 태그 사용
 3. class 이름 붙이고 css 적용
 -->


	<div class="header">
		<header>
			<div class="topnav">
				<ul>
					<c:if test="${empty user}">
						<ul>
							<li><a href="/member/login">ログイン</a></li>
							<li><a href="/member/insert">新規取得</a></li>
							<li><a href="/">ホーム</a></li>
							
						</ul>
					</c:if>
					<c:if test="${!empty user}">
						<c:if test="${user.userid eq 'admin' }">
							<ul>
								<li><a href="/member/list?page=1">会員管理</a></li>
								<li><a href="javascript:logout()">ログアウト</a></li>
								<li><a href="/">ホーム</a></li>
							</ul>
						</c:if>
						<c:if test="${ user.userid != 'admin'}">
							<ul>
								<li><a href="/member/modify">個人情報修正</a></li>
								<li><a href="javascript:logout()">ログアウト</a></li>
								<li><a href="/">ホーム</a></li>
							</ul>
						</c:if>

					</c:if>
				</ul>
			</div>
			<div class="navigation">

				<div style="height: 100px; width: 200px;">
					<a href="hospital_view?idx=${hosp.idx }"><img
						src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
				</div>

				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="hospital_about?idx=${hosp.idx }">病院紹介</a></li>
							<li><a href="hospital_guidance?idx=${hosp.idx }">診療案内</a></li>
							<li><a
								href="/hospital_board/hospital_board?idx=${hosp.idx }&page=1">お知らせ</a></li>
							<li><a href="hospital_reservation?idx=${hosp.idx }">予約</a></li>
							<li><a href="hospital_controller?idx=${hosp.idx }">ホームページ
									<br> 管理
							</a></li>

						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>

	<div class="line"></div>

	<div class="sitewrap">
		<span class="fa fa-close" id="close" style="cursor: pointer"></span>
		<div class="inner">
			<span class="map">ホームページ紹介</span> <span class="map">お知らせ</span> <span
				class="map">病院</span> <span class="map">기업</span> <span class="map">検索</span>
			<span class="map">新規取得</span> <span class="map">ログイン</span>
		</div>
	</div>

	<div class="container">
		<div class="text_center">
			<p>
				<span class="support_text">${hosp.h_name }</span><br /> <strong>診療案内</strong>
			</p>
			<span class="col_bar"></span>
		</div>
		<div class="greeting_cont">
			<img src="/resources/upload/hosp/doctor_photo/${hosp.d_photo }"
				alt=""
				style="float: left; padding: 0px 40px; width: 500px; height: 500px;">
			<div class="text_wrap">
				<p>${hosp.d_medical }</p>
			</div>
		</div>
	</div>
	<!-- end contents -->

	<script>
		$(function() {
			$(".location  .dropdown > a").on("click", function(e) {
				e.preventDefault();
				if ($(this).next().is(":visible")) {
					$(".location  .dropdown > a").next().hide();
				} else {
					$(".location  .dropdown > a").next().hide();
					$(this).next().show();
				}
			});
		});
	</script>


	<footer class="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">病院</p>
				<p>住所 : ${hosp.h_addr1 } ${hosp.h_addr2 }/お客様案内センター :
					${hosp.h_tel } 事業者番号: ${hosp.h_code }</p>
				<br>
			</address>
			<p class="copyright">Copyright &copy ${hosp.h_name }. All rights
				reserved.</p>
		</div>
	</footer>
</body>
</html>