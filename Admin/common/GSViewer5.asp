<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="common\ExtractDates.asp"-->

<%
orderBy = Replace(request("orderby"),"_","  ")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")
mysql = request("mysql")
where_sql = request("where_sql")
bttns = request("bttns")
myheader = request("myheader")
addEditPgLink = request("addEditPgLink")

if addEditPgLink ="" then
    fees="fees_add.asp"
End If


if orderBy <> "" then SqlorderBy=" order by " &  orderBy end if
SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

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
SQL = mysql & where_sql

%>

<%
if bttns="Payroll.Buttons" then
%>

  <!--#include file="common\buttons\Payroll.Buttons.asp"-->

<%
End If




if bttns="ReservationReports.Buttons" then
%>

  <!--#include file="common\buttons\ReservationReports.Buttons.asp"-->

<%
End If

if bttns="Tasks.Buttons" then
%>

  <!--#include file="common\buttons\Tasks.Buttons.asp"-->

<%
End If


if bttns="Instructions.Buttons" then
%>
   <!--#include file="common\buttons\Instructions.Buttons.asp"-->

<%
End If


if bttns="Invoice.Buttons" then
%>
   <!--#include file="common\buttons\Invoice.Buttons.asp"-->

<%
End If



if bttns="Operator.Buttons" then
%>

   <!--#include file="common\buttons\Operator.Buttons.asp"-->
<%
End If


if bttns="UserRoles.Buttons" then
%>

   <!--#include file="common\buttons\UserRoles.Buttons.asp"-->
<%
End If


if bttns="Adi.Buttons" then
%>

   <!--#include file="common\buttons\Adi.Buttons.asp"-->
<%
End IF

IF  bttns="CashAccounts.Buttons" then
%>

   <!--#include file="common\buttons\CashAccounts.Buttons.asp"-->
<%
End If

if bttns="" then
%>
   SQL = "select 'ERROR: No matching buttons'"

<%
End If



'Response.Write "<br>" & SQL & "<br>"
'SQL_TOT = "select count(1) as tot from dbo.fees " &  SQL_Where
'Set RS_TOT = SQLCN.Execute(SQL_TOT)
'Response.Write "Total <br>" & RS_TOT("tot") & "<br>"

%>

<h2 ALIGN=CENTER> <%=myheader%>  </h2>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>
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

<!--#include file="common\columnHeadings.asp"-->













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

for each x in RS.Fields
%>
<!--not include file="common\columnFormatter.asp"-->
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
<%
     End If

%>
</font></td></tr></table></td></tr></table><br>

<%

End If

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
