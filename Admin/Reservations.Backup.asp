<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="common\ExtractDates.asp"-->

<%
   myheader = request("myheader")
%>

<h2 ALIGN=CENTER> <%=myheader%> .. </h2>
<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>
<%


filterDays = request("filter")
orderBy = Replace(request("orderby"),"_","  ")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")

DeleteID = request("AddID")
AddID = request("AddID")
submit = request("submit")

If (submit <> "Delete" ) Then
%>
      <!--#include file="common\update_reservation.asp"-->
<%
End If
%>
<!--#include file="common\generic_delete.asp"-->
<%

if orderBy <> "" then SqlorderBy=" order by " &  orderBy end if

SQL_WhereBetween = " where Arrival BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL = "select * from vReservationDetailRooms " & SQL_WhereBetween

Response.Write SQL


If NOT (SearchFor = "") Then
     SQL_SearchFor = " AND (" &_
	" Booking  LIKE '%" & SearchFor & "%'    or " &_
	" [Source] LIKE '%" & SearchFor & "%'    or " &_
	" [Comment] LIKE '%" & SearchFor & "%'   or " &_
	" Amount LIKE '%" & SearchFor & "%'      or " &_
	" [FirstName] LIKE '%" & SearchFor & "%' or " &_
	" [Surname]   LIKE '%" & SearchFor & "%' or " &_
	" Email     LIKE '%" & SearchFor & "%'   or " &_
	" Address  LIKE '%" & SearchFor & "%'    or " &_
	" PostCode LIKE '%" & SearchFor & "%'    or " &_
	" phone LIKE '%" & SearchFor & "%'       or " &_
	" [Status] LIKE '%" & SearchFor & "%' " &_
	")"

    SQL_WhereBetween = " where [Arrival] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
    SQL_Where = SQL_WhereBetween & SQL_SearchFor
    SQL = "select Booking, Booking Reservation,Source,FirstName,Surname,Arrival, Email, Status from dbo.vReservationDetailRooms4Search "  & SQL_Where
    SQL_TOT = "select count(*) as tot from vReservationDetail "  & SQL_Where


End If

myheader = "Reservations"
SQL_ARRIVALS = " select id2print, id2edit,Reservation , Source , FirstName ,Surname, [GBP], Arrival , nights , RoomType ,RoomNum, NR, Status , Comment" &_
               " from vReservationDetailRooms "
SQL_DEPARTURES = " select id2print, id2edit,Reservation , Source , FirstName ,Surname, [GBP], Departure , nights , RoomType ,RoomNum, NR, Status , Comment" &_
               " from vReservationDetailRooms "
SQL_TOT = "select count(*) as tot from vReservations "  & SQL_Where
SQL_TOT = "select count(*) as tot from dbo.vReservationDetailRooms "




if (filterDays="noFilter") Then
    SQL = "select * from dbo.vReservationDetailRooms "

End If

if (filterDays="groupByMultiLets" ) Then
    SQL = "select Booking, count(1) from dbo.vReservationDetailRooms Group By Booking having count(1) > 1"
END IF


if (filterDays="CheckinsT7" ) Then
    SQL_WhereBetween = " where [Arrival] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
    SQL = SQL_ARRIVALS & SQL_WhereBetween
    SQL_TOT = SQL_TOT & SQL_WhereBetween

END IF

if (filterDays="CheckinsT1" ) Then
    SQL = SQL_ARRIVALS & " where [Arrival] = dbo.truncDate(getDate()) "
    SQL_TOT = SQL_TOT & " where [Arrival] = dbo.truncDate(getDate()) "
    myheader = "Today's Room Checkins"
END IF


if (filterDays="CheckOuts7") Then
    SQL_WhereBetween = " where Departure BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
    SQL     = SQL_DEPARTURES & SQL_WhereBetween & " order by Departure"
    SQL_TOT = SQL_TOT & SQL_WhereBetween
    myheader = "Check outs in the next 7 days"
End If

if (filterDays="CheckOutsT1") Then
    SQL_WhereBetween = " where Departure BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
    SQL      = SQL_DEPARTURES & SQL_WhereBetween
    SQL_TOT  = SQL_TOT & SQL_WhereBetween
    myheader = "Check Outs Today"
End If


if (filterDays="errors") Then
    SQL = "select * from dbo.f_ReservationErrors ('%TEST%')"
    SQL_TOT = "select count(*) as tot from dbo.f_ReservationErrors ('%TEST%')"
    myheader = "Errors"
End If


if isDebug then
   Response.Write "<br>" & SQL & "<br>"
end if

'print friendly
mysql = SQL


Set RS_TOT = SQLCN.Execute(SQL_TOT)
Response.Write "<br><br> <b>Total Reservations &nbsp; " & RS_TOT("tot") & "</b><br>"

%>

<!--#include file="common\buttons\Reservations.Buttons.asp"-->

<form  Method="GET">
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

    if InStr(x.Name,"id2") > 0  then

    %>
      <td> &nbsp; </TD>
    <%
    Else
    %>
    <td bgcolor="#C5D3E7" align="center"><font face="Verdana, arial" size="1" color="#000000"><b>
    <a href="?betweenFrom=<%=betweenFrom%>&betweenTo=<%=betweenTo%>&orderby=<%=x.name%>_Desc&page=<%If NOT (orderby = "ID_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
    <%=x.name%> &nbsp;<a href="?betweenFrom=<%=betweenFrom%>&betweenTo=<%=betweenTo%>&orderby=<%=x.name%>&page=<%If NOT (orderby = "ID_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font>
    </td>
    <%
    End If
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
addEditPgLink = "Reservations_edit.asp"
editPgLink  = "Reservations_edit.asp"
printPgLink = "ReservationPrint.asp"
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
