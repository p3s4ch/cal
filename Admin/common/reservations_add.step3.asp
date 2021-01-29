<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<br>
<b>Reservation Add - Step 3 -  <i> Room Will Be Allocated Automatically </i> </b> <br>

<BR>




<!--#include file="common\update_reservation.step2.asp"-->

Now, leave this page open and try to take payment. <BR>
Only take payment if it is either NON-REFUNDABLE or it is the time of Guest Check-In <BR>
If it is a Cancellable then we must wait for arrival before charging. (Status is then set to WAITING)
Remember: <BR>
For Budget Places we charge the <i> Amount to Establishment </i>, Customer has already paid commission<BR>
For Booking.com we charge the <b>Total </b> , commission is paid by us later .<BR>
For airbnb.com  payment is automatic. <BR>

<BR>
Once done, update the STATUS and Comment below. <BR>
Status is either NEW, PAID , PAID CASH , DECLINED or WAITING <BR>
Comment should include your name. <br>
Remember to update your cash account for any cash received or paid including deposits.


<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<form action="reservations.asp" name="frmUser" Method="POST">
<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>


<%

sql ="select  Status , Comment  from dbo.[vReservationDetail] where Booking = '" & Booking & "'"
set RS = SQLCN.Execute(sql )

status = RS("Status")

clr="#DAE3F0"

%>

 <tr>
   <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b> Payment Status </b></font></td>
   <td bgcolor="<%=clr%>" ></td>
   <td bgcolor="<%=clr%>" ><input type="text" name="status" value="<%=status%>" class="inputbox" size="35" maxlength="255"></td>
</tr>


<%
    clr="#C5D3E7"
%>

<tr>
   <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b> Comment </b></font></td>
   <td bgcolor="<%=clr%>" ></td>
   <td bgcolor="<%=clr%>" ><input type="text" name="Comment" value="*" class="inputbox" size="35" maxlength="255"></td>
</tr>



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

<input type="hidden" name="AddId"  value=<%=AddId%>     >
<input type="hidden" name="uid" value="<%=uid%>" >
<input type="hidden" name="Booking" value="<%=Booking%>" >
<input type="hidden" name="Source" value="<%=Source%>" >
<input type="hidden" name="Firstname" value="<%=Firstname%>" >
<input type="hidden" name="Surname" value="<%=Surname%>" >
<input type="hidden" name="Mobile" value="<%=Mobile%>" >
<input type="hidden" name="Email" value="<%=Email%>" >
<input type="hidden" name="tableName" value="Reservations" >
<input type="hidden" name="ID" value="<%=ID%>" >
<input type="submit" name="Submit" value="FinalSave" class="inputSubmit">
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
