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
			<li><a href="../member/login">ログイン</a></li>
			<li><a href="../member/insert">新規取得</a></li>
			<li><a href="/">ホーム</a>
		</ul>
	</div>
	<div class="navigation">
		<div style="height:100px; width:200px;">
			<a href="../hospital/hospital_view?idx=${idx }"><img 
				src="/resources/upload/hosp/banner/${h_banner }" alt="모집사진"></a>
		</div>
		<div class="nav">
			<nav>
				<ul class="navi">
						<li><a href="../hospital/hospital_about?idx=${idx }">病院紹介</a></li>
					<li><a href="../hospital/hospital_guidance?idx=${idx }">診療案内</a></li>
					<li><a href="hospital_board?idx=${idx }&page=1">お知らせ</a></li>
					<li><a href="../hospital/hospital_reservation?idx=${idx }">予約</a></li>				
					<li><a href="../hospital/hospital_modify?idx=${idx }">ホームページ <br> 修正</a></li>
					<li><a href="../hospital/reservation?idx=${idx }">予約管理</a></li>


				</ul>
			</nav>
		</div>
	</div>
</header>

</div>

<div class="line"></div>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">病院フォーム</h2>
	</div>
	
	<div class="write-form">
		<table summery="갤러리 글쓰기 테이블 입니다">
			<caption class="readonly">フォーム</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
			<form name="input" method="post" action="hospital_board_write" enctype="multipart/form-data">
			
			 		<input type="hidden" name="idx2" value="${idx }">
			 		
					<tr>
						<th>題目</th>
						<td><input type="text" name="subject">				
						</td>
					</tr>
					<tr>
						<th>内容</th>
						<td><textarea name="contents"></textarea></td>
					</tr>	
						
					<tr>
						<th>ファイル添付</th>
						<td><input type="file" name="filename">
						</td>
					</tr>	
				</form>				
					<tr>
						<td colspan="2">
							<a href="javascript:send()"><input type="button" value="登録する" class="btn-write"></a>
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
		
	
	
		alert("登録します。.");
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
				<p>住所 : ${hosp.h_addr1 } ${hosp.h_addr2 }/お客様案内センター: ${hosp.h_tel } 事業者番号: ${hosp.h_code }</p><br>
			</address>
			<p class="copyright">Copyright &copy ${hosp.h_name }. All rights reserved.</p>
		</div>
</footer>














