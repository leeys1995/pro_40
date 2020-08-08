<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

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
			<form name="my" method="post" action="logininsert.do" enctype="multipart/form-data" onsubmit="return formcheck();">
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

<script>
	function formcheck() {
		if(my.title.value=="") {
			alert("제목입력하세요");
			my.title.focus();
			return false;
		}
		if(my.content.value=="") {
			alert("내용입력하세요");
			my.contnet.focus();
			return false;
		}
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>















