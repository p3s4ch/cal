<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<%
    CustomerID = request("ID")

    AddID = request("ID")



	If (AddID <> "") Then
	  SQL = "select * from Customers WHERE ID = " & AddID
	  Set RS = SQLCN.Execute(SQL)

	  're pull
	  CustomerID=Rs("ID")

	  Title=RS("Title")
	  Surname=RS("Surname")
	  FirstName=RS("FirstName")
	  Address=RS("Address")
	  PostCode=RS("PostCode")
	  Email=RS("Email")
	  Phone=RS("Phone")
	  Mobile=RS("Mobile")
	  HeardAboutUs=RS("HeardAboutUs")
	  Response.Write "Edit ID = " & AddID
	Else
	  AddID = -1
	  Response.Write "Add New Customer"
	End If


%>

<table border="0" cellpadding="2" cellspacing="0" width="100%">

<tr>
<td width="100%"><font face="Verdana" size="1"><br>

<form action="customers.asp" name="frmUser" Method="Get">
<table border="0" cellpadding="3" cellspacing="0" align="center">

<!--#include file="customerOnlyOffice.asp"-->

<tr>
<td align="right" valign="bottom"><input type="reset" name="Reset" value="Reset" class="inputSubmit"></td>
<td>&nbsp;</td>
<td valign="bottom">
<input type="hidden" name="uid" value="<%=uid%>" />
<input type="hidden" name="CustomerID" value="<%=AddID%>" />

<input type="submit" name="Submit" value="Save" class="inputSubmit">
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

