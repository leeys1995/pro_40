<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">장수하늘소 포트폴리오</h2>
	</div>
	
	<div class="write-form">
	<form name="my" method="post" action="portfolioinsert.do" enctype="multipart/form-data" onsubmit="return formcheck();">
		<table>
			<caption class="readonly">포트폴리오 입력폼</caption>			
			<colgroup>
				<col class="w20">
				<col class="w80">
			</colgroup>
			<tbody>
			
					<tr>
						<th><label for="title">제목</label></th>
						<td><input type="text" name="title" id="title"></td>
					</tr>
					<tr>
						<th><label for="content">내용</th>
						<td><textarea name="content" id="content" title="내용을 입력하세요"></textarea></td>
					</tr>
					<tr>
						<th><label for="writer">작성자</label></th>
						<td><input type="text" name="writer" id="writer"></td>
					</tr>
					<tr>
						<th><label for="appfile">첨부</label></th>
						<td><input type="file" name="appfile" id="appfile"></td>
					</tr>
					<tr>
						<th><label for="pass">비밀번호</label></th>
						<td><input type="password" name="pass" id="pass"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="전송" class="btn-write">
							<input type="button" value="목록"  class="btn-reset" onclick="javascript:location.href='portfolio.do'">
						</td>
					</tr>
				
			</tbody>
		</table>
		</form>
	</div>
		
</div>

<script>
	function formcheck() {
		
		var re = /^[a-zA-Z0-9]{4,12}$/ 
			// 아이디와 패스워드가 적합한지 검사할 정규식
	    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	        //이메일이 적합한지 검사할 정규식
	        
	    var pw=document.getElementById("pass");
	        
	    var num = pw.search(/[0-9]/g);
	    var eng = pw.search(/[a-z]/ig);
	    var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	    
        
		if(my.title.value=="") {
			alert("제목입력하세요");
			my.title.focus();
			return false;
		}
		if(my.content.value=="") {
			alert("내용입력하세요");
			my.content.focus();
			return false;
		}
		
		

	    if(my.pw.length < 8){
	    	  alert("8자리 ~ 20자리 이내로 입력해주세요.");
	    	  my.pass.focus();
	    	  return false;
    	 }

	    if(pw.search(/₩s/) != -1){
	    	  alert("비밀번호는 공백업이 입력해주세요.");
	    	  my.pass.focus();
	    	  return false;
		 } if(num < 0 || eng < 0 || spe < 0 ){
	    	  alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
	    	  my.pass.focus();
	    	  return false;
		 }
		return true;
	}
	
	
</script>

<%@ include file="../footer.jsp"%>















