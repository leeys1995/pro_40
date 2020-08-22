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
					<li><a href="../member/login">로그인</a></li>
					<li><a href="../member/insert">회원가입</a></li>
					<li><a href="/" ">홈으로</a>
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
							<li><a href="../corparation/corparation_about?idx=<%=idx%>">기업소개</a></li>
							<li><a
								href="../corparation/corparation_guidance?idx=<%=idx%>">제품소개</a></li>
							<li><a href="corparation_board?idx=<%=idx%>&page=1">공지</a></li>
							<li><a href="/corparation_board/product?idx=<%=idx%>&page=1">제품문의</a></li>
							<li><a href="../corparation/corparation_controller?idx=<%=idx%>">홈페이지 <br>
									관리
							</a></li>
						
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
		<h2 class="sub-title">공지사항</h2>
		<div class="sub-search">

			<form name="board" method="post"
				action="corparation_board?page=1&idx=<%=idx%>">


				<tr>
					<td><select name="search">

							<option value="subject"
								<c:if test="${pageVO.search =='subject'}">selected</c:if>>글제목</option>

							<option value="contents"
								<c:if test="${pageVO.search =='contents'}">selected</c:if>>글내용</option>
					</select></td>
					<c:if test="${empty pageVO.key }">
						<td><input type="text" size=20 name="key"></td>
					</c:if>
					<c:if test="${!empty pageVO.key }">
						<td><input type="text" size=20 name="key"
							value="${pageVO.key }"></td>
					</c:if>
					<td><a href="javascript:b_search()"><input type="button"
							value="검색" class="btn"></a></td>

				</tr>
				<br>
				<td>총개수:${totcount }</td>
			</form>
		</div>
	</div>

	<div class="content-body">
		<table class="qatable">
			<caption class="readonly">공지사항 표</caption>
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
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날자</th>
					<th>조회수</th>
				</tr>


				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="board">
						<tr>
							<td>${board.idx }</td>
							<td><a href="corpboardHits?idx=${board.idx }&idx2=<%=idx%>">${board.subject }</a></td>
							<td>${c_name }</td>
							<td>${board.regdate.substring(0,10) }</td>
							<td>${board.readcnt }</td>

						</tr>
					</c:forEach>
				</c:if>


				<c:if test="${empty list }">
					<tr>
						<td colspan="5">데이터가 존재하지 않습니다.</td>

					</tr>

				</c:if>
			</tbody>
		</table>
	</div>


	<div class="paging">
		<ul>

			<li><div>${listpage }</div></li>

		</ul>



		



	</div>

</div>
</body>
<footer class="footer">
	<div class="container clearfix">
		<address class="address">
			<p class="title">기업</p>
			<p>주소 : ${corp.c_addr1 } ${corp.c_addr2 }/고객센터: ${corp.c_tel }
				사업자등록번호: ${corp.c_code }</p>
			<br>
		</address>
		<p class="copyright">Copyright &copy ${corp.c_name }. All rights
			reserved.</p>
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

















