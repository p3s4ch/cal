<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="common\func_SQL_WhereBetweenMonth.asp"-->


<h2 ALIGN=CENTER>Projects </h2>


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
Operator = request("Operator")
ByGroup = request("ByGroup")

Response.Write "Jobs done by operator : "& Operator & "<br>"


if Operator0="pchudy" then Operator="Tom" end if

'SQL_WhereBetween  = " where StartTime " & getSQL_WhereBetweenMonth(iMonth,iYear)

SQL_WhereBetween  = " where [date] " &  getSQL_WhereBetweenMonth2(iMonth,iYear)


if orderBy <> "" then SqlorderBy=" order by " &  orderBy end if

SQL_WhereBetween = " where [Date] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

SQL_SearchFor = " [Details] LIKE '%fern12.kitchen%'"

If NOT (SearchFor = "") Then
    SQL_SearchFor = " (" &_
    " [Details] LIKE '%" & SearchFor & "%' " &_
	" OR [ToAddress] LIKE '%" & SearchFor & "%' " &_
	")"
End If
'remove date filter
bgSQL_WhereBetween = " where "

SQL_Where = " where " & SQL_SearchFor


SQL = "select ID, StartTime Date, Details, Operator, BillTotal Total, ToAddress Code from cEvents " &  SQL_Where  & " order by StartTime desc"

if ByGroup = "y" then
   SQL = "select  ToAddress Code , sum (BillTotal) Total  from cEvents group by ToAddress"
End If

SQL_TOT = "SELECT  IsNull (Sum(BillTotal),0) Tot  FROM cEvents " &  SQL_Where



Response.Write "<br>" & SQL & "<br>"

SQL_TOT = "select sum(BillTotal) as tot from cEvents " &  SQL_Where
Set RS_TOT = SQLCN.Execute(SQL_TOT)
MonthTotal = RS_TOT("Tot")


Response.Write "<br>2. fern12.loft "


Set RS = SQLCN.Execute(SQL)

%>
<font color=blue size=3>Total for Gilon jobs + materials in <%= MonthName(iMonth) %>  &pound; <%=MonthTotal %> </font>



<form  Method="GET">
   <br>
   <input type="hidden" Name="Operator" Value="Tom" />
   <!--#include file="common\searchMonthFormWithSearch.asp"-->

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
addEditPgLink="events_add.asp"
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
