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
		<h2 class="sub-title">新規取得</h2>
	</div>
	
	<div class="write-form">
		<table summery="회원가입 글쓰기 테이블 입니다">
			<caption class="readonly">新規取得入力フォーム</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
			<form name="my" method="post" action="insert" enctype="multipart/form-data" onsubmit="return formcheck();">
				<fieldset>
					<legend class="readonly">入力フォーム</legend>
					<tr>
						<th scope="row">
							<label for="id">ID</label>
						</th>
						<td>
							<input type="text" name="userid" id="userid" class="minput"placeholder="重複確認ボタンを押してください。" readonly value="<%=userid%>"> 
							<a href="javascript:idchk()" class="btn-write">重複確認</a>
						</td>
					</tr>
					<tr>
						<th scope="row"><lavel for="pass1">パスワード</lavel></th>
						<td><input type="password" name="passwd" id="passwd"  class="minput"></td>
					</tr>
					<tr>
						<th scope="row">パスワード確認</th>
						<td><input type="password" name="pass2"  class="minput"></td>
					</tr>
					<tr>
						<th scope="row">
							<label for="name">ブレンド名</label>
						</th>
						<td>
							<input type="text" name="name" id="name" class="minput"> 
						</td>
					</tr>
					<tr>
						<th scope="row">
							<label for="name">事業者番号</label>
						</th>
						<td>
							<input type="text" name="c_code1" id="c_code1"  maxlength="3" style="width: 17.3%" placeholder="c_code1">-
							<input type="text" name="c_code2" id="c_code2"  maxlength="2" style="width: 11.3%" placeholder="c_code2">-
							<input type="text" name="c_code3" id="c_code3"  maxlength="5" style="width: 29.3%" placeholder="c_code3"> 
						</td>
					</tr>
					<tr>
						<th scope="row">
							<label for="name">電話番号</label>
						</th>
						<td>
							<input type="text" name="tel1" id="tel1"   style="width: 19.3%" placeholder="tel1" maxlength="3">-
							<input type="text" name="tel2" id="tel2"   style="width: 19.3%" placeholder="tel2" maxlength="4">-
							<input type="text" name="tel3" id="tel3"   style="width: 19.3%" placeholder="tel3" maxlength="4"> 
						</td>
					</tr>
					<tr>
						<th scope="row">メール</th>
						<td>
							<input type="text" name="email1" class="email" placeholder="email1"> @
							<input type="text" name="email2"  class="email" placeholder="email2"> 
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="加入する" class="btn-write">
							<input type="button" value="ホーム"  class="btn-reset" onclick="javascript:location.href='/'">
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
			alert("IDをご入力ください。");
			my.userid.focus();
			return false;
		}
		if(my.passwd.value=="") 
		{
			alert("パスワードをご入力ください。");
			my.passwd.focus();
			return false;
		}
		if(my.passwd.value != my.pass2.value) 
		{
			alert("パスワードをご確認ください。");
			my.pass2.focus();
			return false;
		}
		if(my.name.value=="") 
		{
			alert("ブレンド名をご入力ください。");
			my.name.focus();
			return false;
		}
		if(my.c_code1.value=="") 
		{
			alert("c_code1をご入力ください。");
			my.c_code1.focus();
			return false;
		}
		if(my.c_code2.value=="") 
		{
			alert("c_code2をご入力ください。");
			my.c_code2.focus();
			return false;
		}
		if(my.c_code3.value=="") 
		{
			alert("c_code3をご入力ください。");
			my.c_code3.focus();
			return false;
		}
		if(my.tel1.value=="") 
		{
			alert("tel1をご入力ください。");
			my.tel1.focus();
			return false;
		}
		if(my.tel2.value=="") 
		{
			alert("tel2をご入力ください。");
			my.tel2.focus();
			return false;
		}
		if(my.tel3.value=="") 
		{
			alert("tel3をご入力ください。");
			my.tel3.focus();
			return false;
		}
		if(my.email1.value=="") 
		{
			alert("email1をご入力ください。");
			my.email1.focus();
			return false;
		}
		if(my.email2.value=="") 
		{
			alert("email2をご入力ください。");
			my.email2.focus();
			return false;
		}
		alert("新規取得を進めます。");
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>


