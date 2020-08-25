<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
					<c:if test="${empty user}">
						<ul>
							<li><a href="/member/login">ログイン</a></li>
							<li><a href="/member/insert">新規取得</a></li>
							<li><a href="/">ホーム</a></li>
							
						</ul>
					</c:if>
					<c:if test="${!empty user}">
						<c:if test="${user.userid eq 'admin' }">
							<ul>
								<li><a href="/member/list?page=1">会員管理</a></li>
								<li><a href="javascript:logout()">ログアウト</a></li>
								<li><a href="/">ホーム</a></li>
							</ul>
						</c:if>
						<c:if test="${ user.userid != 'admin'}">
							<ul>
								<li><a href="/member/modify">個人情報修正</a></li>
								<li><a href="javascript:logout()">ログアウト</a></li>
								<li><a href="/">ホーム</a></li>
							</ul>
						</c:if>

					</c:if>
				</ul>
			</div>
			<div class="navigation">
				<div style="height: 100px; width: 200px;">
					<a href="../hospital/hospital_view?idx=<%=idx%>"><img
						src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
				</div>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="hospital_about?idx=<%=idx%>">病院紹介</a></li>
							<li><a href="hospital_guidance?idx=<%=idx%>">診療案内</a></li>
							<li><a
								href="/hospital_board/hospital_board?idx=<%=idx%>&page=1">お知らせ</a></li>

							<li><a href="hospital_modify?idx=<%=idx%>">ホームページ <br>
									修正
							</a></li>
							<li><a href="reservation?idx=<%=idx%>">予約管理</a></li>

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
			<h2 class="sub-title">ホームページ修正</h2>
		</div>

		<div class="write-form">
			<table summery="갤러리 글쓰기 테이블 입니다">
				<caption class="readonly">ホームページ入力フォーム</caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<form name="input" method="post" enctype="multipart/form-data">


						<input type="hidden" name="idx" value="${idx }">
						<tr>
							<th>1.既存病院バーナー</th>
							<td><img class="img2"
								src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진">
							</td>
						</tr>
						<tr>
							<th>1.病院バーナー</th>
							<td><input type="file" name="h_banner" accept="image/*"
								onchange="setThumbnail(event);">
								<div id="image_container"></div></td>
						</tr>


						<tr>
							<th>病院名前</th>
							<td><input type="text" name="h_name" value="${hosp.h_name }"></td>
						</tr>
						<tr>
							<th>事業者登録</th>
							<td><input type="text" name="h_code1" id="h_code1"
								maxlength="3" style="width: 17.3%" placeholder="h_code1"
								value="${hosp.h_code.substring(0,3) }" readonly>- <input
								type="text" name="h_code2" id="h_code2" maxlength="2"
								style="width: 11.3%" placeholder="h_code2"
								value="${hosp.h_code.substring(4,6) }" readonly>- <input
								type="text" name="h_code3" id="h_code3" maxlength="5"
								style="width: 29.3%" placeholder="h_code3"
								value="${hosp.h_code.substring(7) }" readonly></td>
						</tr>
						<tr>
							<th>病院電話番号</th>
							<td><input type="text" name="h_tel1" id="h_tel1"
								style="width: 19.3%" placeholder="h_tel1" maxlength="3"
								value="${hosp.h_tel.substring(0,3) }">- <input
								type="text" name="h_tel2" id="h_tel2" style="width: 19.3%"
								placeholder="h_tel2" maxlength="4"
								value="${hosp.h_tel.substring(4,8) }">- <input
								type="text" name="h_tel3" id="h_tel3" style="width: 19.3%"
								placeholder="h_tel3" maxlength="4"
								value="${hosp.h_tel.substring(9) }"></td>
						</tr>
						<tr>
							<th>地域</th>
							<td><input type="text" name="h_addr1"
								value="${hosp.h_addr1 }"></td>
						</tr>
						<tr>
							<th>住所</th>
							<td><input type="text" name="h_addr2"
								value="${hosp.h_addr2 }"></td>
						</tr>
						<tr>
							<th>診療案内</th>
							<td><textarea name="d_medical"> ${hosp.d_medical }</textarea></td>
						</tr>
						<tr>
							<th>2.既存病院背景写真</th>
							<td><img class="img2"
								src="/resources/upload/hosp/hospital_photo/${hosp.h_photo }"
								alt="모집사진"></td>
						</tr>
						<tr>
							<th>2.病院背景写真</th>
							<td><input type="file" name="h_photo" accept="image/*"
								onchange="setThumbnail1(event);">
								<div id="image_container1"></div></td>
						</tr>
						<tr>
							<th>3.既存写真</th>
							<td><img class="img2"
								src="/resources/upload/hosp/doctor_photo/${hosp.d_photo }"
								alt="모집사진"></td>

						</tr>
						<tr>
							<th>3.写真</th>
							<td><input type="file" name="d_photo" accept="image/*"
								onchange="setThumbnail2(event);">
								<div id="image_container2"></div></td>

						</tr>
						<tr>
							<th>病院紹介題目</th>
							<td><input type="text" name="d_mager"
								value="${hosp.d_mager }"></td>
						</tr>
						<tr>
							<th>病院紹介内容</th>
							<td><textarea name="h_history">${hosp.h_history }</textarea></td>
						</tr>

						<tr>
							<th>4.既存病院広報動画</th>
							<td><video controls
									src="/resources/upload/hosp/video/${hosp.h_video }" width=500
									height=200></video></td>
						</tr>
						<tr>
							<th>4.病院広報動画</th>
							<td><input type="file" name="h_video"></td>
						</tr>
						<tr>
							<th>病院住所</th>
							<td><textarea name="h_come">${hosp.h_come }</textarea></td>
						</tr>



						<tr>
							<td colspan="3"><a href="javascript:send()"><input
									type="button" value="修正する" class="btn-write"></a> <a
								href="javascript:home()"><input type="button" value="キャンセル"
									class="btn-reset"></a> <a href="javascript:del()"><input
									type="button" value="削除する" class="btn-reset"
									style="background-color: green;"></a></td>
						</tr>
					</form>
				</tbody>
			</table>
		</div>

	</div>
