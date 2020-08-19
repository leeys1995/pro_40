<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>
<%
	String userid = request.getParameter("userid");
%>
<%
if(userid==null)
{
	userid="";
}
%>
<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">장수하늘소 회원가입</h2>
	</div>
	
	<div class="write-form">
		<table summery="회원가입 글쓰기 테이블 입니다">
			<caption class="readonly">회원가입 입력폼</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
			<form name="my" method="post" action="insert" enctype="multipart/form-data" onsubmit="return formcheck();">
				<fieldset>
					<legend class="readonly">입력폼</legend>
					<tr>
						<th scope="row">
							<label for="id">아이디</label>
						</th>
						<td>
							<input type="text" name="userid" id="userid" class="minput" placeholder="중복환인 버튼을 눌러주세요" readonly value="<%=userid%>"> 
							<a href="javascript:idchk()" class="btn-write">중복확인</a>
						</td>
					</tr>
					<tr>
						<th scope="row"><lavel for="pass1">패스워드</lavel></th>
						<td><input type="password" name="passwd" id="passwd"  class="minput"></td>
					</tr>
					<tr>
						<th scope="row">패스워드 확인</th>
						<td><input type="password" name="pass2"  class="minput"></td>
					</tr>
					<tr>
						<th scope="row">
							<label for="name">상호명</label>
						</th>
						<td>
							<input type="text" name="name" id="name" class="minput"> 
						</td>
					</tr>
					<tr>
						<th scope="row">
							<label for="name">사업자 번호</label>
						</th>
						<td>
							<input type="text" name="c_code1" id="c_code1"  maxlength="3" style="width: 17.3%" placeholder="c_code1">-
							<input type="text" name="c_code2" id="c_code2"  maxlength="2" style="width: 11.3%" placeholder="c_code2">-
							<input type="text" name="c_code3" id="c_code3"  maxlength="5" style="width: 29.3%" placeholder="c_code3"> 
						</td>
					</tr>
					<tr>
						<th scope="row">
							<label for="name">전화번호</label>
						</th>
						<td>
							<input type="text" name="tel1" id="tel1"   style="width: 19.3%" placeholder="tel1" maxlength="3">-
							<input type="text" name="tel2" id="tel2"   style="width: 19.3%" placeholder="tel2" maxlength="4">-
							<input type="text" name="tel3" id="tel3"   style="width: 19.3%" placeholder="tel3" maxlength="4"> 
						</td>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td>
							<input type="text" name="email1" class="email" placeholder="email1"> @
							<input type="text" name="email2"  class="email" placeholder="email2"> 
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="가입하기" class="btn-write">
							<input type="button" value="홈"  class="btn-reset" onclick="javascript:location.href='/'">
						</td>
					</tr>
					</fieldset>
				</form>
			</tbody>
		</table>
	</div>
		
</div>

<script>
function idchk() 
{
		window.open("idcheck", "", "width=400, height=250, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );
}
	function formcheck() {
		if(my.userid.value=="") 
		{
			alert("아이디입력하세요");
			my.userid.focus();
			return false;
		}
		if(my.passwd.value=="") 
		{
			alert("패스워드를 입력하세요");
			my.passwd.focus();
			return false;
		}
		if(my.passwd.value != my.pass2.value) 
		{
			alert("패스워드를 확인하세요");
			my.pass2.focus();
			return false;
		}
		if(my.name.value=="") 
		{
			alert("상호명을 입력하세요");
			my.name.focus();
			return false;
		}
		if(my.c_code1.value=="") 
		{
			alert("c_code1를 입력하세요");
			my.c_code1.focus();
			return false;
		}
		if(my.c_code2.value=="") 
		{
			alert("c_code2를 입력하세요");
			my.c_code2.focus();
			return false;
		}
		if(my.c_code3.value=="") 
		{
			alert("c_code3를 입력하세요");
			my.c_code3.focus();
			return false;
		}
		if(my.tel1.value=="") 
		{
			alert("tel1를 입력하세요");
			my.tel1.focus();
			return false;
		}
		if(my.tel2.value=="") 
		{
			alert("tel2를 입력하세요");
			my.tel2.focus();
			return false;
		}
		if(my.tel3.value=="") 
		{
			alert("tel3를 입력하세요");
			my.tel3.focus();
			return false;
		}
		if(my.email1.value=="") 
		{
			alert("email1을 입력하세요");
			my.email1.focus();
			return false;
		}
		if(my.email2.value=="") 
		{
			alert("email2을 입력하세요");
			my.email2.focus();
			return false;
		}
		alert("회원가입을 진행합니다.");
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>















