


<script>
 function getOptionValue(obj)
 {

 if (obj.name == "CustomerID")
 {

	var a = document.frmUser.CustomerID.value;
	     var temp = new Array();
		 temp = a.split('~');

     document.frmUser.CustomerIDx.value= temp[0];
     document.frmUser.Title.value = temp[1];
	 document.frmUser.PUN.value = temp[2];
     document.frmUser.Surname.value = temp[3];
     document.frmUser.Name.value = temp[4];

     document.frmUser.BillAddress.value =temp[5];

     document.frmUser.Mobile.value = temp[6];
     document.frmUser.Phone.value = temp[7];

     document.frmUser.BillPostCode.value =temp[8];
     document.frmUser.Email.value = temp[9];

     document.frmUser.HeardAboutUs.value = temp[10];
     document.frmUser.CATS.value = temp[11];

     if( document.frmUser.CustomerID.selectedIndex == 0)
           	   document.frmUser.newCustomer.checked = true;
     else
	      	   document.frmUser.newCustomer.checked = false;


	 }
 }
 </script>









<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Customer</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">

<%


sql="select * from  Customers " & sqlWHEREcustomers
if isDebug then
        Response.Write sql
End If
Set RSCustomers = SQLCN.Execute(sql)



if  isCustomer then
    viewOnlyHimself = " and ID =" & CustomerID
    Response.Write "CustomerID=" & CustomerID
    if EventCustomerID  <> "" then
       CustomerID=EventCustomerID
    End if

    ckBoxDisabled="DISABLED"
    isNewCHECKED = "checked"

    sql="select * from  Customers where ID =" & CustomerID

    

	Set RSCustomers = SQLCN.Execute(sql)
	Title=RSCustomers("Title")
	FirstName=RSCustomers("FirstName")
	PUN=RSCustomers("PUN")
	CATS=RSCustomers("CATS")
	Surname=RSCustomers("Surname")
	Address=RSCustomers("Address")
	Postcode=RSCustomers("Postcode")
	Phone=RSCustomers("Phone") 
	Mobile=RSCustomers("Mobile")  
	Email=RSCustomers("Email")
	ReqInv=RSCustomers("ReqInv")
	HeardAboutUs=RSCustomers("HeardAboutUs")


   Response.Write "<select name=CustomerID class=inputBox>"
   Response.Write "<option value=" & CustomerID & " selected>" & Surname & "</option>"
   Response.Write "</select>"

end if

'Response.Write "isCustomer=" & isCustomer
'Response.Write "EventCustomerID=" & EventCustomerID

%>


<%
if  isCustomer <> 1 then
%>

<select name="CustomerID" class="inputBox" OnChange="getOptionValue(this)" >
<option value="-1" <%=noCustomerSelected%>  firstName="" Surname="" Address="" Postcode="" Phone="" Mobile="" Email="" > select or add new</option>

<%
Set RSCustomers = Server.CreateObject("ADODB.Recordset")

sql="select * from  Customers " & sqlWHEREcustomers
if isDebug then
        Response.Write sql
End If
Set RSCustomers = SQLCN.Execute(sql)

isNewCHECKED = "checked"

Do While Not RSCustomers.eof
	isSelected =""

	if RSCustomers("ID") = EventCustomerID or RSCustomers("ID") = CustomerID then
	    isSelected = "selected"
	    isNewCHECKED = ""
	    PUN=RSCustomers("PUN")
	    CATS=RSCustomers("CATS")
	    Title=RSCustomers("Title")
	    FirstName=RSCustomers("FirstName")
	    Surname=RSCustomers("Surname")
	    Address=RSCustomers("Address")
	    Postcode=RSCustomers("Postcode")
	    Phone=RSCustomers("Phone")
	    Mobile=RSCustomers("Mobile")
	    Email=RSCustomers("Email")
	    ReqInv=RSCustomers("ReqInv")
	    Heard=RSCustomers("HeardAboutUs")

	End If
%>

<option <%=isSelected%>
value="<%=RSCustomers("ID")%>~<%=RSCustomers("Title")%>~<%=RSCustomers("PUN")%>~<%=RSCustomers("Surname")%>~<%=RSCustomers("FirstName")%>~<%=RSCustomers("Address")%>~<%=RSCustomers("Mobile")%>~<%=RSCustomers("Phone")%>~<%=RSCustomers("Postcode")%>~<%=RSCustomers("Email")%>~<%=ReqInv%>~<%=Heard%>~<%=RSCustomers("CATS")%>" >

<%=RSCustomers("Title")%>,
<%=RSCustomers("Surname")%>,
<%=RSCustomers("PUN")%>,
<%=RSCustomers("CATS")%>,
<%=RSCustomers("FirstName")%> ,&nbsp; &nbsp;
<%=RSCustomers("Address")%> ,
<%=RSCustomers("Postcode")%>

</option>

<%

RSCustomers.movenext
Loop
RSCustomers.close
set RSCustomers = nothing
%>
</select>

<%
end if
%>

</td>
</tr>



<script type="text/javascript" language="JavaScript">
 function newCustomerCk(obj)
 {
   if (frmUser.newCustomer.checked == true)
      {
         //alert("new Customer yay")

         document.frmUser.CustomerID.selectedIndex = 0
         document.frmUser.Title.value =""
         document.frmUser.PUN.value =""
         document.frmUser.CATS.value =""
         document.frmUser.Name.value =""
         document.frmUser.Surname.value =""
         document.frmUser.BillAddress.value =""
         document.frmUser.BillPostCode.value =""
         document.frmUser.Phone.value =""
         document.frmUser.Mobile.value =""
         document.frmUser.Email.value =""
         document.frmUser.HeardAboutUs.value =""

       }
   else
      alert("Please select Customer from the above list")
 }
 </script>






<tr>
<td bgcolor="#DAE3F0"> &nbsp;&nbsp;</td>
<td bgcolor="#DAE3F0"></td>

<td bgcolor="#DAE3F0">

<input type="hidden" name="CustomerIDx" value="<%=CustomerID%>" >
<font face="Verdana" size="1" color="48576C">&nbsp;<b> Organisation or Surname</b>
<input type="text" name="Surname" value="<%=Surname%>" class="inputbox" size="34" maxlength="255">
&nbsp;

<font face="Verdana" size="1" color="48576C">&nbsp;<b> PUN #</b>
<input type="text" name="PUN" value="<%=PUN%>" class="inputbox" size="34" maxlength="255">
</font>

</td>
</tr>



<tr>

<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Category of Services, CATS </b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="CATS" value="<%=CATS%>" class="inputbox" size="50" maxlength="255">
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
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Email </b></font></td>
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