<!-- not include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->
<b>VAT Edit </b> <br>



<%
   	AddID = request("ID")

	uid =	 request("uid")

	If (AddID <> "") Then
	    myID =AddID
	    Response.Write "<h2> Edit VAT Return </h2>"

	    sql = " select due vatDue_box1, Reclaimed_bx4 vatReclaimed_box4 , Net_bx5 , Sales salesExcl_box6, "&_
               " PurchasesExclVAT_bx7 purchasesExcl_box7 , Rate , comment, periodID from VAT where ID = "& myID

	else
	    Response.Write "<h2>Time to Submit New VAT Return </h2>"
	    Response.Write "<h3>go to www.gateway.gov.uk <br> L9KBHH1BJC[Hey]P  pw N**1 </h3>"

        sql = "dbo.doVATReturnSTD"
        SQLCN.Execute(sql )
        sql = "select * from dbo.VAT_TEMP"
	    AddID=-1
	    myID = 1
	End if

%>



<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>



<form action="vat.asp" name="frmUser" Method="POST">
<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>
<%
set RS = SQLCN.Execute(sql )
%>




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
<input type="hidden" name="tableName"  value="Reservations" ></td>



</tr>


<tr>
<td align="right" valign="bottom"></td>
<td>&nbsp;</td>
<td valign="bottom">

<input type="hidden" name="uid" value="<%=uid%>" >
<input type="hidden" name="tableName" value="<%=tableName%>" >
<input type="hidden" name="ID" value="<%=ID%>" >
<input type="submit" name="Submit" value="Save" class="inputSubmit">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;





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
