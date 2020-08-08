<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../header.jsp" %>


<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">장수하늘소 갤러리</h2>
	</div>
	
	<div class="write-form">
		<table summery="갤러리 글쓰기 테이블 입니다">
			<caption class="readonly">갤러리 입력폼</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
			<form name="input" method="post" action="notice_modify" enctype="multipart/form-data">
					 
					 <input type="hidden" name="idx" value="${notice.idx}">
					 
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" value="${ notice.subject }">				
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="contents">${notice.contents }</textarea></td>
					</tr>	
						
					<tr>
						<th>파일첨부</th>
						<td><input type="file" name="filename">
						<c:if test="${!empty notice.filename }">
							※기존파일이 존재해요
						</c:if>
						</td>
					</tr>	
				</form>				
					<tr>
						<td colspan="2">
							<a href="javascript:send()"><input type="button" value="수정" class="btn-write"></a>
							<a href="javascript:home()">"<input type="button" value="뒤로가기" class="btn-reset"></a>
						</td>
					</tr>
				
			</tbody>
		</table>
	</div>
		
</div>

<script>
	function send() {
		
		if(input.subject.value=="") {
			alert("제목을 입력해주세요");
			input.subject.focus();
			return;
		}
		if(input.contents.value=="") {
			alert("내용을 입력해주세요");
			input.contents.focus();
			return;
		}
		
	
	
		alert("수정합니다.");
		input.submit();
	}
	
	function home(){
		
		history.back();
	}
</script>

<%@ include file="../footer.jsp" %>














