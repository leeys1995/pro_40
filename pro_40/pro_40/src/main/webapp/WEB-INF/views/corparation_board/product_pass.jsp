<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
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
					<c:if test="${empty user}">
						<ul>
							<li><a href="/member/login">ログイン</a></li>
							<li><a href="/member/insert">新規取得</a></li>
							<li><a href="javascript:void(0)" class="sitemap">サイトマップ</a></li>
							<!--	2020/08/19 전체검색	-->
							<li>
								<div id="wrap">
									<form action="/about/search_page" autocomplete="on"
										id="main_search_form">
										<input id="search" name="search" type="text"
											placeholder="検索ワードを入力してください"><input
											id="search_submit" value="Rechercher" type="submit">
									</form>
								</div>
							</li>
						</ul>
					</c:if>
					<c:if test="${!empty user}">
						<c:if test="${user.userid eq 'admin' }">
							<ul>
								<li><a href="/member/list?page=1">会員管理</a></li>
								<li><a href="javascript:logout()">ログアウト</a></li>
								<li><a href="" class="sitemap">サイトマップ</a></li>
							</ul>
						</c:if>
						<c:if test="${ user.userid != 'admin'}">
							<ul>
								<li><a href="/member/modify">個人情報修正</a></li>
								<li><a href="javascript:logout()">ログアウト</a></li>
								<li><a href="" class="sitemap">サイトマップ</a></li>
							</ul>
						</c:if>

					</c:if>
				</ul>
			</div>
			<div class="navigation">
				<div style="height: 100px; width: 200px;">
					<a href="../corparation/corparation_view?idx=<%=idx%>"><img
						height="100px"
						src="/resources/upload/corp/banner/${corp.c_banner }" alt="모집사진"></a>
				</div>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="../corparation/corparation_about?idx=<%=idx%>">企業紹介</a></li>
							<li><a
								href="../corparation/corparation_guidance?idx=<%=idx%>">製品紹介</a></li>
							<li><a href="corparation_board?idx=<%=idx%>&page=1">お知らせ</a></li>
							<li><a href="/corparation_board/product?idx=<%=idx%>&page=1">製品の問い合わせ</a></li>
							<li><a href="../corparation/corparation_modify?idx=<%=idx%>">ホームページ
									<br> 修正
							</a></li>

						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>
	<div class="line"></div>

	<div class="contain">
		<div class="sub-topcontent">
			<h2 class="sub-title">製品の問い合わせ パスワード</h2>
		</div>

		<div class="write-form"
			style="width: 50%; margin: 0 auto; border: 1px solid #ccc; padding: 20px;">

			<form name="my" method="post"
				action="product_pass?idx=${idx }&idx2=${idx2}"
				onsubmit="return formcheck();">

				<fieldset>
					<legend class="readonly">ログイングループ</legend>
					<div style="width: 70%; float: left;">
						<label for="pw" class="readonly">パスワード</label> <input
							type="password" name="p_pass" id="passwd" placeholder="パスワード">
					</div>
					<div
						style="width: 28%; float: right; padding: 15px; height: 132px; margin-top: 3px;">
						<input type="submit" value="確認する" alt="확인"
							style="background: #FF4000; color: #fff; width: 100%; height: 100%; border: 0 none; cursor: pointer;">
					</div>
				</fieldset>
			</form>
		</div>

	</div>
</body>
<script>
	function formcheck() {
		if (my.p_pass.value == "") {
			alert("パスワードを入力ください。");
			my.p_pass.focus();
			return false;
		}

		return true;
	}
</script>

<footer class="footer">
	<div class="container clearfix">
		<address class="address">
			<p class="title">企業</p>
			<p>住所 : ${corp.c_addr1 } ${corp.c_addr2 }/お客様案内センター: ${corp.c_tel }
				事業者番号: ${corp.c_code }</p>
			<br>
		</address>
		<p class="copyright">Copyright &copy ${corp.c_name }. All rights
			reserved.</p>
	</div>
</footer>