</body>
<script>
	function send() {

		if (input.h_banner.value == "") {
			alert("バーナーを入れてください。");
			input.h_banner.focus();
			return;
		}
		if (input.h_name.value == "") {
			alert("病院名を入れてください。");
			input.h_name.focus();
			return;
		}

		if (input.h_tel1.value == "") {
			alert("電話番号1を入れてください。");
			input.h_tel1.focus();
			return;
		}
		if (input.h_tel2.value == "") {
			alert("電話番号2を入れてください。");
			input.h_tel2.focus();
			return;
		}
		if (input.h_tel3.value == "") {
			alert("電話番号3を入れてください。");
			input.h_tel3.focus();
			return;
		}
		if (input.h_addr1.value == "") {
			alert("住所を入れてください。");
			input.h_addr1.focus();
			return;
		}
		if (input.h_addr2.value == "") {
			alert("住所を入れてください。");
			input.h_addr2.focus();
			return;
		}
		if (input.d_medical.value == "") {
			alert("診療案内を入れてください。");
			input.d_medical.focus();
			return;
		}
		if (input.h_photo.value == "") {
			alert("背景写真を入れてください。");
			input.h_photo.focus();
			return;
		}
		if (input.d_photo.value == "") {
			alert("背景写真2を入れてください。");
			input.d_photo.focus();
			return;
		}
		if (input.d_mager.value == "") {
			alert("진료과목을 입력해주세요");
			input.d_mager.focus();
			return;
		}
		if (input.h_history.value == "") {
			alert("沿革を入れてください。");
			input.h_history.focus();
			return;
		}
		if (input.h_video.value == "") {
			alert("病院広報動画を入れてください。");
			input.h_video.focus();
			return;
		}
		if (input.h_come.value == "") {
			alert("住所を入れてください。");
			input.h_come.focus();
			return;
		}

		alert("修正します。");

		input.action = "hospital_modify";
		input.submit();
	}

	function home() {

		history.back();
	}

	function del() {

		alert("ホームページを削除します。");
		input.action = "hospital_delete";
		input.submit();
	}
</script>

<footer class="footer">
	<div class="container clearfix">
		<address class="address">
			<p class="title">病院</p>
			<p>住所 : ${hosp.h_addr1 } ${hosp.h_addr2 }/お客様案内センター :
				${hosp.h_tel } 事業者番号: ${hosp.h_code }</p>
			<br>
		</address>
		<p class="copyright">Copyright &copy ${hosp.h_name }. All rights
			reserved.</p>
	</div>
</footer>











