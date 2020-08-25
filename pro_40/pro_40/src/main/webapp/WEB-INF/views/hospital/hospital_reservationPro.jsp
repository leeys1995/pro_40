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
					<a href="../hospital/hospital_view?idx=<%=idx%>"><img
						src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
				</div>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="hospital_about?idx=<%=idx%>">病院紹介</a></li>
							<li><a href="hospital_guidance?idx=<%=idx%>">診療案内</a></li>
							<li><a
								href="/hospital_board/hospital_board?idx=<%=idx%>&page=1">お知らせ</a></li>
							<li><a href="hospital_reservation?idx=<%=idx%>">予約</a></li>
							<li><a href="hospital_controller?idx=<%=idx%>">ホームページ <br>
									管理
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
			<h2 class="sub-title">病院管理</h2>
		</div>

		<div class="write-form">
			<table summery="갤러리 글쓰기 테이블 입니다">
				<caption class="readonly">フォーム</caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>

					<form name="input" method="post" action="hospital_reservationPro">


						<input type="hidden" value="${idx }" name="idx"> <input
							type="hidden" value="${year }" name="year"> <input
							type="hidden" value="${month }" name="month"> <input
							type="hidden" value="${day }" name="day">

						<c:if test="${!empty list }">

							<tr>
								<th>日付</th>
								<td>${year }年 ${month }月 ${day }日</td>
							</tr>

							<tr>
								<th>時間</th>
								<td><c:forEach var="res" items="${list }">

										<input type="checkbox" name="reservation_time"
											value="${res.reservation_time }">${res.reservation_time } <br>

									</c:forEach></td>
							</tr>
							<tr>
								<th>名前</th>
								<td><input type="text" name="name"></td>
							</tr>
							<tr>
								<th>電話番号</th>
								<td><input type="text" name="tel"></td>
							</tr>

							<tr>
								<th>診療希望事項</th>
								<td><textarea name="disease"></textarea></td>
							</tr>



							<tr>
								<td colspan="2"><a href="javascript:send()"><input
										type="button" value="予約" class="btn-write"></a> <a
									href="javascript:home()"><input type="button" value="キャンセル"
										class="btn-reset"></a></td>
							</tr>

						</c:if>

						<c:if test="${empty list }">
							<script>
								alert("予約できる時間がありません。 ");
								history.back();
							</script>
						</c:if>
					</form>
				</tbody>
			</table>
		</div>

	</div>
</body>
<script>
	function send() {

		if (input.name.value == "") {
			alert("名前をご入力ください。");
			input.name.focus();
			return;
		}
		if (input.tel.value == "") {
			alert("電話番号をご入力ください。");
			input.tel.focus();
			return;
		}

		if (input.disease.value == "") {
			alert("病名をご入力ください。");
			input.h_tel.focus();
			return;
		}

		alert("予約します。");
		input.submit();
	}

	function home() {

		history.back();
	}
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
