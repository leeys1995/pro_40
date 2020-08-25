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
				<c:if test="${empty user}">
					<ul>

						<li><a href="../member/login">ログイン</a></li>
						<li><a href="../member/insert">新規取得</a></li>
						<li><a href="/">ホーム</a>
					</ul>
				</c:if>
				<c:if test="${!empty user}">
					<c:if test="${user.userid eq 'admin' }">
						<ul>
							<li><a href="../member/list?page=1">会員管理</a></li>
							<li><a href="javascript:logout()">ログアウト</a></li>
							<li><a href="/">ホーム</a>
						</ul>
					</c:if>
					<c:if test="${ user.userid != 'admin'}">
						<ul>
							<li><a href="../member/modify">個人情報修正</a></li>
							<li><a href="javascript:logout()">ログアウト</a></li>
							<li><a href="/">ホーム</a>

						</ul>
					</c:if>
				</c:if>

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
							<li><a href="hospital_controller?idx=${hosp.idx }">ホームページ <br> 管理</a></li>

						</ul>
					</nav>
				</div>
			</div>
		</header>
</div>
	<div class="line"></div>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">ホームページ管理 パスワード</h2>
	</div>
	
	<div class="write-form" style="width:50%; margin:0 auto; border:1px solid #ccc; padding:20px;">
	
		<form name="my" method="post" action="hospital_controller" onsubmit="return formcheck();">
		    
		     <input type="hidden" name="idx" value="${hosp.idx }">
		     
			<fieldset>
				<legend class="readonly">ログイングループ</legend>
				<div style="width:70%; float:left;">
					<label for="pw" class="readonly">パスワード</label>
					<input type="password" name="h_pass" id="passwd" placeholder="パスワード">
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:132px; margin-top:3px;">
					<input type="submit" value="確認" alt="확인" 
					style="background: #FF4000; color:#fff;
					width:100%; height:100%; border:0 none; cursor:pointer;">
				</div>
			</fieldset>
		</form>	
	</div>
		
</div>
</body>
<script>
	function formcheck() {
		if(my.h_pass.value=="") {
			alert("パスワードをご確認ください。");
			my.h_pass.focus();
			return false;
		}
		
		return true;
	}
</script>

<footer class="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">病院</p>
				<p>住所 : ${hosp.h_addr1 } ${hosp.h_addr2 }/お客様案内センター: ${hosp.h_tel }
					事業者番号: ${hosp.h_code }</p>
				<br>
			</address>
			<p class="copyright">Copyright &copy ${hosp.h_name }. All rights
				reserved.</p>
		</div>
	</footer>














