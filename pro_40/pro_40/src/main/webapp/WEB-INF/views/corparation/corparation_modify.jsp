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
<title>企業</title>
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
				<div style="height: 100px; width: 200px;">
					<a href="corparation_view?idx=${corp.idx }"><img height="100px"
						src="/resources/upload/corp/banner/${corp.c_banner }" alt="모집사진"></a>
				</div>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="corparation_about?idx=${corp.idx }">企業紹介</a></li>
							<li><a href="corparation_guidance?idx=${corp.idx }">製品紹介</a></li>
							<li><a
								href="/corparation_board/corparation_board?idx=${corp.idx }&page=1">お知らせ</a></li>
							<li><a
								href="/corparation_board/product?idx=${corp.idx }&page=1">製品の問い合わせ</a></li>
							<li><a href="corparation_modify?idx=${corp.idx }">ホームページ <br>
									修正
							</a></li>

						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>

	<div class="line"></div>




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
			<h2 class="sub-title">企業管理</h2>
		</div>

		<div class="write-form">
			<table summery="갤러리 글쓰기 테이블 입니다">
				<caption class="readonly">フォーム</caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<form name="input" method="post" enctype="multipart/form-data">


						<input type="hidden" name="idx" value="${idx }">
						<tr>
							<th>1.既存入力企業バーナー</th>
							<td><img class="img2"
								src="/resources/upload/corp/banner/${corp.c_banner }" alt="모집사진">
							</td>
						</tr>
						<tr>
							<th>1.企業バーナー</th>
							<td><input type="file" name="c_banner" accept="image/*"
								onchange="setThumbnail(event);">
								<div id="image_container"></div></td>
						</tr>


						<tr>
							<th>企業名</th>
							<td><input type="text" name="c_name" value="${corp.c_name }"
								readonly></td>
						</tr>
						<tr>
							<th>事業者登録</th>
							<td><input type="text" name="c_code" value="${corp.c_code }"
								readonly></td>
						</tr>
						<tr>
							<th>企業電話番号</th>
							<td><input type="text" name="c_tel" value="${corp.c_tel }"></td>
						</tr>
						<tr>
							<th>地域</th>
							<td><input type="text" name="c_addr1"
								value="${corp.c_addr1 }"></td>
						</tr>
						<tr>
							<th>住所</th>
							<td><input type="text" name="c_addr2"
								value="${corp.c_addr2 }"></td>
						</tr>
						<tr>
							<th>製品紹介</th>
							<td><textarea name="p_intro"> ${corp.p_intro }</textarea></td>
						</tr>
						<tr>
							<th>2.既存企業背景写真</th>
							<td><img class="img2"
								src="/resources/upload/corp/corparation_photo/${corp.c_photo }"
								alt="모집사진"></td>
						</tr>
						<tr>
							<th>2.企業拝啓写真</th>
							<td><input type="file" name="c_photo" accept="image/*"
								onchange="setThumbnail1(event);">
								<div id="image_container1"></div></td>
						</tr>
						<tr>
							<th>3.既存写真</th>
							<td><img class="img2"
								src="/resources/upload/corp/product_photo/${corp.p_photo }"
								alt="모집사진"></td>

						</tr>
						<tr>
							<th>3.写真</th>
							<td><input type="file" name="p_photo" accept="image/*"
								onchange="setThumbnail2(event);">
								<div id="image_container2"></div></td>

						</tr>
						<tr>
							<th>企業紹介題目</th>
							<td><input type="text" name="p_mager" value="${corp.p_mager }"></td>
						</tr>
						<tr>
							<th>企業紹介題目</th>
							<td><textarea name="c_history">${corp.c_history }</textarea></td>
						</tr>

						<tr>
							<th>4.既存企業広報動画</th>
							<td><video controls
									src="/resources/upload/corp/video/${corp.c_video }" width=500
									height=200></video></td>
						</tr>
						<tr>
							<th>4.企業広報動画</th>
							<td><input type="file" name="c_video"></td>
						</tr>
						<tr>
							<th>企業住所</th>
							<td><textarea name="c_come">${corp.c_come }</textarea></td>
						</tr>



						<tr>
							<td colspan="2"><a href="javascript:send()"><input
									type="button" value="修正する" class="btn-write"></a> <a
								href="javascript:home()"><input type="button" value="キャンセル"
									class="btn-reset"></a> <a href="javascript:del()"><input
									type="button" value="削除する" class="btn-reset"
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
				alert("バーナーを入れてください。");
				input.c_banner.focus();
				return;
			}
			if (input.c_name.value == "") {
				alert("企業名を入れてください。");
				input.c_name.focus();
				return;
			}
			if (input.c_code.value == "") {
				alert("事業者番号を入れてください。");
				input.c_code.focus();
				return;
			}

			if (input.c_tel.value == "") {
				alert("電話番号をご入力ください。");
				input.c_tel.focus();
				return;
			}
			if (input.c_addr1.value == "") {
				alert("住所1をご入力ください。");
				input.c_addr1.focus();
				return;
			}
			if (input.c_addr2.value == "") {
				alert("住所2をご入力ください。");
				input.c_addr2.focus();
				return;
			}
			if (input.p_intro.value == "") {
				alert("製品紹介をご入力ください。");
				input.p_intro.focus();
				return;
			}
			if (input.c_photo.value == "") {
				alert("배경사진을 입력해주세요");
				input.c_photo.focus();
				return;
			}
			if (input.p_photo.value == "") {
				alert("背景写真2を入れてください。");
				input.p_photo.focus();
				return;
			}
			if (input.p_mager.value == "") {
				alert("製品種類を入れてください。");
				input.p_mager.focus();
				return;
			}
			if (input.c_history.value == "") {
				alert("沿革を入れてください。");
				input.c_history.focus();
				return;
			}
			if (input.c_video.value == "") {
				alert("企業広報動画を入れてください。");
				input.c_video.focus();
				return;
			}
			if (input.c_come.value == "") {
				alert("住所を入れてください。");
				input.c_come.focus();
				return;
			}

			alert("修正します。");

			input.action = "corparation_modify";
			input.submit();
		}

		function home() {

			history.back();
		}

		function del() {

			alert("ホームページを削除します。");
			input.action = "corparation_delete";
			input.submit();

		}
	</script>

<footer class="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">企業</p>
				<p>住所 : ${corp.c_addr1 } ${corp.c_addr2 }/お客様案内センター: ${corp.c_tel }
					事業者番号: ${corp.c_code }</p>
				<br>
			</address>
			<p class="copyright">Copyright &copy ${corp.c_name }. All rights
				reserved.</p>
		</div>
	</footer>