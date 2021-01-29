<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<%

    uid = request("uid")
    AddId = request("AddId")
    reason = request("reason")

    Booking = request("Booking")

	sql = "exec dbo.ReservationCancel  '" & Booking & "', '" & reason & "'," & uid

    Response.Write sql & "<br>"

    set RS = SQLCN.Execute(sql)

%>

<b>This Reservation Is Now Cancelled ! </b>



</tr>
</table></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
