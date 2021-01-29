<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<%
dim RSSETTINGS
Set RSSETTINGS = Server.CreateObject("ADODB.Recordset")
RSSETTINGS.Open "Settings", Conn, 2, 2

RSSETTINGS.Find "ID='" & 1 & "'"

RSSETTINGS("Admin_ID") = request("Admin_ID")
RSSETTINGS("Page_Title") = request("Page_Title")
RSSETTINGS("Background_Color") = request("Background_Color")
RSSETTINGS("Font_Color") = request("Font_Color")
RSSETTINGS("Link_Color") = request("Link_Color")
RSSETTINGS("Hover_Link_Color") = request("Hover_Link_Color")
RSSETTINGS("Visited_Link_Color") = request("Visited_Link_Color")
RSSETTINGS("Active_Link_Color") = request("Active_Link_Color")
RSSETTINGS("Weekday_Font") = request("Weekday_Font")
RSSETTINGS("Weekday_Font_Size") = request("Weekday_Font_Size")
RSSETTINGS("Weekday_Font_Color") = request("Weekday_Font_Color")
RSSETTINGS("Weekday_Background_Color") = request("Weekday_Background_Color")
RSSETTINGS("Date_Font") = request("Date_Font")
RSSETTINGS("Date_Font_Size") = request("Date_Font_Size")
RSSETTINGS("Date_Font_Color") = request("Date_Font_Color")
RSSETTINGS("Date_Background_Color") = request("Date_Background_Color")
RSSETTINGS("Event_Font") = request("Event_Font")
RSSETTINGS("Event_Font_Size") = request("Event_Font_Size")
RSSETTINGS("Event_Font_Color") = request("Event_Font_Color")
RSSETTINGS("Cell_Background_Color") = request("Cell_Background_Color")
RSSETTINGS("Cell_Width") = request("Cell_Width")
RSSETTINGS("Cell_Height") = request("Cell_Height")
RSSETTINGS("Border_Size") = request("Border_Size")
RSSETTINGS("Border_Color") = request("Border_Color")
RSSETTINGS("Header") = request("Header")
RSSETTINGS("Footer") = request("Footer")
RSSETTINGS("Admin_Pass") = request("Admin_Pass")

If (request("Abbreviate_Days") = "on") Then
	RSSETTINGS("Abbreviate_Days") = True
Else
	RSSETTINGS("Abbreviate_Days") = False
End If

If (request("Abbreviate_Months") = "on") Then
	RSSETTINGS("Abbreviate_Months") = True
Else
	RSSETTINGS("Abbreviate_Months") = False
End If

If (request("Event_Display") = "on") Then
	RSSETTINGS("Event_Display") = True
Else
	RSSETTINGS("Event_Display") = False
End If
RSSETTINGS.update

RSSETTINGS.close
set RSSETTINGS = nothing
%>
<html>
<head>
<title>Ocean12 ASP Calendar Manager</title>

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
<td bgcolor="#B0C4DE" height="15" width="100%"><font face="Verdana" size="1" color="#000000"><b>&nbsp;Settings</b></font></td>
</tr>
<tr>
<td bgcolor="#000000" height="1" width="100%"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>

<table border="0" cellpadding="2" cellspacing="0" width="517">
<tr>
<td width="100%"><font face="Verdana" size="1">

The settings have been updated.<br><br>
<a href="main.asp">&lt;&lt; <b>Return</b></a>

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