<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="..\..\include\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<table border="0" cellpadding="2" cellspacing="0" width="517">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>

Events

<%
orderBy = request.querystring("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
DeleteID = request("DeleteID")
AddID = request("AddID")

If (DeleteID <> "") Then
  SQL = "DELETE FROM cEvents WHERE ID = " & DeleteID
  Set RS = SQLCN.Execute(SQL)
  Response.Write "Deleted Item = " & DeleteID
End If

If (AddID <> "") Then
    Response.Write "Add Edit ID " & AddID
    Response.Write  " "
	StartDate = request("StartDate")
	StartHour    = request("StartHour")
	Email    = request("Email")
	Address    = request("Address")
	PostCode    = request("PostCode")
	Phone    = request("Phone")

    If (AddID = "-1") Then
	    Response.Write "Add New"
	    SQL = "insert into cEvents (Title) values ('"& Title & "')"

	Else
	    Response.Write "Update cEvents " & AddID
 		SQL = "Update cEvents set Title = '" & Title & "' " &_
 		                            " where ID = "& AddID
	End If
	    Response.Write  " "
	    Response.Write  " "
	    Response.Write  SQL
	    Response.Write  " "
		Set RS = SQLCN.Execute(SQL)
End If


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
%>

<form action="events.asp" Method="GET"><!--#include file="common\searchForm.asp"--></form>
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
<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=Event_Name_Up&page=<%If NOT (orderby = "Event_Name_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Event&nbsp;<a href="?orderby=Event_Name_Down&page=<%If NOT (orderby = "Event_Name_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>
<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b><a href="?orderby=Date_Up&page=<%If NOT (orderby = "Date_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;Start Time&nbsp;<a href="?orderby=Date_Down&page=<%If NOT (orderby = "Date_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>
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

<a href="events_add.asp?ID=<%=RS("ID")%>&orderby=<%=orderby%>&page=<%=intPage%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">Edit</a>
&nbsp;&nbsp;
<a href="events_delete.asp?ID=<%=RS("ID")%>&orderby=<%=orderby%>&page=<%=intPage%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">Remove</a></font></td>


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
<center><font face="Verdana, arial" size="1">There are currently no items in this category.</font></center>
<%Else%>
<center><font face="Verdana, arial" size="1">There are no items that match your search.</font></center>
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
<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->