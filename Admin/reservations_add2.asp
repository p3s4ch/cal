<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<b>Reservation Add / Edit </b> <br>



<%
   	AddId = trim(request("ID"))
   	Response.Write "AddId= "& AddId
   	Response.Write "<br> "



   	tempID = AddId
   	if (AddId ="") or isNull(AddId) or (AddId ="-1")  Then
	    AddId = "-1"
	    tempID = 1

   			sql =    "select '' Booking, 'BudgetPlaces' Source, '' Firstname, " &_
				"'' Surname, '@' Email, '' Mobile, '' [Amount To Establishment], " &_
				" 'mm/dd/yyyy' Arrival,'mm/dd/yyyy' Departure,1 nights,'double' RoomType, '101' RoomNum, " &_
		        "'CN'  [Cancellation Policy NR = non refundable or CN=Cancellable] , 'NEW' Status, '' Comment "
	 else
	    sql =  "select Booking, Source, Firstname, " &_
				" Surname, Email, Mobile, [Amount To Establishment], " &_
				"  Arrival, Departure, nights, RoomType,  RoomNum, " &_
		        "  [Cancellation Policy NR = non refundable or CN=Cancellable] ,  Status, Comment  from dbo.[vReservationDetail] where ID = " & AddId

	end if

	'Response.Write "sql= "& sql
	Response.Write "<br>"

%>



<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>



<form action="reservations.asp" name="frmUser" Method="POST">
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
<input type="hidden" name="AddId"  value=<%=AddId%>     >
<input type="hidden" name="uid" value="<%=uid%>" >
<input type="hidden" name="tableName" value="Reservations" >
<input type="hidden" name="ID" value="<%=ID%>" >
<input type="submit" name="Submit" value="Save" class="inputSubmit">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;

<input type="submit" name="Submit" value="Delete" class="inputSubmit">


</td>
</tr>
</table>
</form>


</td>
</tr>
</table>

</td><td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1">

<form action="YearViewRoom.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="YearViewRoom" class="inputSubmit">
</form>


</td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
