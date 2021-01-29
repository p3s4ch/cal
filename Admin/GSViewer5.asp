<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="common\ExtractDates.asp"-->


<h3> <%=Admin_Id%> </h3>

<%
orderby = Replace(request("orderby"),"_","  ")

SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")
mysql = request("mysql")
where_sql = request("where_sql")
bttns = request("bttns")
if bttns="" then
      bttns="Main.Buttons"
End If
myheader = request("myheader")
addEditPgLink = request("addEditPgLink")


if isDebug then
     Response.Write "GSViewer5.asp called with these params:<br> "
     Response.Write "<br>bttns="&bttns
     Response.Write "<br>mysql="&mysql
     Response.Write "<br>Submit="&Submit
     Response.Write "<br>isDebug[" & isDebug & "] isMars [" & isMars & "] isPluto [" & isPluto & "]<br>"

End If


if bttns="AccessControl.Buttons" then %>       <!--#include file="common\buttons\AccessControl.Buttons.asp"--> <% End If
if bttns="Mary.Buttons" then %>       <!--#include file="common\buttons\Mary.Buttons.asp"--> <% End If
if bttns="Test2.Buttons" then %>       <!--#include file="common\buttons\Test2.Buttons.asp"--> <% End If
if bttns="LAWS.Buttons" then %>                <!--#include file="common\buttons\Laws.Buttons.asp"--> <% End If
if bttns="All.Buttons" then %>       <!--#include file="common\buttons\All.Buttons.asp"--> <% End If
if bttns="Main.Buttons" then %>       <!--#include file="common\buttons\Main.Buttons.asp"--> <% End If
if bttns="BookASlot.Buttons" then %>  <!--#include file="common\buttons\BookASlot.Buttons.asp"--> <% End If
if bttns="Tut1.Buttons" then %>  <!--#include file="common\buttons\tut1.Buttons.asp"--> <% End If
if bttns="Tut2.Buttons" then %>  <!--#include file="common\buttons\tut2.Buttons.asp"--> <% End If
if bttns="Tut3.Buttons" then %>  <!--#include file="common\buttons\tut3.Buttons.asp"--> <% End If
if bttns="Tut4.Buttons" then %>  <!--#include file="common\buttons\tut4.Buttons.asp"--> <% End If
if bttns="Tut5.Buttons" then %>  <!--#include file="common\buttons\tut5.Buttons.asp"--> <% End If
if bttns="EruvAccount.Buttons" then %>  <!--#include file="common\buttons\EruvAccount.Buttons.asp"--> <% End If
if bttns="OperatorCategories.Buttons" then %>   <!--#include file="common\buttons\OperatorCategories.Buttons.asp"--> <% End If
if bttns="OperatorAccount.Buttons" then %>   <!--#include file="common\buttons\OperatorAccount.Buttons.asp"--> <% End If
if bttns="OperatorAccountAdmin.Buttons" then %> <!--#include file="common\buttons\OperatorAccountAdmin.Buttons.asp"--> <% End If
if bttns="PriceAlert.Buttons" then %>   <!--#include file="common\buttons\PriceAlert.Buttons.asp"--> <% End If
if bttns="Operators.Buttons" then %>   <!--#include file="common\buttons\Operators.Buttons.asp"-->   <% End If
if bttns="AgentAccount.Buttons" then %>   <!--#include file="common\buttons\AgentAccount.Buttons.asp"--> <% End If
if bttns="SearchBetween.Buttons" then %>   <!--#include file="common\buttons\SearchBetween.Buttons.asp"--> <% End If

if bttns="CostsByCat.Buttons" then
%>

  <!--#include file="common\buttons\CostsByCat.Buttons.asp"-->

<%
End If

if bttns="Timesheet.Buttons" then
%>

  <!--#include file="common\buttons\Timesheet.Buttons.asp"-->

<%
End If

if bttns="Payments.Buttons" then
%>
  <!--#include file="common\buttons\Payments.Buttons.asp"-->
<%
End If



if bttns="Recruiters.Buttons" then
IF  orderby = "" then orderby=" Date Desc " End If

%>

  <!--#include file="common\buttons\Recruiters.Buttons.asp"-->

<%
End If


if bttns="Accounts.Buttons" then
%>

  <!--#include file="common\buttons\Accounts.Buttons.asp"-->

<%
End If

if bttns="FixHSBC.Buttons" then
%>

  <!--#include file="common\buttons\FixHSBC.Buttons.asp"-->

<%
End If

if bttns="FixAccounts.Buttons" then
%>

  <!--#include file="common\buttons\FixAccounts.Buttons.asp"-->

<%
End If

if bttns="Gilon.Buttons" then
%>

  <!--#include file="common\buttons\Gilon.Buttons.asp"-->

<%
End If

if bttns="Dashboard.Buttons" then
%>

  <!--#include file="common\buttons\Dashboard.Buttons.asp"-->

<%
End If


if bttns="Errors.Buttons" then
%>

  <!--#include file="common\buttons\Errors.Buttons.asp"-->

<%
End If


if bttns="Payroll.Buttons" then
%>

  <!--#include file="common\buttons\Payroll.Buttons.asp"-->

<%
End If





if bttns="Instructions.Buttons" then
%>
   <!--#include file="common\buttons\Instructions.Buttons.asp"-->

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

IF  bttns="tut1.steve0.Buttons" then
%>

   <!--#include file="common\buttons\tut1.steve0.Buttons.asp"-->
<%
End If



IF  bttns="ChannelBook.Buttons" then
%>

   <!--#include file="common\buttons\ChannelBook.Buttons.asp"-->
<%
End If



IF  orderby <> "" then
    orderby = Replace(orderby,"_"," ")
    SQL_ORDERBY  = " ORDER BY " & orderby
    'Response.Write SQL_ORDERBY
    'Response.Write "<BR>"

    SQL = SQL & SQL_ORDERBY
End If



if isDebug then Response.Write SQL End If

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

' Turn on error Handling
On Error Resume Next
   RS.Open SQL, SQLCN, 1, 3
' Error Handler
If Err.Number <> 0 Then
   Response.Write "<b>Error CANNOT execute SQL: </b> <br>" & sql

   RS.Open "select 'not good' Error " , SQLCN, 1, 3

End If
On Error Goto 0 ' Reset error handling.



RS.PageSize = 1075
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
	<a href="?orderby=<%=orderBy%>&page=<%=intPage - 1%>&SearchFor=<%=SearchFor%>&uid=<%=uid%>&SearchWhere=<%=SearchWhere%>"><< <b>Prev</b></a>
<%End If%>
</font></td>
<td width="50%" align="right"><font face="Verdana, arial" size="1" >
<%If cInt(intPage) < cInt(intPageCount) Then%>
	<a href="?orderby=<%=orderBy%>&page=<%=intPage + 1%>&SearchFor=<%=SearchFor%>&uid=<%=uid%>&SearchWhere=<%=SearchWhere%>"><b>Next</b> >></a>
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
