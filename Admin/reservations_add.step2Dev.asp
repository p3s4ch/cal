<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<script type="text/javascript" language="JavaScript">
<!--
function showMoreRooms(obj)
{
    	var div_a  = document.all("AddExtraRoom");

		div_a.style.visibility = "visible";


}


-->
</script>



<br>
<b>Step 2 Creating A New Reservation  </b> <br> <br>


Note: Where a Reservation is for 2 or more rooms , please enter in pickle as a seperate Reservation per room. <br>
The second Booking number should be the same as the original with a ".2" or ".3" etc. at the end <br>




<!--#include file="common\update_reservation.step1.asp"-->

<%
    sql ="select [Amount To Establishment],Arrival,Departure,    nights,    RoomType, " &_
          "[Cancellation Policy NR = non refundable or CN=Cancellable] , Status PaymentStatus,  " &_
          "Comment   from dbo.[vReservationDetail] where Booking = '" & Booking &"'"

    'Response.Write "sql= "& sql

	'Response.Write "<br>"

%>


<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>



<form action="reservations_add.step3.asp" name="frmUser" Method="POST">
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







<%
    clr="#C5D3E7"
%>

<tr>
   <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b> Add Room </b></font></td>
   <td bgcolor="<%=clr%>" ></td>
   <td bgcolor="<%=clr%>" ><input type="text" name="extraRooms" VALUE="1"  onclick="showMoreRooms(this)">
   </td>
</tr>



<span id="AddExtraRoom">
						<select name=moveToName>
						<option value="" SELECTED></option>
                            <%
                            Set RSOPERATOR = Server.CreateObject("ADODB.Recordset")
                            RSOPERATOR.Open "Operators", SQLCN, 2, 2
	                            Do While Not RSOPERATOR.eof
	                            %>
		                            <option value="<%=RSOPERATOR("Name")%>"><%=RSOPERATOR("Name")%></option>
	                            <%
	                        RSOPERATOR.movenext
                            Loop
                            RSOPERATOR.close
                            set RSOPERATOR = nothing
                            %>

						</select>

</span>







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
<input type="submit" name="Submit" value="NEXT" class="inputSubmit">
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
