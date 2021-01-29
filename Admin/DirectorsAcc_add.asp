<!--#include file="loggedin.asp"-->
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
	    tempID = 1
	end if
	
	'Response.Write "AddId= "& AddId
	'Response.Write "<br>"
%>


<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>
<form action="DirectorsAcc.asp" name="frmUser" Method="GET">
<table border="0" cellpadding="3" cellspacing="0" align="center" width = 90%>
<%  
set RS = SQLCN.Execute("select top 1 * from DirectorsAcc where ID = " &tempID ) 

clr="#DAE3F0"
isADateType =false
isAnID=false
isCostCode=false
isDescription=false

for each x in RS.Fields
if InStr(x.Name,"Date") > 0 then isADateType =true else isADateType=false end if
if InStr(x.Name,"CostCode") > 0 then isCostCode =true else isCostCode=false end if
if InStr(x.Name,"ID") > 0  then isAnID =true else isAnID=false end if
if InStr(x.Name,"Description") > 0 then isDescription =true else isDescription=false end if

if isADateType then
 %> 
<tr>
<td bgcolor="<%=clr%>" ><font face="Verdana" size="1" color="48576C"><b>Date </b></font></td>
<td bgcolor="<%=clr%>" ></td>
<td bgcolor="<%=clr%>" >
	<script type="text/javascript" src="inc/popupWindow.js"></script>
	<input type="text" name="asofdate" id="Text1" maxlength="10" size="8" value=<%=x.Value%> />
	<a href="javascript:;"
	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=asofdate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" /></a>
</tr>

<% 
end if 

if isCostCode then
 %> 
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>Cost Code</b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
                          <select name="CostCode" class="inputBox">
                        <option value="" SELECTED></option>
                        <%
                        Set RS_CC= Server.CreateObject("ADODB.Recordset")
                        RS_CC.Open "select distinct CostCode from Costs order by 1", SQLCN, 2, 2
	                        Do While Not RS_CC.eof
	                        if RS("CostCode") = RS_CC("CostCode") then
	                        %>
		                        <option value="<%=RS_CC("CostCode")%>" selected><%=RS_CC("CostCode")%></option>
	                        <%
	                        else
	                        %>
	                        <option value="<%=RS_CC("CostCode")%>"><%=RS_CC("CostCode")%></option>
	                        <%
	                        end if
                        RS_CC.movenext
                        Loop
                        RS_CC.close
                        set RS_CC = nothing
                        %>
                        </select>
   <font face="Verdana"  color="48576C" size="1">  Other </font>
   <input type="text" name="CostCodeOther" class="inputbox" size="25" maxlength="255" ></td>
</tr>
<% 
end if

if isAnID then
 %> 
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" ><input type="text" name="<%=x.Name%>" value="<%=AddId%>" class="inputbox" size="8" maxlength="255" disabled ></td>
</tr>
<% 
end if

if isDescription then
 %> 
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" > <TEXTAREA name="<%=x.Name%>" ROWS=10 COLS=40  >  <%=x.Value%>  </textarea>
  
  </td>
</tr>
<% 
end if

'This is now the default plain vanilla case **************************************************
if Not isADateType AND NOT isAnID and NOT isCostCode and NOT isDescription then 
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

<input type="hidden" name="uid" value="<%=uid%>" />
<input type="hidden" name="AddId"  value=<%=AddId%> class="inputbox" size="30" maxlength="255"></td>
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
