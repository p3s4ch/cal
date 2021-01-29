<!------ REMOVED loggedin.asp -->
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

<h2 ALIGN=CENTER>Operators</h2>
<img src="hsbc.bmp" />

<form action="main.asp" name="frmUser" Method="Get">
 &nbsp; <input type="submit" name="Submit" value="Home" class="inputSubmit">
</form>

<table border="0" cellpadding="2" cellspacing="0" width="130%">

<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<%
orderBy = Replace(request("orderby"),"_","  ")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
betweenFrom= request("betweenFrom")
betweenTo= request("betweenTo")
excl_cat = request("excl_cat")
DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")
iMonth = request("iMonth")
iYear = request("iYear")

doGroupByMonth = request("doGroupByMonth")
doGroupByMonthIsSet=request("doGroupByMonthIsSet")

If Request.QueryString("page") <> "" Then
    Response.Write "isScroll &nbsp; <br>"
    doGroupByMonth = "" 
    doGroupByMonthIsSet="yes"
End if	
	
if iMonth <> "" then
betweenFrom = "1 " & MonthName(iMonth) & " " & iYear
betweenTo   = "30 " & MonthName(iMonth) & " " & iYear
end if




if doGroupByMonth = "" and doGroupByMonthIsSet="yes" then 
  doGroupByMonth="0" 
  isGroupByMonth = "hasBeenUnchecked"
else
 doGroupByMonth="1"
 isGroupByMonth = "checked"
end if

if orderBy <> "" then SqlorderBy=" order by " &  orderBy end if
if  excl_cat ="" then excl_cat =0 end if
if betweenFrom="" then betweenFrom="1 May 2007" end if
if betweenTo="" then   betweenTo="30 Apr 2008" end if

if Not IsDate(betweenFrom) then
Response.Write betweenFrom & " is Not a date"
Response.End
end if

if Not IsDate(betweenTo) then
Response.Write betweenTo & " is Not a date"
Response.End
end if

'SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

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

SQL = "select * from dbo.Operators order by id "


%>
<form  Method="GET"> 
   <br>
     <!--#include file="common\searchForm.asp"-->      
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

RS.PageSize = 550
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
