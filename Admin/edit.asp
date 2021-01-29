<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<html>
<head>
<title>Ocean12 ASP Calendar Manager</title>

<script language="javascript">

function open_Event_Name() {
  popupWin = window.open('help.asp?ID=Event_Name', 'remote', 'width=300,height=200')
}
function open_Event_Date() {
  popupWin = window.open('help.asp?ID=Event_Date', 'remote', 'width=300,height=200')
}
function open_Event_Time() {
  popupWin = window.open('help.asp?ID=Event_Time', 'remote', 'width=300,height=200')
}
function open_Event_Category() {
  popupWin = window.open('help.asp?ID=Event_Category', 'remote', 'width=300,height=200')
}
function open_Event_Location() {
  popupWin = window.open('help.asp?ID=Event_Location', 'remote', 'width=300,height=200')
}
function open_Event_Description() {
  popupWin = window.open('help.asp?ID=Event_Description', 'remote', 'width=300,height=200')
}

function VerifyData() {
	if (document.frmUser.Event_Name.value == "") {
		alert("You must enter an Event Name.");
		return false;
	} else if (document.frmUser.Category.value == "") {
		alert("You must select a category.");
		return false;
	} else if ((document.frmUser.Date_Month.value == "Blank") ||
				(document.frmUser.Date_Day.value == "Blank") ||
				(document.frmUser.Date_Year.value == "Blank") ||
				(document.frmUser.Date_Hour.value == "Blank") ||
				(document.frmUser.Date_Minute.value == "Blank") ||
				(document.frmUser.Date_AMPM.value == "Blank")) {
		alert("You must complete the Date and Time fields.");
		return false;
	} else
		return true;
}
</script>

<!--#include file="style.asp"-->

</head>
<body bgcolor="#F0F0F0" vlink="#48576C" link="#48576C" alink="#000000">
<table border="0" cellpadding="0" cellspacing="0" width="650" align="center">
<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
<td colspan="3" bgcolor="#52637B" height="35" width="648"><font face="Verdana" size="5" color="#FFCC00"><b>&nbsp;Ocean<i>12</i> ASP Calendar Manager</b></font></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
<td bgcolor="#8199DA" valign="top" width="130">

<table border="0" cellpadding="0" cellspacing="0" width="130">
<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="main.asp"><font face="Verdana" size="1"><b>&nbsp;Home</b></font></a></td>
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
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
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
<td bgcolor="#B0C4DE" width="130" height="15"><a href="http://scripts.ocean12tech.com/asp/calendar/support/"><font face="Verdana" size="1"><b>&nbsp;Support</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="http://scripts.ocean12tech.com/asp/calendar/docs/"><font face="Verdana" size="1"><b>&nbsp;Documentation</b></font></a></td>
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
<td bgcolor="#B0C4DE" height="15" width="100%"><font face="Verdana" size="1" color="#000000"><b>&nbsp;Edit Event</b></font></td>
</tr>
<tr>
<td bgcolor="#000000" height="1" width="100%"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>

<table border="0" cellpadding="2" cellspacing="0" width="517">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<%
dim RSFORM
Set RSFORM = Server.CreateObject("ADODB.Recordset")
RSFORM.Open "Events", Conn, 2, 2

RSFORM.Find "ID='" & request("ID") & "'"
%>

<form action="edit2.asp" name="frmUser" Method="Post" onSubmit="return VerifyData()">
<input type="hidden" name="ID" value="<%=request("ID")%>">
<input type="hidden" name="orderby" value="<%=request("orderby")%>">
<input type="hidden" name="page" value="<%=request("page")%>">
<input type="hidden" name="SearchFor" value="<%=request("SearchFor")%>">
<input type="hidden" name="SearchWhere" value="<%=request("SearchWhere")%>">
<table border="0" cellpadding="3" cellspacing="0" align="center">
<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Name</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Event_Name();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Event_Name" value="<%=RSFORM("Event_Name")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Date</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Event_Date();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><select name="Date_Month" class="inputbox">
<option value="Month" SELECTED>Month</option>
<% 
monthCounter = 1
monthSelected = CInt(Month(RSFORM("Date")))

Do WHILE monthCounter <= 12
If (monthSelected <> monthCounter) Then %>
<option value="<%=monthCounter%>"><%=MonthName(monthCounter)%></option>
<% Else %>
<option value="<%=monthCounter%>" SELECTED><%=MonthName(monthCounter)%></option>
<% End If
monthCounter = monthCounter + 1
Loop
%>
</select>

<select name="Date_Day" class="inputbox">
<option value="Day" SELECTED>Day</option>
<% 
dayCounter = 1
daySelected = CInt(Day(RSFORM("Date")))

