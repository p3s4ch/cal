<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--REMOVED common\banner.asp ---->
<!--#include file="common\ExtractDates.asp"-->

<h2 ALIGN=CENTER>Turnover</h2>
<LINK href="ScrollBars.css" rel="stylesheet" type="text/css">
<form action="main.asp" name="frmUser" Method="Get">
 &nbsp; <input type="submit" name="Submit" value="Home" class="inputSubmit">
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

excl_cat = request("excl_cat")
excl_cat = request("Filter_excl_cat")
period_cat = request("period_cat")
period = request("period")

if  excl_cat ="" then excl_cat =0 end if
if  period_cat ="" then period_cat ="VAT" end if
if  period ="" then period =0 end if

if orderBy <> "" then SqlorderBy=" order by " &  orderBy end if
if  excl_cat ="" then excl_cat =0 end if
if betweenFrom="" then betweenFrom="1 Jan 2006" end if
if betweenTo="" then   betweenTo="31 Dec 2009" end if

SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND (" &_
	" SlipNo LIKE '%" & SearchFor & "%' or " &_
	" CostCode LIKE '%" & SearchFor & "%' or " &_
	" Supplier LIKE '%" & SearchFor & "%' or " &_
	" Description LIKE   '%" & SearchFor & "%' or " &_
	" Details  LIKE  '%" & SearchFor & "%' or " &_
	" [Date] LIKE '%" & SearchFor & "%' or " &_
	" Total LIKE '%" & SearchFor & "%' )"

End If

SQL_Where = SQL_WhereBetween & SQL_SearchFor
'Response.Write "<br>SQL_Where" & SQL_Where & "<br><hr>"
SQL = "exec turnover "&excl_cat&", 0,'"&period_cat&"'"

'Response.Write "~2 enabled"
Response.Write "<br>Sales = Total Invoice Sales"
Response.Write "<br>VAT = Sales x 17.5% "
Response.Write "<br>Turnover = Total Invoice Sales + VAT"
Response.Write "<br>Receipts = Receipts <u>during this period</u> incl. VAT on Sales <u>during this period</u> only"
Response.Write "<br>All Receipts = Receipts <u>during this period</u> incl. VAT on Sales <u>from any period</u>"


Response.Write "<br><font color=red>Unpaid = For Invoices <u>during this period</u> <i>only </i>"
Response.Write "<br>All Upaid= For all invoices </font>"

Response.Write "<br>VAT Due is based on flat rate scheme adjusted for certain inputs and any errors"


'Response.Write "<br>" & SQL & "<br>"

'SQL_tot  =  "select IsNull(sum(IsNull(Total,0)),0)  as tot from Costs " &  SQL_Where
'Set RS_TOT = SQLCN.Execute(SQL_tot)
'tot = FormatNumber(RS_TOT("tot"), 2)
'Response.Write "<b>Total &nbsp;&pound;" & tot & "<b><br>"

%>

<form action="Turnover.asp" Method="GET">
	Filter out: <select name=Filter_excl_cat disabled>
	<option value=0 <% if excl_cat=0 then Response.Write "selected" end if%> > No Filter </option>
	<option value=5 <% if excl_cat=5 then Response.Write "selected" end if%> > Computer Work </option>
	<option value=6 <% if excl_cat=6 then Response.Write "selected" end if%> > Non Computer Work </option>
	</select>

	Report Period Type <select name=period_cat>
	<option value=VAT <% if period_cat="VAT" then Response.Write "selected" end if%> > By VAT Periods </option>
	<option value=YEAR <% if period_cat="YEAR" then Response.Write "selected" end if%> > By CALENDAR YEAR </option>
	<option value=CorpTAX <% if period_cat="CorpTAX" then Response.Write "selected" end if%>  > By Corporate TAX Year </option>
	<option value=MONTH <% if period_cat="MONTH" then Response.Write "selected" end if%>> By Month </option>
	</select>


<input type="submit"  name="Submit" value="GO" class="inputSubmit">
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
<%  
for each x in RS.Fields
     
  if InStr(x.Name,"periodID") > 0 then 
   
  
   
  else
     
    %> 
    <td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
    <a href="?betweenFrom=<%=betweenFrom%>&betweenTo=<%=betweenTo%>&orderby=<%=x.name%>_Desc&page=<%If NOT (orderby = "ID_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
    <%=x.name%> &nbsp;<a href="?betweenFrom=<%=betweenFrom%>&betweenTo=<%=betweenTo%>&orderby=<%=x.name%>&page=<%If NOT (orderby = "ID_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font>
    </td>
    
<% 

   end if
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

<%  

isTurnover=false
isPeriodID=false
isMonth=false
 
for each x in RS.Fields
if InStr(x.Name,"Turnover") > 0 then isTurnover =true else isTurnover=false end if
if InStr(x.Name,"periodID") > 0 then isPeriodID =true else isPeriodID=false end if
if InStr(x.Name,"Month") > 0 then isMonth =true else isMonth=false end if


if isTurnover then
 %> 
   <td bgcolor="<%=color1%>">
   <a href=Revenue.asp?periodID=<%= RS("periodID") %> ><b><font face="Verdana, arial" size="1" color=blue><%= x.value %></font></a></b></td>
 <% 
 end if
 
 
 if isMonth then
 %> 
   <td bgcolor="<%=color1%>">
   <b><font face="Verdana, arial" size="1" ><%= MonthName(x.value) %></font></b></td>
 <% 
 end if
 
 if Not isTurnover and Not isID and Not isPeriodID and Not isMonth then
 %> 
   <td bgcolor="<%=color1%>"><font face="Verdana, arial" size="1"><%= x.value %></font></td>
 <%
 end if 
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
