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
			<li><a href="../member/login">ログイン</a></li>
			<li><a href="../member/insert">新規取得</a></li>
			<li><a href="/">ホーム</a>
		</ul>
	</div>
	<div class="navigation">
	
			
		<div style="height:100px; width:200px;">
		
			<a href="../hospital/hospital_view?idx=<%=idx%>"><img
				src="/resources/upload/hosp/banner/${h_banner }" alt="모집사진"></a>
		
		</div>
		<div class="nav">
			<nav>
				<ul class="navi">
						<li><a href="../hospital/hospital_about?idx=<%=idx%>">病院紹介</a></li>
					<li><a href="../hospital/hospital_guidance?idx=<%=idx%>">診療案内</a></li>
					<li><a href="hospital_board?idx=<%=idx%>&page=1">お知らせ</a></li>
					<li><a href="../hospital/hospital_reservation?idx=<%=idx%>">予約</a></li>				
					<li><a href="../hospital/hospital_controller?idx=<%=idx%>">ホームページ <br> 管理</a></li>

				</ul>
			</nav>
		</div>
	</div>
</header>
</div>

<div class="line"></div>
<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">お知らせ</h2>
		<div class="sub-search">
		
			<form name="board" method="post" action="hospital_board?page=1&idx=<%=idx%>">
				
				
				<tr>
					<td><select name="search">
						    
							<option value="subject"
							<c:if test="${pageVO.search =='subject'}">selected</c:if>>題目</option>

							<option value="contents"
							<c:if test="${pageVO.search =='contents'}">selected</c:if>>内容</option>
							</select></td>
							<c:if test="${empty pageVO.key }">
							<td><input type="text" size=20 name="key"></td>
							</c:if>
							<c:if test="${!empty pageVO.key }">
							<td><input type="text" size=20 name="key"
									value="${pageVO.key }"></td>
							</c:if>
							<td><a href="javascript:b_search()"><input type="button" value="검색" class="btn"></a></td>

											</tr>
				<br>
				<td>総数:${totcount }</td>
			</form>
		</div>
	</div>

	<div class="content-body">
		<table class="qatable">
			<caption class="readonly">お知らせ</caption>
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
					<th>日付</th>
					<th>数</th>
				</tr>

				
				<c:if test="${!empty list }">
				 <c:forEach items="${list }" var="board">
						<tr>
						<td>${board.idx }</td>
						<td><a href="hospboardHits?idx=${board.idx }&idx2=<%=idx%>">${board.subject }</a></td>
						<td>${h_name }</td>
						<td>${board.regdate.substring(0,10) }</td>
						<td>${board.readcnt }</td>
					
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
			<li style="padding: 0 30px;"><a href="${prev }"><img
					src="/images/i_prev.gif"></a></li>
			<li><a href="#">${page }</a></li>
			<li style="padding: 0 30px;"><a href="${next }"><img
					src="/images/i_next.gif"></a></li>
			
		</ul>

	</div>

</div>
</body>
<footer class="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">病院</p>
				<p>住所 : ${hosp.h_addr1 } ${hosp.h_addr2 }/お客様案内センター : ${hosp.h_tel } 	事業者番号: ${hosp.h_code }</p><br>
			</address>
			<p class="copyright">Copyright &copy ${hosp.h_name }. All rights reserved.</p>
		</div>
</footer>

<script>
function b_search() {

	if (board.key.value == "") {

		alert("검색어를 입력하세요");
		board.key.focus();
		return;
	}
	board.submit();
}
</script>

















