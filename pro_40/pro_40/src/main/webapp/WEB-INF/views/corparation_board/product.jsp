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
							<li><a href="/corparation_board/product?idx=<%=idx%>&page=1">製本の問い合わせ</a></li>
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
			<h2 class="sub-title">製品の問い合わせ</h2>
			<div class="sub-search">
				<form name="my" method="post" action="product?page=1&idx=<%=idx%>">
					<select name="search" class="sel">
						<option value="subject"
							<c:if test="${pageVO.search =='subject'}">selected</c:if>>題目</option>
						<option value="contents"
							<c:if test="${pageVO.search =='contents'}">selected</c:if>>内容</option>
					</select>
					<c:if test="${empty pageVO.key }">
						<td><input type="text" size=20 name="key"></td>
					</c:if>
					<c:if test="${!empty pageVO.key }">
						<td><input type="text" size=20 name="key"
							value="${pageVO.key }"></td>
					</c:if>
					<a href="javascript:p_search()"><input type="button" value="検索"
						class="btn"></a>
				</form>
			</div>
		</div>

		<div class="content-body">
			<table class="qatable">
				<caption class="readonly">Q&Aの表</caption>
				<colgroup>
					<col width="6%">
					<col width="48%">
					<col width="10%">
					<col width="15%">
					<col width="11%">
					<col width="10%">
				</colgroup>
				<tbody>
					<tr>
						<th>番号</th>
						<th>題目</th>
						<th>名前</th>
						<th>書く日付</th>
						<th>返事</th>

					</tr>

					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="product">
							<tr>
								<td>${product.idx }</td>
								<td class="tleft"><a
									href="product_pass?idx=${product.idx }&idx2=<%=idx%>">${product.p_subject }</a>


								</td>
								<td>${product.p_name }</td>
								<td>${product.regdate.substring(0,10) }</td>

								<c:if test="${product.reply_ok eq('0') }">
									<td>返事未完了</td>
								</c:if>

								<c:if test="${product.reply_ok eq('1') }">
									<td>返事完了</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:if>

					<c:if test="${empty list }">
						<tr>
							<td colspan="5">データが存在できません。</td>

						</tr>

					</c:if>
				</tbody>
			</table>
		</div>


		<div class="paging">
			<ul>

				<li style="padding: 0 30px;"><a href="${prev }"><img style="width:20px; height:20px;"
						src="/images/i_prev.gif"></a><a href="#">${page }</a>
						<a href="${next }"><img style="width:20px; height:20px;"
						src="/images/i_next.gif"></a></li>
				
			</ul>
			<a href="product_write?idx=<%=idx%>" class="btn-write">書く</a>
		</div>

	</div>
</body>
<script>
	function p_search() {

		if (my.key.value == "") {
			alert("検索する単語を入力してください。");
			my.key.focus;
			return;
		}

		my.submit();
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







