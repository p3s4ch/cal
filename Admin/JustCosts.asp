<!--#include file="dsn.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->


<h2 ALIGN=CENTER>Costs</h2>
<form action="Costs_add.asp" name="frmUser" Method="Get">
 &nbsp; <input type="submit" name="Submit" value="Add" class="inputSubmit">
</form>


<table border="0" cellpadding="2" cellspacing="0" width="100%">

<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<!--#include file="common\ExtractDates.asp"-->

<%
orderBy = Replace(request("orderby"),"_","  ")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
SearchForCC = request("SearchForCC")
excl_cat = request("excl_cat")
DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")

if Submit ="Delete" then
	DeleteID = AddID
	AddID =""
end if
If (DeleteID <> "")      Then
      SQL = "DELETE FROM Costs WHERE SlipNo = " & DeleteID
      Set RS = SQLCN.Execute(SQL)
      Response.Write "Succesfully deleted SlipNo : " & DeleteID
end If 

doGroupByCC = request("doGroupByCC")
doGroupByCCIsSet=request("doGroupByCCIsSet")


if doGroupByCC = "" and doGroupByCCIsSet="yes" then 
  doGroupByCC="0" 
  isGroupByCC = "hasBeenUnchecked"
else
 doGroupByCC="1"
 isGroupByCC = "checked"
end if
  
  
  
%>
<!--#include file="common\update_costs.asp"-->
<%
SqlorderBy = " order by SlipNo desc "
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
if SearchForCC <> "" then SQL_SearchFor = " AND CostCode like '%"& SearchForCC &"%'" end if


SQL_Where = SQL_WhereBetween & SQL_SearchFor
'Response.Write "<br>SQL_Where" & SQL_Where & "<br><hr>"
SQL = "select SlipNo,[Date],CostCode,Supplier,Description, Total, Scan, Payment, TxID from Costs " &_
SQL_Where &  SqlorderBy
'Different SQL 
if doGroupByCC="1" then 
SQL = "select CostCode, cast(Sum(Total) as money) [Combined Total] from Costs "& SQL_WhereBetween &" group by CostCode order by 1 "
end if

Response.Write "<br>" & SQL & "<br>"

SQL_tot  =  "select IsNull(sum(IsNull(Total,0)),0)  as tot from Costs " &  SQL_Where
Set RS_TOT = SQLCN.Execute(SQL_tot)
tot = FormatNumber(RS_TOT("tot"), 2)
Response.Write "<b>Total &nbsp;&pound;" & tot & "<b><br>"

%>
<form  Method="GET"> 
   <br> 
       <div align=center>
        <input type=checkbox <%= isGroupByCC %> name="doGroupByCC" value=1 > Group By Cost Code
        <input type=hidden name="doGroupByCCIsSet" value="yes" > 
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

RS.PageSize = 3280
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
    <a href="?uid=<%=uid%>&doGroupByCCIsSet=yes&FromDay=<%=Day(betweenFrom)%>&FromMonth=<%=Month(betweenFrom)%>&FromYr=<%=Year(betweenFrom)%>&ToDay=<%=Day(betweenTo)%>&ToMonth=<%=Month(betweenTo)%>&ToYr=<%=Year(betweenTo)%>&orderby=<%=x.name%>_Desc&page=<%If NOT (orderby = "ID_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
    <%=x.name%> &nbsp;<a href="?uid=<%=uid%>&doGroupByCCIsSet=yes&FromDay=<%=Day(betweenFrom)%>&FromMonth=<%=Month(betweenFrom)%>&FromYr=<%=Year(betweenFrom)%>&ToDay=<%=Day(betweenTo)%>&ToMonth=<%=Month(betweenTo)%>&ToYr=<%=Year(betweenTo)%>
    &orderby=<%=x.name%>&page=<%If NOT (orderby = "ID_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font>
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

isCombinedTot=false
isAnID=false
isMonth=false
isDt=false

for each x in RS.Fields
if InStr(x.Name,"No") > 0 then isAnID =true else isAnID=false end if
if InStr(x.Name,"Combined Total") > 0 then isCombinedTot =true else isCombinedTot=false end if
if InStr(x.Name,"Month") > 0 then isMonth =true else isMonth=false end if
if InStr(x.Name,"Date") > 0 then isDt =true else isDt=false end if

if isDt then
 %> 
   <td bgcolor="<%=color1%>">
   <b><font face="Verdana, arial" size="1" > <%= MonthName(Month(x.value),true)%>&nbsp; <%= Day(x.value)%> &nbsp;,<%= Year(x.value) %> </font></b></td>
 <% 
 end if

if isMonth then
 %> 
   <td bgcolor="<%=color1%>">
   <b><font face="Verdana, arial" size="1" ><%= MonthName(x.value) %></font></b></td>
 <% 
 end if
 
if isAnID then
 %> 
   <td bgcolor="<%=color1%>">
   <a href=Costs_add.asp?ID=<%= x.value %>><font face="Verdana, arial" size="1" color=red><%= x.value %></font></a></td>
 <% 
 end if
 
 if isCombinedTot then
 %> 
   <td bgcolor="<%=color1%>">
   <a href="?doGroupByCCIsSet=yes&FromDay=<%=Day(betweenFrom)%>&FromMonth=<%=Month(betweenFrom)%>&FromYr=<%=Year(betweenFrom)%>&ToDay=<%=Day(betweenTo)%>&ToMonth=<%=Month(betweenTo)%>&ToYr=<%=Year(betweenTo)%>&SearchForCC=<%=RS("CostCode")%>">
     <font face="Verdana, arial" size="1" color=red><%= x.value %></font></a></td>
 <% 
 end if
 
 
 if Not isAnID and Not isCombinedTot and Not isMonth and Not isDt then
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

</table>
</body>
</html>
<!--#include file="dsn2.asp"-->
