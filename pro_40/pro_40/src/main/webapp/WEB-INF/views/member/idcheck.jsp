<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<HTML>
<HEAD>
<TITLE>IDチェック</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<STYLE TYPE="text/css">
<!--
body { font-family: 돋움, Verdana; font-size: 9pt}
td   { font-family: 돋움, Verdana; font-size: 9pt; text-decoration: none; color: #000000} 
--->
</STYLE>



</HEAD>
<BODY bgcolor="#FFFFFF">
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="/images/u_b02.gif"></td>
    <td align=center><FONT COLOR="#FFFFFF"><b>아이디 중복 체크</FONT></td>
    <td align=right><img src="/images/u_b03.gif"></td>
  </tr>
</table>
<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
<TR BGCOLOR=#948DCF>
  <TD>
    <TABLE CELLPADDING=4 CELLSPACING=1 BORDER=0 WIDTH=330>
  	  <TR BGCOLOR="#FFFFFF">
        <TD ALIGN="center">
        
        <form name="input" method="post" action="idcheck">

 	<c:if test="${row==0 }">
        	<FONT FACE="굴림"><B>IDをご入力ください。</B></FONT><br>
          <br> <INPUT NAME=userid type=text size=16 maxlength=16><br>
      	  <br><input type=image src="/images/u_bt08.gif" border=0 vspace=0 onclick="javascript:chk()">    	       
 	</c:if>      	
 	
	<c:if test="${row!=0 }">
		<c:if test="${empty vo1 }">
          <br><FONT FACE="굴림">${userid }<B>使用できます。</B></FONT><br>
         <BR><FONT COLOR="#483cae"><b>${userid }</b></FONT>はまだ使用できないIDです。<br>
         <BR><FONT COLOR="#483cae"><b>${userid }</b></FONT>に登録してもよろしいです。<br>
 		 <INPUT NAME=userid1 type="hidden" size=16 maxlength=16 value="${userid }">
   		 <input type=image src="/images/u_bt13.gif" border=0 vspace=5 onclick="javascript:cl()">	

  		 </c:if>      
 		<c:if test="${!empty vo1 }">        
         <br><font face="굴림"><b>申し訳ございません。</b></font><br>
    	<BR><FONT COLOR="#483cae"><b>${vo1.getUserid()}</b></FONT>はもう使用中のIDです。<br>
    	<br>ほかのIDを書いてください。<br>
    	<br> <INPUT NAME=userid type=text size=16 maxlength=16>
      	  <br><input type=image src="/images/u_bt08.gif" border=0 vspace=0>
		</c:if>
	</c:if>     	
    	 </form>


        </TD>
      </TR>
    </TABLE>
 </TD>
</TR>
</TABLE>

<TABLE CELLPADDING=0 CELLSPACING=0 BORDER=0 WIDTH=330>
  <TR BGCOLOR=#7AAAD5>
    <td align=left><img src="/images/u_b04.gif"></td>
    <td align=right><img src="/images/u_b05.gif"></td>
  </tr>
</table>
</BODY>
</HTML>
<script>	
function cl() 
{
	window.opener.document.my.userid.value = document.input.userid1.value;
	self.close();
}
function chk()
{
	if(input.userid.value=="")
	{
		alert("IDをご入力ください。");
		input.userid.focus();
		return;
	}
	input.submit();
}

function send()
{
input.submit();
}

</script>
