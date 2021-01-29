<!--#include file="common/SQL_Cn.asp" -->
<!--#include file="Common/GilonHiddenURLSessionNoURL.asp"-->
<!--#include file="func_MiniMonthInventory.asp"-->

<!--#include file="common/util.asp"-->



<LINK href="styles/mystyle19.css" rel="stylesheet" type="text/css">

<LINK href="styles/MiniMonthStyle4ignore.css" rel="stylesheet" type="text/css">

<%
iMonth= request("iMonth")
iYear = request("iYear")
op = request("operator")
roomType = request("roomType")

op1 = "Rooms.101"
op2= "Rooms.102"


Response.Write "<br>iMonth=" & iMonth
Response.Write "<br>iYear=" & iYear
Response.Write "<br>roomType=" & roomType
%>

<body>

<font size=4 color = black><%=op%> </font>
<br>
<br>

<P align=centre>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;


<a href=YearView.asp?uid=<%=uid%>&iYear=<%=iYear -1%>&operator=<%=op%> > <font > Previous </font></a>
<font color=black > &nbsp;&nbsp; <%=iYear%> &nbsp;&nbsp;</font>
<a href=YearView.asp?uid=<%=uid%>&iYear=<%=iYear +1%>&operator=<%=op%> >  <font > Next     </font> </a>
</P>


<table width=70% >
<%
   iMnth =8
   op="Bed In Dorm"
%>
<TR>
<TD><%=op%>  <% Response.Write GetMiniMonthInventory(iMnth,iYear, op) %> </TD>
</TR>




<TR>
<TD><A href="main.asp?uid=<%=uid%>"> Admin</a></TD>
</TR>


</table>
</body>
