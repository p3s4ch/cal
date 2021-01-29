<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common/banner.asp"-->



<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<%

orderBy = request.querystring("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
DeleteID = request("DeleteID")
CustomerID = request("CustomerID")
Response.Write "<br> <H2> Customers </H2> <br>"
%>


<form action="customers_add.asp" name="frmUser" Method="Get">
 &nbsp; <input type="submit" name="Submit" value="Add" class="inputSubmit">
</form>


<%

If (DeleteID <> "") Then
  SQL = "DELETE FROM Customers WHERE ID = " & DeleteID
  Set RS = SQLCN.Execute(SQL)
  Response.Write "Deleted Customer ID = " & DeleteID
End If


If NOT (SearchFor = "") Then

	SQL_SearchFor = " WHERE " &_

	" ID LIKE ('%" & SearchFor & "%') or " &_
    " Title LIKE ('%" & SearchFor & "%') or " &_
    " Firstname LIKE ('%" & SearchFor & "%') or " &_
    " Surname LIKE ('%" & SearchFor & "%') or " &_
    " Address LIKE ('%" & SearchFor & "%') or " &_
    " Postcode LIKE ('%" & SearchFor & "%') or " &_
    " Email LIKE ('%" & SearchFor & "%') or " &_
    " Phone LIKE ('%" & SearchFor & "%') or " &_
    " Mobile LIKE ('%" & SearchFor & "%') or " &_
    " Comment LIKE ('%" & SearchFor & "%')  "
Else
	SQL_SearchFor = ""
End If

If orderBy      = "" Then
	SQL_OrderBy = " ORDER BY Surname"


ElseIf orderBy      = "Surname_Up" Then
	SQL_OrderBy = " ORDER BY Surname DESC"

ElseIf orderBy      = "Surname_Down" Then
	SQL_OrderBy = " ORDER BY Surname"

ElseIf orderBy      = "ID_Up" Then
	SQL_OrderBy = " ORDER BY ID"

ElseIf orderBy      = "ID_Down" Then
	SQL_OrderBy = " ORDER BY ID DESC"

ElseIf orderBy      = "Name_Up" Then
	SQL_OrderBy = " ORDER BY FirstName DESC"
ElseIf orderBy = "Name_Down" Then
	SQL_OrderBy = " ORDER BY FirstName"
ElseIf orderBy = "Address_Up" Then

	SQL_OrderBy = " ORDER BY Address DESC"
ElseIf orderBy = "Address_Down" Then
	SQL_OrderBy = " ORDER BY Address"

ElseIf orderBy = "PostCode_Up" Then
	SQL_OrderBy = " ORDER BY PostCode DESC"
ElseIf orderBy = "PostCode_Down" Then
	SQL_OrderBy = " ORDER BY PostCode "

ElseIf orderBy = "Phone_Up" Then
	SQL_OrderBy = " ORDER BY Phone DESC"
ElseIf orderBy = "Phone_Down" Then
	SQL_OrderBy = " ORDER BY PostCode "
End If

SQL = "SELECT * FROM Customers " & SQL_SearchFor & SQL_OrderBy
'Response.Write SQL
'Response.End

%>
<form action="customers2.asp" Method="GET"><!--#include file="common\searchForm.asp"--></form>

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

RS.PageSize = 100
RS.CacheSize = RS.PageSize
intPageCount = RS.PageCount
intRecordCount = RS.RecordCount



If NOT (RS.BOF AND RS.EOF) Then
%>

<table border="0" cellpadding="3" cellspacing="0" align="center">
<tr>

<td bgcolor="#FFFFFF"></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=ID_Up&page=<%If NOT (orderby = "ID_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
ID&nbsp;<a href="?orderby=ID_Down&page=<%If NOT (orderby = "ID_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>


<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Surname_Up&page=<%If NOT (orderby = "Surname_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Surname&nbsp;<a href="?orderby=Surname_Down&page=<%If NOT (orderby = "Surname_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>


<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Name_Up&page=<%If NOT (orderby = "FirstName_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Name(s)&nbsp;<a href="?orderby=Name_Down&page=<%If NOT (orderby = "FirstName_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Address_Up&page=<%If NOT (orderby = "Address_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Address&nbsp;<a href="?orderby=Address_Down&page=<%If NOT (orderby = "Address_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=PostCode_Up&page=<%If NOT (orderby = "PostCode_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Post Code&nbsp;<a href="?orderby=PostCode_Down&page=<%If NOT (orderby = "PostCode_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Phone_Up&page=<%If NOT (orderby = "Phone_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Phone&nbsp;<a href="?orderby=Phone_Down&page=<%If NOT (orderby = "Phone_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

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

<a href="customers_add.asp?ID=<%=RS("ID")%>&orderby=<%=orderby%>&page=<%=intPage%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">Edit</a>&nbsp;&nbsp;
<a href="customers.asp?DeleteID=<%=RS("ID")%>&orderby=<%=orderby%>&page=<%=intPage%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">Remove</a></font></td>

<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("ID")   %></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Surname")   %></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1"><%=RS("FirstName")%></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Address")%></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("PostCode")%></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Phone")%></font></td>
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
