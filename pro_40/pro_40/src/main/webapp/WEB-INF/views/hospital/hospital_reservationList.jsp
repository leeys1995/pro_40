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

							<li><a href="hospital_modify?idx=<%=idx%>">ホームページ <br>
									修正
							</a></li>
							<li><a href="reservation?idx=<%=idx%>">予約管理</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>
	<div class="line"></div>
	<div class="contain">
		<div class="sub-topcontent">
			<h2 class="sub-title">予約管理システム</h2>

		</div>

		<div class="content-body">
			<table class="qatable">
				<caption class="readonly">お知らせ表</caption>
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
						<th>年度</th>
						<th>月</th>
						<th>日</th>
						<th>時間</th>
						<th>削除</th>
					</tr>


					<c:if test="${!empty list }">
						<c:forEach items="${list }" var="res">
							<tr>
								<td>${listcount}</td>
								<td>${res.year }</td>
								<td>${res.month }</td>
								<td>${res.day }</td>
								<td>${res.reservation_time}</td>
								<td><a
									href="hospitalReservationDelete?idx=${res.idx }&year=${res.year}&month=${res.month}&
						day=${res.day}&reservation_time=${res.reservation_time}"
									class="btn-write">削除</a></td>
							</tr>
							<c:set var="listcount" value="${listcount-1}" />
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

				<li><div>${listpage }</div></li>

			</ul>



			<a href="hospital_reservation_write?idx=<%=idx%>" class="btn-write">予約時間追加</a>



		</div>

	</div>

</body>
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


















