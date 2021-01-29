<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="common\func_SQL_WhereBetweenMonth.asp"-->
<!--not include file="common\ExtractDates.asp"-->



<%
tableName = "cEvents"
uid=request("uid")

%>

<!--#include file="common\generic_delete.asp"-->
<!--#include file="common\buttons\searchAsof.extract.asp"-->
<!--#include file="common\update_EventTimesheet.asp"-->

<%
    uid = request("uid")

    iMonth = request("iMonth")
    iYear = request("iYear")



    Operator = request("Operator_hidden")
    'Response.Write "Operator = "& Operator


    if Operator = "" then
       Operator =request("op")
    End If

    if Operator = "" then
		Admin_ID=request("Admin_ID")
		sqlop = "select top 1 [Name] from " &_
				"(select [Name] from operators where username='"&Admin_ID&"' union select 'zzz' [Name] ) t "
		set RSOP = SQLCN.execute(sqlop)
		Operator = RSOP("Name")
    End If

    val = Operator


%>


<br>
<br>
<br>

<%

sql = "select '' EntryEntryTime_Ext , getDate() [Begin Time_Ext] , DateAdd(hh,1,getDate())  [End Time_Ext] , '' [Duration Hours] , '' [Task Details_Ext] ,  " &_
	   	          " 'handyman' Category_hidden, 1  AllDay_hidden,  1 CatB_hidden ,  2676 CustomerID_hidden, 'Office_hidden' Office_hidden, " &_
	   	          " 0 BillTotal ,  '10 Fernhurst Gardens' SiteAddress_hidden, " &_
	   	          " 'HA8 7PH' SitePostCode_hidden, 1  SameAsBill_hidden, " &_
	          " 'blue' Color_hidden , '"& Operator &"'  Operator_hidden ,   'NEW' status_hidden "

%>

<form action="GSAdd5.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName" value="EventTimesheet" />
<input type="hidden" name="actionPage" value="GSAdd5.update.asp" />
<input type="hidden" name="myheader" value="Timesheet Add Entry" />
<input type="hidden" name="bttns" value="Timesheet.Buttons" />
<input type="hidden" name="op" Value="<%=Operator%>" />
<input type="hidden" name="mysql" value="<%=sql%>"   />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="ADD" class="inputSubmit">
</form>



<form  Method="GET">
   <br>
   <input type="hidden" Name="Operator" Value="<%=Operator%>" />

   <!--#include file="common\searchMonthWithOpSearch.asp"-->

</form>

<h1>Timesheet : <%= Operator  %>  for <%= MonthName(iMonth)  %> , <%= iYear  %> </h1>


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
'Operator = request("Operator")
'Operator = op "Paul"



if Operator0="pchudy" then Operator="Tom" end if
SQL_WhereBetween  = " where [date] " &  getSQL_WhereBetweenMonth2(iMonth,iYear)


if orderBy <> "" then SqlorderBy=" order by " &  orderBy end if

SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

If NOT (SearchFor = "") Then
    SQL_SearchFor = " AND (" &_
	" [Details] LIKE '%" & SearchFor & "%' " &_
	")"

'remove date filter
'SQL_WhereBetween = " where "
End If

'forgetaboutit
SQL_SearchFor = SQL_SearchFor & " AND Operator= '" & Operator & "'"

SQL_Where = SQL_WhereBetween & SQL_SearchFor


SQL = "select * from vTimesheet " &  SQL_Where  & " order by [date] desc"
SQL_TOT = "SELECT  IsNull (Sum(Total),0) Tot  FROM vTimesheet " &  SQL_Where

Set RS_TOT = SQLCN.Execute(SQL_TOT)
tots = RS_TOT("Tot")


if tots <> "" then
  Response.Write "<br><br> <b>Total &nbsp; &pound; " & FormatNumber(tots) & "</b><br>"
end if


Set RS = SQLCN.Execute(SQL)

%>







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
<td bgcolor="#FFFFFF"></td>
<%

for each x in RS.Fields

    isAnAddID=false
    if InStr(x.Name,"AddID" ) > 0 then
             isAnAddID =true
             isAnID=false
          else
             isAnAddID=false
          end if

    if isAnAddID then
	 %>

	   <td bgcolor="#FFFFFF"></td>
	 <%
    end if


    if not isAnAddID then
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

<td bgcolor="#FFFFFF"> &nbsp; </td>


<%

addEditPgLink="timesheet_add.asp?uid="&uid&"&op="&Operator
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
