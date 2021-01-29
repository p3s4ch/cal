

<%
   spacing = "&nbsp; &nbsp; &nbsp; "
%>

<Table>
<!--------------------------------Row 1 -------------------------------------------->
<TR>

<TD>
<form action="GenericSQLExecutor.asp?filter=Next7" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.allocateTodaysRooms" />
<input type="hidden" name="periodID" value="700" /> <%=spacing%>
<input type="submit" name="Submit" value="Allocate Todays Rooms" class="inputSubmit">
</form></TD>

<TD bgcolor=#0099CC >
<form action="RoomsInventory.asp?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="RoomType" value="Double" />
<input type="hidden" name="iMnth" value="9" />
<input type="hidden" name="iYear" value="2014" /> <%=spacing%>
<input type="submit" name="Submit" value="Rooms Inventory" class="inputSubmit" />
</form></TD>


<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="20" />
<input type="hidden" name="myheader" value="Rooms Checked out on or before today." />
<input type="hidden" name="filter" value="AvailFromTodaysCheckOuts" /> <%=spacing%>
<input type="submit" name="Submit" value="Avail. Rooms before Todays Check-Ins" class="inputSubmit">
</form></TD>

<TD>
<form name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> /> <%=spacing%>
<input type="submit" name="Submit" value="&nbsp" class="inputSubmit" />
</form></TD>


</TR>
<!--------------------------------Row 2 -------------------------------------------->
<TR>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="700" />
<input type="hidden" name="filter" value="" /> <%=spacing%>
<input type="submit" name="Submit" value="&nbsp;" class="inputSubmit">
</form></TD>


<td>
<form action="BlankPrint.asp"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="<%=mysql%>" />
<input type="hidden" name="uid" value="540" />
<input type="hidden" name="myheader" value="<%=myheader%>" /> <%=spacing%>
<input type="submit" name="Submit" value="Print" class="inputSubmit" />
</form></td>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="76" />
<input type="hidden" name="filter" value="TonightsFreeRooms" /> <%=spacing%>
<input type="submit" name="Submit" value="Tonights Free Rooms" class="inputSubmit">
</form></TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="filter" value="Inventory" /> <%=spacing%>
<!--#include file="searchButtonAsof.asp"-->
<input type="hidden" name="myheader" value="Inventory Summary" />
<input type="submit" name="Submit" value="Inventory Summary" class="inputSubmit">
</form></TD>
</TR>

<!------------------------------ Row 3 ---------------------------------------------->

<TR>

<TD>
<form action="Reservations.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="700" />
<input type="hidden" name="myheader" value="Today's Arrivals" />
<input type="hidden" name="filter" value="CheckinsT1" /> <%=spacing%>
<input type="submit" name="Submit" value="Back To Check-ins Check-outs" class="inputSubmit" bgcolor=red />
</form></TD>


<td>
<form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="<%=mysql%>" />
<input type="hidden" name="uid" value="540" />
<input type="hidden" name="myheader" value="<%=myheader%>" /> <%=spacing%>
<input type="submit" name="Submit" value="&nbsp" class="inputSubmit" />
</form></td>

<td>
<form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="<%=mysql%>" />
<input type="hidden" name="booking"  value="bos25081636k" />
<input type="hidden" name="uid" value="540" />
<input type="hidden" name="myheader" value="Reservation Confirmation" /> <%=spacing%>
<input type="submit" name="Submit" value="&nbsp" class="inputSubmit" />
</form></td>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="filter" value="f_RoomsSoldBreakdown" /> <%=spacing%>
<!--#include file="searchButtonAsof.asp"-->
Room Type
<!--#include file="dropDownRoomType.asp"-->
<input type="hidden" name="myheader" value="Sales by Room Type" /> <%=spacing%>
<input type="submit" name="Submit" value="Rooms Sold" class="inputSubmit">
</form></TD>


</TR>



</Table>


