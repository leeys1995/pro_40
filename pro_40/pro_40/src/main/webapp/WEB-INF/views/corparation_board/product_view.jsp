<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int idx2 = Integer.parseInt(request.getParameter("idx2"));
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
					<a href="../corparation/corparation_view?idx=<%=idx2%>"><img
						height="100px" src="/resources/upload/corp/banner/${c_banner }"
						alt="모집사진"></a>
				</div>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="../corparation/corparation_about?idx=<%=idx2%>">企業紹介</a></li>
							<li><a
								href="../corparation/corparation_guidance?idx=<%=idx2%>">製品初回</a></li>
							<li><a href="corparation_board?idx=<%=idx2%>&page=1">お知らせ</a></li>
							<li><a
								href="/corparation_board/product?idx=<%=idx2%>&page=1">製品の問い合わせ</a></li>
							<li><a
								href="../corparation/corparation_modify?idx=<%=idx2%>">ホームページ
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
			<h2 class="sub-title">企業</h2>
		</div>

		<div class="write-form">
			<table summery="갤러리 글쓰기 테이블 입니다">
				<caption class="readonly">フォーム</caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>

					<tr>
						<th>名前</th>
						<td><input type="text" name="p_name"
							value="${product.p_name }" readonly></td>
					</tr>
					<tr>
						<th>題目</th>
						<td><input type="text" name="p_subject"
							value="${product.p_subject }"></td>
					</tr>

					<tr>
						<th>内容</th>
						<td><textarea name="p_contents" readonly>${product.p_contents }</textarea></td>
					</tr>


					</form>
					<tr>
						<td colspan="2"><a href="productdelete?idx=${product.idx }"><input
								type="button" value="削除する" class="btn-write"></a> <a
							href="/corparation_board/product?idx=<%=idx2%>&page=1"><input
								type="button" value="キャンセル" class="btn-reset"></a></td>
					</tr>

				</tbody>
			</table>
		</div>


	</div>


	<c:if test="${!empty product.reply }">
		<div class="contain">
			<div class="write-form">
				<table summery="갤러리 글쓰기 테이블 입니다">
					<caption class="readonly">フォーム</caption>
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tbody>
						<tr>
							<th>答弁者</th>
							<td><input type="text" name="reply" value="${c_name }"
								readonly></td>
						</tr>

						<tr>
							<th>返事</th>
							<td><textarea name="reply" readonly>${product.reply }</textarea></td>
						</tr>


					</tbody>
				</table>
			</div>
		</div>
	</c:if>


	<c:if test="${empty product.reply }">
		<div class="contain">
			<div class="write-form">
				<table summery="갤러리 글쓰기 테이블 입니다">
					<caption class="readonly">フォーム</caption>
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tbody>
						<form name="input" method="post"
							action="reply?idx=<%=idx%>&idx2=<%=idx2%>">


							<input type="hidden" name="idx" value="<%=idx%>"> <input
								type="hidden" name="idx2" value="<%=idx2%>">

							<tr>
								<th>返事</th>
								<td><textarea name="reply"></textarea></td>
							</tr>


						</form>
						<tr>
							<td colspan="2"><a href="javascript:send()"> <input
									type="button" value="返事する" class="btn-reset">
							</a></td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>

	</c:if>
</body>
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



<script>
	function send() {

		if (input.reply.value == "") {

			alert("返事をご入力ください。");
			input.reply.focus();
			return;
		}

		alert("返事を入力します。");
		input.submit();
	}
</script>










