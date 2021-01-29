<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="common\update_generic.asp"-->



<h2 ALIGN=CENTER>VAT View</h2>


<form action="vat_add.asp" name="frmUser" Method="Get">
 &nbsp; <input type="submit" name="Submit" value="Pay And Submit New VAT Return" class="inputSubmit"></form>


VAT Paid is calculated on actual payments in the HSBC Bank transactions during the given period [For VAT of previous period]<br> 
VAT Calculated is based on applying a simple flat rate (13%) to total Receipts. <br>
This will differ from the final VAT Declared on the VAT return due to adjustments for capital assets purchased of £2,000 or more plus errors in previous returns etc. <br>
<table border="0" cellpadding="2" cellspacing="0" width="100%">

<tr>

<td width="100%"><font face="Verdana" size="1"><br>
<!--#include file="common\ExtractDates.asp"-->
<%

orderBy = request("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")


SQL_WhereBetween = " where DateReceived BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND " &_
	" ID LIKE '%" & SearchFor & "%' or " &_
	" Surname LIKE '%" & SearchFor & "%' or " &_
	" PaymentType LIKE '%" & SearchFor & "%' or " &_
	" Amount LIKE '%" & SearchFor & "%' "

End If

SQL_Where = SQL_WhereBetween & SQL_SearchFor

SQL_Where = "where PeriodStart >= '"& betweenFrom & "'" &_
             " AND PeriodEnd <= '"& betweenTo &"'" 


If orderBy      = "" Then
	SQL_OrderBy = " ORDER BY ID DESC"

ElseIf orderBy      = "ID_Up" Then
	SQL_OrderBy = " ORDER BY ID Asc "

ElseIf orderBy      = "Amount" Then
	SQL_OrderBy = " ORDER BY Amount"

ElseIf orderBy      = "Amount_Down" Then
	SQL_OrderBy = " ORDER BY Amount DESC "
ElseIf orderBy = "Cat" Then
	SQL_OrderBy = " ORDER BY Cat"
ElseIf orderBy      = "Cat_Down" Then
	SQL_OrderBy = " ORDER BY Cat DESC "
End If



SQL  ="SELECT *  FROM vVAT "  &  SQL_Where
SQL_t= "SELECT Sum(VAT_Declared) as tot FROM vVAT  " & SQL_Where
if isDebug = "1" then 
   Response.Write SQL
   Response.Write "<br>"
   Response.Write SQL_t
   Response.Write "<br>" 
End if   


Set RS_TOT = SQLCN.Execute(SQL_t)
tot= FormatNumber(RS_TOT("tot"), 2)
Response.Write "<b>Total VAT Payable &nbsp;&pound;" & tot & "<b><br>"
'Response.Write SQL_t
'Response.End

%>
<form action="Revenue.asp" Method="GET">    
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

RS.PageSize = 80
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
Period#&nbsp;<a href="?orderby=ID_Down&page=<%If NOT (orderby = "ID_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=DateReceived_Up&page=<%If NOT (orderby = "DateReceived_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Period From&nbsp;<a href="?orderby=DateReceived_Down&page=<%If NOT (orderby = "DateReceived_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>


<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=DateReceived_Up&page=<%If NOT (orderby = "DateReceived_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Period End&nbsp;<a href="?orderby=DateReceived_Down&page=<%If NOT (orderby = "DateReceived_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>


<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=DateOfInvoice_Up&page=<%If NOT (orderby = "DateOfInvoice_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Total Receipts<a href="?orderby=DateOfInvoice_Down&page=<%If NOT (orderby = "DateOfInvoice_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Cat_Up&page=<%If NOT (orderby = "Cat_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
VAT Declared&nbsp;<a href="?orderby=Cat_Down&page=<%If NOT (orderby = "Cat_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=TotalInclVAT_Up&page=<%If NOT (orderby = "TotalInclVAT_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
VAT Paid&nbsp;<a href="?orderby=TotalInclVAT_Down&page=<%If NOT (orderby = "TotalInclVAT_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>


<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Customer_Up&page=<%If NOT (orderby = "Customer_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Comment &pound; &nbsp;<a href="?orderby=CustomerID_Down&page=<%If NOT (orderby = "Customer_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

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

<td bgcolor="#FFFFFF"></td>

<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Period")   %></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("PeriodStart") %></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("PeriodEnd") %></font></td>

<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("TurnoverByReceipts") %></font></td>

<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("VAT_Declared") %></font></td>

<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("VAT_Paid") %></font></td>



<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Comment") %></font></td>


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
