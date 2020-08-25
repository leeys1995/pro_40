<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">お知らせ</h2>
		<div class="sub-search">
			<form name="my" method="post" action="notice?page=1">
				<select name="search" class="sel">
					<option value="subject"
						<c:if test="${pageVO.search =='subject'}">selected</c:if>>題目</option>
					<option value="contents"
						<c:if test="${pageVO.search =='contents'}">selected</c:if>>内容</option>
				</select>
				<c:if test="${empty pageVO.key }">
					<td><input type="text" size=20 name="key"></td>
				</c:if>
				<c:if test="${!empty pageVO.key }">
					<td><input type="text" size=20 name="key"
						value="${pageVO.key }"></td>
				</c:if>
				<a href="javascript:n_search()"><input type="button" value="検索"
					class="btn"></a>
			</form>
		</div>
	</div>

	<div class="content-body">
		<table class="qatable">
			<caption class="readonly">질문답변 표</caption>
			<colgroup>
				<col width="6%">
				<col width="48%">
				<col width="10%">
				<col width="15%">
				<col width="11%">
				<col width="10%">
			</colgroup>
			<tbody>
				<tr>
					<th>番号</th>
					<th>題目</th>
					<th>名前</th>
					<th>日付</th>
					<th>アクセス数</th>
				</tr>

				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="notice">
						<tr>
							<td>${notice.idx }</td>
							<td class="tleft"><a href="noticeHits?idx=${notice.idx }">${notice.subject }</a></td>
							<td>サイトあ管理者</td>
							<td>${notice.regdate.substring(0,10) }</td>
							<td>${notice.readcnt }</td>
						</tr>
					</c:forEach>
				</c:if>

				<c:if test="${empty list }">
					<tr>
						<td colspan="5">データが存在できません。</td>

					</tr>

				</c:if>
			</tbody>
		</table>
	</div>


	<div class="paging">
	
		<ul>
			<li style="padding:0 30px;"><a href="${prev }"><img style="width:20px; height:20px;" src="/images/i_prev.gif"></a><a href="#">${page }</a>
			<a href="${next }"><img style="width:20px; height:20px;" src="/images/i_next.gif"></a></li>
		
		</ul>
	

		<c:if test="${user.userid=='admin' }">
			<a href="notice_write" class="btn-write">書く</a>
		</c:if>
	</div>

</div>

<script>
	function n_search() {

		if (my.key.value == "") {
			alert("검색단어입력하세요");
			my.key.focus;
			return;
		}

		my.submit();
	}
</script>

<%@ include file="../footer.jsp"%>















