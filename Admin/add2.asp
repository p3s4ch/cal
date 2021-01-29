<!--#include file="..\..\include\SQL_Cn.asp"-->
<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<%
StartDate =request("StartDate")
EndDate   =request("EndDate")
SiteID=request("SiteID")
Address=request("Address")
PostCode=request("PostCode")
Surname=request("Surname")
Response.Write ("SiteID = "& SiteID)
Response.Write ("Address = "& Address)
Response.Write ("PostCode = "& PostCode)
Response.Write ("Surname = "& Surname)

'if IsDate(StartDate) then
'Response.Write ("is date = "&StartDate)
'end if
'Response.End
'If IsDate(request("Date_Month1") + "/" + request("Date_Day1") + "/" + request("Date_Year1")) Then

Set RSEVENTS = Server.CreateObject("ADODB.Recordset")
RSEVENTS.Open "cEvents", SQLCn, 2, 2
RSEVENTS.addnew
RSEVENTS("Title") = request("Title")
RSEVENTS("Details") = request("Details")
RSEVENTS("Category") = request("Category")
RSEVENTS("CatA") = request("Category")
RSEVENTS("CatB") = request("Category")
RSEVENTS("SiteID") = request("SiteID")
RSEVENTS("Assigned") = request("Assigned")
StartTime = StartDate + request("StartTime")
RSEVENTS("StartTime") = StartTime
EndTime = request("EndDate") + request("EndTime")
'Response.Write "eventDate2 ="&eventDate2
'Response.End
RSEVENTS("EndTime") = EndTime

'If (request("Location") = "") Then
	'RSEVENTS("Location") = Null
'Else
	'RSEVENTS("Location") = request("Location")
'End If

RSEVENTS.update

'RSEVENTS.close
set RSEVENTS = nothing

'End If
%>
<html>
<head>
<title>Micro Calendar</title>

<!--#include file="style.asp"-->

<script language="javascript">

function open_Settings_List_Name() {
  popupWin = window.open('help.asp?ID=Settings_List_Name', 'remote', 'width=300,height=200')
}
function open_Settings_Admin_ID() {
  popupWin = window.open('help.asp?ID=Settings_Admin_ID', 'remote', 'width=300,height=200')
}
function open_Settings_Admin_Email() {
  popupWin = window.open('help.asp?ID=Settings_Admin_Email', 'remote', 'width=300,height=200')
}
function open_Settings_From_Email() {
  popupWin = window.open('help.asp?ID=Settings_From_Email', 'remote', 'width=300,height=200')
}
function open_Settings_URL_Dir() {
  popupWin = window.open('help.asp?ID=Settings_URL_Dir', 'remote', 'width=300,height=200')
}
function open_Settings_URL_Home() {
  popupWin = window.open('help.asp?ID=Settings_URL_Home', 'remote', 'width=300,height=200')
}
function open_Settings_Message_Welcome() {
  popupWin = window.open('help.asp?ID=Settings_Message_Welcome', 'remote', 'width=300,height=200')
}
function open_Settings_Message_Goodbye() {
  popupWin = window.open('help.asp?ID=Settings_Message_Goodbye', 'remote', 'width=300,height=200')
}
function open_Settings_Password() {
  popupWin = window.open('help.asp?ID=Settings_Password', 'remote', 'width=300,height=200')
}
function open_Settings_Notify_Join() {
  popupWin = window.open('help.asp?ID=Settings_Notify_Join', 'remote', 'width=300,height=200')
}
function open_Settings_Notify_Quit() {
  popupWin = window.open('help.asp?ID=Settings_Notify_Quit', 'remote', 'width=300,height=200')
}

function VerifyData() {
	if ((document.frmUser.Component.value == "ASPEmail") &&
		(document.frmUser.SMTP.value == "")) {
		alert("You must enter a Mail Server if you are using the Mail Component you have selected");
		return false;
	}

	if (document.frmUser.Admin_Pass.value != document.frmUser.Admin_Pass2.value) {
		alert("Passwords do not Match.");
		return false;
	} else if (document.frmUser.List_Name.value == "") {
		alert("You must enter the mailinglist name.");
		return false;
	} else if (document.frmUser.Admin_ID.value == "") {
		alert("You must enter an Admin ID.");
		return false;
	} else if (document.frmUser.Admin_Email.value == "") {
		alert("You must enter an Admin Email.");
		return false;
	} else if (document.frmUser.From_Email.value == "") {
		alert("You must enter a Return Email.");
		return false;
	} else if (document.frmUser.URL_Dir.value == "") {
		alert("You must enter the URL of the Directory in which this program is installed.");
		return false;
	} else if (document.frmUser.URL_Home.value == "") {
		alert("You must enter the URL of your Homepage.");
		return false;
	} else if (document.frmUser.Admin_Pass.value == "") {
		alert("You must enter an Admin Password.");
		return false;
	} else
		return true;
}
</script>



</head>
<body vlink="#48576C" link="#48576C" alink="#000000">
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
<td bgcolor="#B0C4DE" height="15" width="100%"><font face="Verdana" size="1" color="#000000"><b>&nbsp;Add Event</b></font></td>
</tr>
<tr>
<td bgcolor="#000000" height="1" width="100%"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>

<table border="0" cellpadding="2" cellspacing="0" width="517">
<tr>
<td width="100%">


<font face="Verdana" size="1">Event <%=id%> has been added<br></font></td>
</tr>
</table></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td width="1" bgcolor="#000000"></td>
<td colspan="3" align="center" bgcolor="#B0C4DE" height="30">
<font face="Verdana" size="1"><br>&copy;2007</font></td>
<td width="1" bgcolor="#000000"></td>
</tr>


<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>


</body>
</html>
<!--#include file="dsn2.asp"-->