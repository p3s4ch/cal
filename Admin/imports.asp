<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<h2 ALIGN=CENTER>Monthly Tasks </h2>


<table>

<tr>
<td>
<form action="pickle2spider.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.ImportJava2HSBC" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="pickle2spider" class="inputSubmit">
</form>
</td>

</tr>



<tr>
<td>
<form action="GenericSQLExecutor.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.ImportJava2HSBC" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="ImportJava2HSBC" class="inputSubmit">
</form>
</td>

</tr>
<tr>

</tr>

<tr>
<td>
<form action="GenericSQLExecutor.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.ImportHSBC2Costs" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="ImportHSBC2Costs" class="inputSubmit">
</form>
</td>
</tr>


<tr>
<td>
<form action="GenericSQLExecutor.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.ImportHSBC2Costs" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="ImportCosts2Sales" class="inputSubmit">
</form>
</td>
</tr>



<tr>
<td>
<form action="GenericSQLExecutor.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.ImportPayrollSite2Payroll" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="ImportPayrollSite2Payroll" class="inputSubmit">
</form>
</td>
</tr>



<tr>
<td>
<form action="GenericSQLExecutor.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.ImportPayroll2Costs" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="ImportPayroll2Costs" class="inputSubmit">
</form>
</td>
</tr>


<tr>

<td>
<form action="GenericSQLExecutor.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.ImportInvoices2Costs" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="ImportInvoices2Costs" class="inputSubmit">
</form>
</td>

</tr>
<tr>





<td>
<form action="UpdateCostCodes.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="Update Cost Codes and Cheques " class="inputSubmit">
</form>
</td>

</tr>
<tr>

<td>
<form action="GenericSQLExecutor.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.ImportInvoices2Costs" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="ImportInvoices2Costs" class="inputSubmit">
</form>

&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

<form action="GenericSQLExecutor.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="mysql" value="exec dbo.ImportAll" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="dbo.ImportAll" class="inputSubmit">
</form>
</td>


</tr>
<tr>


<td>

<%
SQL="select * from prep2InvoiceEvents "
addEditPgLink = "event_add.asp"
%>
<!--not include file="GenericSQLViewerMiniDev.asp"-->

<form action="CreateInvoices.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="loopAll" value="no" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="CreateInvoicesFromEventsByCustomerID" class="inputSubmit">
<input type="text" name="CustomerID" class="inputbox" size="10" maxlength="255">
</form>

</td></tr>


<tr><td>&nbsp;</td></tr>




<tr><td>

<b>1st of each month</b><br>
Click the following button on the 1st of each month.<br>
Then go look at the unpaid invoices and send them an email that their invoices are ready.<br>
<form action="CreateInvoices.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
<input type="hidden" name="loopAll" value="yes" />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="[CreateInvoicesFromEventsByCustomerID_LoopAll]" class="inputSubmit">
</form>

</td></tr>
<tr><td>


<form action="CleanInvoice.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="[CleanInvoice]" class="inputSubmit">
<input type="text" name="InvoiceID" class="inputbox" size="10" maxlength="255">
</form>

</td></tr>
<tr><td>

<form action="ResetRooms.asp" name="frmUser2" Method="GET">
<input type="hidden" name="uid" value=<%=uid%> />
&nbsp; &nbsp; &nbsp;
<input type="submit" name="Submit" value="ResetRooms" class="inputSubmit">
<input type="text" name="InvoiceID" class="inputbox" size="10" maxlength="255">
</form>


</td></tr></table>







</td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->
