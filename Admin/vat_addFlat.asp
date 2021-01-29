
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<%
   	AddID = request("AddID")

	uid =	 request("uid")

	If (AddID <> "") Then
	    myID =AddID
	    Response.Write "<h2> Edit VAT Return </h2>"
	    sql = "select * from vVAT where ID = "& myID

	else
	    Response.Write "<h2> Submit New VAT Return </h2>"
        sql = "exec doVATReturn"
	    AddID=-1
	    myID = 1
	End if

%>


<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>
<form action="VAT.asp?tableName=dbo.VAT" name="Form" Method="POST">

<input type=hidden name=uid value=<%=uid%> >

<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>
<%


set RS = SQLCN.Execute(sql)

clr="#DAE3F0"
isADateType =false
isAnID=false
isAComment=false
isSuperfluous=false
isCalculated=false


for each x in RS.Fields
if InStr(x.Name,"Date") > 0 then isADateType =true else isADateType=false end if
if InStr(x.Name,"ID") > 0 then isAnID =true else isAnID=false end if
if InStr(x.Name,"Comment") > 0 then isAComment =true else isAComment=false end if
if InStr(x.Name,"PeriodStart") > 0 or InStr(x.Name,"PeriodEnd") > 0 then isSuperfluous =true else isSuperfluous=false end if
if InStr(x.Name,"Calculated") > 0 then isCalculated =true else isCalculated=false end if


if isSuperfluous then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b> <%=x.Value%> </b></font></td>
</tr>
<%
end if
if isCalculated then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="red" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="red" size="1">  <b> <%=x.Value%> </b></font></td>
</tr>
<%
end if


if isADateType then
 %>
<tr>
<td bgcolor="<%=clr%>" ><font face="Verdana" size="1" color="48576C"><b>Date </b></font></td>
<td bgcolor="<%=clr%>" ></td>
<td bgcolor="<%=clr%>" >
	<script type="text/javascript" src="inc/popupWindow.js"></script>
	<input type="text" name="paymentDate" id="Text1" maxlength="10" size="8" value=<%=x.Value%> />
	<a href="javascript:;"
	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=paymentDate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" /></a>
</tr>

<%
end if


if isAComment then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" ><textarea name="<%=x.Name%>" class="inputbox" cols="65" rows="30" ><%=x.Value%> </textarea></td>
</tr>
<%
end if

if isAnID then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" >  </td>
  <td bgcolor="<%=clr%>" ><input type="text" name="AddId" value="<%=AddId%>" class="inputbox" size="5" disabled></td>
</tr>
<%
end if

'This is now the default plain vanilla case **************************************************
if Not isADateType AND NOT isAnID AND NOT isAComment and not isSuperfluous AND NOT isCalculated then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" ></td>
  <td bgcolor="<%=clr%>" ><input type="text" name="<%=x.Name%>" value="<%=x.Value%>" class="inputbox" size="35" maxlength="255"></td>
</tr>
<%
end if

   if clr="#DAE3F0" then clr="#C5D3E7" else clr="#DAE3F0" end if
 next
%>

<tr>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">

<input type="hidden" name="AddId"  value=<%=AddId%> class="inputbox" size="30" maxlength="255"></td>
<input type="hidden" name="tableName"  value="VAT">
</tr>




<tr>
<td align="right" valign="bottom"></td>
<td>&nbsp;</td>
<td valign="bottom">  <input type="submit" name="Submit" value="Save" class="inputSubmit">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
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
