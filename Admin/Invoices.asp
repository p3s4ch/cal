
<!--#include file="dsn.asp"-->
<!--NOT include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<LINK href="ScrollBars.css" rel="stylesheet" type="text/css">

<h2 ALIGN=CENTER>Invoices.</h2>
<table><tr>


<td><form action="imports.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="imports.asp" class="inputSubmit">
</form></td>

<td><form action="Invoices.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="SearchFor" value="AllUnpaid" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="View Unpaid Invoices" class="inputSubmit">
</form></td>

<td><form action="InvoiceEvents.asp"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="InvoiceEvents" class="inputSubmit">
</form></td>


</tr>
</table>




<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>


<!--#include file="common\update_customers.asp"-->

<!--we need the CustomerID for the invoice "-->

<!--#include file="common\update_invoices.asp"-->
<!--#include file="common\ExtractDates.asp"-->

<%
uid = request("uid")

Response.Write "uid="&uid
orderBy = request.querystring("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")

%>

<form action="invoices_add.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value="<%=uid%>" >
 &nbsp; <input type="submit" name="Submit" value="Add" class="inputSubmit">
</form>



<%
SQL_WhereBetween = " where DateOfInvoice BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

If NOT (SearchFor = "") Then
     SQL_SearchFor = " (" &_
	" ID LIKE ('%" & SearchFor & "%') or " &_
	" Surname LIKE ('%" & SearchFor & "%') or " &_
	" Description LIKE ('%" & SearchFor & "%') or " &_
	" DateOfInvoice LIKE ('%" & SearchFor & "%') or " &_
	" TotalInclVAT LIKE ('%" & SearchFor & "%') or " &_
	" Comment LIKE ('%" & SearchFor & "%') or " &_
	" Status LIKE ('%" & SearchFor & "%') )"

	SQL_Where = " where " & SQL_SearchFor

Else
	SQL_SearchFor = " AND Description <> 'Cancelled'"
    SQL_Where = SQL_WhereBetween & SQL_Excl_cat & SQL_SearchFor

End If

If (SearchFor = "AllUnpaid") Then
    SQL_Where = " where Status = 'Unpaid' or  Status like '%Remind%'"
End If



If orderBy      = "" Then
	SQL_OrderBy = " ORDER BY ID DESC"

ElseIf orderBy      = "ID" Then
	SQL_OrderBy = " ORDER BY ID"

ElseIf orderBy      = "ID_Down" Then
	SQL_OrderBy = " ORDER BY ID DESC"

ElseIf orderBy      = "Description_Up" Then
	SQL_OrderBy = " ORDER BY Description"
ElseIf orderBy      = "Description_Down" Then
	SQL_OrderBy = " ORDER BY Description DESC"

ElseIf orderBy      = "DateOfInvoice_Up" Then
	SQL_OrderBy = " ORDER BY DateOfInvoice"
ElseIf orderBy      = "DateOfInvoice_Down" Then
	SQL_OrderBy = " ORDER BY DateOfInvoice DESC"

ElseIf orderBy      = "TotalInclVAT_Up" Then
	SQL_OrderBy = " ORDER BY TotalInclVAT "
ElseIf orderBy = "TotalInclVAT_Down" Then
	SQL_OrderBy = " ORDER BY TotalInclVAT DESC"


ElseIf orderBy      = "Cat_Up" Then
	SQL_OrderBy = " ORDER BY Cat "
ElseIf orderBy = "Cat_Down" Then
	SQL_OrderBy = " ORDER BY Cat DESC"
End If

SQL = "SELECT * FROM vInvoices "   & SQL_Where & SQL_OrderBy
SQL_t= "SELECT Sum(IsNull(TotalInclVAT,0)) as tot FROM vInvoices  " & SQL_Where
if isDebug = "1" then
   Response.Write SQL
   Response.Write "<br>"
   Response.Write SQL_t
   Response.Write "<br>"
End if

