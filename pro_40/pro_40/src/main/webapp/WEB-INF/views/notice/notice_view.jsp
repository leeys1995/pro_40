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
					 		
					<tr>
						<th>題目</th>
						<td><input type="text" name="subject" value="${notice.subject }" readonly>				
						</td>
					</tr>
					<tr>
						<th>内容</th>
						<td><textarea name="contents" readonly>${notice.contents }</textarea></td>
					</tr>	
						
					<tr>
						<th>ファイル添付</th>
						<c:if test="${!empty notice.filename }">
						<td><a href="/resources/upload/notice/file/${notice.filename }">${notice.filename }</a>
						</td>
						</c:if>
						
						<c:if test="${empty notice.filename }">
						<td>ファイルが存在できません。
						</td>
						</c:if>
					</tr>	
				</form>				
					<tr>
						<td colspan="2">
						  <c:if test="${user.userid=='admin' }">
							<a href="notice_modify?idx=${notice.idx }"><input type="button" value="修正する" class="btn-write"></a>
							<a href="noticedelete?idx=${notice.idx }"><input type="button" value="削除する" class="btn-reset" style="background-color:green"></a>
						  </c:if>
							<a href="javascript:home()">"<input type="button" value="キャンセル" class="btn-reset"></a>
						</td>
					</tr>
				
			</tbody>
		</table>
	</div>
		
</div>

<script>

	
	function home(){
		
		history.back();
	}
</script>

<%@ include file="../footer.jsp" %>















