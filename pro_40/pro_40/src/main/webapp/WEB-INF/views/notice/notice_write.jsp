<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../header.jsp" %>



<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">お知らせ</h2>
	</div>
	
	<div class="write-form">
		<table summery="갤러리 글쓰기 테이블 입니다">
			<caption class="readonly">갤러리 입력폼</caption>			
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
			<form name="input" method="post" action="notice_write" enctype="multipart/form-data">
			
					<tr>
						<th>題目</th>
						<td><input type="text" name="subject">				
						</td>
					</tr>
					<tr>
						<th>内容</th>
						<td><textarea name="contents"></textarea></td>
					</tr>	
						
					<tr>
						<th>ファイル添付</th>
						<td><input type="file" name="filename">
						</td>
					</tr>	
				</form>				
					<tr>
						<td colspan="2">
							<a href="javascript:send()"><input type="button" value="登録する" class="btn-write"></a>
							<a href="javascript:home()">"<input type="button" value="キャンセル" class="btn-reset"></a>
						</td>
					</tr>
				
			</tbody>
		</table>
	</div>
		
</div>

<script>
	function send() {
		
		if(input.subject.value=="") {
			alert("題目を入力してください。");
			input.subject.focus();
			return;
		}
		if(input.contents.value=="") {
			alert("内容を入力してください。");
			input.contents.focus();
			return;
		}
		
	
	
		alert("登録します。");
		input.submit();
	}
	
	function home(){
		
		history.back();
	}
</script>

<%@ include file="../footer.jsp" %>













