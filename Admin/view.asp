<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="..\..\include\SQL_Cn.asp"-->
<html>
<head>
<title>Micro Calendar</title>

<!--#include file="style.asp"-->

</head>
<body bgcolor="#F0F0F0" vlink="#48576C" link="#48576C" alink="#000000">
<table border="0" cellpadding="0" cellspacing="0" width="650" align="center">
<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
<td colspan="3" bgcolor="black" height="35" width="648"><font face="Verdana" size="5" color="#FFCC00"><b>&nbsp;Micro Calendar</b></font></td>
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
<td bgcolor="#B0C4DE" height="15" width="100%"><font face="Verdana" size="1" color="#000000"><b>&nbsp;View/Edit Event</b></font></td>
</tr>
<tr>
<td bgcolor="#000000" height="1" width="100%"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>

<table border="0" cellpadding="2" cellspacing="0" width="517">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>


<%
orderBy = request.querystring("orderby")

SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")

If (SearchWhere = "All") Then
	SQL_SearchWhere = "(Title LIKE ('%" & SearchFor & "%') OR StartTime LIKE ('%" & SearchFor & "%') OR Category LIKE ('%" & SearchFor & "%'))"
Else
	SQL_SearchWhere = SearchWhere & " LIKE ('%" & SearchFor & "%')"
End If

If NOT (SearchFor = "") Then
	SQL_SearchFor = " WHERE " & SQL_SearchWhere
Else
	SQL_SearchFor = ""
End If

If orderBy = "Event_Name_Up" Then
	SQL_OrderBy = " ORDER BY Title DESC"
ElseIf orderBy = "Event_Name_Down" Then
	SQL_OrderBy = " ORDER BY Title"
ElseIf orderBy = "Date_Up" Then
	SQL_OrderBy = " ORDER BY StartTime DESC"
ElseIf orderBy = "Date_Down" Then
	SQL_OrderBy = " ORDER BY StartTime"

ElseIf orderBy = "Address_Up" Then
	SQL_OrderBy = " ORDER BY Address DESC"
ElseIf orderBy = "Address_Down" Then
	SQL_OrderBy = " ORDER BY Address"
	
ElseIf orderBy = "PostCode_Up" Then
	SQL_OrderBy = " ORDER BY PostCode DESC"	
ElseIf orderBy = "PostCode_Down" Then
	SQL_OrderBy = " ORDER BY PostCode "
	
ElseIf orderBy = "Category_Up" Then
	SQL_OrderBy = " ORDER BY Category DESC"
ElseIf orderBy = "Category_Down" Then
	SQL_OrderBy = " ORDER BY Category"
Else
	orderBy = "Date_Down"
	SQL_OrderBy = " ORDER BY StartTime"
End If


SQL = "SELECT * FROM cEvents left join  Sites on SiteID = Sites.ID " & SQL_SearchFor & SQL_OrderBy
'SQL = "SELECT * FROM cEvents "& SQL_SearchFor 

%>

<form action="view.asp" Method="GET">
<table border="0" cellpadding="5" cellspacing="0" align="center">
<tr>
<td bgcolor="#DAE3F0">
<table border="0" cellpadding="2" cellspacing="0" align="center">
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana, arial" size="1"  color="48576C"><b>Search for</b></font></td>
<td bgcolor="#DAE3F0"><input type="text" name="SearchFor" class="inputBox" value="<%=SearchFor%>"></td>
<td bgcolor="#DAE3F0"><font face="Verdana, arial" size="1"  color="48576C"><b>In</b></font></td>
<td bgcolor="#DAE3F0">

<select name="SearchWhere" class="inputBox">
<option value="All" <%If (SearchWhere = "All") Then%>SELECTED<%End If%>>All Fields</option>
<option value="Title" <%If (SearchWhere = "Email") Then%>SELECTED<%End If%>>Event Name</option>
<option value="StartTime" <%If (SearchWhere = "Name_Last") Then%>SELECTED<%End If%>>Date & Time</option>
<option value="Location" <%If (SearchWhere = "Date_In") Then%>SELECTED<%End If%>>Location</option>
<option value="Location" <%If (SearchWhere = "Date_In") Then%>SELECTED<%End If%>>Category</option>
</select></td>
<td bgcolor="#DAE3F0"><input type="submit" value="Go" class="inputSubmit"></td>
</tr>
</table>
</td>
</tr>
</table>
</form>

<%



Set RS = Server.CreateObject("ADODB.Recordset")

Dim colorchanger
Dim color1
Dim color2
colorchanger = 0
color1 = "#C5D3E7"
color2 = "#B0C4DE"

