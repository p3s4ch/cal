<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<br>
<b>Reservation Edit Done <i> Please Check All Details </i> </b> <br>

<BR>

<%

Booking = request("Reservation")

Response.Write "<BR>Booking. = " & Booking
%>


<!--#include file="common\update_reservation.edit.asp"-->
<!--#include file="common\update_reservation.ExtraRooms.edit.asp"-->

<%
Response.Write "<BR>Done"
Response.End

%>

</td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
