<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<br>
<b>Step 2 </b> <br> <br>

<%
     Booking = trim(request("Booking"))
     UpdateNumberofRoomsOnly = trim(request("UpdateNumberofRoomsOnly"))

     if Not UpdateNumberofRoomsOnly = "YES" then
     AddId = -1
%>

<!--#include file="common\update_reservation.step1.asp"-->

<%
    End If

    noOfRooms = trim(request("Number of Rooms"))
    Response.Write "noOfRooms = " & noOfRooms

    rTypes = "RoomType"
    if noOfRooms = "2" then rTypes = "RoomType, '' RoomType2 " end if
    if noOfRooms = "3" then rTypes = "RoomType, '' RoomType2, '' RoomType3 " end if
    if noOfRooms = "4" then rTypes = "RoomType, '' RoomType2, '' RoomType3,'' RoomType4 " end if
    if noOfRooms = "5" then rTypes = "RoomType, '' RoomType2, '' RoomType3,'' RoomType4,'' RoomType5 " end if
    if noOfRooms = "6" then rTypes = "RoomType, '' RoomType2, '' RoomType3,'' RoomType4,'' RoomType5,'' RoomType6" end if
    if noOfRooms = "7" then rTypes = "RoomType, '' RoomType2, '' RoomType3,'' RoomType4,'' RoomType5,'' RoomType6, '' RoomType7" end if
    if noOfRooms = "8" then rTypes = "RoomType, '' RoomType2, '' RoomType3,'' RoomType4,'' RoomType5,'' RoomType6,''  RoomType7,'' RoomType8" end if
    if noOfRooms = "9" then rTypes = "RoomType, '' RoomType2, '' RoomType3,'' RoomType4,'' RoomType5,'' RoomType6,''  RoomType7,'' RoomType8,'' RoomType9" end if
    if noOfRooms = "10" then rTypes = "RoomType, '' RoomType2, '' RoomType3,'' RoomType4,'' RoomType5,'' RoomType6,'' RoomType7,'' RoomType8,'' RoomType9,'' RoomType10" end if
    if noOfRooms = "11" then rTypes = "RoomType, '' RoomType2, '' RoomType3,'' RoomType4,'' RoomType5,'' RoomType6,'' RoomType7,'' RoomType8,'' RoomType9,'' RoomType10,'' RoomType11" end if
    if noOfRooms = "12" then rTypes = "RoomType, '' RoomType2, '' RoomType3,'' RoomType4,'' RoomType5,'' RoomType6,'' RoomType7,'' RoomType8,'' RoomType9,'' RoomType10,'' RoomType11,'' RoomType12" end if

    sql ="select top 1 Booking , Source,  FirstName,Surname,Email,Mobile, "& noOfRooms &" NoOfRooms, [Amount To Establishment] " &_
          ",Arrival Arrival_GS5date_Ext ,Departure Departure_GS5date_Ext,    nights," &_
          "[Cancellation Policy NR = non refundable or CN=Cancellable] , Status PaymentStatus,  " &_
          "Comment , GuestRequests , '' "  & rTypes &_
          " from dbo.[vReservationDetail] where Booking = '" & Booking & "'"

    Response.Write "sql= "& sql

	Response.Write "<br>"



%>


<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>



<form action="reservations_add.step3.asp" name="frmUser" Method="POST">
<input type="hidden" name="AddId"      value="-2" >
<input type="hidden" name="uid" value="<%=uid%>" >

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


<tr>
<td align="right" valign="bottom"></td>
<td>&nbsp;</td>
<td valign="bottom">

<input type="hidden" name="tableName" value="Reservations" >
<input type="hidden" name="ignoreLastXparams" value="4" >
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
