
<!--#include file="func_MiniMonth.asp"-->
<!--#include file="util.asp"-->
calMonth
<br>

<a href="javascript:;" onclick="opener.document.getElementById('<%=asofdate%>').value='22/3/2010'; window.close();" title="24 nov 2010" >22</a>




<%
Response.Write GetMiniMonth (3,2010,tom)
%>