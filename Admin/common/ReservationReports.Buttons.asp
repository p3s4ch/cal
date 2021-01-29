

<!--#include file="searchBetween.extract.asp"-->
<%

bttns = request("bttns")
filter_on = request("filter_on")

mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")



SQL_SELECT        = "select ID, Description , CustomerID Customer,  Total , TotalInclVAT , DateOfInvoice , Status "
SQL_FROM          = " from Invoices "
SQL_WhereBetween = " where [DateOfInvoice] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_ORDERBY      = " order by DateOfInvoice desc "

SQL = "select * from Invoices where Status='Unpaid'" & SQL_ORDERBY
myheader="Invoices"

addEditPgLink="Invoices_add.asp"
printPgLink="invoice_print.asp"
editPgLink="Invoices_add.asp"

if filter_on = "" OR filter_on="INITIAL" then
   myheader="Reservation Reports "
   SQL = "select 'please select one of the Reports above'"
End If


SQL_SELECT ="select id2edit,Reservation ,Surname, [GBP], Status  from vReservationDetailRooms"


if filter_on="No_Shows" then
   myheader="<i>No Show </i> Reservations "
   SQL = SQL_SELECT & " where [Arrival] BETWEEN '10/23/2014 1:54:24 AM' AND '10/31/2014 1:54:24 AM' "
End If


if filter_on="deposits" then
   myheader="<i>Guest Deposits</i>  "
   SQL = SQL_SELECT & " where [Arrival] BETWEEN '10/23/2014 1:54:24 AM' AND '10/31/2014 1:54:24 AM' "
End If



if filter_on="Show_All" then
    myheader="Payroll: All Employees "
    SQL = SQL_SELECT
End If


spacing = "&nbsp; &nbsp; &nbsp; "

%>

<Table>
<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="ReservationReports.Buttons" />
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
<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName" value="employees" />
<input type="hidden"      name="bttns" value="ReservationReports.Buttons" />
<input type="hidden"      name="mysql" value="select   '' ID, '' Ref , ''  Name ,'' Surname ,'' DOB , '' Address, '' Postcode ,'' Email , '' Mobile, '' NINum, 'mm/dd/yyyy' Arrival, 'mm/dd/yyyy' Departure,  '' Comment, '' isActive" />
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit">
</form>

</TD>
</TR>


</Table>

<!--#include file="searchGSBetweenDates5.asp"-->