Set RS_TOT = SQLCN.Execute(SQL_t)
tot= RS_TOT("tot")
if trim(tot) = "" then tot = 0 end if
if IsNull(tot)  then tot = 0 end if
tot= FormatNumber(tot, 2)
Response.Write "<b>Total for this period &nbsp;&pound;" & tot & "<b><br>"
'Response.Write SQL_t
Response.End
%>
<form  Method="GET">
       <!--#include file="common\searchFormX.asp"-->
</form>
<%
'Response.End

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

<table border="0" cellpadding="3" cellspacing="0" align="center" width="100%">
<tr>

<td bgcolor="#FFFFFF"></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=ID_Down&page=<%If NOT (orderby = "ID_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
No #&nbsp;<a href="?orderby=ID&page=<%If NOT (orderby = "ID") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Description_Up&page=<%If NOT (orderby = "Description_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Description&nbsp;<a href="?orderby=Description_Down&page=<%If NOT (orderby = "Description_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Customer_Up&page=<%If NOT (orderby = "Customer_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Customer&nbsp;<a href="?orderby=CustomerID_Down&page=<%If NOT (orderby = "Customer_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=DateOfInvoice_Up&page=<%If NOT (orderby = "DateOfInvoice_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Date&nbsp;<a href="?orderby=DateOfInvoice_Down&page=<%If NOT (orderby = "DateOfInvoice_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=TotalInclVAT_Up&page=<%If NOT (orderby = "TotalInclVAT_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
 &nbsp;  &nbsp; Total &pound; &nbsp;<a href="?orderby=TotalInclVAT_Down&page=<%If NOT (orderby = "TotalInclVAT_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=TotalInclVAT_Up&page=<%If NOT (orderby = "TotalInclVAT_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
 &nbsp;  &nbsp;  VAT &pound; &nbsp;<a href="?orderby=TotalInclVAT_Down&page=<%If NOT (orderby = "TotalInclVAT_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=TotalInclVAT_Up&page=<%If NOT (orderby = "TotalInclVAT_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
 &nbsp;  Tot+VAT &pound; &nbsp;<a href="?orderby=TotalInclVAT_Down&page=<%If NOT (orderby = "TotalInclVAT_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
Balance Outstanding&nbsp; &pound; &nbsp;</b></font>
</td>

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

<a href="invoice_print.asp?uid=<%=uid%>&ID=<%=RS("ID")%>"> <font face="Verdana, arial" size="1" color=green>Preview</font> </a>  &nbsp;
<a href="invoices_add.asp?uid=<%=uid%>&ID=<%=RS("ID")%>">  <font face="Verdana, arial" size="1">Edit	</font></a>&nbsp;
<a href="revenue_add.asp?uid=<%=uid%>&InvoiceID=<%=RS("ID")%>">  <font face="Verdana, arial" size="1" color=blue>Payment</font></a>&nbsp;


</td>


<%



if RS("Status")="Paid" then
     fontcolor2="black"
     fontcolor="green"
     outstandingCk = "<img src=Tick_g.gif /> " & FormatNumber(RS("Outstanding"), 2)

     if FormatNumber(RS("Outstanding"), 2) <> 0 then
             outstandingCk = "<font color=red size=2><b>!</b></font> " & FormatNumber(RS("Outstanding"), 2)
     End If





else
    fontcolor = "red"
    fontcolor2 = "red"
    outstandingCk=" &nbsp;"& FormatNumber(RS("Outstanding"), 2)

End if





%>

<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1"><%=RS("ID")   %></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1" color=<%=fontcolor2%> ><%=Left(RS("Description"),50)   %></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1" color=<%=fontcolor2%> ><%=RS("Surname")%></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1" color=<%=fontcolor2%> ><%=RS("DateOfInvoice")%></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1" color=<%=fontcolor2%> ><%=RS("Total")%></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1" color=<%=fontcolor2%> ><%=RS("VAT")%></font></td>
<td bgcolor="<%=color2%>"><font face="Verdana, arial" size="1" color=<%=fontcolor2%> ><%=RS("TotalInclVAT")%></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1" color=<%=fontcolor%> > <b><%=RS("Status")%> </b>
 <%=outstandingCk %> </font>

</td>

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
