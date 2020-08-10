<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<!-- naver script -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- kakao script -->
<meta http-equiv="X-UA-Compatible" content="IE=ege"/>
<meta name="viewport" content="user-scalable=no,inital-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,width=device-width">
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        // @details 카카오톡 Developer API 사이트에서 발급받은 JavaScript Key
        Kakao.init( "3fa33dcd009da237f6c24a7f61c30317" );
        // @breif 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
              container : "#kakao-login-btn"
            , success : function( authObj ) {
                // console.log( authObj );
          alert(JSON.stringify(authObj))
                Kakao.API.request({
                     url: '/v2/user/me'
                    , success : function( res ) {
                        // console.log( res );
                        // @breif 아이디
                        document.getElementById( "kakaoIdentity" ).innerHTML = res.id;
                        alert(res.id)
                        // @breif 닉네임
                        document.getElementById( "kakaoNickName" ).innerHTML = res.properties.nickname;
                        // @breif 프로필 이미지
                        document.getElementById( "kakaoProfileImg" ).src = res.properties.profile_image;
                        // @breif 썸네일 이미지
                        //document.getElementById( "kakaoThumbnailImg" ).src = res.properties.thumbnail_image;
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

<!--Main Login  -->
<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">장수하늘소 로그인</h2>
	</div>
	
	<div class="write-form" style="width:50%; margin:0 auto;">
		<table summery="아이디, 패스워드 입력">
			<caption class="readonly">로그인 입력폼</caption>			
			<colgroup>
				<col width="20%">
				<col width="70%">
				<col width="30%">
			</colgroup>
			<tbody>
			<form name="my" method="post" action="logininsert.do" enctype="multipart/form-data">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id"></td>
					<td rowspan="2">
						<input type="submit" value="로그인" class="btn-write" style="height:110px;">
					</td>
				</tr>
				
				<tr>
					<th>패스워드</th>
					<td><input type="text" name="pw"></td>
				</tr>
				
				<tr>
					<td colspan="3" style="text-align:center;">아이디찾기 | 패스워드 찾기</td>
				</tr>
			</form>
			</tbody>
		</table>
	</div>
</div>
<!-- Main Login End -->

<!-- NAVER login -->
<div id="naver_id_login" style="text-align:center; "><a href="${url}">
<img src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" style="width: 300px; height: auto;"/></a>
</div>

<!-- KAKAO login -->
<div style="width: 300px; height: auto; margin: auto;">
<a id="kakao-login-btn"></a>
</div>

<!-- KAKAO user -->

<br>
    <div><span id="kakaoIdentity"></span></div>
    <div><span id="kakaoNickName"></span></div>
    <div><img id="kakaoProfileImg" src=""/></div>
    <!-- <div><img id="kakaoThumbnailImg" src=""/></div> -->

<a href="javascript:logout()">logout</a>

<!-- login script-->
<script>
	function formcheck() {
		if(my.title.value=="") {
			alert("제목입력하세요");
			my.title.focus();
			return;
		}
		if(my.content.value=="") {
			alert("내용입력하세요");
			my.contnet.focus();
			return;
		}
		return true;
	}
</script>

<!-- KAKAO logout script-->
<script>
function logout() {
	Kakao.Auth.logout(
		function(obj) {
		if(obj==true){}else{}
		location.href='/member/kakao';
	 });
}
</script>

<%@ include file="../footer.jsp"%>
 --%>