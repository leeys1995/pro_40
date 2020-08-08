<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar"%>

<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet">
<header>
	<div class="topnav">
		<ul>
			<li><a href="login.do">로그인</a></li>
			<li><a href="member.do">회원가입</a></li>
			<li><a href="javascript:void(0)" class="sitemap">사이트맵</a></li>
		</ul>
	</div>
	<div class="navigation">
		<h1 class="logo">
			<a href="../hospital/hospital_view?idx=${idx2 }"><img height="100px"
				src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
		</h1>
		<div class="nav">
			<nav>
				<ul class="navi">
					<li><a href="about.do">병원소개</a></li>
					<li><a href="about.do">진료안내</a></li>
					<li><a href="hospital_board?idx=${idx2 }&page=1">공지</a></li>
					<li><a href="/corparation/corparation">예약</a></li>


				</ul>
			</nav>
		</div>
	</div>
</header>

<br>
<br>

<% 

	Date nowTime =new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
	Calendar calendar = Calendar.getInstance();
%>
 <%
 
	String now = sf.format(nowTime);

     Calendar cal = Calendar.getInstance();
     int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("y"));
     int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH) : (Integer.parseInt(request.getParameter("m")) - 1);

    // 시작요일 확인
    // - Calendar MONTH는 0-11까지임
    cal.set(year, month, 1);
     int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);

    // 다음/이전월 계산
    // - MONTH 계산시 표기월로 계산하기 때문에 +1을 한 상태에서 계산함
    int prevYear = year;
     int prevMonth = (month + 1) - 1;
     int nextYear = year;
     int nextMonth = (month  + 1) + 1;

    // 1월인 경우 이전년 12월로 지정
    if (prevMonth < 1) {
         prevYear--;
         prevMonth = 12;
     }

    // 12월인 경우 다음년 1월로 지정
    if (nextMonth > 12) {
         nextYear++;
         nextMonth = 1;
     }
 %>
 
 <style>
 	.div1{margin:0 auto; width:700px;}
 	table .cal1{text-align:center; font-size:30px;}
 </style>
 <div class="div1">
 <br>
 
 <h1>달력</h1>
 <table border="0" cellpadding="0" cellspacing="0">
 <tr>
     <td class="cal1"> <%=year%>년 <%=month+1%>월</td>
 </tr>
 <tr>
     <td>

        <table border="1" width="500px" height="500px">
         <tr>
             <td>일</td>
             <td>월</td>
             <td>화</td>
             <td>수</td>
             <td>목</td>
             <td>금</td>
             <td>토</td>
         </tr>
         <tr>
 <%
     // 시작요일까지 이동
    for (int i=1; i<bgnWeek; i++) out.println("<td>&nbsp;</td>");

    // 첫날~마지막날까지 처리
    // - 날짜를 하루씩 이동하여 월이 바뀔때까지 그린다
    while (cal.get(Calendar.MONTH) == month) {
         out.println("<td>" + cal.get(Calendar.DATE) + "</td>");

        // 토요일인 경우 다음줄로 생성
        if (cal.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) out.println("</tr><tr>");

        // 날짜 증가시키지
        cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), cal.get(Calendar.DATE)+1);
     }

    // 끝날부터 토요일까지 빈칸으로 처리
    for (int i=cal.get(Calendar.DAY_OF_WEEK); i<=7; i++) out.println("<td>&nbsp;</td>");
 %>
         </tr>
         </table>

    </td>
 </tr>
 </table>
 <br>
 <br>
 <% 
   int iDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK); //요일을 구한다

   String strDayOfWeek = "";
   switch(iDayOfWeek){
      case 1: 
         strDayOfWeek = "일요일";
         break;
      case 2: 
         strDayOfWeek = "월요일";
         break;
      case 3: 
         strDayOfWeek = "화요일";
         break;
      case 4: 
         strDayOfWeek = "수요일";
         break;
      case 5: 
         strDayOfWeek = "목요일";
         break;
      case 6: 
         strDayOfWeek = "금요일";
         break;
      case 7: 
         strDayOfWeek = "토요일";
         break;

      }

%>
<h3>오늘은<%=now %> <%=strDayOfWeek %>입니다.</h3>

<br>
</div>
<div class="div1"></div>
<br>
<br>
<br>

<div class="footer">
	<footer>
		<p>&copy; JANGSU. All &nbsp;&nbsp;&nbsp;Rights Reserved.</p>
	</footer>
	<!-- &copy; &nbsp; &gt; > &lt;< -->
</div>


