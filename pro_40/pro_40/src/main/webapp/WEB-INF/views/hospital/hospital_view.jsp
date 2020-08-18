<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	int idx2 = Integer.parseInt(request.getParameter("idx"));
%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID&submodules=geocoder"></script>
<html>
<head>
<meta charset="UTF-8">
<title>장수하늘소</title>
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet" type="text/css">
<style>
	.aaa_right {
		padding:15px;
		height: 200px;
		}
		
</style>
<!-- 카카오톡 맵 좌표 찍기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=831d3575fb87dc0f7e2e0d4494eb90f6&libraries=services"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>

	$(function() {

		$('.slider').bxSlider({
			mode : 'fade',
			captions : true
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
				<ul>
					<li><a href="../member/login">로그인</a></li>
					<li><a href="../member/insert">회원가입</a></li>
					<li><a href="javascript:void(0)" class="sitemap">사이트맵</a></li>
				</ul>
			</div>
			<div class="navigation">
				<h1 class="logo">
					<a href="hospital_view?idx=${hosp.idx }"><img height="100px"
						src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
				</h1>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="hospital_about?idx=${hosp.idx }">병원소개</a></li>
							<li><a href="hospital_guidance?idx=${hosp.idx }">진료안내</a></li>
							<li><a href="/hospital_board/hospital_board?idx=${hosp.idx }&page=1">공지</a></li>
							<li><a href="hospital_reservation?idx=${hosp.idx }">예약</a></li>							
							<li><a href="hospital_modify?idx=${hosp.idx }">홈페이지 <br> 수정</a></li>
							<li><a href="reservation?idx=${hosp.idx }">예약관리</a></li>

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

	<style>
/* aaa css */
.aaa_wrap {
	clear: both;
	width: 1200px; /* 가로폭 지정 */
	/* border:1px solid #ccc;   테두리 선 */
	/* background:#f00;  배경색 */
	height: 360px; /* 높이 */
	margin: 0 auto; /* 그룹 가운데 정렬 */
	/* 
	10 30 20 50 상 우 하 좌
	10 20 상하 , 좌우
	40 30 20 상, 좌우 , 하
	10 상하좌우 
	*/
}

.aaa_left, .aaa_right {
	width: 585px;
	float: left; /* 그룹을 왼쪽으로 정렬 */
	border: 1px solid #cdcdcd;
	padding: 40px;
	border-radius: 5px; /* 모서리 둥글게 */
	position: relative; /* 상대위치 지정, 왼쪽 상당이 기준점이 된다 */
}

.aaa_left .plus, .aaa_right .plus {
	position: absolute;
	right: 30px;
	top: 40px;
	padding: 12px;
}

.aaa_left {
	margin-right: 30px;
}

.aaa_wrap .aaa_left .title {
	margin-bottom: 16px;
}

.aaa_wrap .aaa_right .title {
	margin-bottom: 16px;
}

.aaa_left ul li { /* 하위 선택자 */
	line-height: 220%; /* 줄간격 */
}

.aaa_right ul li { /* 하위 선택자 */
	line-height: 220%; /* 줄간격 */
}
</style>
	<div class="slider">

		<div>
			<img height="1000px"
				src="/resources/upload/hosp/hospital_photo/${hosp.h_photo }" alt=""
				title="병원 메인 사진">
		</div>

	</div>

	<div class="aaa_wrap">
		<div class="aaa_left">
			<h2 class="title">공지시항</h2>
			<ul>
			
			 <c:if test="${!empty list }">
			    <c:forEach items="${list }" var="hosp_board" begin="0" end="4">
				<li><a href="../hospital_board/hospboardHits?idx=${hosp_board.idx }&idx2=<%=idx2%>">${hosp_board.subject }</a> </li>
				</c:forEach>
			</c:if>
		
			<c:if test="${empty list }">
			
			<li>아직 데이터가 존재하지 않습니다.</li>
			</c:if>
			</ul>
			<a href="../hospital_board/hospital_board?page=1&idx=${hosp.idx }"><span class="fa fa-plus plus"></span></a>
		</div>

		<div class="aaa_right">
			<h2 class="title">병원 홍보 동영상</h2>
				<ul>
				<li><video controls
						src="/resources/upload/hosp/video/${hosp.h_video }"	
						autoplay="autoplay" width=500 height=200></video></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				 
				</ul>		
		</div>

	</div>

		<div id="map" style="width:100%;height:350px;"></div>
	<div class="footer">
		<footer>
			<p>&copy; JANGSU. All &nbsp;&nbsp;&nbsp;Rights Reserved.</p>
		</footer>
		<!-- &copy; &nbsp; &gt; > &lt;< -->
	</div>
</body>
</html>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${hosp.h_addr1}'+'${hosp.h_addr2}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${hosp.h_name}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>














