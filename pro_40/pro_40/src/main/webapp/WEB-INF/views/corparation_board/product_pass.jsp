<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
			<li><a href="javascript:void(0)" class="sitemap">사이트맵</a></li>
		</ul>
	</div>
	<div class="navigation">
		<div style="height: 100px; width: 200px;">
			<a href="../corparation/corparation_view?idx=<%=idx%>"><img height="100px"
				src="/resources/upload/corp/banner/${corp.c_banner }" alt="모집사진"></a>
		</div>
		<div class="nav">
			<nav>
				<ul class="navi">
					<li><a href="../corparation/corparation_about?idx=<%=idx%>">기업소개</a></li>
					<li><a href="../corparation/corparation_guidance?idx=<%=idx%>">제품소개</a></li>
					<li><a href="corparation_board?idx=<%=idx%>&page=1">공지</a></li>
					<li><a href="/corparation_board/product?idx=<%=idx%>&page=1">제품문의</a></li>		
					<li><a href="../corparation/corparation_modify?idx=<%=idx%>">홈페이지 <br> 수정</a></li>

				</ul>
			</nav>
		</div>
	</div>
</header>
</div>
	<div class="line"></div>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">제품문의 패스워드</h2>
	</div>
	
	<div class="write-form" style="width:50%; margin:0 auto; border:1px solid #ccc; padding:20px;">
	
		<form name="my" method="post" action="product_pass?idx=${idx }&idx2=${idx2}" onsubmit="return formcheck();">
		
			<fieldset>
				<legend class="readonly">로그인그룹</legend>
				<div style="width:70%; float:left;">
					<label for="pw" class="readonly">패스워드</label>
					<input type="password" name="p_pass" id="passwd" placeholder="패스워드">
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:132px; margin-top:3px;">
					<input type="submit" value="확인" alt="확인" 
					style="background: #FF4000; color:#fff;
					width:100%; height:100%; border:0 none; cursor:pointer;">
				</div>
			</fieldset>
		</form>	
	</div>
		
</div>
</body>
<script>
	function formcheck() {
		if(my.p_pass.value=="") {
			alert("비밀번호를 입력하세요");
			my.p_pass.focus();
			return false;
		}
		
		return true;
	}
</script>

<footer class="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">기업</p>
				<p>주소 : ${corp.c_addr1 } ${corp.c_addr2 }/고객센터: ${corp.c_tel } 	사업자등록번호: ${corp.c_code }</p><br>
			</address>
			<p class="copyright">Copyright &copy ${corp.c_name }. All rights reserved.</p>
		</div>
</footer>















