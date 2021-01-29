<!--#include file="dsn.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<%
   	AddID = request("ID")
    InvoiceID = request("InvoiceID")

 	If (AddID <> "") Then
	   Response.Write "&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<font size=20> Receipt No #  " & AddID &"</font>"
	  SQL = "select * from vRevenue WHERE ID = " & AddID
	  Set RS = SQLCN.Execute(SQL)

      Amount = RS("Amount")
      InvoiceID = RS("InvoiceID")
      DateReceived =RS("DateReceived")
	  PaymentType =RS("PaymentType")
	  'Cat=RSInvoices("Cat")

	Else
	  AddID = -1
	  Response.Write "&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<font size=20> New Receipt </font>"
	  dim d
      d = Date()
      DateReceived = d
	End If



    If (InvoiceID = "") Then
        Response.Write "InvoiceID NOT found <br>"
        Response.End
    End if




  SQL = "select * from Invoices WHERE ID = " & InvoiceID
  Set RSInvoices = SQLCN.Execute(SQL)
  if NOT RSInvoices.EOF then
  	  CustomerID = RSInvoices("CustomerID")
  	  Description = RSInvoices("Description")
  end if


  Response.Write "<br> Invoice No :" & InvoiceID


%>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>


<form action="revenue.asp" name="frmUser" Method="Post">



<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Date Received</b></font></td>
<td bgcolor="#DAE3F0"></td>


<td bgcolor="#DAE3F0">
	<script type="text/javascript" src="inc/popupWindow.js"></script>
	<input type="text" name="DateOf" id="DateOf" maxlength="10" size="8" value=<%=DateReceived%> />
	<a href="javascript:;"
	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=DateOf&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" />
	</a>

	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    Payment Type
	<select name=PaymentType>

	<option value="CASH" <%if Status="Not Sent" then Response.Write "selected" end if%>>CASH</option>
	<option value="BACS" <%if Status="Sent" then Response.Write "selected" end if%>>BACS Payment</option>
	<option value="PayPal" <%if Status="Paid" then Response.Write "selected" end if%>>Pay Pal</option>
	<option value="CCARD" <%if Status="1st Reminder Sent" then Response.Write "selected" end if%>>Credit Card</option>
	<option value="CHEQUE" <%if Status="2nd Reminder Sent" then Response.Write "selected" end if%>>CHEQUE</option>

	</select>

	</td><tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Description</b></font></td>
<td bgcolor="#C5D3E7"></td>
<td bgcolor="#C5D3E7"><input type="text" name="Description" value="<%=Description%>" class="inputbox" size="80" maxlength="255"></td>
</tr>


<!--#include file="customerOnlyOffice.asp"-->



<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Payment Received &nbsp; &pound;</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">
<input type="text" name="Amount" value="<%=Amount%>" class="inputbox" size="10" maxlength="255"></td>
</tr>



<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>



</td>
</tr>



<tr>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="hidden" name="AddId"     value=<%=AddId%> >
                      <input type="hidden" name="uid"        value=<%=uid%> >

                      <input type="hidden" name="InvoiceId" value=<%=InvoiceID%> ></td>
</tr>


<tr>


<td align="right" valign="bottom"></td>
<td>&nbsp;          <input type="submit" name="Submit" value="Save" class="inputSubmit">         </td>
<td valign="bottom">
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
