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
		<h2 class="sub-title">장수하늘소 회원정보 수정</h2>
	</div>
	
	<div class="write-form">
		<table summery="회원가입 글쓰기 테이블 입니다">
			<caption class="readonly">회원정보 수정폼</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
			<form name="my" method="post" action="modify"" enctype="multipart/form-data" onsubmit="return formcheck();">
				<fieldset>
					<legend class="readonly">입력폼</legend>
					<tr>
						<th scope="row">
							<label for="id">아이디</label>
						</th>
						<td>
							<input type="text" name="userid" id="userid" class="minput" readonly value="${user.userid }"> 
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
							<input type="text" name="name" id="name" class="minput" value="${user.name }"> 수정가능
						</td>
					</tr>
					<tr>
						<th scope="row">
							<label for="name">사업자 번호</label>
						</th>

						<td>
							<input type="text" name="c_code1" id="c_code1"  maxlength="3" style="width: 17.3%" value="${user.c_code.substring(0,3) }" readonly>-
							<input type="text" name="c_code2" id="c_code2"  maxlength="2" style="width: 11.3%" value="${user.c_code.substring(4,6) }" readonly>-
							<input type="text" name="c_code3" id="c_code3"  maxlength="5" style="width: 29.3%" value="${user.c_code.substring(7,12)}" readonly> 
						</td>


					</tr>
					<tr>
						<th scope="row">
							<label for="name">전화번호</label>
						</th>
<c:if test="${user.tel.length()==12}">						
						<td>
							<input type="text" name="tel1" id="tel1"   style="width: 19.3%" value="${user.tel.substring(0,3)}">-
							<input type="text" name="tel2" id="tel2"   style="width: 19.3%" value="${user.tel.substring(4,7)}">-
							<input type="text" name="tel3" id="tel3"   style="width: 19.3%" value="${user.tel.substring(8,12)}"> 수정가능
						</td>
</c:if>
<c:if test="${user.tel.length()==13}">
						<td>
							<input type="text" name="tel1" id="tel1"   style="width: 19.3%" value="${user.tel.substring(0,3)}">-
							<input type="text" name="tel2" id="tel2"   style="width: 19.3%" value="${user.tel.substring(4,8)}">-
							<input type="text" name="tel3" id="tel3"   style="width: 19.3%" value="${user.tel.substring(9,13)}"> 수정가능
						</td>
</c:if>						
<c:if test="${user.tel.length()==14}">
						<td>
							<input type="text" name="tel1" id="tel1"   style="width: 19.3%" value="${user.tel.substring(0,4)}">-
							<input type="text" name="tel2" id="tel2"   style="width: 19.3%" value="${user.tel.substring(5,9)}">-
							<input type="text" name="tel3" id="tel3"   style="width: 19.3%" value="${user.tel.substring(10,14)}"> 수정가능
						</td>
</c:if>						
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td>
							<input type="text" name="email1" class="email" value="${user.email.split('@')[0]}"> @
							<input type="text" name="email2"  class="email" value="${user.email.split('@')[1]}">  수정가능
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정하기" class="btn-write">
							<input type="button" value="홈"  class="btn-reset" onclick="javascript:cl()">
						</td>
					</tr>
					</fieldset>
				</form>
			</tbody>
		</table>
	</div>
		
</div>

<script>

	function formcheck() 
	{
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
		alert("회원정보 수정을 진행합니다.");
		return true;
	}
	function cl() 
	{
		alert("취소하고 홈으로 돌아 갑니다.");
		location.href="";
	}
</script>

<%@ include file="../footer.jsp"%>















