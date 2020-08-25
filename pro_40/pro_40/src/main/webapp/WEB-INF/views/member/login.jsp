<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- naver script -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- kakao script -->
<meta http-equiv="X-UA-Compatible" content="IE=ege"/>
<meta name="viewport" content="user-scalable=no,inital-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width">
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- Kakao Api -->
<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        // @details 카카오톡 Developer API 사이트에서 발급받은 JavaScript Key
        Kakao.init( "3fa33dcd009da237f6c24a7f61c30317" );
        // @breif 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
              container : "#kakao-login-btn"
            , success : function( authObj ) {
                // console.log( authObj );
          //alert(JSON.stringify(authObj)) <---토큰값
                Kakao.API.request({
                     url: '/v2/user/me'
                    , success : function( res ) {
						$(document).ready(function() {
							$('#userid').val(res.id);
							$('#name').val(res.properties.nickname);
							kakao.method="post";
							kakao.action="kakao_login";
							kakao.submit();
						});
						
                        // console.log( res );
                        // @breif 아이디
                        //document.getElementById( "kakaoIdentity" ).innerHTML = res.id;
                        //alert(res.id) <--유저 id
                        // @breif 닉네임
                        //document.getElementById( "kakaoNickName" ).innerHTML = res.properties.nickname;
                        
                    }, fail : function( error ) {
                        alert( JSON.stringify( error ) );
                    }
                });
            }
            , fail : function( error ) {
                alert( JSON.stringify( error ));
            }
        });
    });
</script>
<!-- KAKAO script End -->    
    

<%@ include file="../header.jsp"%>
<style type="text/css">
  html, div, body,h3{
  	margin: 0;
  	padding: 0;
  }
  h3{
  	display: inline-block;
  	padding: 0.6em;
  }
  </style>
<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">ログイン</h2>
	</div>
	<div class="write-form" style="width:50%; margin:0 auto; border:1px solid #ccc; padding:20px;">
	
		<form name="kakao">
			<input id="userid" name="userid" type="hidden" />
			<input id="name"  name="name" type="hidden" />
		</form>
	
		<form name="my" method="post" action="login" onsubmit="return formcheck();">
			<fieldset>
				<legend class="readonly">ログイン</legend>
				<div style="width:70%; float:left;">
					<label for="userid" class="readonly">ID</label>
					<input type="text" name="userid" id="userid" placeholder="ログインID">
					<label for="pw" class="readonly">パスワード</label>
					<input type="password" name="passwd" id="passwd" placeholder="パスワード">
				</div>
				<div style="width:28%; float:right;padding:15px;
				height:132px; margin-top:3px;">
					<input type="submit" value="ログイン" alt="로그인" 
					style="background: #FF4000; color:#fff;
					width:100%; height:100%; border:0 none; cursor:pointer;">
				</div>
				<p style="clear:both;padding-top:20px; text-align:center;"><a href="/member/idsearch">IDを探す</a> | <a href="/member/pwchange">パスワードを探す</a> | <a href="/member/insert">新規取得</a></p>
				<!-- 외부 api로 로그인		-2020/08/22-	 -->
				    <div><span id="kakaoIdentity"></span></div>
				    <div><span id="kakaoNickName"></span></div>
				    <!-- <div><img id="kakaoThumbnailImg" src=""/></div> -->
				    
							</fieldset>
		</form>	
	</div>
		
</div>
<!-- NAVER login -->
<div id="naver_id_login" style="text-align:center; "><a href="/member/login_api">
<img src="/images/Log in with NAVER_Official_Green.PNG" style="width: 300px; height: auto;"/></a>

</div>
<br>
<!-- KAKAO login -->
<!-- 임시용 영어 KAKAO 로그인 버튼 	- 2020/08/23 수정- -->
<div style="width: 300px; height: auto; margin: auto; cursor: pointer;">
	<!-- <a id="kakao-login-btn"></a> -->
	<img src="/images/kakao_login.png" id="kakao-login-btn">
</div>

<!-- login script-->
<script>
	function formcheck() {
		if(my.title.value=="") {
			alert("題目をご入力ください。");
			my.title.focus();
			return;
		}
		if(my.content.value=="") {
			alert("内容をご入力ください。");
			my.contnet.focus();
			return;
		}
		return true;
	}
</script>

<!-- KAKAO logout script-->
<!-- <script>
function logout() {
	Kakao.Auth.logout(
		function(obj) {
		if(obj==true){}else{}
		location.href='/member/kakao';
	 });
}
</script> -->


<br>
<script>
	function formcheck() {
		if(my.userid.value=="") {
			alert("IDをご入力ください。");
			my.userid.focus();
			return false;
		}
		if(my.passwd.value=="") {
			alert("パスワードをご入力ください。");
			my.passwd.focus();
			return false;
		}
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>