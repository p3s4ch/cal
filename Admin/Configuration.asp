<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<!--#include file="common\update_payment.asp"-->
<!--#include file="common\func_SQL_WhereBetweenMonth.asp"-->

<%

Response.Write "HI" & Admin_ID

%>


<h2 ALIGN=CENTER>Advanced Configuration </h2>
<table>
<tr>
<td><form action="users.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Users" class="inputSubmit">
</form></td>


<td><form action="GenericSQLViewer5.asp"  name="frmUser" Method="GET">
<input type="hidden" name="uid"   value=<%=uid%> />
<input type="hidden" name="mysql" value="select * from Operators" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="operators via GenericSQLViewer5" class="inputSubmit">
</form></td>

<td><form action="categories.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="categories" class="inputSubmit">
</form></td>


<td><form action="AvailSlots.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Create Available Operator Slots" class="inputSubmit">
</form></td>

<td><form action="AvailSlotsRoom.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Open A Room" class="inputSubmit">
</form></td>


<td><form action="Main.asp?uid=<%=uid%>&Team=Rooms"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Diary Rooms" class="inputSubmit">
</form></td>

<td><form action="Periods.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Periods" class="inputSubmit">
</form></td>


<td><form action="Preferences.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Preferences" class="inputSubmit">
</form></td>

</tr>


<tr>
<td><form action="imports.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Monthly Tasks" class="inputSubmit">
</form></td>


<td><form action="GenericSQLViewer5.asp"  name="frmUser" Method="GET">
<input type="hidden" name="uid"   value=<%=uid%> />
<input type="hidden" name="addEditPgLink"   value="TelephoneBook_add.asp" />
<input type="hidden" name="mysql" value="select ID, Comment from TelephoneBook where Title='2do' AND FirstName='monthly' AND Surname='<%=Admin_ID%>' " />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Instructions" class="inputSubmit">
</form></td>





<td><form action="operators.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Daily Tasks" class="inputSubmit">
</form></td>





<td><form action="GenericSQLViewer5.asp"  name="frmUser" Method="GET">
<input type="hidden" name="uid"   value=<%=uid%> />
<input type="hidden" name="addEditPgLink"   value="operators_add.asp" />
<input type="hidden" name="mysql" value="select * from operators" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="operators" class="inputSubmit">
</form></td>





<td><form action="AvailSlots.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank" class="inputSubmit">
</form></td>

<td><form action="Main.asp?uid=<%=uid%>&Team=Rooms"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank" class="inputSubmit">
</form></td>

<td><form action="Periods.asp?uid=<%=uid%>"  name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="blank" class="inputSubmit">
</form></td>




</tr>



</table>


webmail.123-reg.co.uk <br>
gil@micromen.co.uk :: Br[z]..[4]123


</td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
