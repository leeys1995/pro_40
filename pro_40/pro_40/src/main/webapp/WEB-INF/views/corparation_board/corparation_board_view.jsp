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
			<a href="./../corparation/corparation_view?idx=${idx2 }"><img height="100px"
				src="/resources/upload/corp/banner/${c_banner }" alt="모집사진"></a>
		</h1>
		<div class="nav">
			<nav>
				<ul class="navi">
					<li><a href="../corparation/corparation_about?idx=${corp.idx }">企業紹介</a></li>
					<li><a href="../corparation/corparation_guidance?idx=${corp.idx }">製品紹介</a></li>
					<li><a href="corparation_board?idx=${idx2 }&page=1">お知らせ</a></li>
					<li><a href="/corparation_board/product?idx=${corp.idx }&page=1">製品の問い合わせ</a></li>		
					<li><a href="../corparation/corparation_modify?idx=${corp.idx }">ホームページ <br>　修正</a></li>

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
					 		
					<tr>
						<th>題目</th>
						<td><input type="text" name="subject" value="${board.subject }" readonly>				
						</td>
					</tr>
					<tr>
						<th>内容</th>
						<td><textarea name="contents" readonly>${board.contents }</textarea></td>
					</tr>	
						
					<tr>
						<th>ファイル添付</th>
						<c:if test="${!empty board.filename }">
						<td><a href="/resources/upload/corp_board/file/${board.filename }">${board.filename }</a>
						</td>
						</c:if>
						
						<c:if test="${empty board.filename }">
						<td>ファイルが存在できません。
						</td>
						</c:if>
					</tr>	
				</form>				
					<tr>
						<td colspan="2">
							<a href="corparation_board_modify?idx=${board.idx }&idx2=${idx2}"><input type="button" value="修正する" class="btn-write"></a>
							<a href="javascript:home()">"<input type="button" value="キャンセル" class="btn-reset"></a>
						</td>
					</tr>
				
			</tbody>
		</table>
	</div>
		
</div>

<script>

	
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