dim intPage
dim intPageCount
dim intRecordCount

If Request.QueryString("page") = "" Then
	intPage = 1	
Else
	intPage = Request.QueryString("page")
End If
	
RS.CursorLocation = 3
RS.CursorType = 3
RS.ActiveConnection = Conn
	
Response.Write SQL
'Response.End
	
RS.Open SQL, SQLCN, 1, 3
	
RS.PageSize = 20
RS.CacheSize = RS.PageSize
intPageCount = RS.PageCount
intRecordCount = RS.RecordCount

If NOT (RS.BOF AND RS.EOF) Then
%>

<table border="0" cellpadding="3" cellspacing="0" align="center">
<tr>
<td bgcolor="#FFFFFF"></td>
<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=Event_Name_Up&page=<%If NOT (orderby = "Event_Name_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Event&nbsp;Name&nbsp;<a href="?orderby=Event_Name_Down&page=<%If NOT (orderby = "Event_Name_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=Date_Up&page=<%If NOT (orderby = "Date_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Date & Time&nbsp;<a href="?orderby=Date_Down&page=<%If NOT (orderby = "Date_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>
<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=Address_Up&page=<%If NOT (orderby = "Address_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Address&nbsp;<a href="?orderby=Address_Down&page=<%If NOT (orderby = "Address_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>
<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=PostCode_Up&page=<%If NOT (orderby = "PostCode_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Post Code&nbsp;<a href="?orderby=PostCode_Down&page=<%If NOT (orderby = "PostCode_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=Category_Up&page=<%If NOT (orderby = "Category_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Category&nbsp;<a href="?orderby=Category_Down&page=<%If NOT (orderby = "Category_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>
</tr>

<%	
If CInt(intPage) > CInt(intPageCount) Then intPage = intPageCount
	If CInt(intPage) <= 0 Then intPage = 1
		If intRecordCount > 0 Then
			RS.AbsolutePage = intPage
			intStart = RS.AbsolutePosition
			If CInt(intPage) = CInt(intPageCount) Then
				intFinish = intRecordCount
			Else
				intFinish = intStart + (RS.PageSize - 1)
			End if
		End If
	If intRecordCount > 0 Then
		For intRecord = 1 to RS.PageSize
%>
<tr>
<td bgcolor="#FFFFFF"><font face="Verdana, arial" size="1">
<a href="edit.asp?ID=<%=RS("ID")%>&orderby=<%=orderby%>&page=<%=intPage%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">Edit</a>&nbsp;&nbsp;<a href="delete.asp?ID=<%=RS("ID")%>&orderby=<%=orderby%>&page=<%=intPage%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">Remove</a></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Title")%></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1"><%=FormatDateTime(RS("StartTime"), vbShortDate)%>
<br><%=FormatDateTime(RS("StartTime"), vbLongTime)%></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Address")%></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("PostCode")%></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1"><%=RS("Category")%></font></td>
</tr>
			
<%
RS.MoveNext
If colorchanger = 1 Then
	colorchanger = 0
	color1 = "#C5D3E7"
	color2 = "#B0C4DE"
Else
	colorchanger = 1
	color1 = "#DAE3F0"
	color2 = "#C5D3E7"
End If

If RS.EOF Then Exit for
	Next
%>
<tr>
<td colspan="5"><table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td width="50%" align="left"><font face="Verdana, arial" size="1">
<%If cInt(intPage) > 1 Then%>
	<a href="?orderby=<%=orderBy%>&page=<%=intPage - 1%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>"><< <b>Prev</b></a>
<%End If%>
</font></td>
<td width="50%" align="right"><font face="Verdana, arial" size="1" >
<%If cInt(intPage) < cInt(intPageCount) Then%>
	<a href="?orderby=<%=orderBy%>&page=<%=intPage + 1%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>"><b>Next</b> >></a>
<%End If%>
</font></td></tr></table></td></tr></table><br>
<%End If
Else
If (SearchFor = "") Then%>
<center><font face="Verdana, arial" size="1">There are currently no events.</font></center>
<%Else%>
<center><font face="Verdana, arial" size="1">There are currently no events that match your search.</font></center>
<%End If
End If
RS.close
Set RS = Nothing
%>


</font></td>
</tr>
</table></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
<td colspan="3" align="center" bgcolor="#B0C4DE" height="30">

<font face="Verdana" size="1"><br>&copy;2007 Micro Software Ltd,</font></td>

<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>


<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

</table>


</body>
</html>
<!--#include file="dsn2.asp"-->