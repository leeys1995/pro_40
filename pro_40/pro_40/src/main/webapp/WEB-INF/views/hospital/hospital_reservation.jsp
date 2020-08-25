<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Calendar"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
%>
<head>
<link href="../css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link href="../css/common.css" rel="stylesheet">
<link href="../css/mystyle.css" rel="stylesheet">
</head>

<body>

	<div class="header">
		<header>
			<div class="topnav">
				<ul>
					<c:if test="${empty user}">
						<ul>
							<li><a href="/member/login">ログイン</a></li>
							<li><a href="/member/insert">新規取得</a></li>
							<li><a href="/">ホーム</a></li>
							
						</ul>
					</c:if>
					<c:if test="${!empty user}">
						<c:if test="${user.userid eq 'admin' }">
							<ul>
								<li><a href="/member/list?page=1">会員管理</a></li>
								<li><a href="javascript:logout()">ログアウト</a></li>
								<li><a href="/">ホーム</a></li>
							</ul>
						</c:if>
						<c:if test="${ user.userid != 'admin'}">
							<ul>
								<li><a href="/member/modify">個人情報修正</a></li>
								<li><a href="javascript:logout()">ログアウト</a></li>
								<li><a href="/">ホーム</a></li>
							</ul>
						</c:if>

					</c:if>
				</ul>
			</div>
			<div class="navigation">
				<div style="height: 100px; width: 200px;">
					<a href="hospital_view?idx=<%=idx%>"><img
						src="/resources/upload/hosp/banner/${hosp.h_banner }" alt="모집사진"></a>
				</div>
				<div class="nav">
					<nav>
						<ul class="navi">
							<li><a href="hospital_about?idx=<%=idx%>">病院紹介</a></li>
							<li><a href="hospital_guidance?idx=<%=idx%>">診療案内</a></li>
							<li><a
								href="/hospital_board/hospital_board?idx=<%=idx%>&page=1">お知らせ</a></li>
							<li><a href="hospital_reservation?idx=<%=idx%>">予約</a></li>
							<li><a href="hospital_controller?idx=${hosp.idx }">ホームページ
									<br> 管理
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</header>
	</div>
	<div class="line"></div>
	<div class="contain">
		<div class="sub-topcontent">
			<h2 class="sub-title">予約</h2>

			<%
				Calendar cal = Calendar.getInstance();

				String strYear = request.getParameter("year");

				String strMonth = request.getParameter("month");

				int year = cal.get(Calendar.YEAR);

				int month = cal.get(Calendar.MONTH);

				int date = cal.get(Calendar.DATE);

				if (strYear != null)

				{

					year = Integer.parseInt(strYear);

					month = Integer.parseInt(strMonth);

				} else {

				}

				//년도/월 셋팅

				cal.set(year, month, 1);

				int startDay = cal.getMinimum(java.util.Calendar.DATE);

				int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);

				int start = cal.get(java.util.Calendar.DAY_OF_WEEK);

				int newLine = 0;

				//오늘 날짜 저장.

				Calendar todayCal = Calendar.getInstance();

				SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");

				int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
			%>

			<html lang="ko">

<HEAD>

<TITLE>カレンダー</TITLE>

<meta http-equiv="content-type" content="text/html; charset=utf-8">





<script type="text/javaScript" language="javascript"> 

      

       </script>

<style TYPE="text/css">
body {
	scrollbar-face-color: #F6F6F6;
	scrollbar-highlight-color: #bbbbbb;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #bbbbbb;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #bbbbbb;
	margin-left: "0px";
	margin-right: "0px";
	margin-top: "0px";
	margin-bottom: "0px";
}

