<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../header.jsp"%>


<%
	int idx2 = Integer.parseInt(request.getParameter("idx2"));
	int idx = Integer.parseInt(request.getParameter("idx"));
%>

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
					<th>글쓴이</th>
					<td><input type="text" name="p_name"
						value="${product.p_name }" readonly></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="p_subject"
						value="${product.p_subject }"></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea name="p_contents" readonly>${product.p_contents }</textarea></td>
				</tr>


				</form>
				<tr>
					<td colspan="2"><a href="productdelete?idx=${product.idx }"><input
							type="button" value="삭제하기" class="btn-write"></a> <a
						href="/corparation_board/product?idx=<%=idx2 %>&page=1"><input type="button" value="뒤로가기"
							class="btn-reset"></a></td>
				</tr>

			</tbody>
		</table>
	</div>


</div>


<c:if test="${!empty product.reply }">
	<div class="contain">
		<div class="write-form">
			<table summery="갤러리 글쓰기 테이블 입니다">
				<caption class="readonly">갤러리 입력폼</caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<tr>
						<th>답변자</th>
						<td><input type="text" name="reply" value="${c_name }" readonly > </td>
					</tr>

					<tr>
						<th>답글</th>
						<td><textarea name="reply" readonly>${product.reply }</textarea></td>
					</tr>


				</tbody>
			</table>
		</div>
	</div>
</c:if>


<c:if test="${empty product.reply }">
	<div class="contain">
		<div class="write-form">
			<table summery="갤러리 글쓰기 테이블 입니다">
				<caption class="readonly">갤러리 입력폼</caption>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tbody>
					<form name="input" method="post"
						action="reply?idx=<%=idx%>&idx2=<%=idx2%>">


						<input type="hidden" name="idx" value="<%=idx%>"> <input
							type="hidden" name="idx2" value="<%=idx2%>">

						<tr>
							<th>답글</th>
							<td><textarea name="reply"></textarea></td>
						</tr>


					</form>
					<tr>
						<td colspan="2"><a href="javascript:send()"> <input
								type="button" value="답글하기" class="btn-reset">
						</a></td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>

</c:if>
<%@ include file="../footer.jsp"%>


<script>
	function send() {

		if (input.reply.value == "") {

			alert("답글을 입력바랍니다.");
			input.reply.focus();
			return;
		}

		alert("답글을 입력합니다.");
		input.submit();
	}

</script>










