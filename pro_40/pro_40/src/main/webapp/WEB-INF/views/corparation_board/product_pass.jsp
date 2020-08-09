<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">제품문의 패스워드</h2>
	</div>
	
	<div class="write-form" style="width:50%; margin:0 auto; border:1px solid #ccc; padding:20px;">
	
		<form name="my" method="post" action="product_pass?idx=${idx }&idx2=${idx2}" onsubmit="return formcheck();">
		
			<fieldset>
				<legend class="readonly">로그인그룹</legend>
				<div style="width:70%; float:left;">
					<label for="pw" class="readonly">패스워드</label>
					<input type="password" name="p_pass" id="passwd" placeholder="패스워드">
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:132px; margin-top:3px;">
					<input type="submit" value="확인" alt="확인" 
					style="background: #FF4000; color:#fff;
					width:100%; height:100%; border:0 none; cursor:pointer;">
				</div>
			</fieldset>
		</form>	
	</div>
		
</div>

<script>
	function formcheck() {
		if(my.p_pass.value=="") {
			alert("비밀번호를 입력하세요");
			my.p_pass.focus();
			return false;
		}
		
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>















