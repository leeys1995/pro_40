<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">会員情報修正</h2>
	</div>
	
	<div class="write-form">
		<table summery="회원가입 글쓰기 테이블 입니다">
			<caption class="readonly">会員情報修正フォーム</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
			<form name="my" method="post" action="admo"" enctype="multipart/form-data" onsubmit="return formcheck();">
				<fieldset>
					<legend class="readonly">入力フォーム</legend>
					<tr>
						<th scope="row">
							<label for="id">ＩＤ</label>
						</th>
						<td>
							<input type="text" name="userid" id="userid" class="minput" value="${vo.userid }" readonly> 
						</td>
					</tr>
					<tr>
						<th scope="row">
							<label for="name">ブランド名</label>
						</th>
						<td>
							<input type="text" name="name" id="name" class="minput" value="${vo.name }">
						</td>
					</tr>
					<tr>
						<th scope="row">
							<label for="name">事業者番号</label>
						</th>

						<td>
							<input type="text" name="c_code1" id="c_code1"  maxlength="3" style="width: 17.3%" value="${vo.c_code.substring(0,3) }" >-
							<input type="text" name="c_code2" id="c_code2"  maxlength="2" style="width: 11.3%" value="${vo.c_code.substring(4,6) }" >-
							<input type="text" name="c_code3" id="c_code3"  maxlength="5" style="width: 29.3%" value="${vo.c_code.substring(7,12)}" > 
						</td>


					</tr>
					<tr>
						<th scope="row">
							<label for="name">電話番号</label>
						</th>
<c:if test="${user.tel.length()==12}">						
						<td>
							<input type="text" name="tel1" id="tel1"   style="width: 19.3%" value="${vo.tel.substring(0,3)}">-
							<input type="text" name="tel2" id="tel2"   style="width: 19.3%" value="${vo.tel.substring(4,7)}">-
							<input type="text" name="tel3" id="tel3"   style="width: 19.3%" value="${vo.tel.substring(8,12)}"> 
						</td>
</c:if>
<c:if test="${user.tel.length()==13}">
						<td>
							<input type="text" name="tel1" id="tel1"   style="width: 19.3%" value="${vo.tel.substring(0,3)}">-
							<input type="text" name="tel2" id="tel2"   style="width: 19.3%" value="${vo.tel.substring(4,8)}">-
							<input type="text" name="tel3" id="tel3"   style="width: 19.3%" value="${vo.tel.substring(9,13)}"> 
						</td>
</c:if>						
<c:if test="${user.tel.length()==14}">
						<td>
							<input type="text" name="tel1" id="tel1"   style="width: 19.3%" value="${vo.tel.substring(0,4)}">-
							<input type="text" name="tel2" id="tel2"   style="width: 19.3%" value="${vo.tel.substring(5,9)}">-
							<input type="text" name="tel3" id="tel3"   style="width: 19.3%" value="${vo.tel.substring(10,14)}"> 
						</td>
</c:if>						
					</tr>
					<tr>
						<th scope="row">メール</th>
						<td>
							<input type="text" name="email1" class="email" value="${vo.email.split('@')[0]}"> @
							<input type="text" name="email2"  class="email" value="${vo.email.split('@')[1]}">  수정가능
						</td>
					</tr>
					<tr>
						<th scope="row">等級</th>
						<td>
							<select name="rank">
								<option value=""<c:if test="${vo.rank eq '' }">selected</c:if>>等級選択</option>
								<option value="A"<c:if test="${vo.rank eq 'A' }">selected</c:if>>病院管理者</option>
								<option value="B"<c:if test="${vo.rank eq 'B' }">selected</c:if>>企業管理者</option>
								<option value="C"<c:if test="${vo.rank eq 'C' }">selected</c:if>>一般</option>
								<option value="V"<c:if test="${vo.rank eq 'V' }">selected</c:if>>全体管理者</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="修正する" class="btn-write">
							<input type="button" value="ホーム"  class="btn-reset" onclick="javascript:cl()">
							<input type="button" value="以前ページへ"  class="btn-reset" onclick="history.back()">
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

		if(my.userid.value=="") 
		{
			alert("IDをご入力ください。");
			my.userid.focus();
			return false;
		}
		if(my.name.value=="") 
		{
			alert("ブランド名をご入力ください。");
			my.name.focus();
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
		if(my.rank.value=="")
		{
			alert("等級をご選択ください。");
			my.rank.focus();
			return false;
		}
		alert("会員情報修正を進めます。");
		return true;
	}
	function cl() 
	{
		alert("キャンセルしてホームに戻ります。");
		location.href="";
	}
</script>

<%@ include file="../footer.jsp"%>
