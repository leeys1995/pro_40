<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../header.jsp" %>

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
			<form name="input" method="post" action="corparation_write" enctype="multipart/form-data">
			
			        <input type="hidden" name="idx" value="${user.idx }">
			        
			        
			         <tr>
						<th>※ ホームページパスワード</th>
						<td><input type="password" name="c_pass"  placeholder="ホームページ 修正と削除の時必要です。"></td>
					</tr>
					
					<tr>
						<th>企業バーナー</th>
						<td><input type="file" name="c_banner" accept="image/*"
						onchange="setThumbnail(event);">
						
					   
						<div id="image_container"></div>
						
						</td>
					</tr>
					<tr>
						<th>企業名</th>
						<td><input type="text" name="c_name"></td>
					</tr>
					<tr>
						<th>事業者登録</th>
						<td><input type="text" name="c_code"></td>
					</tr>
					<tr>
						<th>企業電話番号</th>
						<td><input type="text" name="c_tel"></td>
					</tr>	
					<tr>
						<th>地域</th>
						<td>
						<select name="c_addr1">
								<option value="">地域選択</option>
								<option value="서울특별시">서울특별시</option>
								<option value="부산광역시">부산광역시</option>
								<option value="대전광역시">대전광역시</option>
								<option value="광주광역시">광주광역시</option>
								<option value="대구광역시">대구광역시</option>
						</select>
						</td>
					</tr>
					<tr>
						<th>住所</th>
						<td><input type="text" name="c_addr2"></td>
					</tr>		
					<tr>
						<th>製品紹介</th>
						<td><textarea name="p_intro"></textarea></td>
					</tr>	
					<tr>
						<th>企業背景写真</th>
						<td><input type="file" name="c_photo"  accept="image/*" onchange="setThumbnail1(event);">
						<div id="image_container1"></div></td>
					</tr>
					<tr>
						<th>製品写真</th>
						<td><input type="file" name="p_photo" accept="image/*" onchange="setThumbnail2(event);">
						<div id="image_container2"></div></td>
						
					</tr>
					<tr>
						<th>企業紹介題目</th>
						<td><input type="text" name="p_mager"></td>
					</tr>
					<tr>
						<th>企業紹介内容</th>
						<td><textarea name="c_history"></textarea></td>
					</tr>
					<tr>
						<th>企業広報動画</th>
						<td><input type="file" name="c_video"></td>
					</tr>
					<tr>
						<th>企業住所</th>
						<td><textarea name="c_come"></textarea></td>
					</tr>
					

					
					<tr>
						<td colspan="2">
							<a href="javascript:send()"><input type="button" value="登録する" class="btn-write"></a>
							<a href="javascript:home()">"<input type="button" value="キャンセル" class="btn-reset"></a>
						</td>
					</tr>
				</form>
			</tbody>
		</table>
	</div>
		
</div>

<script>

	function send() {
		
		if(input.c_banner.value=="") {
			alert("バーナーを入れてください。");
			input.c_banner.focus();
			return;
		}
		if(input.c_name.value=="") {
			alert("企業名をご入力ください。");
			input.c_name.focus();
			return;
		}
		if(input.c_code.value=="") {
			alert("事業者番号をご入力ください。");
			input.c_code.focus();
			return;
		}
		
		if(input.c_tel.value=="") {
			alert("電話番号をご入力ください。");
			input.c_tel.focus();
			return;
		}
		if(input.c_addr1.value=="") {
			alert("住所1をご入力ください。");
			input.c_addr1.focus();
			return;
		}
		if(input.c_addr2.value=="") {
			alert("住所2をご入力ください。");
			input.c_addr2.focus();
			return;
		}
		if(input.p_intro.value=="") {
			alert("製品紹介をご入力ください。");
			input.p_intro.focus();
			return;
		}
		if(input.c_photo.value=="") {
			alert("背景写真をご入力ください。");
			input.c_photo.focus();
			return;
		}
		if(input.p_photo.value=="") {
			alert("背景写真2をご入力ください。");
			input.p_photo.focus();
			return;
		}
		if(input.p_mager.value=="") {
			alert("製品種類をご入力ください。");
			input.p_mager.focus();
			return;
		}
		if(input.c_history.value=="") {
			alert("沿革をご入力ください。");
			input.c_history.focus(); 
			return;
		}
		if(input.c_video.value=="") {
			alert("企業広報動画をご入力ください。");
			input.c_video.focus();
			return;
		}
		if(input.c_come.value=="") {
			alert("企業住所をご入力ください。");
			input.c_come.focus();
			return;
		}
			
		alert("登録します。");
		input.submit();
	}
	
	function home(){
		
		history.back();
	}
</script>

<%@ include file="../footer.jsp" %>
