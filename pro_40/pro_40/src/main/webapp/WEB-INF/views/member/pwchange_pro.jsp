<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">장수하늘소 코드입력</h2>
	</div>
	
	<div class="write-form" style="width:50%; margin:0 auto; border:1px solid #ccc; padding:20px;">
		<form name="my" method="post" action="pwupdate" onsubmit="return formcheck();">
		
			<fieldset>
				<legend class="readonly">로그인그룹</legend>

				<div style="width:70%; float:left;">
					<label for="name" class="readonly">PW</label>
					<input type="hidden" name="userid" id="userid" value="${userid}">
					<input type="password" name="passwd" id="passwd" placeholder="비밀번호"> 
					<br>
					<br>
					<input type="password" name="passwdchk" id="passwdchk" placeholder="비밀번호 확인"> 
					<label for="tel" class="readonly">인증번호</label>
					<br>
					<input type="text" name="pw_code" id="pw_code" placeholder="pw_code">
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:132px; margin-top:3px;">
					<input type="submit" value="인증번호 확인" alt="인증번호 확인" 
					style="background: #FF4000; color:#fff;
					width:100%; height:100%; border:0 none; cursor:pointer;">
				</div>
				
				<div style="width:28%; float:right;padding:15px;
				height:70px; margin-top:-5px;">
				<a href="/member/login"><input type="button" value="뒤로가기" alt="뒤로가기" 
				style="background: #FF4000; color:#fff;
				width:100%; height:100%; border:0 none; cursor:pointer;"></a>
				</div>
			</fieldset>
		</form>	
	</div>
		
</div>

<script>

	function formcheck() 
	{
		if(my.name.value=="") 
		{
			alert("사업장명을 입력하세요");
			my.name.focus();
			return false;
		}
		if(my.passwd.value=="")
		{
			alert("비밀번호를 입력하세요");
			my.passwd.focus();
			return false;
		}else if(my.passwd.value != my.passwdchk.value) 
		{
			alert("비밀번호를 확인하세요");
			my.passwdchk.focus();
			return false;
		}
		
		if(my.pw_code.value=="") 
		{
			alert("인증번호를 입력하세요");
			my.pw_code.focus();
			return false;
		}
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>















