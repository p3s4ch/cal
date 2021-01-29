<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="common\func_SQL_WhereBetweenMonth.asp"-->


<h2 ALIGN=CENTER>HSBC Business Cards</h2>


<table border="0" cellpadding="2" cellspacing="0" width="100%">

<tr>

<td width="100%"><font face="Verdana" size="1"><br>
<!--not include file="common\ExtractDates.asp"-->

<%
iMonth=request("Month")
iYear=request("Year")

SQL_WhereBetween = " where [Date] " & getSQL_WhereBetweenMonth(iMonth,iYear)

orderBy = request("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
excl_cat = request("excl_cat")

if  excl_cat ="" then excl_cat =0 end if

SQL_WhereBetween = SQL_WhereBetween 
 

If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND (" &_
	" ID LIKE '%" & SearchFor & "%' or " &_
	" [Transaction] LIKE '%" & SearchFor & "%' or " &_
	" [Date] LIKE '%" & SearchFor & "%' or " &_
	" Amount LIKE '%" & SearchFor & "%' )"

End If

SQL_Where = SQL_WhereBetween & SQL_SearchFor
'Response.Write ">"& SQL_Where
'Response.End

If orderBy      = "" Then
	SQL_OrderBy = " ORDER BY [Date] DESC"

ElseIf orderBy      = "ID_Up" Then
	SQL_OrderBy = " ORDER BY ID Asc "

ElseIf orderBy      = "Amount" Then
	SQL_OrderBy = " ORDER BY Amount"

ElseIf orderBy      = "Amount_Down" Then
	SQL_OrderBy = " ORDER BY Amount DESC "

End If

SQL  ="SELECT *  FROM HSBC_BUSCARD " & SQL_Where & SQL_OrderBy
Response.Write SQL
if isDebug = "1" then 
   Response.Write SQL
   Response.Write "<br>"
   'Response.Write SQL_t
   'Response.Write "<br>" 
End if   


SQL_totDeposits  = "SELECT IsNull(sum(IsNull(Amount,0)),0) as tot FROM HSBC_BUSCARD " & SQL_Where &" AND Amount > 0 " 
SQL_totWithdraws= "SELECT  IsNull(sum(IsNull(Amount,0)),0)  as tot FROM HSBC_BUSCARD " & SQL_Where &" AND Amount < 0 " 
'Response.Write "<br>" & SQL_totDeposits & "<br>"


Set RS_TOT_DEPOSITS = SQLCN.Execute(SQL_totDeposits)
Set RS_TOT_WITHDRAWS = SQLCN.Execute(SQL_totWithdraws)

tot_d = FormatNumber(RS_TOT_DEPOSITS("tot"), 2)

'Response.Write "<br> withdraws=" & RS_TOT_WITHDRAWS("tot") & "<br>"

tot_w =  FormatNumber(RS_TOT_WITHDRAWS("tot"),2)


Dim tot
tot = (tot_d * 1 + tot_w)

Response.Write "<b>Total Deposits &nbsp;&pound;" & tot_d & "<b><br>"
Response.Write "<b>Total Withdraws &nbsp;&pound;"& tot_w & "<b><br>"
Response.Write "<b><br>Balance &nbsp;&pound;"    & FormatNumber(tot,2) & "<b><br>"


'Response.Write SQL
'Response.End

%>
   
  <form action="?" Method="POST">
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

RS.PageSize = 580
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
Date#&nbsp;<a href="?orderby=ID_Down&page=<%If NOT (orderby = "ID_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=DateReceived_Up&page=<%If NOT (orderby = "DateReceived_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Transaction&nbsp;<a href="?orderby=DateReceived_Down&page=<%If NOT (orderby = "DateReceived_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Customer_Up&page=<%If NOT (orderby = "Customer_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Amount &pound; &nbsp;<a href="?orderby=CustomerID_Down&page=<%If NOT (orderby = "Customer_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>


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
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><b><%= MonthName(Month(RS("Date").value),true)%>&nbsp; <%= Day(RS("Date").value)%> &nbsp;,<%= Year(RS("Date").value) %></b></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Transaction") %></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1"><%=FormatNumber(RS("Amount"), 2)%></font></td>
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
