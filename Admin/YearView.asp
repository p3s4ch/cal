<!--#include file="Admin/common/SQL_Cn.asp" -->
<!--#include file="admin/Common/GilonHiddenURLSessionNoURL.asp"-->
<!--#include file="func_MiniMonth.asp"-->
<!--#include file="Admin/common/util.asp"-->



<LINK href="mystyle18.css" rel="stylesheet" type="text/css">

<LINK href="MiniMonthStyle3.css" rel="stylesheet" type="text/css">

<%
iMonth= request("iMonth")
iYear = request("iYear")
op = request("operator")
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
<TR>
<TD><% Response.Write GetMiniMonth(1,iYear,op) %> </TD>
<TD><% Response.Write GetMiniMonth(2,iYear,op) %> </TD>
<TD><% Response.Write GetMiniMonth(3,iYear,op) %> </TD>
</TR> <TR>
<TD><% Response.Write GetMiniMonth(4,iYear,op) %> </TD>
<TD><% Response.Write GetMiniMonth(5,iYear,op) %> </TD>
<TD><% Response.Write GetMiniMonth(6,iYear,op) %> </TD>
</TR> <TR>
<TD><% Response.Write GetMiniMonth(7,iYear,op) %> </TD>
<TD><% Response.Write GetMiniMonth(8,iYear,op) %> </TD>
<TD><% Response.Write GetMiniMonth(9,iYear,op) %> </TD>
</TR> <TR>
<TD><% Response.Write GetMiniMonth(10,iYear,op) %> </TD>
<TD><% Response.Write GetMiniMonth(11,iYear,op) %> </TD>
<TD><% Response.Write GetMiniMonth(12,iYear,op) %> </TD>
</TR>
<TR>
<TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD>

<!--#include file="common/homeLink.asp" -->


</TD>
</TR>
</table>
</body>
