
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--REMOVED common\banner.asp ---->

<STYLE>
<!--
BODY
{ color:#000000;
  background-color:#d0d0d0;
  scrollbar-face-color:#A8DDA0;
  scrollbar-arrow-color:#FFFFFF;
  scrollbar-track-color:#EBFFED;
  scrollbar-shadow-color:#000000;
  scrollbar-highlight-color:#000000;
  scrollbar-3dlight-color:#808080;
  scrollbar-darkshadow-Color:#202020;
}
-->
</STYLE>

<h2 ALIGN=CENTER>HSBC Analysis Report</h2>
<img src="hsbc.bmp" />
<!--#include file="common\ExtractDates.asp"-->
<!--#include file="common\Menu_Bar.asp"-->


<table border="0" cellpadding="2" cellspacing="0" width="130%">

<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<%
orderBy = Replace(request("orderby"),"_","  ")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
excl_cat = request("excl_cat")
DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")
iMonth = request("iMonth")
iYear = request("iYear")

doGroupByMonth = request("doGroupByMonth")
doGroupByMonthIsSet=request("doGroupByMonthIsSet")

doGroupCoCosts = request("doGroupCoCosts")
doGroupByCoCostsIsSet=request("doGroupByCoCostsIsSet")


If Request.QueryString("page") <> "" Then
    Response.Write "isScroll &nbsp; <br>"
    doGroupByMonth = "" 
    doGroupByMonthIsSet="yes"
End if	
	
if iMonth <> "" then
betweenFrom = "1 " & MonthName(iMonth) & " " & iYear
betweenTo   = "30 " & MonthName(iMonth) & " " & iYear
end if



sql_cols = " id,  sDate as [Date],  [Transaction],  cast(Amount as money) Amount,  Sales,  Personal,  Salary,  Media,  Insurance,  Telecoms,  BankLoan,  BankCharges,  HMRC,  VAT,  Petrol,  Card,  Chq , Expenses   "

if doGroupByMonth = "" and doGroupByMonthIsSet="yes" then 
  doGroupByMonth="0" 
  isGroupByMonth = "hasBeenUnchecked"
else
 doGroupByMonth="1" 
 isGroupByMonth = "checked"
end if

if doGroupCoCosts = "" and doGroupByCoCostsIsSet="yes" then 
  doGroupCoCosts="0" 
  isdoGroupCoCosts = "hasBeenUnchecked"
else
  doGroupCoCosts="1" 
  isdoGroupCoCosts = "checked"
  sql_cols = " [sDate], [Transaction], Amount,  Sales,  Personal ,Amount - Personal as Company   "
     
end if


if orderBy <> "" then SqlorderBy=" order by " &  orderBy end if
if  excl_cat ="" then excl_cat =0 end if


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

'SQL_Where = SQL_WhereBetween & SQL_SearchFor
Response.Write "<br>betweenFrom=" & betweenFrom 
doCombineCoCosts = 1
doGroupByMonth = 0
SQL = "select " & sql_cols & " from [dbo].[HSBC_Analysis_T] " & SQL_WhereBetween 

Response.Write SQL
'Response.End

if isDebug = "1" then 
   Response.Write SQL
   Response.Write "<br>"
   'Response.Write SQL_t
   'Response.Write "<br>" 
End if   


Response.Write "<br>Withdrawers = Bank Transfer to directors personal account, personal credit cards etc"

Response.Write "<br>Media includes all advertisements, newpapers and P.R. such as Jam Media"
Response.Write "<br>Card = Commercial Card used for Wickes , Homebase and plumbing supplies"
Response.Write "<br>Petrol = Morgan Stanley used as Petrol Card"
Response.Write "<br>Expenses = Dividends, Corp  TAX, Software purchase & support from overseas requires FX transfer via Custom House XE"
Response.Write "<br>Other= check sum"
Response.Write "<br>Receipts* = This information comes from the Receipts Table"




%>
<form  Method="GET"> 
   <br>
     <div align=center>
         <input type=checkbox <%= isdoGroupCoCosts %> name="doGroupCoCosts" value=1 > Group Company Costs
        <input type=checkbox <%= isGroupByMonth %> name="doGroupByMonth" value=1 > Group By Month
        <input type=hidden name="doGroupByMonthIsSet" value="yes" >
        <input type=hidden name="doGroupByCoCostsIsSet" value="yes" >
         
       </div>
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

RS.PageSize = 850
RS.CacheSize = RS.PageSize
intPageCount = RS.PageCount
intRecordCount = RS.RecordCount


If NOT (RS.BOF AND RS.EOF) Then
%>
<table border="1" cellpadding="3" cellspacing="0" align="center">
<tr>
<td bgcolor="#FFFFFF"></td>
<%  
bgClr="#C5D3E7"
for each x in RS.Fields
    if bgClr="#C5D3E7" then bgClr="white"  else bgClr="#C5D3E7" end if
    %> 
    <td bgcolor="<%=bgClr%>" align="center"><font face="Verdana, arial" size="1" color="#000000"><b> <%=x.name%> </b></font></td>
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

isAnID=false
isMonth=false

for each x in RS.Fields

  if bgClr="#C5D3E7" then bgClr="white"  else bgClr="#C5D3E7" end if

if InStr(x.Name,"Month") > 0 then isMonth =true else isMonth=false end if
if InStr(x.Name,"No") > 0 then isAnID =true else isAnID=false end if
if isAnID then
 %> 
   <td bgcolor="<%=bgClr%>">
   <a href=Costs_add.asp?ID=<%= x.value %>><font face="Verdana, arial" size="1" color=red><%= x.value %></font></a></td>
 <% 
 end if
 
if isMonth then
 %> 
   <td bgcolor="<%=color1%>">
   <b><font face="Verdana, arial" size="1" ><%= MonthName(x.value) %></font></b></td>
 <% 
 end if
 
 
 if Not isAnID AND Not isMonth then
 %> 
   <td bgcolor="<%=bgClr%>"><font face="Verdana, arial" size="1"><%= x.value %></font></td>
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

<!-- REMOVED common copyright.asp-->
</table>
</body>
</html>
<!--#include file="dsn2.asp"-->
