<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<%
dim RSCOUNT
set RSCOUNT = server.createobject("adodb.recordset")
SQLCOUNT = "SELECT ID FROM Events"
RSCOUNT.Open SQLCOUNT, Conn, 1, 3
dim totalCount
totalCount = RSCOUNT.recordcount
RSCOUNT.close
SQLCOUNT = "SELECT ID FROM Categories"
RSCOUNT.Open SQLCOUNT, Conn, 1, 3
dim totalCategoryCount
totalCategoryCount = RSCOUNT.recordcount
RSCOUNT.close
set RSCOUNT = nothing
%>
<html>
<head>
<title>Ocean12 ASP Calendar Manager</title>

<!--#include file="style.asp"-->

</head>
<body bgcolor="#F0F0F0" vlink="#48576C" link="#48576C" alink="#000000">
<table border="0" cellpadding="0" cellspacing="0" width="650" align="center">
<tr>
<td height="1" colspan="5" bgcolor="#000000">here is image clear <img src="../im/clear.gif" height="1" width="1"></td>
</tr>






<tr>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
<td bgcolor="#8199DA" valign="top" width="130">

<table border="0" cellpadding="0" cellspacing="0" width="130">

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
<a href="../MonthView.asp"><font face="Verdana" size="1"><b>&nbsp;Calendar</b></font></a></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
<a href="../YearView.asp"><font face="Verdana" size="1"><b>&nbsp;Year View</b></font></a></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
<a href="../MonthView.asp"><font face="Verdana" size="1"><b>&nbsp;Month View</b></font></a></td>
</tr>


<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
<a href="../WeekView.asp"><font face="Verdana" size="1"><b>&nbsp;Week View</b></font></a></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
<a href="../DayView.asp"><font face="Verdana" size="1"><b>&nbsp;Day View</b></font></a></td>
</tr>




<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td height="5"><img src="../im/clear.gif" height="5" width="1"></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="add.asp"><font face="Verdana" size="1"><b>&nbsp;Add Event</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="view.asp"><font face="Verdana" size="1"><b>&nbsp;View/Edit Events</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="categories_add.asp"><font face="Verdana" size="1"><b>&nbsp;Add&nbsp;Category</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="categories.asp"><font face="Verdana" size="1"><b>&nbsp;View&nbsp;Categories</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="wrench1.jpg" height="1" width="1"></td>
</tr>

<tr>
<td height="5"><img src="../im/clear.gif" height="5" width="1"></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../clear.gif" height="1" width="1"></td>
</tr>


<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="Customers_add.asp"><font face="Verdana" size="1"><b>&nbsp;Add&nbsp;Customer</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="Customers.asp"><font face="Verdana" size="1"><b>&nbsp;View&nbsp;Customers</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="wrench1.jpg" height="1" width="1"></td>
</tr>

<tr>
<td height="5"><img src="../im/clear.gif" height="5" width="1"></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../clear.gif" height="1" width="1"></td>
</tr>


<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="settings.asp"><font face="Verdana" size="1"><b>&nbsp;Settings</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>



<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td height="5"><img src="../im/clear.gif" height="5" width="1"></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE"  width="130" height="15"><a href="logout.asp"><font face="Verdana" size="1"><b>&nbsp;Log&nbsp;Out</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>

</td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
<td bgcolor="#FFFFFF" width="517" valign="top" height="200">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td bgcolor="#B0C4DE" height="15" width="100%"><font face="Verdana" size="1" color="#000000"><b>&nbsp;Control Panel</b></font></td>
</tr>
<tr>
<td bgcolor="#000000" height="1" width="100%"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>

<table border="0" cellpadding="2" cellspacing="0" width="517">
<tr>
<td width="100%"><font face="Verdana" size="1">

Total Events: <b><%=totalCount%></b><br>
Total Categories: <b><%=totalCategoryCount%></b>

</font></td>
</tr>
</table></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>


<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>


</body>
</html>
<!--#include file="dsn2.asp"-->