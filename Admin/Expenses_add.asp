<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<%
   	AddID = request("ID")
    Admin_ID = session("Admin_ID")
    isAdmin = Session("isAdmin")
    
    
    if isAdmin then
       Response.Write "<br> is Admin <br>"
       else
       Name = Admin_ID  
    End if
    
    'default
    PayMethod = "CASH"
       
	If (AddID <> "") Then
	  SQL = "select * from Expenses WHERE ID = " & AddID
	  Set RS = SQLCN.Execute(SQL)

	  Name=RS("Name")
	  Amount=RS("Amount")
	  Comment=RS("Comment")
	  paymentDate=RS("Date")

      PayMethod=RS("PayMethod")
      InvoiceGiven=RS("InvoiceGiven")


	  Response.Write "Edit Expenses No #  " & AddID
	  Response.Write "<br>"
	
	Else
	  AddID = -1
	  Response.Write "Add New"


     dim d
     d = Date()
     paymentDate = d


	End If


%>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>


<form action="Expenses.asp" name="frmUser" Method="GET">



<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>




<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Name of payee</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="Name" value="<%=Name%>" class="inputbox" size="15" maxlength="255"></td>
</tr>






<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Date </b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">
	<script type="text/javascript" src="inc/popupWindow.js"></script>
	<input type="text" name="paymentDate" id="Date" maxlength="10" size="8" value=<%=paymentDate%> />
	<a href="javascript:;"
	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=paymentDate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" /></a>




<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Comment</b></font></td>
<td bgcolor="#C5D3E7"></td>
<td bgcolor="#C5D3E7"><input type="text" name="Comment" value="<%=Comment%>" class="inputbox" size="50" maxlength="255"></td>
</tr>



<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Amount</b> </font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"> <font face="Verdana" size="1" color="48576C"><b>&pound;</b> </font>
          <input type="text" name="Amount" value="<%=Amount%>" class="inputbox" size="6" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Pay Method</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="PayMethod" value="<%=PayMethod%>" class="inputbox" size="6" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>InvoiceGiven</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="text" name="InvoiceGiven" value="<%=InvoiceGiven%>" class="inputbox" size="6" maxlength="255"></td>
</tr>



<tr>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">

<input type="hidden" name="AddId"  value=<%=AddId%> class="inputbox" size="30" maxlength="255"></td>
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
