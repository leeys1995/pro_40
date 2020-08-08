<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../header.jsp"%>

<div class="contain">
	<div class="sub-topcontent">
		<h2 class="sub-title">장수하늘소 질문답변</h2>
		<div class="sub-search">
			<form name="my" method="post" action="qasearch.do" onsubmit="return check()">
				<select name="sel" class="sel">
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="cont" class="text">
				<input type="submit" value="검색" class="btn">
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
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>답변상태</th>
					<th>날자</th>
					<th>조회수</th>
				</tr>
				<tr>
					<td>10</td>
					<td class="tleft"><a href="qaview.do">JVM이란 무엇인가요?</a></td>
					<td>이순신</td>
					<td><span  class="red">답변대기</td>
					<td>2019-06-13</td>
					<td>18</td>
				</tr>
				<tr>
					<td>9</td>
					<td class="tleft">서블릿이란 무엇인가요?</td>
					<td>서블릿</td>
					<td><span  class="gray">답변완료</span></td>
					<td>2019-06-13</td>
					<td>250</td>
				</tr>
				<tr>
					<td>8</td>
					<td class="tleft">JVM이란 무엇인가요?</td>
					<td>이순신</td>
					<td><span  class="red">답변대기</td>
					<td>2019-06-13</td>
					<td>18</td>
				</tr>
				<tr>
					<td>7</td>
					<td class="tleft">서블릿이란 무엇인가요?</td>
					<td>서블릿</td>
					<td><span  class="gray">답변완료</span></td>
					<td>2019-06-13</td>
					<td>250</td>
				</tr>
				<tr>
					<td>6</td>
					<td class="tleft">JVM이란 무엇인가요?</td>
					<td>이순신</td>
					<td><span  class="red">답변대기</td>
					<td>2019-06-13</td>
					<td>18</td>
				</tr>
				<tr>
					<td>5</td>
					<td class="tleft">서블릿이란 무엇인가요?</td>
					<td>서블릿</td>
					<td><span  class="gray">답변완료</span></td>
					<td>2019-06-13</td>
					<td>250</td>
				</tr>
				<tr>
					<td>4</td>
					<td class="tleft">JVM이란 무엇인가요?</td>
					<td>이순신</td>
					<td><span  class="red">답변대기</td>
					<td>2019-06-13</td>
					<td>18</td>
				</tr>
				<tr>
					<td>3</td>
					<td class="tleft">서블릿이란 무엇인가요?</td>
					<td>서블릿</td>
					<td><span  class="gray">답변완료</span></td>
					<td>2019-06-13</td>
					<td>250</td>
				</tr>
				<tr>
					<td>2</td>
					<td class="tleft">JVM이란 무엇인가요?</td>
					<td>이순신</td>
					<td><span  class="red">답변대기</td>
					<td>2019-06-13</td>
					<td>18</td>
				</tr>
				<tr>
					<td>1</td>
					<td class="tleft">서블릿이란 무엇인가요?</td>
					<td>서블릿</td>
					<td><span  class="gray">답변완료</span></td>
					<td>2019-06-13</td>
					<td>250</td>
				</tr>
			</tbody>
		</table>
	</div>
		
		
		<div class="paging">
			<ul>
				<li><a href="#">이전</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">다음</a></li>
			</ul>
			<a href="qawrite.do" class="btn-write">글쓰기</a>
		</div>

</div>

<script>
	function check() {
		if(my.cont.value=="") {
			alert("검색단어입력하세요");
			my.cont.focus;
			return false;
		}
		return true;
	}
</script>

<%@ include file="../footer.jsp"%>















