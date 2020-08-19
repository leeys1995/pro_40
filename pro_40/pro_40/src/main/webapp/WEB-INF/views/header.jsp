<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>장수하늘소</title>
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<link href="/css/common.css" rel="stylesheet">
	<link href="/css/mystyle.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<!-- 2020/08/19 테스트중 -->
	<link href="/css/search.css" rel="stylesheet">
  <script>
    $(function(){
    	
      $('.slider').bxSlider({
    	  mode: 'fade',
    	  captions: true
      });
      
      $(".sitemap").click(function() {
			$(".sitewrap").slideDown();
		})
	  $("#close").click(function() {
			$(".sitewrap").slideUp();
		})
		
	  $(".nav > nav > .navi > li").hover(function() {
		  $(this).children(".navi2").stop().slideDown();
	  }, function() {
		  $(this).children(".navi2").stop().slideUp();
	  });
		
    });
  </script>

</head>
<body>
	<div class="header">
		<header>
			<div class="topnav">
<c:if test="${empty user}">			
				<ul>
					<li><a href="/member/login">로그인</a></li>
					<li><a href="/member/insert">회원가입</a></li>
					<li><a href="javascript:void(0)" class="sitemap">사이트맵</a></li>
					<!--	2020/08/19 테스트중	-->
					<li>
						<div id="wrap">
  							<form action="" autocomplete="on" id="main_search_form">
							<input id="search" name="search" type="text" placeholder="검색어 입력"><input id="search_submit" value="Rechercher" type="submit">
							</form>
						</div>
					</li>
				</ul>
</c:if>
<c:if test="${!empty user}">	
<c:if test="${user.userid eq 'admin' }">	
				<ul>
					<li><a href="/member/list?page=1">회원관리</a></li>
					<li><a href="javascript:logout()">로그아웃</a></li>
					<li><a href="" class="sitemap">사이트맵</a></li>
				</ul>
</c:if>
<c:if test="${ user.userid != 'admin'}">
				<ul>
					<li><a href="/member/modify">개인전보 수정</a></li>
					<li><a href="javascript:logout()">로그아웃</a></li>
					<li><a href="" class="sitemap">사이트맵</a></li>
				</ul>	
</c:if>

</c:if>
			</div>
			<div class="navigation">
				<h1 class="logo"><a href="/">LOGO</a></h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="/about/about">사이트소개</a></li>
							<li><a href="/notice/notice?page=1">공지사항</a></li>
							<li><a href="/hospital/hospital?page=1">병원</a></li>
							<li><a href="/corparation/corparation?page=1">기업</a></li>
							<li><a href="qa.do">검색</a></li>						

						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>
	
	<div class="line"></div>
	
	<div class="sitewrap">
		<span class="fa fa-close" id="close" style="cursor: pointer"></span>
		<div class="inner">
			<span class="map">홈페이지소개</span> <span class="map">공지사항</span> <span
				class="map">병원</span> <span class="map">기업</span> <span class="map">검색</span>
			<span class="map">회원가입</span> <span class="map">로그인</span>
		</div>
	</div>
	
	
<script type="text/javascript">
function logout() 
{
	if(confirm("로그아웃 하시겠습니까?")== true)
	{
		alert("로그아웃 되었습니다.");
		location.href="/member/logout";
	}else
	{
		alert("취소 되었습니다.");
		location.href="";
	}
}

</script>	
	
	
	
	
	
	