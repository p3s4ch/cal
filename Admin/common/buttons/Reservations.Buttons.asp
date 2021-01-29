

<%
   spacing = "&nbsp; &nbsp; &nbsp; "
%>

<Table>
<TR>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="700" />
<input type="hidden" name="myheader" value="Next 7 Days Checkins" />
<input type="hidden" name="filter" value="CheckinsT7" /> <%=spacing%>
<input type="submit" name="Submit" value="Arrivals in Next 7 Days" class="inputSubmit">
</form></TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="1000" />
<input type="hidden" name="filter" value="CheckOutsT1" /> <%=spacing%>
<input type="submit" name="Submit" value="Check Outs Today" class="inputSubmit">
</form></TD>

<TD>
<form action="YearViewRoom.asp?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="RoomType" value="Double" />
<input type="hidden" name="iMonth" value="8" />
<input type="hidden" name="iYear" value="2014" /> <%=spacing%>
<input type="submit" name="Submit" value="Std. Doubles 101 - 102 " class="inputSubmit" />
</form></TD>


<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="76" />
<input type="hidden" name="filter" value="noFilter" /> <%=spacing%>
<input type="submit" name="Submit" value="All Reservations" class="inputSubmit">
</form></TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="20" />
<input type="hidden" name="filter" value="errors" /> <%=spacing%>
<input type="submit" name="Submit" value="Errors or Missing Info" class="inputSubmit">
</form></TD>


<TD>
<form action="reservations_add.step0.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit" />
</form></TD>


</TR>

<TR>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="700" />
<input type="hidden" name="filter" value="CheckinsT1" /> <%=spacing%>
<input type="submit" name="Submit" value="Today's Arrivals" class="inputSubmit">
</form></TD>


<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="700" />
<input type="hidden" name="filter" value="CheckOuts7" /> <%=spacing%>
<input type="submit" name="Submit" value="Check Outs in Next 7 Days" class="inputSubmit">
</form></TD>



<td>
<form action="BlankPrint.asp"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="<%=print_sql%>" />
<input type="hidden" name="uid" value="540" />
<input type="hidden" name="myheader" value="<%=myheader%>" /> <%=spacing%>
<input type="submit" name="Submit" value="Print" class="inputSubmit" />
</form></td>

<td>
<form action="ReservationPrint.asp"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="<%=mysql%>" />
<input type="hidden" name="booking"  value="bos25081636k" />

<input type="hidden" name="uid" value="540" />
<input type="hidden" name="myheader" value="Reservation Confirmation" /> <%=spacing%>
<input type="submit" name="Submit" value="ReservationPrint" class="inputSubmit" />
</form></td>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="20" />
<input type="hidden" name="filter" value="groupByMultiLets" /> <%=spacing%>
<input type="submit" name="Submit" value="Reservations of Multiple Rooms" class="inputSubmit">
</form></TD>

<TD>
<form action="ReservationsRooms.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="20" />
<input type="hidden" name="myheader" value="Rooms Checked out on or before today." />
<input type="hidden" name="filter" value="AvailFromTodaysCheckOuts" /> <%=spacing%>
<input type="submit" name="Submit" value="Manage Rooms" class="inputSubmit">
</form></TD>

</TR>
</Table>


