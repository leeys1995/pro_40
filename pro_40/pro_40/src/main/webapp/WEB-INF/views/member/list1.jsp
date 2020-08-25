<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" align="center" width="70%">
		<tr>
			<td colspan="5" align="right" valign="middle" height="20">
			<font size="2" face="고딕">全体会員数: 
			<b>${totcount }</b>名 - ${page }/ ${totpage } Pages
			</font></td>
		</tr>
		<tr bgcolor="e3e9ff">
			<td width="10%" align="center" height="20"><font face="돋움"
				size="2">番号</font></td>
			<td width="50%" align="center" height="20"><font face="돋움"
				size="2">ブレンド名</font></td>
			<td width="15%" align="center" height="20"><font face="돋움"
				size="2">ID</font></td>
			<td width="15%" align="center" height="20"><font face="돋움"
				size="2">電話番号</font></td>
			<td width="10%" align="center" height="20"><font face="돋움"
				size="2">メール</font></td>
			<td width="10%" align="center" height="20"><font face="돋움"
				size="2">取得日付</font></td>
			<td width="10%" align="center" height="20"><font face="돋움"
				size="2">最後ログイン時間</font></td>
			<td width="10%" align="center" height="20"><font face="돋움"
				size="2">事業者番号</font></td>
		</tr>

<!--  
			<tr>
			<td>번호</td>
			<td>사업장 이름</td>
			<td>ID</td>
			<td>등급</td>
			<td>전화번호</td>
			<td>Email</td>
			<td>가입일자</td>
			<td>마지막 로그인 시간 </td>
			<td>사업자 번호</td>
		</tr>
-->
<c:if test="${!empty list }">
<c:forEach var="list" items="${list }">
		<tr bgcolor="e3e9ff">
			<td width="10%" align="center" height="20"><font face="돋움"
				size="2">${listcount }</font></td>
			<td width="50%" align="center" height="20"><font face="돋움"
				size="2">${list.name}</font></td>
			<td width="15%" align="center" height="20"><font face="돋움"
				size="2">${list.userid }</font></td>
			<td width="15%" align="center" height="20"><font face="돋움"
				size="2">${list.tel }</font></td>
			<td width="10%" align="center" height="20"><font face="돋움"
				size="2">${list.email }</font></td>
			<td width="10%" align="center" height="20"><font face="돋움"
				size="2">${list.user_first }</font></td>
			<td width="10%" align="center" height="20"><font face="돋움"
				size="2">${list.user_last }</font></td>
			<td width="10%" align="center" height="20"><font face="돋움"
				size="2">${list.c_code }</font></td>
			<c:set var="listcount" value="${listcount-1 }"></c:set>
		</tr>
</c:forEach>		
</c:if>
<c:if test="${empty list }">
	<td align="center" colspan="5" height="25">登録された資料がありません。</td>
</c:if>

					<div align="center">
						<table width="700" border="0" cellspacing="0" cellpadding="5">
							<tr>&nbsp;
							</tr>
							<tr>
								<td colspan="5">
									<div align="center">${listpage }</div>
								</td>
							</tr>
						</table>
					</div>

	</table>
</body>
</html>

<%@ include file="../footer.jsp"%>
