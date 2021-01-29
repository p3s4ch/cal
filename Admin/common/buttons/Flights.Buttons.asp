
<%
bttns = request("bttns")
filter_on = request("filter_on")
hasDates = request("hasDates")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")

if filter_on = "" OR filter_on="INITIAL" then
   myheader="<h2> Flights , Hotels And check-ins   </h2> "
   tableName="flights"

   SQL_SELECT        ="select ID id2edit, BookingID Ref, Amount , Departure, Arrival, FromAirport , ToAirport , Comment , Agent from dbo.flights order by Departure"


   SQL_SELECT4ADD    = " select '' Ref , '' FromAirport ,'' ToAirport   , '' Departure_GS5date_Ext, getDate() DepartureTime_DT24H_Ext, " &_
                       " ''  ArrivalEntryTime_Ext , getDate() ArrivalTime_DT24H_Ext,  0 Amount, '' Comment , '' Agent "

   SQL_SELECT4EDIT   = "select BookingID Ref, FromAirport , ToAirport ,Departure Departure_GS5date_Ext, Departure DepartureTime_DT24H_Ext, " &_
                    "Arrival ArrivalEntryTime_Ext , Arrival ArrivalTime_DT24H_Ext, Amount, Comment , Agent "

   SQL               = SQL_SELECT & " from " & tableName
   editSQL=SQL_SELECT4EDIT & " FROM " & tableName & " where ID= "

   editPgLink="GSEdit5.asp"


End If
spacing = "&nbsp; &nbsp; &nbsp; "

%>


<table>
<tr>
<TD>
<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value="<%=uid%>" />
<input type="hidden" name="bttns" value="<%=bttns%>" />
<input type="hidden" name="tableName"   value="<%=tableName%>" />
<input type="hidden" name="myheader"   value="<%=tableName%>" />
<input type="hidden" name="mysql"  value="<%=SQL_SELECT4ADD %>" />
<input type="hidden" name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>
<input type="hidden" name="filter_on" value="<%=filter_on%>" /> <%=spacing%>
<input type="submit" name="Submit" value="ADD" class="inputSubmit">
</form>
</TD>
<tr>
</table>
