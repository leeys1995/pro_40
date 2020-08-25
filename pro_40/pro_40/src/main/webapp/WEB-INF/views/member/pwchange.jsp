<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">暗証番号探す</h2>
	</div>
	
	<div class="write-form" style="width:50%; margin:0 auto; border:1px solid #ccc; padding:20px;">
		<form name="my" method="post" action="pwchange" onsubmit="return formcheck();">
			<fieldset>
				<legend class="readonly"> 暗証番号探す</legend>
<c:if test="${code eq '0' }">
				<div style="width:70%; float:left;">
					<label for="name" class="readonly">ID</label>
					<input type="text" name="userid" id="userid" placeholder="ID"> 
					<label for="name" class="readonly">ブレンド名</label>
					<input type="text" name="name" id="name" placeholder="ブレンド名"> 
					<label for="Email" class="readonly">メール</label>
					<br>
					<input type="text" name="email1" id="email1" placeholder="email1" style=width:180px;> @
					<input type="text" name="email2" id="email2"  placeholder="email2" style=width:180px;>
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:132px; margin-top:3px;">
					<input type="submit" value="認証番号を伝送" alt="인증번호 전송" 
					style="background: #FF4000; color:#fff;
					width:100%; height:100%; border:0 none; cursor:pointer;">
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:70px; margin-top:3px;">
				<a href="/member/login"><input type="button" value="キャンセル" alt="뒤로가기" 
				style="background: #FF4000; color:#fff;
				width:100%; height:100%; border:0 none; cursor:pointer;"></a>
				</div>
</c:if>

<c:if test="${userid eq '1' }">
				<div>
					該当情報の会員が存在できません。<br>
					個人情報をもう一度確認して検索してください。
				</div>
				<div style="width:70%; float:left;">
					<label for="userid" class="readonly">ID</label>
					<input type="text" name="userid" id="userid" placeholder="ID"> 
					<label for="name" class="readonly">ブレンド名</label>
					<input type="text" name="name" id="name" placeholder="ブレンド名"> 
					<label for="Email" class="readonly">メール</label>
					<br>
					<input type="text" name="email1" id="email1" placeholder="email1" style=width:180px;> @
					<input type="text" name="email2" id="email2"  placeholder="email2" style=width:180px;>
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:132px; margin-top:3px;">
					<input type="button" value="認証番号を伝送" alt="인증번호 전송" 
					style="background: #FF4000; color:#fff;
					width:100%; height:100%; border:0 none; cursor:pointer;" onclick="javascript:chk()">
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:70px; margin-top:3px;">
				<a href="/member/login"><input type="button" value="キャンセル" alt="뒤로가기" 
				style="background: #FF4000; color:#fff;
				width:100%; height:100%; border:0 none; cursor:pointer;"></a>
				</div>
</c:if>



			</fieldset>
		</form>	
	</div>
		
</div>

<script>

	function formcheck() 
	{
		if(my.userid.value=="") {
			alert("IDをご入力ください。");
			my.userid.focus();
			return false;
		}
		if(my.name.value=="") {
			alert("ブレンド名ををご入力ください。");
			my.name.focus();
			return false;
		}
		if(my.email1.value=="") {
			alert("email1をご入力ください。");
			my.email1.focus();
			return false;
		}
		if(my.email2.value=="") {
			alert("email2をご入力ください。");
			my.email2.focus();
			return false;
		}
		return true;
	}
	
	function chk() 
	{
		if(my.userid.value=="") {
			alert("IDをご入力ください。");
			my.userid.focus();
		}
		if(my.name.value=="") {
			alert("ブレンド名をご入力ください。");
			my.name.focus();
		}
		if(my.email1.value=="") {
			alert("email1をご入力ください。");
			my.email1.focus();
		}
		if(my.email2.value=="") {
			alert("email2をご入力ください。");
			my.email2.focus();
		}
		my.method="post";
		my.action="pwchange";
		my.submit();

	}
</script>

<%@ include file="../footer.jsp"%>



