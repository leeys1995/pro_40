<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장수하늘소</title>
	<link href="../css/common.css" rel="stylesheet">
	<link href="../css/mystyle.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

  <script>
    $(document).ready(function(){
      $('.slider').bxSlider({
    	  mode: 'fade',
    	  captions: true
      });
    });
  </script>
</head>
<body>
	<div class="header">
		<header>
			<h1 class="logo"><a href="../index.jsp">JANGSU</a></h1>
			<div class="nav">
				<nav>
					<ul class="navi">
						<li><a href="about.jsp">내소개</a></li>
						<li><a href="../gallery/gallery.jsp">갤러리</a></li>
						<li><a href="../portfolio/portfolio.jsp">포트폴리오</a></li>
						<li><a href="../qa/qa.jsp">질문답변</a></li>
						<li><a href="../notice/notice.jsp">공지사항</a></li>
						<li><a href="../shop/shop.jsp">쇼핑몰</a></li>
					</ul>
				</nav>
			</div>
		</header>
	</div>
	
	<div class="line"></div>