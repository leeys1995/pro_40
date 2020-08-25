<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet">
<header>
	<div class="topnav">
		<ul>
			<li><a href="../member/login">ログイン</a></li>
			<li><a href="../member/insert">新規取得</a></li>
			<li><a href="javascript:void(0)" class="sitemap">サイトマップ</a></li>
		</ul>
	</div>
	<div class="navigation">
		<h1 class="logo">
			<a href="../corparation/corparation_view?idx=${idx2 }"><img height="100px"
				src="/resources/upload/corp/banner/${corp.c_banner }" alt="모집사진"></a>
		</h1>
		<div class="nav">
			<nav>
				<ul class="navi">
					<li><a href="../corparation/corparation_about?idx=${corp.idx }">企業紹介</a></li>
					<li><a href="../corparation/corparation_guidance?idx=${corp.idx }">製品紹介</a></li>
					<li><a href="corparation_board?idx=${idx2 }&page=1">お知らせ</a></li>
					<li><a href="/corparation_board/product?idx=${corp.idx }&page=1">製品の問い合わせ</a></li>		
					<li><a href="../corparation/corparation_modify?idx=${corp.idx }">ホームページ <br> 修正</a></li>
					
				</ul>
			</nav>
		</div>
	</div>
</header>



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
			<form name="input" method="post" action="corparation_board_modify" enctype="multipart/form-data">
					 
					 <input type="hidden" name="idx2" value="${idx2 }">
					<tr>
						<th>題目</th>
						<td><input type="text" name="subject" value="${board.subject }">				
						</td>
					</tr>
					<tr>
						<th>内容</th>
						<td><textarea name="contents">${board.contents }</textarea></td>
					</tr>	
						
					<tr>
						<th>ファイル添付</th>
						<td><input type="file" name="filename">
						<c:if test="${!empty board.filename }">
							※既存のファイルが存在します。
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
		
	
	
		alert("修正します。");
		input.submit();
	}
	
	function home(){
		
		history.back();
	}
</script>

<div class="footer">
	<footer>
		<p>&copy; JANGSU. All &nbsp;&nbsp;&nbsp;Rights Reserved.</p>
	</footer>
	<!-- &copy; &nbsp; &gt; > &lt;< -->
</div>
