<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<b>Reservation Edit + Rooms </b> <br>


<font color=red >

Guest requests field is for Room Number preference, breakfast or bike -hire depending on availability <br>
</font>

<%

    AddId = trim(request("AddIdID"))
   	BookingID = trim(request("BookingID"))

    Response.Write "AddId= "& AddId
   	Response.Write "BookingID= "& BookingID
   	Response.Write "<br> "

   	tempID = AddId
   	if (AddId ="") or isNull(AddId) or (AddId ="-1")  Then
	    AddId = "-1"
	    tempID = 1

	    sql =  "select Booking, Source, Firstname, " &_
				" Surname, Email, Mobile, [Amount To Establishment], " &_
				"  Arrival, Departure, nights, RoomType,  RoomNum, " &_
		        "  [Cancellation Policy NR = non refundable or CN=Cancellable] ,  Status, Comment  from dbo.[vReservationDetail] where ID = " & AddId

	end if

    sql = " select * from vReservationDetailRooms4edit where Reservation= '" & BookingID & "'"
    'SQLCN.Execute(sql_prep )



	Response.Write "sql= "& sql
	'Response.Write "<br>"

%>



<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<span align=center>

<form action="ReservationCancelled.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="AddId" value=<%=AddId%> />
<input type="hidden" name="Booking" value=<%=BookingID%> />
&nbsp; &nbsp; &nbsp;
Reason for Cancellation <input type="text" name="reason" value=""  />
<input type="submit" name="Submit" value="Cancel Reservation" class="inputSubmit">
</form>



<form action="Reservations_add.step2.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="AddId" value=<%=AddId%> />
<input type="hidden" name="Booking" value=<%=BookingID%> />
<input type="hidden" name="UpdateNumberofRoomsOnly" value="YES" />
&nbsp; &nbsp; &nbsp;
Number of Rooms: <input type="text" name="Number of Rooms" value=""  />
<input type="submit" name="Submit" value="Update Number of Rooms" class="inputSubmit">
</form>


<span>

<form action="reservations_edit.done.asp" name="frmUser" Method="POST">
<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>
<%
set RS = SQLCN.Execute(sql )
%>




<%
clr="#DAE3F0"

for each x in RS.Fields
%>


<!--#include file="common\columnFormFormatter.asp"-->

<%
   next
%>






<tr>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">
</td>
</tr>

<%

 mysql =  "select * from ReservationExtraRooms  where  Booking=  '" & BookingID & "'"

%>

<!--#include file="loopSimple.asp"-->





<tr>
<td align="right" valign="bottom"></td>
<td>&nbsp;</td>
<td valign="bottom">




<input type="hidden" name="AddId"  value=<%=AddId%>     >
<input type="hidden" name="uid" value="<%=uid%>" >
<input type="hidden" name="tableName" value="Reservations" >
<input type="hidden" name="ID" value="<%=ID%>" >
<input type="submit" name="Submit" value="Save" class="inputSubmit">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;






</td>
</tr>



</table>
</form>


</tr>
</table></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
