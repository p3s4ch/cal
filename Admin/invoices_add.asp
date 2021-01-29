<!--#include file="dsn.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<%
   	AddID = request("ID")
   	sv = request("sv")
   	'se =service : hm , gt , it etc
    Response.Write "sv="& sv

    Response.Write "isCustomer="& isCustomer
    Response.Write "CustomerID="& isCustomer
    Response.Write "<br>"

	If (AddID <> "") Then

	  SQL = "select * from Invoices WHERE ID = " & AddID
	  Set RS = SQLCN.Execute(SQL)
	  Description=RS("Description")
	  TotalInclVAT=RS("TotalInclVAT")
	  Total=RS("Total")
	  VATpct=RS("VATpct")
	  VAT=RS("VAT")
	  EventCustomerID=RS("CustomerID")
	  CustomerID=RS("CustomerID")
	  DateOfInvoice=RS("DateOfInvoice")
	  Cat=RS("Cat")
	  EventID=RS("EventID")
      Status=RS("Status")

      Response.Write "&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<font size=4> Invoice No #  " & AddID
      Response.Write "&nbsp; &nbsp;                <i>   for Customer  " & EventCustomerID &"</i></font><br>"
     AddPaymentLink="<a href=Revenue_add.asp?uid="&uid&"&InvoiceID="& AddID &"><font face=Verdana size=1 color=red >Add Payment</font></a><br>"

	Else
	 AddID = -1
	 Response.Write "&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<font size=20> Issue New <i> "& sv &" </i>   Invoice</font><br>"
	 dim d
     d = Date()
     DateOfInvoice = d
     AddPaymentLink="<font face=Verdana size=1 color=red >This invoice must be saved before adding payments</font></a><br>"

	End If


%>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>


<form action="GSAdd5.update.asp" name="frmUser" Method="Post">
<input type="hidden" name="uid"        value="<%=uid%>" />

<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Date of Invoice</b></font></td>
<td bgcolor="#DAE3F0"></td>


<td bgcolor="#DAE3F0">
<%
fieldName = "DateOfInvoice"
%>

    <!--#include file="common\buttons\searchAsof5.asp"-->



	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	<select name=status>
    <option value="Cancelled" <%if Status="Cancelled" then Response.Write "selected" end if%>>Cancelled</option>
	<option value="Not Sent" <%if Status="Not Sent" then Response.Write "selected" end if%>>Not Sent</option>
	<option value="Sent" <%if Status="Sent" then Response.Write "selected" end if%>>Sent</option>
	<option value="Paid" <%if Status="Paid" then Response.Write "selected" end if%>>Paid</option>
	<option value="1st Reminder Sent" <%if Status="1st Reminder Sent" then Response.Write "selected" end if%>>1st Reminder Sent</option>
	<option value="2nd Reminder Sent" <%if Status="2nd Reminder Sent" then Response.Write "selected" end if%>>2nd Reminder Sent</option>
	<option value="Final Reminder Sent" <%if Status="Final Reminder Sent" then Response.Write "selected" end if%>>Final Reminder Sent</option>
	</select>

	</td>


<tr><td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Description</b></font></td>
<td bgcolor="#C5D3E7"></td><td bgcolor="#C5D3E7">
<textarea name="Description" class="inputbox" cols="85" rows="5"> <%=Description%> </textarea></td></tr>

<!--#include file="customer.asp"-->

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Total &pound;</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Total" value="<%=Total%>" class="inputbox" size="10" maxlength="255"></td>
</tr>


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>VAT Rate</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="VATpct" value="<%=VATpct%>" class="inputbox" size="10" maxlength="255"> % </td>
</tr>



<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>VAT &pound;</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="VAT" value="<%=VAT%>" class="inputbox" size="10" maxlength="255"></td>
</tr>





<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Total Including VAT &pound;</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">
	<input type="text" name="TotalInclVAT" value="<%=TotalInclVAT%>" class="inputbox" size="10" maxlength="255">
	<input type="hidden" name="sv" value="<%=sv%>" class="inputbox" size="5" maxlength="255"></td>
</td>
</tr>



<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Payments Received:</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">

<br>


<%=AddPaymentLink %>

<%
SQL2 = "SELECT * FROM Revenue where InvoiceID =" & AddID
Dim RSREV

Set RSREV = SQLCN.Execute(SQL2)

While not RSREV.EOF
	      Response.Write  "<a href=revenue_add.asp?uid="&uid&"&ID="& RSREV("ID") & ">" & RSREV("DateReceived") & "&nbsp;&nbsp; &pound; &nbsp;" & RSREV("Amount") &"&nbsp;" & RSREV("PaymentType") & "</a> &nbsp;"
          Response.Write  "<a href=receipt_print.asp?uid="&uid&"&ID="& RSREV("ID") & "> &nbsp;&nbsp;<font color=blue> View Receipt &nbsp; </font></a><br>"

          RSREV.MoveNext
Wend
%>


</td>
</tr>





<tr>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>




<td bgcolor="#DAE3F0"> </td>
</tr>

<input type="hidden" name="AddId"      value="<%=AddId%>" >
<input type="hidden" name="tableName"  value="InvoicesV2" >
<input type="hidden" name="unused"  value="unusedPM" >
<input type="hidden" name="unused2"  value="unusedPM2" >
<tr>
<td align="right" valign="bottom"></td> <td>&nbsp;</td> <td valign="bottom">
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
<!--#include file="dsn2.asp"-->
