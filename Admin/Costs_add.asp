<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<%
   	AddId = trim(request("ID"))
   	tempID = AddId
   	if (AddId ="") or isNull(AddId) Then
	    AddId = "-1"
	    tempID = 10
	end if

     SQL ="select SlipNo ID, convert(varchar(11),Date,106) Dt, CostCode, Supplier, Total,Invoice, ReceiptNo Receipt, " &_
          " Description,Details ProjectDetails, Location, Scan, Payment, TxID HSBC_TX " &_
           " from Costs where SlipNo = "  &tempID

    set RS = SQLCN.Execute(SQL)



	'Response.Write "AddId= "& AddId
	'Response.Write "<br>"
%>

CREATE A NEW RULE:
<form action="GSE5.asp" name="frmUser" Method="GET">
<input type="hidden" name="pm0" value="-1" />
<input type="hidden" name="pm1" value=<%=uid%> />
Where Description is like <input type="text"   name="pm2" value="'<%=RS("Description")%>'" />
<BR>AND AMOUNT is +ve =1  or -ve = -1 <input type="text"   name="pm3" value="1" />
New CodeCode <input type="text"       name="pm4" value="" />
<input type="hidden"     name="mysql" value="exec dbo.add_CostCodeExceptions  " /> <%=spacing%>
<input type="hidden"     name="NoOfPMs" value="5" /> <%=spacing%>
<input type="hidden"     name="uid" value=<%=uid%> />
<input type="submit"     name="Submit" value="Create Rule" class="inputSubmit">
</form>


<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>


<form action="Costs.asp" name="frmUser" Method="GET">
<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>


<%
clr="#DAE3F0"

for each x in RS.Fields
%>


<!--#include file="common\columnFormFormatter.asp"-->

<%
   next
%>






<tr>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">

<input type="hidden" name="AddId"  value=<%=AddId%> >
<input type="hidden" name="doGroupByCCIsSet"  value=yes >
<input type="hidden" name="PeriodID"  value=20 ></td>



</tr>


<tr>
<td align="right" valign="bottom"></td>
<td>&nbsp;</td>
<td valign="bottom">


<input type="submit" name="Submit" value="Save" class="inputSubmit">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
       <input type="hidden" name="uid" value="<%=uid%>" />
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
