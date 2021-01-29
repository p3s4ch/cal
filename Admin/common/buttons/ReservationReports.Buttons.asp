

<%


bttns = request("bttns")
filter_on = request("filter_on")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")


thedatefield = "Arrival"

if filter_on="deposits" then thedatefield= "date" end if
if filter_on="moneyReceivedByStaff" then thedatefield= "date" end if

%>
<!--#include file="searchBetween.extract.asp"-->
<%

'Response.Write   " sqlWhereBetween = " & sqlWhereBetween



SQL_SELECT        = "select ID, Description , CustomerID Customer,  Total , TotalInclVAT , DateOfInvoice , Status "
SQL_FROM          = " from Invoices "
SQL_WhereBetween = " where [DateOfInvoice] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_ORDERBY      = " order by DateOfInvoice desc "

SQL = "select * from Invoices where Status='Unpaid'" & SQL_ORDERBY
myheader="Invoices"

addEditPgLink="Invoices_add.asp"
printPgLink="invoice_print.asp"
editPgLink="Invoices_add.asp"
emailPgLink="pickleChaseByEmailRes.asp"
emailChaseTable = "Reservations"

SQL_SELECT ="select id2edit,Reservation ,Surname, [GBP], Status  from vReservationDetailRooms"

if (filter_on = "" OR filter_on="INITIAL" OR filter_on="CheckinsT7" ) Then
   SQL_ARRIVALS = " select id2print id2email, id2print, id2edit,Reservation ,Surname, Email,  [GBP], Arrival , nights , RoomNum, Status , GuestRequests,  S_STATUS S_STATUS_hidden " &_
                  " from vReservationDetailRooms "
    SQL_WHERE = " where [Arrival] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
    SQL = SQL_ARRIVALS & SQL_WHERE & " AND S_STATUS not in ('CANCELLED') "
    'SQL_TOT = SQL_TOT & SQL_WHERE
    'print_sql = SQL_ARRIVALS_PRINT & SQL_WHERE
    myheader="Reservations in Next 7 days "
    editPgLink="Reservations_edit.asp"

END IF


if filter_on="No_Shows" then
   myheader="<i>No Show </i> Reservations "
   SQL = SQL_SELECT & " where [Arrival] BETWEEN '10/23/2014 1:54:24 AM' AND '10/31/2014 1:54:24 AM' "
End If


if filter_on="deposits" then
   myheader="<i>Guest Deposits</i>  "
   SQL = "select ID id2edit, BookingID Guest,  Staff , Amount, Comment from vGuestDeposits "
   SQL =  SQL & " where " & sqlWhereBetween
   Response.Write SQL
   editPgLink="cashAccount_add.asp"
End If

if filter_on="moneyReceivedByStaff" then
   Staff = request("Staff")
   if Staff ="" then Staff = "ALL" End If

   myheader="<i>Trace All Cash Received By Staff</i>  : " &  Staff
   SQL = "select ID id2edit, BookingID Guest,  Staff , Amount, Comment from vGuestDeposits "
   SQL =  SQL & " where (Staff like '%" & Staff & "%' or '"& Staff &"'='ALL' )  AND Amount > 0 AND " & sqlWhereBetween
   Response.Write SQL



   editPgLink="cashAccount_add.asp"
End If




if filter_on="Show_All" then
    myheader="Payroll: All Employees "
    SQL = SQL_SELECT
End If

if filter_on="UnPaid" then
    myheader="Unpaid Reservations"
    SQL = "select * from dbo.vReservations2Pay"
End If



spacing = "&nbsp; &nbsp; &nbsp; "

%>

<Table>
<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="bttns" value="ReservationReports.Buttons" />
<input type="hidden" name="periodID" value="700" />
<input type="hidden" name="myheader" value="Next 7 Days Checkins" />
<input type="hidden" name="filter_on" value="CheckinsT7" /> <%=spacing%>
<input type="submit" name="Submit" value="Arrivals in Next 7 Days" class="inputSubmit">
</form>
</TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="700" />
<input type="hidden" name="filter" value="CheckinsT1" /> <%=spacing%>
<input type="submit" name="Submit" value="Today's Arrivals" class="inputSubmit">
</form>
</TD>

<TD>
<form action="reservations_add.step0.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit" />
</form>
</TD>
</TR>

<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="bttns" value="ReservationReports.Buttons" />
<input type="hidden" name="filter_on" value="No_Shows" /> <%=spacing%>
<input type="submit" name="Submit" value="No Shows" class="inputSubmit">
</form>
</TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="ReservationReports.Buttons" />
<input type="hidden" name="filter_on" value="deposits" /> <%=spacing%>
<input type="submit" name="Submit" value="Trace Deposits" class="inputSubmit">
</form>
</TD>

<TD>
<form action="reservations_add.step0.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> /> <%=spacing%>
<input type="submit" name="Submit" value="Blank" class="inputSubmit" />
</form>
</TD>
</TR>



<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="ReservationReports.Buttons" />
<input type="hidden" name="filter_on" value="No_Shows" /> <%=spacing%>
<input type="submit" name="Submit" value="No_Shows" class="inputSubmit">
</form>
</TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="ReservationReports.Buttons" />
<input type="hidden" name="filter_on" value="UnPaid" /> <%=spacing%>
<input type="submit" name="Submit" value="UnPaid" class="inputSubmit">
</form>
</TD>

<TD>
<form action="reservations_add.step0.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> /> <%=spacing%>
<input type="submit" name="Submit" value="Blank" class="inputSubmit" />
</form>
</TD>
</TR>


<TR>
<TD colspan=2>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="ReservationReports.Buttons" />
<input type="hidden" name="filter_on" value="moneyReceivedByStaff" /> <%=spacing%>
Staff : <input type="text" name="Staff" value="<%=Staff%>" /> <%=spacing%>
<input type="submit" name="Submit" value="Trace Cash Received By Staff" class="inputSubmit">
</form>

</TD>

<TD>
<form action="reservations_add.step0.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> /> <%=spacing%>
<input type="submit" name="Submit" value="Blank" class="inputSubmit" />
</form>
</TD>
</TR>

</Table>

<!--#include file="searchGSBetweenDates5.asp"-->