Do WHILE dayCounter <= 31
If (daySelected <> dayCounter) Then %>
<option value="<%=dayCounter%>"><%=dayCounter%></option>
<% Else %>
<option value="<%=dayCounter%>" SELECTED><%=dayCounter%></option>
<% End If
dayCounter = dayCounter + 1
Loop
%>
</select>

<select name="Date_Year" class="inputbox">
<option value="Year" SELECTED>Year</option>
<% 
yearCounter = Year(Now)
yearSelected = CInt(Year(RSFORM("Date")))

Do WHILE yearCounter <= Year(Now) + 10
If (yearSelected <> yearCounter) Then %>
<option value="<%=yearCounter%>"><%=yearCounter%></option>
<% Else %>
<option value="<%=yearCounter%>" SELECTED><%=yearCounter%></option>
<% End If
yearCounter = yearCounter + 1
Loop
%>
</select></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Time</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Event_Time();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><select name="Time_Hour" class="inputbox">
<option value="Hour" SELECTED>Hour</option>
<% 
hourCounter = 1
hourSelected = CInt(Hour(RSFORM("Date")))

If hourSelected >=12 Then
	hourSelected = hourSelected - 12
End If

Do WHILE hourCounter <= 12
If (hourSelected <> hourCounter) Then %>
<option value="<%=hourCounter%>"><%=hourCounter%></option>
<% Else %>
<option value="<%=hourCounter%>" SELECTED><%=hourCounter%></option>
<% End If
hourCounter = hourCounter + 1
Loop
%>
</select>

<select name="Time_Minute" class="inputbox">
<option value="Minute" SELECTED>Minute</option>
<% 
minuteCounter = 0
minuteSelected = CInt(Minute(RSFORM("Date")))

Do WHILE minuteCounter <= 55
If (minuteSelected <> minuteCounter) Then %>
<option value="<%=minuteCounter%>"><%If (minuteCounter < 10) Then%>0<%End If%><%=minuteCounter%></option>
<% Else %>
<option value="<%=minuteCounter%>" SELECTED><%If (minuteCounter < 10) Then%>0<%End If%><%=minuteCounter%></option>
<% End If
minuteCounter = minuteCounter + 5
Loop
%>
</select>

<select name="Time_AMPM" class="inputbox">
<option value="AMPM" SELECTED>AM/PM</option>
<%
AMPMSelected = CInt(Hour(RSFORM("Date")))
%>
<option value="AM" <%If (AMPMSelected <= 11) Then%>SELECTED<%End If%>>AM</option>
<option value="PM" <%If (AMPMSelected >= 12) Then%>SELECTED<%End If%>>PM</option>
</select></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Category</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Event_Category();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><select name="Category" class="inputBox">
<option value="" SELECTED></option>

<%
Set RSCATEGORY = Server.CreateObject("ADODB.Recordset")
RSCATEGORY.Open "Categories", Conn, 2, 2

Do While Not RSCATEGORY.eof

If (RSCATEGORY("Category") <> RSFORM("Category")) Then %>
<option value="<%=RSCATEGORY("Category")%>"><%=RSCATEGORY("Category")%></option>
<% Else %>
<option value="<%=RSCATEGORY("Category")%>" SELECTED><%=RSCATEGORY("Category")%></option>
<% End If

RSCATEGORY.movenext
Loop
RSCATEGORY.close
set RSCATEGORY = nothing
%>
</select></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Location</b><br><font color="#000000">(optional)</font></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Event_Location();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Location" value="<%=RSFORM("Location")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Description</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Event_Description();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><textarea name="Description" class="inputbox" cols="45" rows="5"><%=RSFORM("Description")%></textarea>
</td>
</tr>

<tr>
<td align="right" valign="bottom"><input type="reset" name="Reset" value="Reset" class="inputSubmit"></td>
<td>&nbsp;</td>
<td valign="bottom"><input type="submit" name="Submit" value="Update Event" class="inputSubmit">
</td>
</tr>
</table>
</form>

<%
RSFORM.close
set RSFORM = nothing
%>

</font></td>
</tr>
</table></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!-- Begin Ocean12 Technologies Copyright Notice -->
<!-- THIS CODE MUST NOT BE CHANGED -->
<tr>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
<td colspan="3" align="center" bgcolor="#B0C4DE" height="30"><font face="Verdana" size="1">Maintained with the <a href="http://scripts.ocean12tech.com">Ocean<i>12</i> ASP Calendar Manager</a> v1.01<br>&copy;2002 <a href="http://scripts.ocean12tech.com">Ocean<i>12</i> Technologies</a>, all rights reserved.</font></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
<!-- End Ocean12 Technologies Copyright Notice -->

<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>


</body>
</html>
<!--#include file="dsn2.asp"-->