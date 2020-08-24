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
			<li><a href="../member/login">로그인</a></li>
			<li><a href="../member/insert">회원가입</a></li>
			<li><a href="/" ">홈으로</a>
		</ul>
	</div>
	<div class="navigation">
			<div style="height:100px; width:200px;">
			<a href="../hospital/hospital_view?idx=<%=idx%>"><img
				src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
			</div>
		<div class="nav">
			<nav>
				<ul class="navi">
					<li><a href="hospital_about?idx=<%=idx%>">병원소개</a></li>
							<li><a href="hospital_guidance?idx=<%=idx%>">진료안내</a></li>
							<li><a href="/hospital_board/hospital_board?idx=<%=idx%>&page=1">공지</a></li>
											
							<li><a href="hospital_modify?idx=<%=idx%>">홈페이지 <br> 수정</a></li>
							<li><a href="reservation?idx=<%=idx%>">예약관리</a></li>

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
	.img2{
	 width :100px;
	 height : 100px;
	}
</style>
<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">홈페이지 수정</h2>
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
						<th>1.기존 병원 배너</th>
						<td><img class="img2" src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진">
						</td>
					</tr>
					<tr>    
						<th>1.병원 배너</th>
						<td><input type="file" name="h_banner" accept="image/*"
						onchange="setThumbnail(event);">	   
						<div id="image_container"></div>
						</td>
					</tr>
					
					
					<tr>
						<th>병원이름</th>
						<td><input type="text" name="h_name" value="${hosp.h_name }"></td>
					</tr>
					<tr>
						<th>사업자등록</th>
						<td><input type="text" name="h_code" value="${hosp.h_code }" readonly></td>
					</tr>
					<tr>
						<th>병원 전화번호</th>
						<td><input type="text" name="h_tel" value="${hosp.h_tel }"></td>
					</tr>	
					<tr>
						<th>지역</th>
						<td><input type="text" name="h_addr1" value="${hosp.h_addr1 }"></td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td><input type="text" name="h_addr2" value="${hosp.h_addr2 }"></td>
					</tr>		
					<tr>
						<th>진료안내</th>
						<td><textarea name="d_medical"> ${hosp.d_medical }</textarea></td>
					</tr>
					<tr>
						<th>2.기존병원 배경사진</th>
						<td><img class="img2" src="/resources/upload/hosp/hospital_photo/${hosp.h_photo }" alt="모집사진">
						</td>
					</tr>	
					<tr>
						<th>2.병원 배경사진</th>
						<td><input type="file" name="h_photo"  accept="image/*" onchange="setThumbnail1(event);">
						<div id="image_container1"></div></td>
					</tr>
					<tr>
						<th>3.기존 사진</th>
						<td><img class="img2" src="/resources/upload/hosp/doctor_photo/${hosp.d_photo }" alt="모집사진">
						</td>
						
					</tr>
					<tr>
						<th>3.사진</th>
						<td><input type="file" name="d_photo" accept="image/*" onchange="setThumbnail2(event);">
						<div id="image_container2"></div></td>
						
					</tr>
					<tr>
						<th>병원 소개 제목</th>
						<td><input type="text" name="d_mager" value="${hosp.d_mager }"></td>
					</tr>
					<tr>
						<th>병원 소개 내용</th>
						<td><textarea name="h_history">${hosp.h_history }</textarea></td>
					</tr>
					
					<tr>
						<th>4.기존 병원홍보영상</th>
						<td><video controls
						src="/resources/upload/hosp/video/${hosp.h_video }"	
						width=500 height=200></video></td>
					</tr>
					<tr>
						<th>4.병원홍보영상</th>
						<td><input type="file" name="h_video"></td>
					</tr>
					<tr>
						<th>병원오시는길</th>
						<td><textarea name="h_come">${hosp.h_come }</textarea></td>
					</tr>
					

					
					<tr>
						<td colspan="3">
							
							<a href="javascript:send()"><input type="button" value="수정" class="btn-write"></a>
							<a href="javascript:home()"><input type="button" value="뒤로가기" class="btn-reset"></a>
							<a href="javascript:del()"><input type="button" value="삭제" class="btn-reset" style="background-color:green;"></a>
						</td>
					</tr>
				</form>
			</tbody>
		</table>
	</div>
		
</div>
</body>
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
		
		
	
		alert("수정합니다.");
		
		input.action="hospital_modify";
		input.submit();
	}
	
	function home(){
		
		history.back();
	}
	
	function del(){
		
		alert("홈페이지를 삭제합니다.");
		input.action="hospital_delete";
		input.submit();
	}
</script>

<footer class="footer">
		<div class="container clearfix">
			<address class="address">
				<p class="title">병원</p>
				<br>
				<p>주소 : ${hosp.h_addr1 } ${hosp.h_addr2 }/고객센터: ${hosp.h_tel } 	사업자등록번호: ${hosp.h_code }</p>
				
				<br>
			</address>
			<p class="copyright">Copyright &copy ${hosp.h_name }. All rights reserved.</p>
		</div>
</footer>











