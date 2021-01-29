
<%
uid =request("uid")
bttns = request("bttns")
filter_on = request("filter_on")

if filter_on = "" OR filter_on="INITIAL" then
   myheader="Tutorial 2"
   SQL = "select ''"
 End If


if filter_on = "x" then
   myheader="filter_on=x"
   SQL = "select Admin_ID, Admin_Pass  from users where id=" & uid
 End If

if filter_on = "columnFormFormatterOverrides" then
   myheader="Change the format using a extension to the field name such as <br> MyField_Format_Ext "
   SQL_SELECT4ADD="select 'FlexCommnt' Flex_FlexCommnt , getDate() as Departs_GS6datetime_Ext  "
   SQL = "select 'CLICK ON THE ADD BUTTON TO SEE HOW TO FORMAT'"

 End If

%>




<h2>Tutorial Two: </h2>
<h2>Step One</h2>
There are two types of buttons depending on the action.It is either action ADD or FILTER <br>
ADD action is shown in Tutorial Five <br>

<h2>FILTER</h2>
This action means stay on the same page. This navigation requires two parameters: action=?
filter_on=x




<TR>
<TD>
<form action="GSAdd5.asp" name="frmUser" Method="POST">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="tableName"   value="Payments" />
<input type="hidden" name="myheader"   value="Add New Payment" />
<input type="hidden"      name="bttns"  value="Payments.Buttons" />
<input type="hidden"      name="mysql"  value="<%=SQL_SELECT4ADD %>"          />
<input type="hidden" name="actionPage" value="GSAdd5.update.asp" /> <%=spacing%>
<input type="hidden" name="filter_on" value="Show_All" /> <%=spacing%>
<input type="submit" name="Submit" value="Add New" class="inputSubmit">
</form>

</TD>
</TR>

Create a copy of this page  DrMars\pickle\MyWebs\calendar.uat\Admin\common\buttons<br>
                              call it tut1.yourPickleUser.Buttons.asp<br>
<h2>Step Two</h2><br>
In this file  calendar.uat\Admin\GSViewer5.asp<br>
add this line like the others<br>
         if bttns="tut1.yourPickleUser.Buttons" then  ...  etc etc<br>
<h2> Step Three</h2>
SAVE and   FTP both files to      /httpdocs/calendar.uat in same folder structure.<br>
If nothing is broken then copy same files to live prod in  /httpdocs/calendar/<br>
</p>

<Table>
<TR>
<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Flights.Buttons" />
<input type="hidden" name="filter_on" value="ALL_FLIGHTS" /> <%=spacing%>
<input type="submit" name="Submit" value="ALL FLIGHTS" class="inputSubmit">
</form>

</TD>

<TD>
<form action="?" name="frmUser" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden"      name="bttns" value="Flights.Buttons" />
<input type="hidden" name="filter_on" value="ALL_FLIGHTS" /> <%=spacing%>
<input type="submit" name="Submit" value="Flights" class="inputSubmit">
</form>
</TD>




