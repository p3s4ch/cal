


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Customer</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">

<%
    'viewOnlyHimself = " where ID =" & CustomerID
    'Response.Write "<br> CustomerID=" & CustomerID
    'Response.Write "<br> EventCustomerID=" & EventCustomerID

    if EventCustomerID <> "" then CustomerID=EventCustomerID end if

    if CustomerID = -1 then
        'it is new so set defaults eg
    	Title =""
    else
    	sql="select * from  Customers where ID =" & CustomerID
    	Set RSCustomers = SQLCN.Execute(sql)

    	Title=trim(RSCustomers("Title"))
		FirstName=trim(RSCustomers("FirstName"))
		Surname=trim(RSCustomers("Surname"))
		Address=trim(RSCustomers("Address"))
		Postcode=trim(RSCustomers("Postcode"))
		Phone=trim(RSCustomers("Phone"))
		Mobile=trim(RSCustomers("Mobile"))
		Email=trim(RSCustomers("Email"))
		HeardAboutUs=trim(RSCustomers("HeardAboutUs"))

    end if





'Response.Write "isCustomer=" & isCustomer
'Response.Write "EventCustomerID=" & EventCustomerID
%>


</td>
</tr>



<tr>
<td bgcolor="#DAE3F0"> &nbsp;&nbsp;</td>
<td bgcolor="#DAE3F0"></td>

<td bgcolor="#DAE3F0">
<font face="Verdana" size="1" color="48576C">&nbsp;<b> Organisation or Surname</b>
<input type="hidden" name="CustomerIDx" value="<%=CustomerID%>" >

<input type="text" name="Surname" value="<%=Surname%>" class="inputbox" size="34" maxlength="255">

&nbsp;

</font>


</td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b> Name or Contact</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">
<input type="text" name="Name" value="<%=FirstName%>" class="inputbox" size="30" maxlength="255">


<font face="Verdana" size="1" color="48576C">
&nbsp;
&nbsp;

<b>Title</b>
<input type="text" name="Title" value="<%=Title%>" class="inputbox" size="8" maxlength="255">

</font>


</td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Phone</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Phone" value="<%=Phone%>" class="inputbox" size="30" maxlength="255">
                      <font face="Verdana" size="1" color="48576C"><b>Mobile</b></font>
&nbsp;                <input type="text" name="Mobile" value="<%=Mobile%>" class="inputbox" size="30" maxlength="255">


</td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Billing Address</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="BillAddress" value="<%=Address%>" class="inputbox" size="50" maxlength="255">
<font face="Verdana" size="1" color="48576C"><b>PostCode</b></font>
<input type="text" name="BillPostCode" value="<%=PostCode%>" class="inputbox" size="10" maxlength="255">
</td>
</tr>


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Email (used as a login username)</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Email" value="<%=Email%>" class="inputbox" size="50" maxlength="255">
</td>

</tr>


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Where did you hear about us ?</b></font>

</td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="HeardAboutUs" value="<%=HeardAboutUs%>" class="inputbox" size="50" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0">&nbsp;</td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
</tr>



