<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">장수하늘소 ID찾기</h2>
	</div>
	
	<div class="write-form" style="width:50%; margin:0 auto; border:1px solid #ccc; padding:20px;">
		<form name="my" method="post" action="idsearch" onsubmit="return formcheck();">
			<fieldset>
				<legend class="readonly"> ID찾기</legend>
<c:if test="${userid eq '0' }">
				<div style="width:70%; float:left;">
					<label for="name" class="readonly">사업장명</label>
					<input type="text" name="name" id="name" placeholder="사업장명">
					<label for="tel" class="readonly">전화번호</label>
					<input type="text" name="tel" id="tel" placeholder="전화번호">
				</div>
				<div style="width:30%; float:right;padding:15px;
				height:70px; margin-top:3px;">
					<input type="submit" value="ID검색" alt="ID검색" 
					style="background: #FF4000; color:#fff;
					width:100%; height:100%; border:0 none; cursor:pointer;">
				</div>
				<div style="width:30%; float:right;padding:15px;
				height:70px; margin-top:3px;">
				<a href="/member/login"><input type="button" value="뒤로가기" alt="뒤로가기" 
				style="background: #FF4000; color:#fff;
				width:100%; height:100%; border:0 none; cursor:pointer;"></a>
				</div>
</c:if>

<c:if test="${userid eq '1' }">
				<div>
					해당정보의 회원이 없습니다.<br>
					회원가입 또는 다시 검색 해주세요.
				</div>
				<div style="width:70%; float:left;">
					<label for="name" class="readonly">아이디</label>
					<input type="text" name="name" id="name" placeholder="사업장명">
					<label for="tel" class="readonly">전화번호</label>
					<input type="text" name="tel" id="tel" placeholder="전화번호">
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:70px; margin-top:3px;">
					<input type="submit" value="ID검색" alt="ID검색" 
					style="background: #FF4000; color:#fff;
					width:100%; height:100%; border:0 none; cursor:pointer;">
				</div>
				
				<div style="width:28%; float:right;padding:15px;
				height:70px; margin-top:3px;">
				<a href="/member/login"><input type="button" value="뒤로가기" alt="뒤로가기" 
				style="background: #FF4000; color:#fff;
				width:100%; height:100%; border:0 none; cursor:pointer;"></a>
				</div>
</c:if>

<c:if test="${chk == '3' }">
<fieldset>
		<div style="width:70%; height; float:left;">
		<br><br><br>
			해당정보의  ID는 ${userid} 입니다.
		</div>
		<div style="width:28%; float:right;padding:15px;
			height:132px; margin-top:3px;">
			<a href="/member/login"><input type="button" value="로그인 하러가기" alt="로그인" 
			style="background: #FF4000; color:#fff;
			width:100%; height:100%; border:0 none; cursor:pointer;"></a>
		</div>
</fieldset>
</c:if>

			</fieldset>
		</form>	
	</div>
		
</div>

<script>

	function formcheck() 
	{
		if(my.name.value=="") {
			alert("사업장명을 입력하세요");
			my.name.focus();
			return false;
		}
		if(my.tel.value=="") {
			alert("전화번호를 입력하세요");
			my.tel.focus();
			return false;
		}
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>















