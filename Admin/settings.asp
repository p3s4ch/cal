<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<html>
<head>
<title>Ocean12 ASP Calendar Manager</title>

<script language="javascript">
function open_Settings_Admin_ID() {
  popupWin = window.open('help.asp?ID=Settings_Admin_ID', 'remote', 'width=300,height=200')
}
function open_Settings_Abbreviate_Days() {
  popupWin = window.open('help.asp?ID=Settings_Abbreviate_Days', 'remote', 'width=300,height=200')
}
function open_Settings_Abbreviate_Months() {
  popupWin = window.open('help.asp?ID=Settings_Abbreviate_Months', 'remote', 'width=300,height=200')
}
function open_Settings_Event_Display() {
  popupWin = window.open('help.asp?ID=Settings_Event_Display', 'remote', 'width=300,height=200')
}
function open_Settings_Page_Title() {
  popupWin = window.open('help.asp?ID=Settings_Page_Title', 'remote', 'width=300,height=200')
}
function open_Settings_Background_Color() {
  popupWin = window.open('help.asp?ID=Settings_Background_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Font_Color() {
  popupWin = window.open('help.asp?ID=Settings_Font_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Link_Color() {
  popupWin = window.open('help.asp?ID=Settings_Link_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Hover_Link_Color() {
  popupWin = window.open('help.asp?ID=Settings_Hover_Link_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Visited_Link_Color() {
  popupWin = window.open('help.asp?ID=Settings_Visited_Link_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Active_Link_Color() {
  popupWin = window.open('help.asp?ID=Settings_Active_Link_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Weekday_Font() {
  popupWin = window.open('help.asp?ID=Settings_Weekday_Font', 'remote', 'width=300,height=200')
}
function open_Settings_Weekday_Font_Size() {
  popupWin = window.open('help.asp?ID=Settings_Weekday_Font_Size', 'remote', 'width=300,height=200')
}
function open_Settings_Weekday_Font_Color() {
  popupWin = window.open('help.asp?ID=Settings_Weekday_Font_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Weekday_Background_Color() {
  popupWin = window.open('help.asp?ID=Settings_Weekday_Background_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Date_Font() {
  popupWin = window.open('help.asp?ID=Settings_Date_Font', 'remote', 'width=300,height=200')
}
function open_Settings_Date_Font_Size() {
  popupWin = window.open('help.asp?ID=Settings_Date_Font_Size', 'remote', 'width=300,height=200')
}
function open_Settings_Date_Font_Color() {
  popupWin = window.open('help.asp?ID=Settings_Date_Font_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Date_Background_Color() {
  popupWin = window.open('help.asp?ID=Settings_Date_Background_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Event_Font() {
  popupWin = window.open('help.asp?ID=Settings_Event_Font', 'remote', 'width=300,height=200')
}
function open_Settings_Event_Font_Size() {
  popupWin = window.open('help.asp?ID=Settings_Event_Font_Size', 'remote', 'width=300,height=200')
}
function open_Settings_Event_Font_Color() {
  popupWin = window.open('help.asp?ID=Settings_Event_Font_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Cell_Background_Color() {
  popupWin = window.open('help.asp?ID=Settings_Cell_Background_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Cell_Width() {
  popupWin = window.open('help.asp?ID=Settings_Cell_Width', 'remote', 'width=300,height=200')
}
function open_Settings_Cell_Height() {
  popupWin = window.open('help.asp?ID=Settings_Cell_Height', 'remote', 'width=300,height=200')
}
function open_Settings_Border_Size() {
  popupWin = window.open('help.asp?ID=Settings_Border_Size', 'remote', 'width=300,height=200')
}
function open_Settings_Border_Color() {
  popupWin = window.open('help.asp?ID=Settings_Border_Color', 'remote', 'width=300,height=200')
}
function open_Settings_Header() {
  popupWin = window.open('help.asp?ID=Settings_Header', 'remote', 'width=300,height=200')
}
function open_Settings_Footer() {
  popupWin = window.open('help.asp?ID=Settings_Footer', 'remote', 'width=300,height=200')
}
function open_Settings_Password() {
  popupWin = window.open('help.asp?ID=Settings_Password', 'remote', 'width=300,height=200')
}

function VerifyData() {
	if (document.frmUser.Admin_Pass.value != document.frmUser.Admin_Pass2.value) {
		alert("Passwords do not Match.");
		return false;
	} else if (document.frmUser.Admin_ID.value == "") {
		alert("You must enter an Admin ID.");
		return false;
	} else if (document.frmUser.Admin_Pass.value == "") {
		alert("You must enter an Admin Password.");
		return false;
	} else if ((document.frmUser.Page_Title.value == "") ||
				(document.frmUser.Background_Color.value == "") ||
				(document.frmUser.Font_Color.value == "") ||
				(document.frmUser.Link_Color.value == "") ||
				(document.frmUser.Hover_Link_Color.value == "") ||
				(document.frmUser.Visited_Link_Color.value == "") ||
				(document.frmUser.Active_Link_Color.value == "") ||
				(document.frmUser.Weekday_Font.value == "") ||
				(document.frmUser.Weekday_Font_Color.value == "") ||
				(document.frmUser.Weekday_Font_Size.value == "") ||
				(document.frmUser.Weekday_Background_Color.value == "") ||
				(document.frmUser.Date_Font.value == "") ||
				(document.frmUser.Date_Font_Color.value == "") ||
				(document.frmUser.Date_Font_Size.value == "") ||
				(document.frmUser.Date_Background_Color.value == "") ||
				(document.frmUser.Event_Font.value == "") ||
				(document.frmUser.Event_Font_Color.value == "") ||
				(document.frmUser.Event_Font_Size.value == "") ||
				(document.frmUser.Cell_Background_Color.value == "") ||
				(document.frmUser.Cell_Width.value == "") ||
				(document.frmUser.Cell_Height.value == "") ||
				(document.frmUser.Border_Size.value == "") ||
				(document.frmUser.Border_Color.value == "")) {
		alert("All Fields that are not marked optional are required.");
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
<td width="100%"><font face="Verdana" size="1"><br>


<%
dim RSFORM
Set RSFORM = Server.CreateObject("ADODB.Recordset")
RSFORM.Open "Settings", Conn, 2, 2

RSFORM.Find "ID='" & 1 & "'"
%>

<form action="settings2.asp" name="frmUser" Method="Post" onSubmit="return VerifyData()">
<table border="0" cellpadding="3" cellspacing="0" align="center">
<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Admin ID</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Admin_ID();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Admin_ID" value="<%=RSFORM("Admin_ID")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td colspan="3" bgcolor="#FFFFFF"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Abbreviate Days</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Abbreviate_Days();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="checkbox" name="Abbreviate_Days" <%If (RSFORM("Abbreviate_Days") = True) Then%>CHECKED<%End If%>></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Abbreviate Months</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Abbreviate_Months();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="checkbox" name="Abbreviate_Months" <%If (RSFORM("Abbreviate_Months") = True) Then%>CHECKED<%End If%>></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Display Category Name</b><br><font color="#000000">(instead of Event Name)</font></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Event_Display();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="checkbox" name="Event_Display" <%If (RSFORM("Event_Display") = True) Then%>CHECKED<%End If%>></td>
</tr>

<tr>
<td colspan="3" bgcolor="#FFFFFF"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Page Title</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Page_Title();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Page_Title" value="<%=RSFORM("Page_Title")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Background Color</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Background_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="text" name="Background_Color" value="<%=RSFORM("Background_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Font Color</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Font_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Font_Color" value="<%=RSFORM("Font_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Link Color</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Link_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="text" name="Link_Color" value="<%=RSFORM("Link_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Hover Link Color</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Hover_Link_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Hover_Link_Color" value="<%=RSFORM("Hover_Link_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Visited Link Color</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Visited_Link_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="text" name="Visited_Link_Color" value="<%=RSFORM("Visited_Link_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Active Link Color</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Active_Link_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Active_Link_Color" value="<%=RSFORM("Active_Link_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td colspan="3" bgcolor="#FFFFFF"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Weekday Font</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Weekday_Font();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="text" name="Weekday_Font" value="<%=RSFORM("Weekday_Font")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Weekday Font Size</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Weekday_Font_Size();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Weekday_Font_Size" value="<%=RSFORM("Weekday_Font_Size")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Weekday Font Color</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Weekday_Font_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="text" name="Weekday_Font_Color" value="<%=RSFORM("Weekday_Font_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Weekday Background Color</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Weekday_Background_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Weekday_Background_Color" value="<%=RSFORM("Weekday_Background_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td colspan="3" bgcolor="#FFFFFF"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Date Font</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Date_Font();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="text" name="Date_Font" value="<%=RSFORM("Date_Font")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Date Font Size</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Date_Font_Size();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Date_Font_Size" value="<%=RSFORM("Date_Font_Size")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Date Font Color</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Date_Font_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="text" name="Date_Font_Color" value="<%=RSFORM("Date_Font_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Date Background Color</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Date_Background_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Date_Background_Color" value="<%=RSFORM("Date_Background_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td colspan="3" bgcolor="#FFFFFF"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Event Font</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Event_Font();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="text" name="Event_Font" value="<%=RSFORM("Event_Font")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Event Font Size</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Event_Font_Size();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Event_Font_Size" value="<%=RSFORM("Event_Font_Size")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Event Font Color</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Event_Font_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="text" name="Event_Font_Color" value="<%=RSFORM("Event_Font_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td colspan="3" bgcolor="#FFFFFF"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Blank Cell Background Color</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Cell_Background_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Cell_Background_Color" value="<%=RSFORM("Cell_Background_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Cell Width</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Cell_Width();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="text" name="Cell_Width" value="<%=RSFORM("Cell_Width")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Cell Height</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Cell_Height();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Cell_Height" value="<%=RSFORM("Cell_Height")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Border Size</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Border_Size();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="text" name="Border_Size" value="<%=RSFORM("Border_Size")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Border Color</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Border_Color();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Border_Color" value="<%=RSFORM("Border_Color")%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td colspan="3" bgcolor="#FFFFFF"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Header</b><br><font color="#000000">(optional)</font></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Header();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><textarea name="Header" class="inputbox" cols="45" rows="5"><%=RSFORM("Header")%></textarea>
</td>
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Footer</b><br><font color="#000000">(optional)</font></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Settings_Footer();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><textarea name="Footer" class="inputbox" cols="45" rows="5"><%=RSFORM("Footer")%></textarea>
</td>
</tr>

<tr>
<td colspan="3" bgcolor="#FFFFFF"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Password</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Settings_Password();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><input type="password" name="Admin_Pass" value="<%=RSFORM("Admin_Pass")%>" class="inputbox" size="10" maxlength="255"></td>
</tr>
<tr>
<td bgcolor="#DAE3F0">&nbsp;</td>
<td bgcolor="#DAE3F0">&nbsp;</td>
<td bgcolor="#DAE3F0"><input type="password" name="Admin_Pass2" value="<%=RSFORM("Admin_Pass")%>" class="inputbox" size="10" maxlength="255"></td>
</tr>
<tr>
<td align="right" valign="bottom"><input type="reset" name="Reset" value="Reset" class="inputSubmit"></td>
<td>&nbsp;</td>
<td valign="bottom"><input type="submit" name="Submit" value="Update Settings" class="inputSubmit">
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