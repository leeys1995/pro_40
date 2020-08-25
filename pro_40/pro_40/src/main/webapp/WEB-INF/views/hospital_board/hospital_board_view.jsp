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
			<li><a href="javascript:void(0)" class="sitemap">サイトマップ</a></li>
		</ul>
	</div>
	<div class="navigation">
		<div style="height:100px; width:200px;">
			<a href="./../hospital/hospital_view?idx=${idx2 }"><img 
				src="/resources/upload/hosp/banner/${h_banner }" alt="모집사진"></a>
		</div>
		<div class="nav">
			<nav>
				<ul class="navi">
						<li><a href="../hospital/hospital_about?idx=${idx2 }">病院紹介</a></li>
					<li><a href="../hospital/hospital_guidance?idx=${idx2 }">診療案内</a></li>
					<li><a href="hospital_board?idx=${idx2 }&page=1">お知らせ</a></li>
					<li><a href="../hospital/hospital_reservation?idx=${idx2 }">予約</a></li>				
					<li><a href="../hospital/hospital_modify?idx=${idx2 }">ホームページ <br> 修正</a></li>
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
						<td><a href="/resources/upload/hosp_board/file/${board.filename }">${board.filename }</a>
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
							<a href="hospital_board_modify?idx=${board.idx }&idx2=${idx2}"><input type="button" value="修正する" class="btn-write"></a>
							<a href="hospital_board_delete?idx=${board.idx }&idx2=${idx2}"><input type="button" value="削除する" class="btn-reset" style="background-color:green"></a>
							<a href="javascript:home()">"<input type="button" value="뒤로가기" class="btn-reset"></a>
						</td>
					</tr>
				
			</tbody>
		</table>
	</div>
		
</div>
</body>
<script>

	
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