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
		<div style="height:100px; width:200px;">
			<a href="../hospital/hospital_view?idx=${idx2 }"><img
				src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
		</div>
		<div class="nav">
			<nav>
				<ul class="navi">
					<li><a href="../hospital/hospital_about?idx=${idx2 }">病院紹介</a></li>
					<li><a href="../hospital/hospital_guidance?idx=${idx2 }">診療案内</a></li>
					<li><a href="hospital_board?idx=${idx2 }&page=1">お知らせ</a></li>
					<li><a href="../hospital/hospital_reservation?idx=${idx2 }">予約</a></li>				
					<li><a href="../hospital/hospital_modify?idx=${idx2 }">ホームページ <br> 　修正</a></li>
					<li><a href="../hospital/reservation?idx=${idx2 }">予約管理</a></li>

				</ul>
			</nav>
		</div>
	</div>
</header>
</div>
<div class="line"></div>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">病院修正</h2>
	</div>
	
	<div class="write-form">
		<table summery="갤러리 글쓰기 테이블 입니다">
			<caption class="readonly">フォーム</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
			<form name="input" method="post" action="hospital_board_modify" enctype="multipart/form-data">
					 
					 <input type="hidden" name="idx" value="${idx }">
					 <input type="hidden" name="idx2" value="${idx2 }">
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" value="${board.subject }">				
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="contents">${board.contents }</textarea></td>
					</tr>	
						
					<tr>
						<th>ファイル添付</th>
						<td><input type="file" name="filename">
						<c:if test="${!empty board.filename }">
							※既存のファイルがあります。
						</c:if>
						</td>
					</tr>	
				</form>				
					<tr>
						<td colspan="2">
							<a href="javascript:send()"><input type="button" value="修正する" class="btn-write"></a>
							<a href="javascript:home()">"<input type="button" value="キャンセル" class="btn-reset"></a>
						</td>
					</tr>
				
			</tbody>
		</table>
	</div>
		
</div>
</body>
<script>
	function send() {
		
		if(input.subject.value=="") {
			alert("題目をご入力ください。");
			input.subject.focus();
			return;
		}
		if(input.contents.value=="") {
			alert("内容をご入力ください。");
			input.contents.focus();
			return;
		}
		
	
	
		alert("修正します。.");
		input.submit();
	}
	
	function home(){
		
		history.back();
	}
</script>

<footer class="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">病院</p>
				<p>住所 : ${hosp.h_addr1 } ${hosp.h_addr2 }/お客様案内センター : ${hosp.h_tel } 	事業者番号: ${hosp.h_code }</p><br>
			</address>
			<p class="copyright">Copyright &copy ${hosp.h_name }. All rights reserved.</p>
		</div>
</footer>














