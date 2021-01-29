<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<%

    mysql = request("mysql")

    sql = mysql
   	AddID = request("ID")
        Response.Write "AddID =" & AddID

	If (AddID <> "") Then
             myID =AddID
        else
             myID = 1
             AddID = -1
        end if

tableName = request("tableName")
'if tableName = "" then
'    Response.Write "requires pm tableName "
'    Response.End
'end if

if tableName = "vGuestDepartures" then
    tableName = "Guest"
end if

Response.Write "<br>uid=" & uid
Response.Write "<br>AddID =" & AddID

%>


<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>
<form action="generic.asp" name="frmUser" Method="POST">


<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>
<%

'sql = "select top 1 * from " & tableName & " where ID = " & myID
Response.Write sql
'Response.End

set RS = SQLCN.Execute(sql)

clr="#DAE3F0"
isADateType =false
isAnID=false

for each x in RS.Fields
if InStr(x.Name,"Date") > 0 then isADateType =true else isADateType=false end if
if InStr(x.Name,"No") > 0 or InStr(x.Name,"ID") > 0    then isAnID =true else isAnID=false end if


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

if isAnID then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" >  </td>
  <td bgcolor="<%=clr%>" ><input type="text" name="AddID" value="<%=AddID%>" class="inputbox" size="15" maxlength="255"></td>
</tr>
<%
end if

'This is now the default plain vanilla case **************************************************
if Not isADateType AND NOT isAnID then
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

</td>
<input type="hidden" name="tableName"  value=<%=tableName%> >
<input type="hidden" name="uid"  value=<%=uid%>  >
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
