<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->



<table border="0" cellpadding="2" cellspacing="0" width="100%">
<!--#include file="common\update_Expenses.asp"-->

<!--#include file="common\func_SQL_WhereBetweenMonth.asp"-->

<tr>
<td width="100%"><font face="Verdana" size="1"><br>


<%

Admin_ID = session("Admin_ID")
isAdmin = Session("isAdmin")
orderBy = request("orderby")


if isAdmin then
     SearchWhere = request("SearchWhere")
     SearchFor = request("SearchFor") 
     Response.Write "<h1> Expenses</h1> <br>"
     Response.Write "<font color=blue size=2> ( Excludes Advertsing, Wages and Contractor Payments )</font> <br>"
Else
      Response.Write "<h1> "& Admin_ID & "`s Expenses </h1> <br>"   
      SQL_SearchFor ="  AND [Name] = '" & Admin_ID &"'" 
End If


iMonth=request("Month")
iYear=request("Year")
'SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_WhereBetween = " where [Date] " & getSQL_WhereBetweenMonth(iMonth,iYear)
  
If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND " &_
	" ( ID LIKE '%" & SearchFor & "%' or " &_
	" [Name] LIKE '%" & SearchFor & "%' or " &_
	" PayMethod LIKE '%" & SearchFor & "%' or " &_
	" Amount LIKE '%" & SearchFor & "%' )"
End If

SQL_Where = SQL_WhereBetween & SQL_SearchFor

If orderBy      = "" Then
	SQL_OrderBy = " ORDER BY [Date] "
	
ElseIf orderBy      = "ID_Up" Then
	SQL_OrderBy = " ORDER BY ID Asc "
ElseIf orderBy      = "Amount" Then
	SQL_OrderBy = " ORDER BY Amount"
ElseIf orderBy      = "Amount_Down" Then
	SQL_OrderBy = " ORDER BY Amount DESC "
End If



SQL = "SELECT * FROM Expenses "  & SQL_Where & SQL_OrderBy

SQL_t= "SELECT IsNull(sum( IsNull(Amount,0)),0) as tot FROM Expenses " & SQL_Where
Set RS_TOT = SQLCN.Execute(SQL_t)
tot = 0
if NOT RS_TOT.EOF then tot= FormatNumber(RS_TOT("tot"), 2) end if
Response.Write "<b>Total Paid &nbsp;&pound;" & tot & "<b><br>"


'Response.Write SQL
'Response.End

%>
<form action="Expenses.asp" Method="GET">
<!--#include file="common\searchMonthForm.asp"-->
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


<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Date_Up&page=<%If NOT (orderby = "Date_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Date&nbsp;<a href="?orderby=Date_Down&page=<%If NOT (orderby = "Date_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>


<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Name_Up&page=<%If NOT (orderby = "Name_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Name&nbsp;<a href="?orderby=Name_Down&page=<%If NOT (orderby = "Name_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>


<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Amount_Up&page=<%If NOT (orderby = "Amount_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Amount&nbsp;<a href="?orderby=Amount_Down&page=<%If NOT (orderby = "Amount_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>


<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Comment_Up&page=<%If NOT (orderby = "Comment_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Comment&nbsp;<a href="?orderby=Comment_Down&page=<%If NOT (orderby = "Comment_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Comment_Up&page=<%If NOT (orderby = "Comment_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
PayMethod&nbsp;<a href="?orderby=Comment_Down&page=<%If NOT (orderby = "PayMethod_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Comment_Up&page=<%If NOT (orderby = "Comment_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
InvoiceGiven&nbsp;<a href="?orderby=Comment_Down&page=<%If NOT (orderby = "Comment_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

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

<td bgcolor="#FFFFFF">

<font face="Verdana, arial" size="1"><a href="Expenses_add.asp?ID=<%=RS("ID")%>">View Edit</a>&nbsp;</font>



</td>


<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Date")%></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Name")   %></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Amount")%></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1"><%=RS("Comment")%></font></td>

<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1"><%=RS("PayMethod")%></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1"><%=RS("InvoiceGiven")%></font></td>


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
<center><font face="Verdana, arial" size="1">There are currently no items in this category</font></center>
<%Else%>
<center><font face="Verdana, arial" size="1">There are no items that match your search</font></center>
<%End If
End If
RS.close
Set RS = Nothing
%>

</font></td>
</tr>
</table>

</td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>
</body>
</html>
<!--#include file="dsn2.asp"-->

