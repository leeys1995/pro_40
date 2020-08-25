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
					<a href="../corparation/corparation_view?idx=<%=idx%>"><img
						height="100px" src="/resources/upload/corp/banner/${c_banner }"
						alt="모집사진"></a>
				</div>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="../corparation/corparation_about?idx=<%=idx%>">企業紹介</a></li>
							<li><a
								href="../corparation/corparation_guidance?idx=<%=idx%>">製品紹介</a></li>
							<li><a href="corparation_board?idx=<%=idx%>&page=1">お知らせ</a></li>
							<li><a href="/corparation_board/product?idx=<%=idx%>&page=1">製品の問い合わせ</a></li>
							<li><a
								href="../corparation/corparation_controller?idx=<%=idx%>">ホームページ
									<br> 管理
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
			<h2 class="sub-title">製品の問い合わせ書く</h2>
		</div>

		<div class="write-form">
			<table summery="갤러리 글쓰기 테이블 입니다">
				<caption class="readonly">フォーム</caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<form name="input" method="post" action="product_write">

						<input type="hidden" value="<%=idx%>" name="idx2">
						<tr>
							<th>題目</th>
							<td><input type="text" name="p_subject"></td>
						</tr>
						<tr>
							<th>名前</th>
							<td><input type="text" name="p_name"></td>
						</tr>
						<tr>
							<th>内容</th>
							<td><textarea name="p_contents"></textarea></td>
						</tr>
						<tr>
							<th>パスワード</th>
							<td><input type="password" name="p_pass"
								placeholder="返事を見るため必要です。"></td>
						</tr>


					</form>
					<tr>
						<td colspan="2"><a href="javascript:send()"><input
								type="button" value="登録する" class="btn-write"></a> <a
							href="javascript:home()"><input type="button" value="キャンセル"
								class="btn-reset"></a></td>
					</tr>

				</tbody>
			</table>
		</div>

	</div>
</body>
<script>
	function send() {

		if (input.p_subject.value == "") {
			alert("題目をご入力ください。");
			input.p_subject.focus();
			return;
		}
		if (input.p_contents.value == "") {
			alert("名前をご入力ください。");
			input.p_contents.focus();
			return;
		}
		if (input.p_name.value == "") {
			alert("内容をご入力ください。");
			input.p_name.focus();
			return;
		}
		if (input.p_pass.value == "") {
			alert("パスワードをご入力ください。");
			input.p_pass.focus();
			return;
		}

		alert("登録します。.");
		input.submit();
	}

	function home() {

		history.back();
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











