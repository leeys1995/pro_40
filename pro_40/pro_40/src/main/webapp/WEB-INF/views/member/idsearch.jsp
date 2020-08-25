<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">ID探す</h2>
	</div>
	
	<div class="write-form" style="width:50%; margin:0 auto; border:1px solid #ccc; padding:20px;">
		<form name="my" method="post" action="idsearch" onsubmit="return formcheck();">
			<fieldset>
				<legend class="readonly">ID探す</legend>
<c:if test="${userid eq '0' }">
				<div style="width:70%; float:left;">
					<label for="name" class="readonly">ブランド名</label>
					<input type="text" name="name" id="name" placeholder="ブランド名">
					<label for="tel" class="readonly">電話番号</label>
					<input type="text" name="tel" id="tel" placeholder="電話番号">
				</div>
				<div style="width:30%; float:right;padding:15px;
				height:70px; margin-top:3px;">
					<input type="submit" value="ID検索" alt="ID검색" 
					style="background: #FF4000; color:#fff;
					width:100%; height:100%; border:0 none; cursor:pointer;">
				</div>
				<div style="width:30%; float:right;padding:15px;
				height:70px; margin-top:3px;">
				<a href="/member/login"><input type="button" value="キャンセル" alt="뒤로가기" 
				style="background: #FF4000; color:#fff;
				width:100%; height:100%; border:0 none; cursor:pointer;"></a>
				</div>
</c:if>

<c:if test="${userid eq '1' }">
				<div>
					当たる情報の会員が存在できません。<br>
					新規取得またはもう一度検索してください。
				</div>
				<div style="width:70%; float:left;">
					<label for="name" class="readonly">ID</label>
					<input type="text" name="name" id="name" placeholder="ブレンド名">
					<label for="tel" class="readonly">電話番号</label>
					<input type="text" name="tel" id="tel" placeholder="電話番号">
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:70px; margin-top:3px;">
					<input type="submit" value="ID検索" alt="ID검색" 
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

<c:if test="${chk == '3' }">
<fieldset>
		<div style="width:70%; height; float:left;">
		<br><br><br>
			当該情報のIDは ${userid} です。
		</div>
		<div style="width:28%; float:right;padding:15px;
			height:132px; margin-top:3px;">
			<a href="/member/login"><input type="button" value="ログイン" alt="로그인" 
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
			alert("ブレンド名をご入力ください。");
			my.name.focus();
			return false;
		}
		if(my.tel.value=="") {
			alert("電話番号をご入力ください。");
			my.tel.focus();
			return false;
		}
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>















