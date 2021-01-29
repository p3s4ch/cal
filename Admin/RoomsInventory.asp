<!--#include file="common/SQL_Cn.asp" -->
<!--#include file="Common/GilonHiddenURLSessionNoURL.asp"-->
<!--#include file="func_MiniMonthInventory.asp"-->

<!--#include file="common/util.asp"-->

<LINK href="styles/mystyle19.css" rel="stylesheet" type="text/css">
<LINK href="styles/MiniMonthStyle4ignore.css" rel="stylesheet" type="text/css">
<style>
table {
    width:100%;
}
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 3px;
    text-align: left;
}
table.names TR:nth-child(even) {
    background-color: #f1f1c1;
}
table.names TR:nth-child(odd) {
   background-color:#ffffff;
}
table.names TH	{
    background-color: #c1c1c1;
}
</style>

<%
iMnth= request("iMnth")
iYear = request("iYear")
op = request("operator")
roomType = request("roomType")

if iMnth = "" then iMnth =6 End If
if iYear = "" then iYear =2013 End If

NextMonth = iMnth + 1
NextYear =  iYear
prevMonth = iMnth - 1
prevYear  = iYear

if NextMonth > 12 then
   NextMonth = 1
   NextYear  = NextYear + 1
End If

if prevMonth < 1 then
   prevMonth = 12
   prevYear  = prevYear - 1
End If

myTitle = MonthName(iMnth) & " " & iYear

%>

<h1>      Pickle's Room Inventory:   <%= myTitle %>     </h1>

<body>
<font size=4 color = black><%=op%> </font>

<P align=centre>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;


<a href=?uid=<%=uid%>&iYear=<%=prevYear%>&iMnth=<%=prevMonth%>&operator=<%=prevMonth%> > <font > Previous </font></a>
<font color=black > &nbsp;&nbsp; <%=iYear%> &nbsp;&nbsp;</font>
<a href=?uid=<%=uid%>&iYear=<%=nextYear%>&iMnth=<%=nextMonth%>&operator=<%=op%> >  <font > Next     </font> </a>
</P>


<table width=70% >
<TR>
<TD>  <% Response.Write GetMiniMonthInventory(iMnth,iYear, "Bed_in_Dorm") %> </TD>
</TR>
<TR>
<TD>   &nbsp; <br> </TD>
</TR>
<TR>
<TD>  <% Response.Write GetMiniMonthInventory(iMnth,iYear, "Single") %> </TD>
</TR>
<TR>
<TD>   &nbsp; <br> </TD>
</TR>
<TR>
<TD>  <% Response.Write GetMiniMonthInventory(iMnth,iYear, "Double_Tiny") %> </TD>
</TR>
<TR>
<TD>   &nbsp; <br> </TD>
</TR>
<TR>
<TD>  <% Response.Write GetMiniMonthInventory(iMnth,iYear, "Double") %> </TD>
</TR>
<TR>
<TD>   &nbsp; <br> </TD>
</TR>
<TR>
<TD>  <% Response.Write GetMiniMonthInventory(iMnth,iYear, "Twin") %> </TD>
</TR>
<TR>
<TD>   &nbsp; <br> </TD>
</TR>
<TR>
<TD>  <% Response.Write GetMiniMonthInventory(iMnth,iYear, "En-Suite_Tiny") %> </TD>
</TR>
<TR>
<TD>   &nbsp; <br><br><br> </TD>
</TR>
<TR>
<TD>  <% Response.Write GetMiniMonthInventory(iMnth,iYear, "En-suite") %> </TD>
</TR>
<TR>
<TD>   &nbsp; <br><br><br> </TD>
</TR>
<TR>
<TD>   &nbsp; <br><br><br> </TD>
</TR>
<TR>
<TD>  <% Response.Write GetMiniMonthInventory(iMnth,iYear, "TEST_ROOM") %> </TD>
</TR>

<TR>
<TD><A href="main.asp?uid=<%=uid%>"> Admin</a></TD>
</TR>


</table>
</body>