td {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

select {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}

A:link {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:visited {
	font-size: 9pt;
	font-family: "돋움";
	color: #000000;
	text-decoration: none;
}

A:active {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

A:hover {
	font-size: 9pt;
	font-family: "돋움";
	color: red;
	text-decoration: none;
}

.button1 {
	color: red;
	text-align: center;
	height: 30px;
}

.button2 {
	color: black;
	text-align: center;
	height: 30px;
}

.button3 {
	color: blue;
	text-align: center;
	height: 30px;
}

.div1 {
	width: 1150px;
}

.div2 {
	text-align: center;
	text-size: 40px;
}
</style>

</HEAD>

<BODY>



	<DIV id="content" style="width: 712px;">



		<table>

			<tr>

				<td align="left"><input type="button"
					onclick="javascript:location.href='<c:url value='hospital_reservation?idx=${idx }' />'"
					value="오늘" /></td>
			</tr>

		</table>

		<!--날짜 네비게이션  -->

		<table width="100%" border="0" cellspacing="1" cellpadding="1"
			id="KOO" bgcolor="#F3F9D7" style="border: 1px solid #CED99C">



			<tr>

				<td height="60">

					<div class="div1">

						<table width="100%" border="0" cellspacing="0" cellpadding="0">

							<tr>

								<td height="10"></td>

							</tr>



							<tr>

								<td align="center" width=5000" >

									<div width="5000px" class="div2">

										<%
											if (month > 0) {
										%>

										<a
											href="<c:url value='hospital_reservation' />?year=<%=year%>&amp;month=<%=month-1%>&idx=${idx}"
											target="_self"> <b>&lt;</b>
										<!-- 이전달 -->

										</a>

										<%
											} else {
										%>

										<b>&lt;</b>

										<%
											}
										%>

										&nbsp;&nbsp;

										<%=year%>年



										<%=month + 1%>月 &nbsp;&nbsp;

										<%
											if (month < 11) {
										%>

										<a
											href="<c:url value='hospital_reservation' />?year=<%=year%>&amp;month=<%=month+1%>&idx=${idx}"
											target="_self"> <!-- 다음달 -->
											<b>&gt;</b>

										</a>

										<%
											}
										%>

									</div>
								</td>

							</tr>

						</table>
				</td>

			</tr>

		</table>

		<br>

		<table border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">

			<THEAD>

				<TR bgcolor="#CECECE">

					<TD width='100px'>
						<form name="input" type="method">
							<DIV align="center">
								<input type="text" name="b1" value="日" class="button1" readonly>
							</DIV>
					</TD>

					<TD width='100px'>

						<DIV align="center">
							<input type="text" name="b1" value="月" class="button2" readonly>
						</DIV>

					</TD>

					<TD width='100px'>

						<DIV align="center">
							<input type="text" name="b1" value="火" class="button2" readonly>
						</DIV>

					</TD>

					<TD width='100px'>

						<DIV align="center">
							<input type="text" name="b1" value="水" class="button2" readonly>
						</DIV>

					</TD>

					<TD width='100px'>

						<DIV align="center">
							<input type="text" name="b1" value="木" class="button2" readonly>
						</DIV>

					</TD>

					<TD width='100px'>

						<DIV align="center">
							<input type="text" name="b1" value="金" class="button2" readonly>
						</DIV>

					</TD>

					<TD width='100px'>

						<DIV align="center">
							<input type="text" name="b1" value="土" class="button3" readonly>
						</DIV>


						</form>
					</TD>

				</TR>

			</THEAD>

			<TBODY>

				<TR>

					<%
						//처음 빈공란 표시

						for (int index = 1; index < start; index++)

						{

							out.println("<TD >&nbsp;</TD>");

							newLine++;

						}

						for (int index = 1; index <= endDay; index++)

						{

							String color = "";

							if (newLine == 0) {
								color = "RED";

							} else if (newLine == 6) {
								color = "#529dbc";

							} else {
								color = "BLACK";
							}
							;

							String sUseDate = Integer.toString(year);

							sUseDate += Integer.toString(month + 1).length() == 1 ? "0" + Integer.toString(month + 1)
									: Integer.toString(month + 1);

							sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index)
									: Integer.toString(index);

							int iUseDate = Integer.parseInt(sUseDate);

							String backColor = "#EFEFEF";

							if (iUseDate == intToday) {

								backColor = "#c9c9c9";

							}

							out.println("<TD valign='top' align='left' height='92px' bgcolor='" + backColor + "' nowrap>");
					%>

					<a
						href="hospital_reservationPro?year=<%=year%>&month=<%=month+1%>&idx=${idx}&index=<%=index%>">
						<font color='<%=color%>'> <%=index%>



					</font>



					</a>


					<%
						out.println("<BR>");

							out.println("<BR>");

							//기능 제거 

							out.println("</TD>");

							newLine++;

							if (newLine == 7)

							{

								out.println("</TR>");

								if (index <= endDay)

								{

									out.println("<TR>");

								}

								newLine = 0;

							}

						}

						//마지막 공란 LOOP

						while (newLine > 0 && newLine < 7)

						{

							out.println("<TD>&nbsp;</TD>");

							newLine++;

						}
					%>

				</TR>



			</TBODY>

		</TABLE>

	</DIV>
		</div>
</body>

<footer class="footer">
	<div class="container clearfix">
		<address class="address">
			<p class="title">病院</p>
			<p>住所 : ${hosp.h_addr1 } ${hosp.h_addr2 }/お客様案内センター :
				${hosp.h_tel } 事業者番号: ${hosp.h_code }</p>
			<br>
		</address>
		<p class="copyright">Copyright &copy ${hosp.h_name }. All rights
			reserved.</p>
	</div>
</footer>












