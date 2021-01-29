<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<h2 ALIGN=CENTER> Chad Utils  </h2>


<%

sql_UserRoles = "EXEC dbo.getUserRoles 20, 'gil' "
Set RSRoles = SQLCN.Execute(sql_UserRoles)
Response.Write "<br> isChannelManager=" & RSRoles("isChannelManager")
Response.Write "<br> isGilon=" & RSRoles("isGilon")
'Session("isChannelManager") = RSRoles("isChannelManager")
%>


<table>
<tr>
<td><form action="YearViewRoom.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="YearViewRoom" class="inputSubmit">
</form></td>

<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="imports.asp?uid=<%=uid%>"><font face="Verdana" size="1" color=green ><b>&nbsp;Imports </b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td height="5">&nbsp;</td></tr>


<td><form action="Fees.asp"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Fees.asp" class="inputSubmit">
</form></td>

<td><form action="payments.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="payments" class="inputSubmit">
</form></td>


<td><form action="AvailSlots.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Create Available Slots" class="inputSubmit">
</form></td>


<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="DayRange.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Day Range</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Configuration.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Configuration</b></font></a></td></tr>


<td><form action="Main.asp?uid=<%=uid%>&Team=Rooms"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Diary Rooms" class="inputSubmit">
</form></td>

<td><form action="report9.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Report 9: P n L" class="inputSubmit">
</form></td>


<td><form action="report5.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="report5" class="inputSubmit">
</form></td>




<td><form action="pickleEmail.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="pickleEmail" class="inputSubmit">
</form></td>

<td><form action="buscard_billy.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="buscard_billy" class="inputSubmit">
</form></td>


</tr>

<tr>
<td><form action="GenericSQLExecutor.asp?uid=<%=uid%>"  name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="sql" value="dbo.fixMissingEvents_LoopAll" >
<input type="hidden" name="code" value="23" > &nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="dbo.fixMissingEvents_LoopAll" class="inputSubmit">
</form></td>


<td><form action="imports.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="imports" class="inputSubmit">
</form></td>

<td><form action="categories.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank" class="inputSubmit">
</form></td>


<td><form action="Costs.asp"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%>    />
<input type="hidden" name="doGroupByCC" value="1" />
<input type="hidden" name="doGroupByCCIsSet" value="yes" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank" class="inputSubmit">
</form></td>






<td><form action="Main.asp?uid=<%=uid%>&Team=Rooms"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank" class="inputSubmit">
</form></td>

<td>

</td>


<td><form action="report9.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank" class="inputSubmit">
</form></td>



<td><form action="UserRolesEcho.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="UserRolesEcho" class="inputSubmit">
</form></td>



<td><form action="BlankPrint.asp"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="select * from dbo.vPrintRes where [StartTime] BETWEEN '18 aug 2014' AND '26 aug 2014'" />
&nbsp; &nbsp; &nbsp;
<input type="hidden" name="uid" value="540" />
<input type="hidden" name="myheader" value="Arrivals in Next 7 Days" />
<input type="submit" name="Submit" value="BlankPrint" class="inputSubmit">
</form></td>



<td><form action="reservations_add.step1b.asp"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="select * from dbo.vPrintRes where [StartTime] BETWEEN '18 aug 2014' AND '26 aug 2014'" />
&nbsp; &nbsp; &nbsp;
<input type="hidden" name="uid" value="540" />
<input type="submit" name="Submit" value="reservations_add.step1b.asp" class="inputSubmit">
</form></td>


</tr>


</table>
notes: <br>
if chas v sholem we delete an event from a Reservation then Reservations page is broken <br>
the following should always be empty : <br>
          select * from Reservations where  not  exists (select * from cEvents where ID = EventID) <br>
if its not then fill this with temporary dates and go back and fix <br>
[dbo].[fixMissingEvents_LoopAll] calls dbo.add_ReservationByCustomerIdNewEvent <br>


</td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>


<hr>



</body>
</html>
<!--#include file="dsn2.asp"-->
