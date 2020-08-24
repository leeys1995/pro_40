<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="header.jsp" %>
	
	<div class="slider">
	   <div><img src="/images/5.JPG" alt="" title="JSL 인재개발원"></div>
	    <div><img src="/images/6.JPG" alt="" title="하이브리드 소프트웨어"></div>
	    <div><img src="/images/1.JPG" alt="" title="전문과 가정 40기"></div>
	    <div><img src="/images/2.JPG" alt="" title="조별 프로젝트"></div>
	    <div><img src="/images/3.JPG" alt="" title="조원"></div>
	    <div><img src="/images/4.JPG" alt="" title="최석호 이영석 염철준"></div>
  	</div>

	<div class="bbs_wrap">
		<div class="bbs_left" style="height:300px;">
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
		<div class="bbs_center" style="height:300px;">
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
		
		<div class="bbs_right" style="height:300px;">
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







