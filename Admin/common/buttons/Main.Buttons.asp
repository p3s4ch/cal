

<%


bttns = request("bttns")
filter_on = request("filter_on")
mysql = request("mysql")
where_sql   = request("where_sql")
role        = request("pm2")
SearchFor   = request("SearchFor")



if isDebug then
     Response.Write "<br>including Main.Buttoms.asp <br>"
End If



if isGilon then

bttns = "All.Buttons"

%>
		Telephones:<br> <form action="?" Method="POST">
		<input type="hidden"      name="bttns" value="<%=bttns%>" />
		<input type="hidden" name="filter_on"  value="TelephoneBook"  />
		<input type="hidden" name="ControlledResource"  value="<%=ControlledResource%>"  />
		<!--#include file="searchForm.asp"-->

		</form>





<%
end if


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

myheader="Main Menu"

addEditPgLink=""
printPgLink=""
editPgLink=""
editSQL=""
tableName=""


if filter_on = "" OR filter_on="INITIAL" then
    myheader="Pickle User : " & Admin_ID
    SQL = " select * from dbo.getAllMenuButtons ('" & Admin_ID & "','" & uid & "')"
End If

if filter_on="PROFILE" then
   myheader="<i>PROFILE </i>"
   SQL = "select Admin_Id Username  from Users where id ="& uid
End If


if filter_on="CONTACT_US" then
   myheader="<i>CONTACT US </i>"
   SQL = "select 'Any questions or comments please send an email <b>office@micromen.awsapps.com </b>'"
End If



spacing = "&nbsp; &nbsp; &nbsp; "

%>

<Table>
<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Main.Buttons" />
<input type="hidden" name="filter_on" value="PROFILE" /> <%=spacing%>
<input type="submit" name="Submit" value="Profile" class="inputSubmit">
</form>

</TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Main.Buttons" />
<input type="hidden" name="filter_on" value="CONTACT_US" /> <%=spacing%>
<input type="submit" name="Submit" value="Contact Us" class="inputSubmit">
</form>
</TD>


</TR>


</Table>


