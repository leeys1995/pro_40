<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

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
			<form name="my" method="post" action="memberinsert.do" enctype="multipart/form-data" onsubmit="return formcheck();">
				<fieldset>
					<legend class="readonly">入力フォーム</legend>
					<tr>
						<th scope="row">
							<label for="id">ID</label>
						</th>
						<td>
							<input type="text" name="id" id="id" class="minput"> 
							<a href="" class="btn-write">重複確認</a>
						</td>
					</tr>
					<tr>
						<th scope="row"><lavel for="pass1">パスワード</lavel></th>
						<td><input type="passwrod" name="pass1" id="pass1"  class="minput"></td>
					</tr>
					<tr>
						<th scope="row">パスワード確認</th>
						<td><input type="passwrod" name="pass2"  class="minput"></td>
					</tr>
					<tr>
						<th scope="row">名前</th>
						<td><input type="text" name="name"  class="minput"></td>
					</tr>
					<tr>
						<th scope="row">メール</th>
						<td>
							<input type="text" name="email1" class="email"> @
							<input type="text" name="email2"  class="email"> 
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="伝送" class="btn-write">
							<input type="button" value="目録"  class="btn-reset" onclick="javascript:location.href='portfolio.do'">
						</td>
					</tr>
					</fieldset>
				</form>
			</tbody>
		</table>
	</div>
		
</div>

<script>
	function formcheck() {
		if(my.id.value=="") {
			alert("IDをご入力ください。");
			my.id.focus();
			return false;
		}
		if(my.pass1.value=="") {
			alert("パスワードをご入力ください。");
			my.pass1.focus();
			return false;
		}
		if(my.pass1.value != my.pass2.value) {
			alert("パスワードをご確認ください。");
			my.pass1.focus();
			return false;
		}
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>



