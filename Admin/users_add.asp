<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<%
   	AddId = trim(request("ID"))
   	Admin_ID = trim(request("Admin_ID"))

   	tempID = AddId
   	if (AddId ="") or isNull(AddId) Then
	    AddId = "-1"
	    sql = "select -1 ID, '' Admin_ID , '' Admin_Pass ,'0' isContractor ,'1' isStaff ,'1' isAdmin ,'0'isDebug ,'1' isJam ,'1' showPayments ,'0' isAudit " &_
              " ,'1' isActive ,'123' Customer ,'0' seeAllCustomers , 'ALL' team"


	else

	    sql ="select * from dbo.[fUserRoles] ('"& Admin_ID &"') "

	end if

	Response.Write "sql= "& sql
	'Response.Write "<br>"
%>


<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<form action="users.asp" name="Form" Method="POST">
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

<input type="hidden" name="AddId"  value=<%=AddId%> >
<input type="hidden" name="doGroupByCCIsSet"  value=yes >
<input type="hidden" name="PeriodID"  value=20 ></td>



</tr>


<tr>
<td align="right" valign="bottom"></td>
<td>&nbsp;</td>
<td valign="bottom">  <input type="submit" name="Submit" value="Save" class="inputSubmit">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;


                      <input type="hidden" name="uid" value="<%=uid%>" />

                      <input type="submit" name="Submit" value="Delete" class="inputSubmit">
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
