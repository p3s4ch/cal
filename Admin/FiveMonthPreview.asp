<table border=1  align=center cellpadding=1 bordercolor=black height=10% width=90% ID="Table1" rules=cols>
<TR >
<TD width="20%"> <font size=6 color = black> <%=operator %> </font></TD>
<TD width="5%"> &nbsp; </TD>

<% 
  'iYear may be changed in calls
  iYearTmp = iYear
  iMonthTmp= iMonth
%>
<TD width="15%"><% Response.Write GetMiniMonth(iMonthTmp - 2, iYearTmp,operator) %></TD>
<TD width="15%"><% Response.Write GetMiniMonth(iMonthTmp - 1, iYearTmp,operator) %></TD>
<TD width="15%"><% Response.Write GetMiniMonth(iMonthTmp   ,  iYearTmp,operator) %></TD>
<TD width="15%"><% Response.Write GetMiniMonth(iMonthTmp + 1, iYearTmp,operator) %></TD>
<TD width="15%"><% Response.Write GetMiniMonth(iMonthTmp + 2, iYearTmp,operator) %> </TD>
</tr>
</table>
<% 
  iYear = iYearTmp
  iMonth = iMonthTmp
%>

