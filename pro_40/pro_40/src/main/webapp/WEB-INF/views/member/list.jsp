<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../header.jsp"%>

<html>
<head><title>게시판 읽기</title>
<link rel="stylesheet" type="text/css" href="/stylesheet.css">
<style type="text/css">
  a.list {text-decoration:none;color:black;font-size:10pt;}
</style>

</head>
<body bgcolor="#FFFFFF" topmargin="0" leftmargin="0">
<table border="0" width="800">
  <tr>

	<td width="80%" valign="top">	
		<br>
    <table border="0" cellspacing="1" width="100%" align="center">
    <tr>
        <td colspan="8" align="center" valign="center" height="20">
        	<font size="2" face="고딕">전체 회원수: 
			<b>${totcount }</b>명 - ${page }/ ${totpage } Pages
			</font>
		</td>
	</tr>
 	   <tr bgcolor="e3e9ff">
 	   	<td width="5%"></td>
 	      <td width="5%" align="center" height="20"><font face="돋움" size="2">번호</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">사업장 이름</font></td>
 	      <td width="7%" align="center" height="20"><font face="돋움" size="2">ID</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">전화번호</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">Email</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">가입일자</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">마지막 로그인 시간</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">사업자 번호</font></td>
 	      <td width="10%" align="center" height="20"><font face="돋움" size="2">등급</font></td>
 	   </tr>

<c:if test="${!empty list }">
<c:forEach var="list" items="${list }">
			<tr onMouseOver="style.backgroundColor='#D1EEEE'" onMouseOut="style.backgroundColor=''">
			<td width="5%"></td>
        <td align="center" height="25">
        	<font face="돋움" size="2" color="#000000">${listcount }</font>
        </td>
				<font face="돋움" size="2" color="#000000">
				<td align="center" height="20"><font face="돋움" size="2" ><a href="/member/admo?idx=${list.idx}" >${list.name}</a></font></td>
				<td align="center" height="20"><font face="돋움" size="2">${list.userid }</font></td>
				<td align="center" height="20"><font face="돋움" size="2">${list.tel }</font></td>
				<td align="center" height="20"><font face="돋움" size="2">${list.email }</font></td>
				<td align="center" height="20"><font face="돋움" size="2">${list.user_first }</font></td>
				<td align="center" height="20"><font face="돋움" size="2">${list.user_last }</font></td>
				<td align="center" height="20"><font face="돋움" size="2">${list.c_code }</font></td>
				<td align="center" height="20"><font face="돋움" size="2">${list.rank }</font></td>
			</tr>
		<c:set var="listcount" value="${listcount-1 }"></c:set>
</c:forEach>		
</c:if>
<c:if test="${empty list }">
	<td align="center" colspan="5" height="25">등록된 자료가 없습니다.</td>
</c:if>	


	 <div align="center">
        <table width="700" border="0" cellspacing="0" cellpadding="5">
          <tr>&nbsp;</tr><tr>
             <td colspan="5">        
                <div align="center">${listpage }</div>
			  </td>
			 </tr>
		</table>

	<table width="600">
		<tr>
			<td width="450px"> &nbsp;</td>
			<td  align="center">
				<table>
					<form>	
					<!-- 검색어를 이용하여 글제목, 작성자, 글내용 중에 하나를 입력 받아 처리하기 위한 부분 -->
						<tr>
							<td>
								<select name="search">
									<option value="name">name</option>
									<option value="userid">userid</option>
									<option value="c_code">c_code</option>
								</select>
								<input type="text" size=20 name="key">
								<a href="#"><input type="button" value="검색" ></a>
							</td>
						</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>

<%@ include file="../footer.jsp"%>