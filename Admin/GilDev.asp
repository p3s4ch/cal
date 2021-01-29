<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<h2 ALIGN=CENTER>Gilon Dev plus ++ reports  </h2>


<%


Response.Write "this is using UserRoles <br> " & Admin_ID
sql_UserRoles = "EXEC dbo.getUserRoles 20, '" & Admin_ID & "'"

sql_UserRoles = "EXEC dbo.getUserRoles 20, 'Doll456' "
Response.Write  "<br>" & sql_UserRoles
Set RSRoles = SQLCN.Execute(sql_UserRoles)
Response.Write "<br> isChannelManager=" & RSRoles("isChannelManager")





sql_UserRoles = "EXEC dbo.getUserRoles 20, 'gil' "
Response.Write  "<br>" & sql_UserRoles
Set RSRoles = SQLCN.Execute(sql_UserRoles)
Response.Write "<br> isChannelManager=" & RSRoles("isChannelManager")
Response.Write "<br> isPole=" & RSRoles("isPole")
Response.Write "<br> isPole=" & RSRoles("isPole")
Response.Write "<br> isJam=" & RSRoles("isJam")
Response.Write "<br> isAdmin=" & RSRoles("isAdmin")
Response.Write "<br> isDebug=" & RSRoles("isDebug")
Response.Write "<br> isSponsor=" & RSRoles("isSponsor")
Response.Write "<br> isActive=" & RSRoles("isActive")
Response.Write "<br> isGilon=" & RSRoles("isGilon")




'Session("isChannelManager") = RSRoles("isChannelManager")
%>





<table border=1>

<tr>
<TD></TD>
<TD></TD>
<TD></TD>
<TD></TD>
<TD></TD>

<TD></TD>
<TD></TD>
<TD>




</TD>
</tr>


<tr>
<td><form action="YearViewRoom.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="YearViewRoom" class="inputSubmit">
</form></td>


<td><form action="imports.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="imports.asp" class="inputSubmit">
</form></td>

<td><form action="categories.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="categories" class="inputSubmit">
</form></td>


<td><form action="AvailSlots.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Create Available Slots" class="inputSubmit">
</form></td>

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


<td><form action="report9.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="naftali" class="inputSubmit">
</form></td>



<td><form action="blankWithmini.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blankWithmini.asp" class="inputSubmit">
</form></td>
</tr>

<!---------------------------------row 2 ------------------------------------->

<tr>
<td><form action="GenericSQLExecutor.asp?uid=<%=uid%>"  name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="sql" value="dbo.fixMissingEvents_LoopAll" >
<input type="hidden" name="code" value="23" > &nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="dbo.fixMissingEvents_LoopAll" class="inputSubmit">
</form></td>

<tr>


<td><form action="GSViewer5.asp?uid=<%=uid%>"  name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="bttns" value="GilDev.Buttons" />
<input type="hidden" name="FilterOn" value="INITIAL" />
Subscibe to newsletter likewholeinhead: <textarea rows="4" cols="50" name="mysql"> nie zawiedzie </textarea>
<input type="hidden" name="code" value="23" > &nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Go" class="inputSubmit">
</form></td>




<td><form action="imports.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank" class="inputSubmit">
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

<td><form action="AvailBlanksPages.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Blank and Generic Pages" class="inputSubmit">
</form></td>


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







<td><form action="reservations_add.step1b.asp"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="select * from dbo.vPrintRes where [StartTime] BETWEEN '18 aug 2014' AND '26 aug 2014'" />
&nbsp; &nbsp; &nbsp;
<input type="hidden" name="uid" value="540" />
<input type="submit" name="Submit" value="reservations_add.step1b.asp" class="inputSubmit">
</form></td>


</tr>

<!---------------------------------row 3 ------------------------------------->

</tr>


<tr>
<td><form action="GSAdd5.asp"  name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value= " select '<%=uid%>' uidx,  '' LogActionsMessage " >
<input type="hidden" name="myheader" value="23" > &nbsp; &nbsp; &nbsp;
<input type="hidden" name="actionPage" value="GSAdd5.update.asp" >
<input type="hidden" name="tableName" value="dbo.logs" >
<input type="submit" name="Submit" value="Test: GSAdd5.asp" class="inputSubmit">
</form></td>


