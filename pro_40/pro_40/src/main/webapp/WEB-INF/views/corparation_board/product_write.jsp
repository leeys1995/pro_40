<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
		int idx = Integer.parseInt(request.getParameter("idx"));
%>
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
			<form name="input" method="post" action="product_write">
			
			<input type="hidden" value="<%=idx %>" name ="idx2">
					<tr>
						<th>제목</th>
						<td><input type="text" name="p_subject">				
						</td>
					</tr>
					<tr>
						<th>글쓴이</th>
						<td><input type="text" name="p_name">				
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="p_contents"></textarea></td>
					</tr>	
					<tr>
						<th>패스워드</th>
						<td><input type="text" name="p_pass" placeholder="답변을 보려면 필요합니다"></td>
					</tr>	
						
					
				</form>				
					<tr>
						<td colspan="2">
							<a href="javascript:send()"><input type="button" value="등록" class="btn-write"></a>
							<a href="javascript:home()"><input type="button" value="뒤로가기" class="btn-reset"></a>
						</td>
					</tr>
				
			</tbody>
		</table>
	</div>
		
</div>

<script>
	function send() {
		
		if(input.p_subject.value=="") {
			alert("제목을 입력해주세요");
			input.p_subject.focus();
			return;
		}
		if(input.p_contents.value=="") {
			alert("글쓴이를 입력해주세요");
			input.p_contents.focus();
			return;
		}
		if(input.p_name.value=="") {
			alert("내용을 입력해주세요");
			input.p_name.focus();
			return;
		}
		if(input.p_pass.value=="") {
			alert("비밀번호를 입력해주세요");
			input.p_pass.focus();
			return;
		}
		
	
	
		alert("등록합니다.");
		input.submit();
	}
	
	function home(){
		
		history.back();
	}
</script>

<%@ include file="../footer.jsp" %>













