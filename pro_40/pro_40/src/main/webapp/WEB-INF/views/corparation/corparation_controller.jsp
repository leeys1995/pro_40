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
				<c:if test="${empty user }">
					<ul>
						<li><a href="../member/login">로그인</a></li>
						<li><a href="../member/insert">회원가입</a></li>
						<li><a href="/" ">홈으로</a>
					</ul>
				</c:if>
				<c:if test="${!empty user}">
					
						<ul>
							<li><a href="javascript:logout()">로그아웃</a></li>
							<li><a href="" class="sitemap">사이트맵</a></li>
						</ul>
					</c:if>
			</div>
			<div class="navigation">

				<div style="height: 100px; width: 200px;">

					<a href="corparation_view?idx=${corp.idx }"><img
						src="/resources/upload/corp/banner/${corp.c_banner }" alt="모집사진"></a>

				</div>

				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="corparation_about?idx=${corp.idx }">기업소개</a></li>
							<li><a href="corparation_guidance?idx=${corp.idx }">제품소개</a></li>
							<li><a
								href="/corparation_board/corparation_board?idx=${corp.idx }&page=1">공지</a></li>
							<li><a
								href="/corparation_board/product?idx=${corp.idx }&page=1">제품문의</a></li>
								
							<li><a href="corparation_controller?idx=${corp.idx }">홈페이지 <br>
									관리
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
		<h2 class="sub-title">홈페이지 관리 패스워드</h2>
	</div>
	
	<div class="write-form" style="width:50%; margin:0 auto; border:1px solid #ccc; padding:20px;">
	
		<form name="my" method="post" action="corparation_controller" onsubmit="return formcheck();">
		    
		     <input type="hidden" name="idx" value="${corp.idx }">
		     
			<fieldset>
				<legend class="readonly">로그인그룹</legend>
				<div style="width:70%; float:left;">
					<label for="pw" class="readonly">패스워드</label>
					<input type="password" name="c_pass" id="passwd" placeholder="패스워드">
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
		if(my.c_pass.value=="") {
			alert("비밀번호를 입력하세요");
			my.c_pass.focus();
			return false;
		}
		
		return true;
	}
</script>

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












