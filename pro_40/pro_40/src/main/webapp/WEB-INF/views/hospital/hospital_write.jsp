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
		<h2 class="sub-title">병원 등록 폼</h2>
	</div>
	
	<div class="write-form">
		<table summery="갤러리 글쓰기 테이블 입니다">
			<caption class="readonly">갤러리 입력폼</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
			<form name="input" method="post" action="hospital_write" enctype="multipart/form-data">
			
			      
			       <input type="hidden" name= "idx" value="${user.idx }">
			       
			        <tr>
						<th>※ 홈페이지 비밀번호</th>
						<td><input type="password" name="h_pass"  placeholder="홈페이지 수정과 삭제시 필요합니다."></td>
					</tr>
					<tr>
						<th>병원 배너</th>
						<td><input type="file" name="h_banner" accept="image/*"
						onchange="setThumbnail(event);">
						
					   
						<div id="image_container"></div>
						
						</td>
					</tr>
					<tr>
						<th>병원이름</th>
						<td><input type="text" name="h_name"></td>
						
					</tr>
					<tr>
						<th>사업자등록</th>
						<td><input type="text" name="h_code"></td>
					</tr>
					<tr>
						<th>병원 전화번호</th>
						<td><input type="text" name="h_tel"></td>
					</tr>	
					<tr> 
						<th>지역</th>
						<td>
							<select name="h_addr1">
								<option value="">지역선택</option>
								<option value="서울특별시">서울특별시</option>
								<option value="부산광역시">부산광역시</option>
								<option value="대전광역시">대전광역시</option>
								<option value="광주광역시">광주광역시</option>
								<option value="대구광역시">대구광역시</option>
							</select>
						
						</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="h_addr2"></td>
					</tr>		
					<tr>
						<th>진료안내</th>
						<td><textarea name="d_medical"></textarea></td>
					</tr>	
					<tr>
						<th>병원 배경사진</th>
						<td><input type="file" name="h_photo"  accept="image/*" onchange="setThumbnail1(event);">
						
						<div id="image_container1"></div>
						
						</td>
					</tr>
					<tr>
						<th>사진</th>
						<td><input type="file" name="d_photo" accept="image/*" onchange="setThumbnail2(event);">
						<div id="image_container2"></div></td>
						
					</tr>
					<tr>
						<th>진료과목</th>
						<td><textarea name="d_mager"></textarea></td>
					</tr>
					<tr>
						<th>연역</th>
						<td><textarea name="h_history"></textarea></td>
					</tr>
					<tr>
						<th>병원홍보영상</th>
						<td><input type="file" name="h_video"></td>
					</tr>
					<tr>
						<th>병원오시는길</th>
						<td><textarea name="h_come"></textarea></td>
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
		
		if(input.h_banner.value=="") {
			alert("배너를 넣어주세요");
			input.h_banner.focus();
			return;
		}
		if(input.h_name.value=="") {
			alert("병원이름을 입력해주세요");
			input.h_name.focus();
			return;
		}
		if(input.h_code.value=="") {
			alert("사업자번호를 입력해주세요");
			input.h_code.focus();
			return;
		}
		
		if(input.h_tel.value=="") {
			alert("전화번호를 입력해주세요");
			input.h_tel.focus();
			return;
		}
		if(input.h_addr1.value=="") {
			alert("주소를 입력해주세요");
			input.h_addr1.focus();
			return;
		}
		if(input.h_addr2.value=="") {
			alert("상세주소를 입력해주세요");
			input.h_addr2.focus();
			return;
		}
		if(input.d_medical.value=="") {
			alert("진료안내를 입력해주세요");
			input.d_medical.focus();
			return;
		}
		if(input.h_photo.value=="") {
			alert("배경사진을 입력해주세요");
			input.h_photo.focus();
			return;
		}
		if(input.d_photo.value=="") {
			alert("배경사진2입력해주세요");
			input.d_photo.focus();
			return;
		}
		if(input.d_mager.value=="") {
			alert("진료과목을 입력해주세요");
			input.d_mager.focus();
			return;
		}
		if(input.h_history.value=="") {
			alert("연역을 입력해주세요");
			input.h_history.focus(); 
			return;
		}
		if(input.h_video.value=="") {
			alert("병원 홍보영상을 올려주세요");
			input.h_video.focus();
			return;
		}
		if(input.h_come.value=="") {
			alert("오시는길을 입력해주세요");
			input.h_come.focus();
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















