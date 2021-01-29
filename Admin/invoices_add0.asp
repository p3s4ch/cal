<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<%
   	AddID = request("ID")

	If (AddID <> "") Then
	  SQL = "select * from Invoices WHERE ID = " & AddID
	  Set RS = SQLCN.Execute(SQL)
	  Description=RS("Description")
	  TotalInclVAT=RS("TotalInclVAT")
	  CustomerID=RS("CustomerID")
	  DateOfInvoice=RS("DateOfInvoice")
	  Cat=RS("Cat")
      Status=RS("Status")

	  Response.Write "Invoice No #  " & AddID
	  Response.Write "<br> Status :" & Status
	  Response.Write "<br> CustomerID =" & CustomerID


	Else
	  AddID = -1
	  Response.Write "Add New"


     dim d
     d = Date()

     DateOfInvoice = d


	End If


%>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>


<form action="invoices.asp" name="frmUser" Method="Post">



<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Date of Invoice</b></font></td>
<td bgcolor="#DAE3F0"></td>


<td bgcolor="#DAE3F0">
	<script type="text/javascript" src="inc/popupWindow.js"></script>
	<input type="text" name="DateOfInvoice" id="DateOfInvoice" maxlength="10" size="8" value=<%=DateOfInvoice%> />
	<a href="javascript:;"
	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=DateOfInvoice&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" />
	</a>

	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;



	<select name=status>

	<option value="Not Sent" <%if Status="Not Sent" then Response.Write "selected" end if%>>Not Sent</option>
	<option value="Sent" <%if Status="Sent" then Response.Write "selected" end if%>>Sent</option>
	<option value="Paid" <%if Status="Paid" then Response.Write "selected" end if%>>Paid</option>
	<option value="1st Reminder Sent" <%if Status="1st Reminder Sent" then Response.Write "selected" end if%>>1st Reminder Sent</option>
	<option value="2nd Reminder Sent" <%if Status="2nd Reminder Sent" then Response.Write "selected" end if%>>2nd Reminder Sent</option>
	<option value="Final Reminder Sent" <%if Status="Final Reminder Sent" then Response.Write "selected" end if%>>Final Reminder Sent</option>
	</select>

	</td><tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Description</b></font></td>
<td bgcolor="#C5D3E7"></td>
<td bgcolor="#C5D3E7"><input type="text" name="Description" value="<%=Description%>" class="inputbox" size="80" maxlength="255"></td>
</tr>


<!--#include file="customer.asp"-->



<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Total Including VAT</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="TotalInclVAT" value="<%=TotalInclVAT%>" class="inputbox" size="5" maxlength="255"></td>
</tr>






<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Cat</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Cat" value="<%=Cat%>" class="inputbox" size="30" maxlength="255"></td>
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



<%
SQL2 = "SELECT * FROM Revenue where InvoiceNo =" & AddID
Dim RSREV

Set RSREV = SQLCN.Execute(SQL2)

While not RSREV.EOF
	      Response.Write  RSREV("DateReceived") & "&nbsp;&nbsp; &pound; &nbsp;" & RSREV("Amount") &"&nbsp;" & RSREV("PaymentType") & "<br>"

          RSREV.MoveNext
Wend
%>


</td>
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
