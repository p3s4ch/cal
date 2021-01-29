<!--not include file="dsn.asp"-->
<!--not include file="body.asp"-->
<!--#include file="common\SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->

<%
   	AddID = request("ID")
	If (AddID <> "") Then
	myID =AddID
	else
	AddID=-1
	myID = 15
	End if

%>


<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>
<form action="TelephoneBook.asp?tableName=dbo.TelephoneBook" name="Form" Method="POST">
<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>
<%
set RS = SQLCN.Execute("select top 1 * from TelephoneBook where ID ="& myID)

clr="#DAE3F0"
isADateType =false
isAnID=false
isAComment=false

for each x in RS.Fields
if InStr(x.Name,"Date") > 0 then isADateType =true else isADateType=false end if
if InStr(x.Name,"ID") > 0 then isAnID =true else isAnID=false end if
if InStr(x.Name,"Comment") > 0 then isAComment =true else isAComment=false end if


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
  <td bgcolor="<%=clr%>" ><textarea name="<%=x.Name%>" class="inputbox" cols="165" rows="200" ><%=x.Value%> </textarea></td>
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
if Not isADateType AND NOT isAnID AND NOT isAComment then
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
<input type="hidden" name="tableName"  value="TelephoneBook">
</tr>




<tr>
<td align="right" valign="bottom"></td>
<td>&nbsp;</td>
<td valign="bottom">  <input type="submit" name="Submit" value="Save" class="inputSubmit">
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
<!--not include file="dsn2.asp"-->
