<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<br>
<b>Timesheet  <i> Add Entry </i> </b>
<br>
<br>


<%
    op = request("op")
    AddID = request("AddID")

    if AddID > 1 then
    	sql = " select StartTime EntryTime , StartTime [Begin Time] , EndTime  [End Time] , duration [Duration Hours] , Details [Task Details] , " &_
			  " 'handyman' Category_hidden, 1  AllDay_hidden,  1 CatB_hidden ,  2676 CustomerID_hidden, 'Office_hidden' Office_hidden, " &_
			  "  BillTotal ,  '10 Fernhurst Gardens' SiteAddress_hidden, " &_
			  " 'HA8 7PH' SitePostCode_hidden, 1  SameAsBill_hidden, " &_
	          " Color  Color_hidden , Operator  Operator_hidden ,  Confirmed   status_hidden  from cevents where ID= " &  AddID

	Else
	   AddID = -1
	   sql = "select '' EntryTime , getDate() [Begin Time] , DateAdd(hh,1,getDate())  [End Time] , '' [Duration Hours] , '' [Task Details] ,  " &_
	   	          " 'handyman' Category_hidden, 1  AllDay_hidden,  1 CatB_hidden ,  2676 CustomerID_hidden, 'Office_hidden' Office_hidden, " &_
	   	          " 0 BillTotal ,  '10 Fernhurst Gardens' SiteAddress_hidden, " &_
	   	          " 'HA8 7PH' SitePostCode_hidden, 1  SameAsBill_hidden, " &_
	          " 'blue' Color_hidden , '"& op &"'  Operator_hidden ,   'NEW' status_hidden "

    End If


    'Response.Write sql


%>



<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>



<form action="timesheetX.asp" name="frmUser" Method="POST">
<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>
<%
set RS = SQLCN.Execute(sql )
%>




<%
clr="#DAE3F0"

for each x in RS.Fields
%>


<!--#include file="common\columnFormFormatter4Times.asp"-->

<%
   next
%>






<tr>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
</tr>


<tr>
<td align="right" valign="bottom"></td>
<td>&nbsp;</td>
<td valign="bottom">
<input type="hidden" name="AddId"  value="<%=AddId%>"     >
<input type="hidden" name="uid" value="<%=uid%>" >
<input type="hidden" name="tableName" value="Reservations" >
<input type="hidden" name="ID" value="-1" >
<input type="hidden" name="Month" value="9" >
<input type="hidden" name="Year" value="2014" >



<tr>
<td align="right" valign="bottom"></td>
<td>&nbsp;          <input type="submit" name="Submit" value="Save" class="inputSubmit">         </td>
<td valign="bottom"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;

                    <input type="submit" name="Submit" value="Delete" class="inputSubmit">
</td>
</tr>





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
