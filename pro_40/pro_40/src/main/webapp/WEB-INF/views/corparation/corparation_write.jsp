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
			<form name="input" method="post" action="corparation_write" enctype="multipart/form-data">
					<tr>
						<th>기업 배너</th>
						<td><input type="file" name="c_banner" accept="image/*"
						onchange="setThumbnail(event);">
						
					   
						<div id="image_container"></div>
						
						</td>
					</tr>
					<tr>
						<th>기업이름</th>
						<td><input type="text" name="c_name"></td>
					</tr>
					<tr>
						<th>사업자등록</th>
						<td><input type="text" name="c_code"></td>
					</tr>
					<tr>
						<th>기업 전화번호</th>
						<td><input type="text" name="c_tel"></td>
					</tr>	
					<tr>
						<th>지역</th>
						<td><input type="text" name="c_addr1"></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="c_addr2"></td>
					</tr>		
					<tr>
						<th>제품소개</th>
						<td><textarea name="p_intro"></textarea></td>
					</tr>	
					<tr>
						<th>기업 배경사진</th>
						<td><input type="file" name="c_photo"  accept="image/*" onchange="setThumbnail1(event);">
						<div id="image_container1"></div></td>
					</tr>
					<tr>
						<th>제품 사진</th>
						<td><input type="file" name="p_photo" accept="image/*" onchange="setThumbnail2(event);">
						<div id="image_container2"></div></td>
						
					</tr>
					<tr>
						<th>제품종류</th>
						<td><textarea name="p_mager"></textarea></td>
					</tr>
					<tr>
						<th>연역</th>
						<td><textarea name="c_history"></textarea></td>
					</tr>
					<tr>
						<th>기업홍보영상</th>
						<td><input type="file" name="c_video"></td>
					</tr>
					<tr>
						<th>기업오시는길</th>
						<td><textarea name="c_come"></textarea></td>
					</tr>
					

					
					<tr>
						<td colspan="2">
							<a href="javascript:send()"><input type="button" value="등록" class="btn-write"></a>
							<a href="javascript:home()">"<input type="button" value="뒤로가기" class="btn-reset"></a>
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
			alert("배너를 넣어주세요");
			input.c_banner.focus();
			return;
		}
		if(input.c_name.value=="") {
			alert("기업이름을 입력해주세요");
			input.c_name.focus();
			return;
		}
		if(input.c_code.value=="") {
			alert("사업자번호를 입력해주세요");
			input.c_code.focus();
			return;
		}
		
		if(input.c_tel.value=="") {
			alert("전화번호를 입력해주세요");
			input.c_tel.focus();
			return;
		}
		if(input.c_addr1.value=="") {
			alert("주소를 입력해주세요");
			input.c_addr1.focus();
			return;
		}
		if(input.c_addr2.value=="") {
			alert("상세주소를 입력해주세요");
			input.c_addr2.focus();
			return;
		}
		if(input.p_intro.value=="") {
			alert("제품소개를 입력해주세요");
			input.p_intro.focus();
			return;
		}
		if(input.c_photo.value=="") {
			alert("배경사진을 입력해주세요");
			input.c_photo.focus();
			return;
		}
		if(input.p_photo.value=="") {
			alert("배경사진2입력해주세요");
			input.p_photo.focus();
			return;
		}
		if(input.p_mager.value=="") {
			alert("제품종류을 입력해주세요");
			input.p_mager.focus();
			return;
		}
		if(input.c_history.value=="") {
			alert("연역을 입력해주세요");
			input.c_history.focus(); 
			return;
		}
		if(input.c_video.value=="") {
			alert("기업 홍보영상을 올려주세요");
			input.c_video.focus();
			return;
		}
		if(input.c_come.value=="") {
			alert("오시는길을 입력해주세요");
			input.c_come.focus();
			return;
		}
			
		alert("등록합니다.");
		input.submit();
	}
	
	function home(){
		
		history.back();
	}
</script>

<%@ include file="../footer.jsp" %>















