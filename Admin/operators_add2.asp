<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<%
	AddID = request("ID")

	If (AddID <> "") Then
	  SQL = "select * from Operators WHERE ID = " & AddID
	  Set RS = SQLCN.Execute(SQL)

	  name=RS("name")
	  Plumbing=RS("Plumbing")
	  Decorating=RS("Decorating")
	  Garden=RS("Garden")
	  Quote=RS("Quote")
	  Handyman=RS("Handyman")
      Services=RS("Services")
      
      Services=RS("Telephone")
      Services=RS("Mobile")
      Services=RS("Comment") 
	  
	  Response.Write "Edit ID = " & AddID
	Else
	  AddID = -1
	  Response.Write "Add New "
	End If


%>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<form action="operators.asp" name="frmUser" Method="Post">
<table border="0" cellpadding="3" cellspacing="0" align="center">

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Name</b></font></td>
<td bgcolor="#C5D3E7"></td>
<td bgcolor="#C5D3E7"><input type="text" name="Name" value="<%=Name%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Plumbing</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Plumbing" value="<%=Plumbing%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Decorating</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Decorating" value="<%=Decorating%>" class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Garden</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Garden" value="<%=Garden%>" class="inputbox" size="30" maxlength="255"></td>
</tr>


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Quote</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Quote" value="<%=Quote%>" class="inputbox" size="30" maxlength="255"></td>
</tr>


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Handyman</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Handyman" value="<%=Handyman%>" class="inputbox" size="30" maxlength="255"></td>
</tr>


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Services Summary</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Services" value="<%=Services%>" class="inputbox" size="80" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Telephone</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Telephone" value="<%=Telephone%>" class="inputbox" size="80" maxlength="255"></td>
</tr>
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Mobile</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Mobile" value="<%=Mobile%>" class="inputbox" size="80" maxlength="255"></td>
</tr>
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Comment</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Comment" value="<%=Comment%>" class="inputbox" size="80" maxlength="255"></td>
</tr>


<tr>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="hidden" name="AddId" value=<%=AddId%> class="inputbox" size="30" maxlength="255"></td>
</tr>


<tr>
<td align="right" valign="bottom"><input type="reset" name="Reset" value="Reset" class="inputSubmit"></td>
<td>&nbsp;</td>
<td valign="bottom"><input type="submit" name="Submit" value="Save" class="inputSubmit">
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
