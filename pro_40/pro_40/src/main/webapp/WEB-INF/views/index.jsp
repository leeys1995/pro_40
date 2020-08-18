<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="header.jsp" %>
	
	<div class="slider">
	    <div><img src="/images/a1.jpg" alt="" title="배움의 즐거움이 있는곳"></div>
	    <div><img src="/images/a2.jpg" alt="" title="나에게 주는 만큼"></div>
	    <div><img src="/images/a3.jpg" alt="" title="나에게도 많은 축복이 있습니다"></div>
  	</div>

	<div class="bbs_wrap">
		<div class="bbs_left">
			<h2 class="title">공지시항</h2>
			<ul>
			
			<c:if test="${!empty list }">
			  <c:forEach var="list" items="${list }" begin="0" end="4">
				<li><a href=/notice/noticeHits?idx=${list.idx }">${list.subject }</a></li>
			
			</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<li>공지사항이 없습니다.</li>
			</c:if>
				
			</ul>	
			<a href="/notice/notice?page=1"><span class="fa fa-plus plus"></span></a>
			
			
		</div>		
		<div class="bbs_center">
			<h2 class="title">병원</h2>
			<ul>
			
			<c:if test="${!empty list1}">
			 <c:forEach var="list1" items="${list1 }" begin="0" end="4">
				<li><a href="/hospital/hospHits?idx=${list1.idx }">${list1.h_name }</a></li>
			</c:forEach>
			</c:if>
				<c:if test="${empty list1 }">
				<li>등록된 병원이 없습니다.</li>
			</c:if>
			
			</ul>
			<a href="/hospital/hospital?page=1"><span class="fa fa-plus plus"></span></a>
		</div>		
		
		<div class="bbs_right">
			<h2 class="title">기업</h2>
			<ul>
			 <c:if test="${!empty list2 }">
			 <c:forEach var="list2" items="${list2 }" begin="0" end="4">
				<li><a href="/corparation/corpHits?idx=${list2.idx }">${list2.c_name }</a></li>			
			</c:forEach>
			</c:if>	
			<c:if test="${empty list2 }">
				<li>등록된 기업이 없습니다.</li>
			</c:if>
			
			
			</ul>
			<a href="/corparation/corparation?page=1"><span class="fa fa-plus plus"></span></a>
		</div>		
		
	</div>
	
<%@ include file="footer.jsp" %>