<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank2" class="inputSubmit">
</form></td>

<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank3" class="inputSubmit">
</form></td>


<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%>    />
<input type="hidden" name="doGroupByCC" value="1" />
<input type="hidden" name="doGroupByCCIsSet" value="yes" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank4" class="inputSubmit">
</form></td>






<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank5" class="inputSubmit">
</form></td>

<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank6" class="inputSubmit">
</form></td>


<td><form action="blankWithMini.asp"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blankWithMini" class="inputSubmit">
</form></td>



<td><form action="BlankPrint.asp"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="select * from dbo.vPrintRes where [StartTime] BETWEEN '18 aug 2014' AND '26 aug 2014'" />
&nbsp; &nbsp; &nbsp;
<input type="hidden" name="uid" value="540" />
<input type="hidden" name="myheader" value="Arrivals in Next 7 Days" />
<input type="submit" name="Submit" value="BlankPrint" class="inputSubmit">
</form></td>



<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="select * from dbo.vPrintRes where [StartTime] BETWEEN '18 aug 2014' AND '26 aug 2014'" />
&nbsp; &nbsp; &nbsp;
<input type="hidden" name="uid" value="540" />
<input type="hidden" name="myheader" value="Arrivals in Next 7 Days" />
<input type="submit" name="Submit" value="Blank9" class="inputSubmit">
</form></td>


<TD>
<form action="ReservationsRooms.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="20" />
<input type="hidden" name="myheader" value="Rooms Checked out on or before today." />
<input type="hidden" name="filter" value="AvailFromTodaysCheckOuts" /> <%=spacing%>
<input type="submit" name="Submit" value="Available Rooms" class="inputSubmit">
</form></TD>


</tr>
<!---------------------- Row  4---------------------------------------->
<tr>


<td><form action="RoomsInventory.asp"  name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="sql" value="dbo.fixMissingEvents_LoopAll" >
<input type="hidden" name="code" value="23" > &nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="RoomsInventory" class="inputSubmit">
</form></td>


<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank2" class="inputSubmit">
</form></td>

<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank3" class="inputSubmit">
</form></td>


<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%>    />
<input type="hidden" name="doGroupByCC" value="1" />
<input type="hidden" name="doGroupByCCIsSet" value="yes" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank4" class="inputSubmit">
</form></td>

<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank5" class="inputSubmit">
</form></td>

<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank6" class="inputSubmit">
</form></td>


<td><form action="blankWithMini.asp"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blankWithMini" class="inputSubmit">
</form></td>



<td><form action="GenericSQLViewer4.asp"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="GenericSQLViewer4.asp" class="inputSubmit">
</form></td>



<td><form action="?"  name="frmUser" Method="GET">
<input type="hidden" name="mysql" value="select * from dbo.vPrintRes where [StartTime] BETWEEN '18 aug 2014' AND '26 aug 2014'" />
&nbsp; &nbsp; &nbsp;
<input type="hidden" name="uid" value="540" />
<input type="hidden" name="myheader" value="Arrivals in Next 7 Days" />
<input type="submit" name="Submit" value="Blank9" class="inputSubmit">
</form></td>


<TD>
<form action="ReservationsRooms.asp" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="periodID" value="20" />
<input type="hidden" name="myheader" value="Rooms Checked out on or before today." />
<input type="hidden" name="filter" value="AvailFromTodaysCheckOuts" /> <%=spacing%>
<input type="submit" name="Submit" value="Available Rooms" class="inputSubmit">
</form></TD>


</tr>
</table>
notes: <br>

<br>exec [dbo].[addUser] -1, 'justin17' , 2017

<br>select * from dbo.UserRoles where Admin_ID='danny3'

<br>exec dbo.addUserRole -1, 'kaz123' , 'hasDiary' ,5

<br>select distinct role from UserRoles

<br>select * from users where Admin_ID like '%justin%'

<br>[dbo].[UsersRoleClone] 'justin17' , 'danny3' , 5

<br>select distinct Admin_ID , [Role]   from UserRoles where Admin_ID ='danny3'



<br>

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
