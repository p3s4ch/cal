<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="common\ExtractDates.asp"-->

<h2 ALIGN=CENTER>Audit Logs </h2>



<form action="fees_add.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Add" class="inputSubmit">
</form>

<table border="0" cellpadding="2" cellspacing="0" width="100%">


<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<%
orderBy = Replace(request("orderby"),"_","  ")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")

DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")

%>

<!--do not include file="common\update_fees.asp"-->

<%

if orderBy <> "" then SqlorderBy=" order by " &  orderBy end if

SQL_WhereBetween = " where [updated] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "


If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND (" &_
	" [Date] LIKE '%" & SearchFor & "%' or " &_
	" [Payer] LIKE '%" & SearchFor & "%' or " &_
	" [Comment] LIKE '%" & SearchFor & "%' or " &_
	" [Amount] LIKE '%" & SearchFor & "%' or " &_
	" ID LIKE '%" & SearchFor & "%'  " &_
	")"

End If

SQL_Where = SQL_WhereBetween & SQL_SearchFor





SQL = "select top 150 * from dbo.logs " &  SQL_Where  & " order by [updated] desc"
Response.Write "<br>" & SQL & "<br>"


%>
<form  Method="GET">
   <br>
     <!--#include file="common\searchFormX.asp"-->
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

RS.PageSize = 280
RS.CacheSize = RS.PageSize
intPageCount = RS.PageCount
intRecordCount = RS.RecordCount



If NOT (RS.BOF AND RS.EOF) Then
%>
<table border="0" cellpadding="3" cellspacing="0" align="center">
<tr>
<td bgcolor="#FFFFFF"></td>
<%
for each x in RS.Fields
    %>
    <td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
    <a href="?betweenFrom=<%=betweenFrom%>&betweenTo=<%=betweenTo%>&orderby=<%=x.name%>_Desc&page=<%If NOT (orderby = "ID_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
    <%=x.name%> &nbsp;<a href="?betweenFrom=<%=betweenFrom%>&betweenTo=<%=betweenTo%>&orderby=<%=x.name%>&page=<%If NOT (orderby = "ID_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font>
    </td>
<%
   next
%>

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

<td bgcolor="#FFFFFF"> &nbsp; </td>


<%
addEditPgLink="fees_add.asp"
for each x in RS.Fields
%>
<!--#include file="common\columnFormatter.asp"-->
<%
   next
%>



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
