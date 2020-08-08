<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../header.jsp"%>

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
			<form name="my" method="post" action="admo"" enctype="multipart/form-data" onsubmit="return formcheck();">
				<fieldset>
					<legend class="readonly">입력폼</legend>
					<tr>
						<th scope="row">
							<label for="id">아이디</label>
						</th>
						<td>
							<input type="text" name="userid" id="userid" class="minput" value="${vo.userid }" readonly> 
						</td>
					</tr>
					<tr>
						<th scope="row">
							<label for="name">상호명</label>
						</th>
						<td>
							<input type="text" name="name" id="name" class="minput" value="${vo.name }">
						</td>
					</tr>
					<tr>
						<th scope="row">
							<label for="name">사업자 번호</label>
						</th>

						<td>
							<input type="text" name="c_code1" id="c_code1"  maxlength="3" style="width: 17.3%" value="${vo.c_code.substring(0,3) }" >-
							<input type="text" name="c_code2" id="c_code2"  maxlength="2" style="width: 11.3%" value="${vo.c_code.substring(4,6) }" >-
							<input type="text" name="c_code3" id="c_code3"  maxlength="5" style="width: 29.3%" value="${vo.c_code.substring(7,12)}" > 
						</td>


					</tr>
					<tr>
						<th scope="row">
							<label for="name">전화번호</label>
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
						<th scope="row">이메일</th>
						<td>
							<input type="text" name="email1" class="email" value="${vo.email.split('@')[0]}"> @
							<input type="text" name="email2"  class="email" value="${vo.email.split('@')[1]}">  수정가능
						</td>
					</tr>
					<tr>
						<th scope="row">등급</th>
						<td>
							<select name="rank">
								<option value=""<c:if test="${vo.rank eq '' }">selected</c:if>>등급 선택</option>
								<option value="A"<c:if test="${vo.rank eq 'A' }">selected</c:if>>병원관리자</option>
								<option value="B"<c:if test="${vo.rank eq 'B' }">selected</c:if>>기업관리자</option>
								<option value="C"<c:if test="${vo.rank eq 'C' }">selected</c:if>>일반</option>
								<option value="V"<c:if test="${vo.rank eq 'V' }">selected</c:if>>총관리자</option>
							</select> 
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정하기" class="btn-write">
							<input type="button" value="홈"  class="btn-reset" onclick="javascript:cl()">
							<input type="button" value="뒤로가기"  class="btn-reset" onclick="history.back()">
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
			alert("아이디를을 입력하세요");
			my.userid.focus();
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
		if(my.rank.value=="")
		{
			alert("등급을 선택하세요");
			my.rank.focus();
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















