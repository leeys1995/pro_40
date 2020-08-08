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
					 		
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" value="${notice.subject }" readonly>				
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="contents" readonly>${notice.contents }</textarea></td>
					</tr>	
						
					<tr>
						<th>파일첨부</th>
						<c:if test="${!empty notice.filename }">
						<td><a href="/resources/upload/notice/file/${notice.filename }">${notice.filename }</a>
						</td>
						</c:if>
						
						<c:if test="${empty notice.filename }">
						<td>파일이 존재하지 않아요
						</td>
						</c:if>
					</tr>	
				</form>				
					<tr>
						<td colspan="2">
							<a href="notice_modify?idx=${notice.idx }"><input type="button" value="수정하기" class="btn-write"></a>
							<a href="noticedelete?idx=${notice.idx }"><input type="button" value="삭제하기" class="btn-write"></a>
							<a href="javascript:home()">"<input type="button" value="뒤로가기" class="btn-reset"></a>
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















