<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="common\ExtractDates2.asp"-->
<%
   myheader = request("myheader")
   roomType = request("roomType")
%>

<h2 ALIGN=CENTER> <%=myheader%>: <%=roomType%> - <%=fromDay%> &nbsp; <%=fromMonthNme%> &nbsp; <%=FromYr%> </h2>


<table border="0" cellpadding="2" cellspacing="0" width="100%">


<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<%


myheader = request("myheader")
Response.Write "<b> " & myheader & "</b>"

d = Date()
Response.Write "<b> " & Day(d) & " "  & MonthName(Month(d)) & " " & Year(d) & " </b>"

filterDays = request("filter")
orderBy = Replace(request("orderby"),"_","  ")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")

DeleteID = request("AddID")
AddID = request("AddID")
submit = request("submit")

if orderBy <> "" then SqlorderBy=" order by " &  orderBy end if

SQL_WhereBetween = " where [StartTime] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "

SQL = "select * from vReservations "  & SQL_WhereBetween
SQL_TOT = "select count(*) as tot from vReservations "  & SQL_Where

If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND (" &_
	" [Booking] LIKE '%" & SearchFor & "%' or " &_
	" [Source] LIKE '%" & SearchFor & "%' or " &_
	" [Comment] LIKE '%" & SearchFor & "%' or " &_
	" [Amount To Establishment] LIKE '%" & SearchFor & "%' or " &_
	" [FirstName] LIKE '%" & SearchFor & "%' or " &_
	" [Surname]   LIKE '%" & SearchFor & "%' or " &_
	" Email     LIKE '%" & SearchFor & "%' or " &_

	" [Status] LIKE '%" & SearchFor & "%' or " &_

	" ID LIKE '%" & SearchFor & "%'  " &_
	")"

    SQL_WhereBetween = " where [Arrival] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
    SQL_Where = SQL_WhereBetween & SQL_SearchFor
    SQL = "select ID, Booking,Source,FirstName,Surname,Departure DepartureDate, RoomType, Email, Status from dbo.vReservationDetailRooms "  & SQL_Where

    SQL_TOT = "select count(*) as tot from vReservationDetail "  & SQL_Where


End If

myheader = "Rooms"


if (filterDays="noFilter") Then
    SQL = "select * from dbo.vReservationDetailRooms "
    SQL_TOT = "select count(*) as totSold from dbo.vReservationDetailRooms "
End If

if (filterDays="AvailFromTodaysCheckOuts" ) Then
    SQL = "select * from [dbo].[vRoomsFreeFrom10Today]"
    SQL_TOT = "select count(*) as totSold from dbo.f_RoomsFreeOnTonight ( getDate() )"
END IF

if (filterDays="TonightsFreeRooms") Then
    SQL = "select RoomType, RoomNum from dbo.f_RoomsFreeOnTonight ( getDate() )"
    SQL_TOT = "select count(*) as totSold from dbo.f_RoomsFreeOnTonight ( getDate() )"
    myheader = "Tonights Free Rooms"
End If

if (filterDays="CheckOutsT1") Then
    SQL = "select ID, Booking,Source,FirstName,Surname,Departure DepartureDate, RoomType, RoomNum, Status  from dbo.vReservationDetailRooms "
    SQL_WhereBetween = " where Departure BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
    SQL = SQL & SQL_WhereBetween
    SQL_TOT = "select count(*) as totSold from dbo.vReservationDetailRooms " & SQL_WhereBetween
    myheader = "Check Outs Today"
End If

if (filterDays="Inventory") Then
    AsOf = fromDay + " " + fromMonthNme + " " + FromYr
    SQL = "exec p_RoomsInventory '" & uid & "','" & asof &"'"
    SQL_TOT = "select count(*) as totSold from dbo.f_RoomsSoldBreakdown ('"& asof & "','"& roomType & "'," & uid &")"
End If


if (filterDays="f_RoomsSoldBreakdown") Then
    AsOf = fromDay + " " + fromMonthNme + " " + FromYr
    roomType = request("roomType")
    SQL = "select  *  from dbo.f_RoomsSoldBreakdown ('"& asof & "','"& roomType & "'," & uid &")"
    SQL_TOT = "select count(*) as totSold from dbo.f_RoomsSoldBreakdown ('"& asof & "','"& roomType & "'," & uid &")"
    Response.Write "<br>++" & SQL & "<br>"
End If


if isDebug then
   Response.Write "<br>" & SQL & "<br>"
end if

'print friendly
mysql = SQL
Response.Write "<br>" & SQL & "<br>"

Set RS_TOT = SQLCN.Execute(SQL_TOT)
Response.Write "<br><br> <b>Total Rooms Sold &nbsp; " & RS_TOT("totSold") & "</b><br><br>"

%>
<!--#include file="common\buttons\Reservations.Buttons.Rooms.asp"-->

<br>
<br>
<br>
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
    <!--#include file="common\columnHeadings.asp"-->
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
editPgLink = "Reservations_edit.asp"
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
