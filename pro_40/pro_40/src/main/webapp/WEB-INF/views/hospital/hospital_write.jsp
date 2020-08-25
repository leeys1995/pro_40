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
		<h2 class="sub-title">病院登録フォーム</h2>
	</div>
	
	<div class="write-form">
		<table summery="갤러리 글쓰기 테이블 입니다">
			<caption class="readonly">フォーム</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
			<form name="input" method="post" action="hospital_write" enctype="multipart/form-data">
			
			      
			       <input type="hidden" name= "idx" value="${user.idx }">
			       
			        <tr>
						<th>※ ホームページ暗証番号</th>
						<td><input type="password" name="h_pass"  placeholder="ほーむ修正と削除の時必要です。"></td>
					</tr>
					<tr>
						<th>病院バーナー</th>
						<td><input type="file" name="h_banner" accept="image/*"
						onchange="setThumbnail(event);">
						
					   
						<div id="image_container"></div>
						
						</td>
					</tr>
					<tr>
						<th>病院名</th>
						<td><input type="text" name="h_name"></td>
						
					</tr>
					<tr>
						<th>事業者登録</th>
						<td><input type="text" name="h_code"></td>
					</tr>
					<tr>
						<th>病院電話番号</th>
						<td><input type="text" name="h_tel"></td>
					</tr>	
					<tr> 
						<th>地域</th>
						<td>
							<select name="h_addr1">
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
						<td><input type="text" name="h_addr2"></td>
					</tr>		
					<tr>
						<th>診療案内</th>
						<td><textarea name="d_medical"></textarea></td>
					</tr>	
					<tr>
						<th>病院拝啓写真</th>
						<td><input type="file" name="h_photo"  accept="image/*" onchange="setThumbnail1(event);">
						
						<div id="image_container1"></div>
						
						</td>
					</tr>
					<tr>
						<th>写真</th>
						<td><input type="file" name="d_photo" accept="image/*" onchange="setThumbnail2(event);">
						<div id="image_container2"></div></td>
						
					</tr>
					<tr>
						<th>病院紹介題目</th>
						<td><input type="text" name="d_mager"></td>
					</tr>
					<tr>
						<th>病院紹介内容</th>
						<td><textarea name="h_history"></textarea></td>
					</tr>
					<tr>
						<th>病院広報動画</th>
						<td><input type="file" name="h_video"></td>
					</tr>
					<tr>
						<th>病院住所</th>
						<td><textarea name="h_come"></textarea></td>
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
		
		if(input.h_banner.value=="") {
			alert("バーナーを入れてください。");
			input.h_banner.focus();
			return;
		}
		if(input.h_name.value=="") {
			alert("病院名を入れてください。");
			input.h_name.focus();
			return;
		}
		if(input.h_code.value=="") {
			alert("事業者番号を入れてください。");
			input.h_code.focus();
			return;
		}
		
		if(input.h_tel.value=="") {
			alert("電話番号を入れてください。");
			input.h_tel.focus();
			return;
		}
		if(input.h_addr1.value=="") {
			alert("住所1を入れてください。");
			input.h_addr1.focus();
			return;
		}
		if(input.h_addr2.value=="") {
			alert("住所2を入れてください。");
			input.h_addr2.focus();
			return;
		}
		if(input.d_medical.value=="") {
			alert("診療案内をご入力ください。");
			input.d_medical.focus();
			return;
		}
		if(input.h_photo.value=="") {
			alert("背景写真をいれてください。");
			input.h_photo.focus();
			return;
		}
		if(input.d_photo.value=="") {
			alert("背景写真2を入れてください。");
			input.d_photo.focus();
			return;
		}
		if(input.d_mager.value=="") {
			alert("診療科目をご入力ください。");
			input.d_mager.focus();
			return;
		}
		if(input.h_history.value=="") {
			alert("沿革をご入力ください。");
			input.h_history.focus(); 
			return;
		}
		if(input.h_video.value=="") {
			alert("病院広報動画を入れてください。");
			input.h_video.focus();
			return;
		}
		if(input.h_come.value=="") {
			alert("病院住所をご入力ください。");
			input.h_come.focus();
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

