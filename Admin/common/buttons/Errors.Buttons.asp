


<!-- remeber to add the buttons to GSViewer5.asp -->


<%

bttns = request("bttns")
handler = request("handler")

mysql = request("mysql")
where_sql = request("where_sql")
role   = request("filter_role")
SearchFor   = request("SearchFor")


if filter_on = "" OR filter_on="Initial" then
   myheader="please check all the reports above. they should all be empty "
   SQL = "select 50 [Total Errors Outstanding] "
End If


if handler = "ReservationErrors.NoRoomNum" then

   SQL_SELECT = " select Reservation id2edit,  Reservation, FirstName, Surname ,NoOfRooms Rooms "
   SQL_WHERE  = " where (NoOfRooms is null or NoOfRooms = 0) and comment <> 'NOT FOUND'  AND PaymentStatus not in ('CANCELLED') "

   SQL =        SQL_SELECT & "from dbo.[vReservationDetailRooms4edit] " & SQL_WHERE
   SQL_TOT =  " select sum(1) tot from dbo.[vReservationDetailRooms4edit] " & SQL_WHERE
   Set RS_TOT = SQLCN.Execute(SQL_TOT)
   tot = RS_TOT("tot")
   myheader="Errors of Reservations without the number of Rooms: " & tot
   editPgLink  = "Reservations_edit.asp"
End If


if handler = "ReservationErrors.NoRoomType" then
   myheader="Reservations without a Room Type"
   SQL = " select Reservation id2edit ,Reservation, FirstName, Surname ,  NoOfRooms Rooms  from vReservationDetailRooms4edit where (not NoOfRooms is  null and NoOfRooms > 0 ) " &_
          " and  not exists (select * from ReservationExtraRooms where  Booking = Reservation) and comment <> 'NOT FOUND'  AND PaymentStatus not in ('CANCELLED') "
   editPgLink  = "Reservations_edit.asp"
End If







if handler = "ReservationErrors.NoPay" then
   myheader="Reservations without Payment"
   SQL = "select top 1 * from fees "
End If




if handler = "ReservationErrors.DUPES" then
   myheader="Reservations Duplicates"
   SQL = "select * from Reservations where BookingID in ( select BookingID from Reservations group by BookingID having  count(1) >1 ) "
End If



%>




<%
   spacing = "&nbsp; &nbsp; &nbsp; "
%>

<br>
<Table border="1">

<TR>
<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Errors.Buttons" />
<input type="hidden"      name="handler" value="ReservationErrors.NoRoomNum" />
<input type="submit"     name="Submit" value="ReservationErrors: Number Of Rooms Missing " class="inputSubmit">
</form>
</TD>
</TR>

<TR>
<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Errors.Buttons" />
<input type="hidden"      name="handler" value="ReservationErrors.NoRoomType" />
<input type="submit"     name="Submit" value="ReservationErrors: No Room Type" class="inputSubmit">
</form>
</TD>
</TR>

<TR>
<TD>
<form action="?" name="frmUser" Method="POST">
<input type="hidden"      name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Errors.Buttons" />
<input type="hidden"      name="handler" value="ReservationErrors.DUPES" />
<input type="submit"     name="Submit" value="ReservationErrors DUPES" class="inputSubmit">
</form>
</TD>
</TR>


</Table>




