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
			
			<form name="input" method="post" action="hospital_reservationPro">
					
					
					<input type="hidden" value="${idx }" name="idx">
					<input type="hidden" value="${year }" name="year">
					<input type="hidden" value="${month }" name="month">
					<input type="hidden" value="${day }" name="day">
					
					<c:if test="${!empty list }">
					
					<tr>
						<th>날자</th>
						<td>
							${year }년 ${month }월 ${day }일
						</td>
					</tr>
					
					<tr>
						<th>시간</th>
						<td>
						
						
						<c:forEach var="res" items="${list }">
						
						<input type="checkbox" name="reservation_time" value="${res.reservation_time }">${res.reservation_time } <br>
						
						</c:forEach>
						
						
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="tel"></td>
					</tr>	
					
					<tr>
						<th>진료희망사항</th>
						<td><textarea name="disease"></textarea></td>
					</tr>	
					

					
					<tr>
						<td colspan="2">
							<a href="javascript:send()"><input type="button" value="예약" class="btn-write"></a>
							<a href="javascript:home()">"<input type="button" value="뒤로가기" class="btn-reset"></a>
						</td>
					</tr>
					
					</c:if>
					
					<c:if test="${empty list }">
						<script>
							alert("예약될수있는 시간이 없습니다.");
							history.back();
						
						</script>
					</c:if>
				</form>
			</tbody>
		</table>
	</div>
		
</div>

<script>
	function send() {
		
	
		if(input.name.value=="") {
			alert("이름을 입력해주세요");
			input.name.focus();
			return;
		}
		if(input.tel.value=="") {
			alert("전화번호를 입력해주세요");
			input.tel.focus();
			return;
		}
		
		if(input.disease.value=="") {
			alert("질병 입력해주세요");
			input.h_tel.focus();
			return;
		}
		
	
		alert("예약합니다.");
		input.submit();
	}
	
	function home(){
		
		history.back();
	}
</script>

<%@ include file="../footer.jsp" %>















