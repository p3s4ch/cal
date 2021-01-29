

<%


bttns = request("bttns")
filter_on = request("filter_on")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")


thedatefield = "Arrival"

if filter_on="deposits" then thedatefield= "date" end if

%>
<!--#include file="searchBetween.extract.asp"-->
<%

'Response.Write   " sqlWhereBetween = " & sqlWhereBetween



SQL_SELECT        = "select ID, Description , CustomerID Customer,  Total , TotalInclVAT , DateOfInvoice , Status "
SQL_SELECT        ="select ID id2edit, BookingID Ref, Amount , Departure, Arrival, FromAirport , ToAirport , Comment , Agent from dbo.flights order by Departure"
SQL_SELECT4ADD    = " select '' Ref , '' FromAirport ,'' ToAirport   , '' Departure_GS5date_Ext, getDate() DepartureTime_DT24H_Ext, " &_
                    " ''  ArrivalEntryTime_Ext , getDate() ArrivalTime_DT24H_Ext,  0 Amount, '' Comment , '' Agent "

SQL_SELECT4EDIT   = "select BookingID Ref, FromAirport , ToAirport ,Departure Departure_GS5date_Ext, Departure DepartureTime_DT24H_Ext, " &_
                    "Arrival ArrivalEntryTime_Ext , Arrival ArrivalTime_DT24H_Ext, Amount, Comment , Agent "

SQL_FROM          = " from Invoices "
SQL_WhereBetween = " where [DateOfInvoice] BETWEEN '" & betweenFrom &"'  AND  '" & betweenTo & "' "
SQL_ORDERBY      = " order by DateOfInvoice desc "

myheader="Flights"

addEditPgLink="Invoices_add.asp"
printPgLink="invoice_print.asp"
editPgLink="GSEdit5.asp"
editSQL=SQL_SELECT4EDIT & " FROM flights where ID= "
tableName="flights"

if filter_on = "" OR filter_on="INITIAL" then
   myheader="Reservation Reports "
   SQL = "select 'please select one of the Reports above'"
End If







if filter_on="ALL_FLIGHTS" then
   myheader="<i>ALL FLIGHTS </i>"
   SQL = SQL_SELECT
End If



spacing = "&nbsp; &nbsp; &nbsp; "

%>

<Table>
<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Flights.Buttons" />
<input type="hidden" name="filter_on" value="ALL_FLIGHTS" /> <%=spacing%>
<input type="submit" name="Submit" value="ALL FLIGHTS" class="inputSubmit">
</form>

</TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Flights.Buttons" />
<input type="hidden" name="filter_on" value="ALL_FLIGHTS" /> <%=spacing%>
<input type="submit" name="Submit" value="Flights" class="inputSubmit">
</form>
</TD>

<TD>
<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"   value="flights" />
<input type="hidden"      name="bttns"  value="ReservationReports.Buttons" />
<input type="hidden"      name="mysql"  value="<%=SQL_SELECT4ADD %>"          />
<input type="hidden" name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit">
</form>

</TD>
</TR>


</Table>

<!--#include file="searchGSBetweenDates5.asp"-->
