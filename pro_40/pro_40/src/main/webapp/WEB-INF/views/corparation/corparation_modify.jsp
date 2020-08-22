<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	int idx2 = Integer.parseInt(request.getParameter("idx"));
%>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=YOUR_CLIENT_ID&submodules=geocoder"></script>
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
	padding: 15px;
	height: 200px;
}
</style>
<!-- 카카오톡 맵 좌표 찍기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=831d3575fb87dc0f7e2e0d4494eb90f6&libraries=services"></script>

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
				<div style="height: 100px; width: 200px;">
					<a href="corparation_view?idx=${corp.idx }"><img height="100px"
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
							<li><a href="corparation_modify?idx=${corp.idx }">홈페이지 <br>
									수정
							</a></li>

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


	<script>
		function setThumbnail(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				document.querySelector("div#image_container").appendChild(img);

				document.getElementById("image_container").style.width = "300px";
				document.getElementById("image_container").style.height = "300px";

			};
			reader.readAsDataURL(event.target.files[0]);
		}

		function setThumbnail1(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				document.querySelector("div#image_container1").appendChild(img);

				document.getElementById("image_container1").style.width = "300px";
				document.getElementById("image_container1").style.height = "300px";

			};
			reader.readAsDataURL(event.target.files[0]);
		}

		function setThumbnail2(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				document.querySelector("div#image_container2").appendChild(img);

				document.getElementById("image_container2").style.width = "300px";
				document.getElementById("image_container2").style.height = "300px";
			};
			reader.readAsDataURL(event.target.files[0]);
		}
	</script>
	<style>
.img2 {
	width: 100px;
	height: 100px;
}


</style>
	<div class="contain">
		<div class="sub-topcontent">
			<h2 class="sub-title">장수하늘소 갤러리</h2>
		</div>

		<div class="write-form">
			<table summery="갤러리 글쓰기 테이블 입니다">
				<caption class="readonly">갤러리 입력폼</caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<form name="input" method="post" enctype="multipart/form-data">


						<input type="hidden" name="idx" value="${idx }">
						<tr>
							<th>1.기존 기업 배너</th>
							<td><img class="img2"
								src="/resources/upload/corp/banner/${corp.c_banner }" alt="모집사진">
							</td>
						</tr>
						<tr>
							<th>1.기업 배너</th>
							<td><input type="file" name="c_banner" accept="image/*"
								onchange="setThumbnail(event);">
								<div id="image_container"></div></td>
						</tr>


						<tr>
							<th>기업이름</th>
							<td><input type="text" name="c_name" value="${corp.c_name }"
								readonly></td>
						</tr>
						<tr>
							<th>사업자등록</th>
							<td><input type="text" name="c_code" value="${corp.c_code }"
								readonly></td>
						</tr>
						<tr>
							<th>기업 전화번호</th>
							<td><input type="text" name="c_tel" value="${corp.c_tel }"></td>
						</tr>
						<tr>
							<th>지역</th>
							<td><input type="text" name="c_addr1"
								value="${corp.c_addr1 }"></td>
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input type="text" name="c_addr2"
								value="${corp.c_addr2 }"></td>
						</tr>
						<tr>
							<th>제품소개</th>
							<td><textarea name="p_intro"> ${corp.p_intro }</textarea></td>
						</tr>
						<tr>
							<th>2.기존기업 배경사진</th>
							<td><img class="img2"
								src="/resources/upload/corp/corparation_photo/${corp.c_photo }"
								alt="모집사진"></td>
						</tr>
						<tr>
							<th>2.기업 배경사진</th>
							<td><input type="file" name="c_photo" accept="image/*"
								onchange="setThumbnail1(event);">
								<div id="image_container1"></div></td>
						</tr>
						<tr>
							<th>3.기존 사진</th>
							<td><img class="img2"
								src="/resources/upload/corp/product_photo/${corp.p_photo }"
								alt="모집사진"></td>

						</tr>
						<tr>
							<th>3.사진</th>
							<td><input type="file" name="p_photo" accept="image/*"
								onchange="setThumbnail2(event);">
								<div id="image_container2"></div></td>

						</tr>
						<tr>
							<th>제품종류</th>
							<td><textarea name="p_mager">${corp.p_mager }</textarea></td>
						</tr>
						<tr>
							<th>연역</th>
							<td><textarea name="c_history">${corp.c_history }</textarea></td>
						</tr>

						<tr>
							<th>4.기존 기업홍보영상</th>
							<td><video controls
									src="/resources/upload/corp/video/${corp.c_video }" width=500
									height=200></video></td>
						</tr>
						<tr>
							<th>4.기업홍보영상</th>
							<td><input type="file" name="c_video"></td>
						</tr>
						<tr>
							<th>기업오시는길</th>
							<td><textarea name="c_come">${corp.c_come }</textarea></td>
						</tr>



						<tr>
							<td colspan="2"><a href="javascript:send()"><input
									type="button" value="수정" class="btn-write"></a> <a
								href="javascript:home()"><input type="button" value="뒤로가기"
									class="btn-reset"></a> <a href="javascript:del()"><input
									type="button" value="삭제" class="btn-reset"
									style="background-color: green"></a></td>
						</tr>
					</form>
				</tbody>
			</table>
		</div>

	</div>

	<script>
		function send() {

			if (input.c_banner.value == "") {
				alert("배너를 넣어주세요");
				input.c_banner.focus();
				return;
			}
			if (input.c_name.value == "") {
				alert("기업이름을 입력해주세요");
				input.c_name.focus();
				return;
			}
			if (input.c_code.value == "") {
				alert("사업자번호를 입력해주세요");
				input.c_code.focus();
				return;
			}

			if (input.c_tel.value == "") {
				alert("전화번호를 입력해주세요");
				input.c_tel.focus();
				return;
			}
			if (input.c_addr1.value == "") {
				alert("주소를 입력해주세요");
				input.c_addr1.focus();
				return;
			}
			if (input.c_addr2.value == "") {
				alert("상세주소를 입력해주세요");
				input.c_addr2.focus();
				return;
			}
			if (input.p_intro.value == "") {
				alert("제품소개를 입력해주세요");
				input.p_intro.focus();
				return;
			}
			if (input.c_photo.value == "") {
				alert("배경사진을 입력해주세요");
				input.c_photo.focus();
				return;
			}
			if (input.p_photo.value == "") {
				alert("배경사진2입력해주세요");
				input.p_photo.focus();
				return;
			}
			if (input.p_mager.value == "") {
				alert("제품종류을 입력해주세요");
				input.p_mager.focus();
				return;
			}
			if (input.c_history.value == "") {
				alert("연역을 입력해주세요");
				input.c_history.focus();
				return;
			}
			if (input.c_video.value == "") {
				alert("기업 홍보영상을 올려주세요");
				input.c_video.focus();
				return;
			}
			if (input.c_come.value == "") {
				alert("오시는길을 입력해주세요");
				input.c_come.focus();
				return;
			}

			alert("수정합니다.");

			input.action = "corparation_modify";
			input.submit();
		}

		function home() {

			history.back();
		}

		function del() {

			alert("홈페이지를 삭제합니다.");
			input.action = "corparation_delete";
			input.submit();

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