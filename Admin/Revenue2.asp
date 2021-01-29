<!-- REMOVED loggedin.asp -->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<h2 ALIGN=CENTER>Receipts</h2>


<table border="0" cellpadding="2" cellspacing="0" width="100%">

<tr>

<td width="100%"><font face="Verdana" size="1"><br>
<!--#include file="common\update_customers.asp"-->
<!--#include file="common\update_revenue.asp"-->
<%

orderBy = request("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
betweenFrom= request("betweenFrom")
betweenTo= request("betweenTo")

excl_cat = request("excl_cat")

if  excl_cat ="" then excl_cat =0 end if
if betweenFrom="" then betweenFrom="1 Jan 2006" end if
if betweenTo="" then   betweenTo="31 Dec 2009" end if

if Not IsDate(betweenFrom) then
Response.Write betweenFrom & " is Not a date"
Response.End
end if

if Not IsDate(betweenTo) then
Response.Write betweenTo & " is Not a date"
Response.End
end if


SQL_WhereBetween = " where DateReceived BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

SQL_Excl_cat = " AND cat <> " & excl_cat

If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND " &_
	" ID LIKE '%" & SearchFor & "%' or " &_
	" Surname LIKE '%" & SearchFor & "%' or " &_
	" PaymentType LIKE '%" & SearchFor & "%' or " &_
	" Amount LIKE '%" & SearchFor & "%' "

	'" i.Cat LIKE '%" & SearchFor & "%' or " &_
	'" c.FirstName LIKE '%" & SearchFor & "%' or " &_
	'" c.Address LIKE '%" & SearchFor & "%' or " &_
	'" c.PostCode LIKE '%" & SearchFor & "%' or " &_
	'" c.Title LIKE '%" & SearchFor & "%' or " &_
	'" c.Email LIKE '%" & SearchFor & "%' or " &_
	'" c.Phone LIKE '%" & SearchFor & "%' or " &_
	'" c.Mobile LIKE '%" & SearchFor & "%' or " &_
	'" c.Comment LIKE '%" & SearchFor & "%' or " &_
	'" i.CustomerID LIKE '%" & SearchFor & "%'"
End If

SQL_Where = SQL_WhereBetween & SQL_Excl_cat & SQL_SearchFor



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


SQL  ="SELECT *              FROM vRevenue " & SQL_Where & SQL_OrderBy
SQL_t= "SELECT sum(Amount) as tot FROM vRevenue " & SQL_Where

if isDebug = "1" then 
   Response.Write SQL
   Response.Write "<br>"
   Response.Write SQL_t
   Response.Write "<br>" 
   
   
End if   
   
   
Set RS_TOT = SQLCN.Execute(SQL_t)
tot= FormatNumber(RS_TOT("tot"), 2)

Response.Write "<b>Total Receipts &nbsp;&pound;" & tot & "<b><br>"
'Response.Write SQL
'Response.End

%>

<form action="Revenue.asp" Method="GET"> 


  <% if Not isAudit="1" then %>
   <DIV ALIGN=center>
    Filter out: <select name=excl_cat>
	<option value=0 <% if excl_cat=0 then Response.Write "selected" end if%> > No Filter </option>
	<option value=5 <% if excl_cat=5 then Response.Write "selected" end if%> > Computer Work </option>
	<option value=6 <% if excl_cat=6 then Response.Write "selected" end if%> > Non Computer Work </option>
	</select>
	</DIV>
	<br>
	<% end if %>
       <!--#include file="common\searchFormX.asp"-->  </form>


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
No#&nbsp;<a href="?orderby=ID_Down&page=<%If NOT (orderby = "ID_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=DateReceived_Up&page=<%If NOT (orderby = "DateReceived_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Received&nbsp;<a href="?orderby=DateReceived_Down&page=<%If NOT (orderby = "DateReceived_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>


<td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=DateReceived_Up&page=<%If NOT (orderby = "DateReceived_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Customer&nbsp;<a href="?orderby=DateReceived_Down&page=<%If NOT (orderby = "DateReceived_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>


<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=DateOfInvoice_Up&page=<%If NOT (orderby = "DateOfInvoice_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Type&nbsp;<a href="?orderby=DateOfInvoice_Down&page=<%If NOT (orderby = "DateOfInvoice_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=TotalInclVAT_Up&page=<%If NOT (orderby = "TotalInclVAT_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Invoice&nbsp;<a href="?orderby=TotalInclVAT_Down&page=<%If NOT (orderby = "TotalInclVAT_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>

<td bgcolor="#DAE3F0" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
<a href="?orderby=Cat_Up&page=<%If NOT (orderby = "Cat_Up") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
Cat&nbsp;<a href="?orderby=Cat_Down&page=<%If NOT (orderby = "Cat_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font></td>



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

<td bgcolor="#FFFFFF">

<a href="receipt_print.asp?ID=<%=RS("ID")%>">
<font face="Verdana, arial" size="1" color=green>Receipt</font> </a>  &nbsp;

<font face="Verdana, arial" size="1"><a href="revenue_add.asp?ID=<%=RS("ID")%>">Edit</a>&nbsp;</font>



</td>


<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("ID")   %></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("DateReceived") %></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Surname") %></font></td>

<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("PaymentType")%></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("InvoiceID")%></font></td>
<td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%=RS("Cat")%></font></td>

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
