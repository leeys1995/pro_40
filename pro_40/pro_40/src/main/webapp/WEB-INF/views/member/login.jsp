<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">장수하늘소 로그인</h2>
	</div>
	
	<div class="write-form" style="width:50%; margin:0 auto; border:1px solid #ccc; padding:20px;">
		<form name="my" method="post" action="login" onsubmit="return formcheck();">
			<fieldset>
				<legend class="readonly">로그인그룹</legend>
				<div style="width:70%; float:left;">
					<label for="userid" class="readonly">아이디</label>
					<input type="text" name="userid" id="userid" placeholder="아이디">
					<label for="pw" class="readonly">패스워드</label>
					<input type="password" name="passwd" id="passwd" placeholder="패스워드">
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:132px; margin-top:3px;">
					<input type="submit" value="로그인" alt="로그인" 
					style="background: #FF4000; color:#fff;
					width:100%; height:100%; border:0 none; cursor:pointer;">
				</div>
				<p style="clear:both;padding-top:20px; text-align:center;"><a href="/member/idsearch">아이디찾기</a> | <a href="/member/pwchange">패스워드찾기</a> | <a href="/member/insert">회원가입</a></p>
			</fieldset>
		</form>	
	</div>
		
</div>

<script>
	function formcheck() {
		if(my.userid.value=="") {
			alert("아이디를 입력하세요");
			my.userid.focus();
			return false;
		}
		if(my.passwd.value=="") {
			alert("비밀번호를 입력하세요");
			my.passwd.focus();
			return false;
		}
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>















