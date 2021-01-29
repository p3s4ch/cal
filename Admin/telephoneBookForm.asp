


<script language="JavaScript">
 function getOptionValue(obj)
 {

 if (obj.name == "CustomerID")
 {

	 //alert("value of Title is : " + document.frmUser.CustomerID.options[document.frmUser.CustomerID.selectedIndex].CusTitle);
	 //alert("value of select1 is : " + document.frmUser.CustomerID.options[document.frmUser.CustomerID.selectedIndex].value);
     //alert("innerText of select1 is : " + document.form1.select1.options[document.form1.select1.selectedIndex].innerText);
     
     document.frmUser.Title.value = document.frmUser.CustomerID.options[document.frmUser.CustomerID.selectedIndex].CusTitle;
	 document.frmUser.Name.value = document.frmUser.CustomerID.options[document.frmUser.CustomerID.selectedIndex].firstName;
     document.frmUser.Surname.value = document.frmUser.CustomerID.options[document.frmUser.CustomerID.selectedIndex].Surname;
     document.frmUser.BillAddress.value = document.frmUser.CustomerID.options[document.frmUser.CustomerID.selectedIndex].Address;
     document.frmUser.BillPostCode.value = document.frmUser.CustomerID.options[document.frmUser.CustomerID.selectedIndex].Postcode;
     document.frmUser.Phone.value = document.frmUser.CustomerID.options[document.frmUser.CustomerID.selectedIndex].Phone;
     document.frmUser.Mobile.value = document.frmUser.CustomerID.options[document.frmUser.CustomerID.selectedIndex].Mobile;
     document.frmUser.Email.value = document.frmUser.CustomerID.options[document.frmUser.CustomerID.selectedIndex].Email;
     document.frmUser.Comment.value = document.frmUser.CustomerID.options[document.frmUser.CustomerID.selectedIndex].Comment;
     

     // alert("selectedIndex : " + document.frmUser.CustomerID.selectedIndex);
     if( document.frmUser.CustomerID.selectedIndex == 0)
     {
      	   document.frmUser.newCustomer.checked = true;
     }
     else
	{
	      	document.frmUser.newCustomer.checked = false;
     }

	 }
 }
 </script>


<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Customer</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><select name="CustomerID" class="inputBox" onChange="getOptionValue(this);">


<option value="-1" <%=noCustomerSelected%>  firstName="" Surname="" Address="" Postcode="" Phone="" Mobile="" Email="" Comment="" >
select or add new</option>
<%

Set RSCustomers = Server.CreateObject("ADODB.Recordset")

RSCustomers.Open "select Title, Email, Surname, FirstName, ID,  Address,Postcode ,Phone, Mobile, Comment from  telephoneBook order by Surname", SQLCN, 2, 2

isNewCHECKED = "checked"

Do While Not RSCustomers.eof
	isSelected =""
	if RSCustomers("ID") = CustomerID then
	    isSelected = "selected"
	    isNewCHECKED = ""
	    Title=RSCustomers("Title")
	    FirstName=RSCustomers("FirstName")
	    Surname=RSCustomers("Surname")
	    Address=RSCustomers("Address")
	    Postcode=RSCustomers("Postcode")
	    Phone=RSCustomers("Phone")
	    Mobile=RSCustomers("Mobile")
	    Email=RSCustomers("Email")
	    Comment=RSCustomers("Comment")
	End If
%>

<option value="<%=RSCustomers("ID")%>" <%=isSelected%> 

firstName="<%=RSCustomers("FirstName")%>"
CusTitle="<%=RSCustomers("Title")%>"
Surname="<%=RSCustomers("Surname")%>" 
Address="<%=RSCustomers("Address")%>" 
Mobile="<%=RSCustomers("Mobile")%>"
Phone="<%=RSCustomers("Phone")%>" 
Postcode="<%=RSCustomers("Postcode")%>" 
Comment="<%=RSCustomers("Comment")%>" 
Email="<%=RSCustomers("Email")%>"  >


<%=RSCustomers("Surname")%>,
<%=RSCustomers("FirstName")%> ,&nbsp; &nbsp;<%=RSCustomers("Address")%> ,<%=RSCustomers("Postcode")%> </option>

<%

RSCustomers.movenext
Loop
RSCustomers.close
set RSCustomers = nothing
%>
</select></td>
</tr>



<script language="JavaScript">
 function newCustomerCk(obj)
 {
   if (frmUser.newCustomer.checked == true)
      {
         //alert("new Customer yay")
         document.frmUser.CustomerID.selectedIndex = 0
         document.frmUser.Title.value =""
         document.frmUser.Name.value =""
         document.frmUser.Surname.value =""
         document.frmUser.BillAddress.value =""
         document.frmUser.BillPostCode.value =""
         document.frmUser.Phone.value =""
         document.frmUser.Mobile.value =""
         document.frmUser.Email.value =""
         document.frmUser.Comment.value =""


       }
   else
      alert("Please select Customer from the above list")
 }
 </script>



<tr>
<td bgcolor="#DAE3F0">&nbsp;&nbsp; </td>

<td bgcolor="#DAE3F0">&nbsp;&nbsp; </td>

<td bgcolor="#DAE3F0"> <input type="checkbox" name="newCustomer" VALUE="1" <%=isNewCHECKED%> onclick="newCustomerCk(this)"  >
                        <font face="Verdana" size="1" color="48576C"><b>Is a New Customer</b>
                        </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>



</td>
</tr>




<tr>


<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Title</b></font></td>

<td bgcolor="#DAE3F0"></td>

<td bgcolor="#DAE3F0">
<input type="text" name="Title" value="<%=Title%>" class="inputbox" size="8" maxlength="255">
<font face="Verdana" size="1" color="48576C">
&nbsp; 
<b>Name</b>
<input type="text" name="Name" value="<%=FirstName%>" class="inputbox" size="30" maxlength="255">
&nbsp; 
<b> Surname</b> </font>
<input type="text" name="Surname" value="<%=Surname%>" class="inputbox" size="34" maxlength="255">



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
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Email</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Email" value="<%=Email%>" class="inputbox" size="50" maxlength="255"></td>
</tr>


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Comment</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><textarea name="Comment"  class="inputbox" cols="85" rows="15" value="<%=Comment%>"  /><%=Comment%></textarea> </td>
</tr>


