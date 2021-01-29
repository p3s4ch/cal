

<%
isADateType =false
isAnID=false
isCostCode=false
isPayment=false
isPayer=false
isSource=false
isLodger=false
isPayerHidden=false
isProjectDetails=false

if InStr(x.Name,"P_ayerHidden")  > 0 then isPayerHidden =true else isPayerHidden=false end if

if InStr(x.Name,"Source")  > 0 then isSource =true else isSource=false end if
if InStr(x.Name,"Payer")  > 0 then isPayer =true else isPayer=false end if

if (InStr(x.Name,"Lodger") > 0)  then isLodger =true else isLodger=false end if
if InStr(x.Name,"Date") > 0 then isADateType =true else isADateType=false end if
if InStr(x.Name,"CostCode") > 0 then isCostCode =true else isCostCode=false end if

if (InStr(x.Name,"ID") > 0)  then isAnID =true else isAnID=false end if


if (InStr(x.Name,"ChequeNo") > 0)  then isAnID =false end if


'if (InStr(x.Name,"Payment") > 0)  then isPayment =true else isPayment=false end if

if isPayerHidden then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  &nbsp; </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" > <input type="hidden" name="Payer" value="<%=x.Value%>"  >
  </td>
</tr>
<%
end if

if isAnID then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" > <input type="text" name="<%=x.Name%>" value="<%=AddID%>" size="8" maxlength="255" readonly disabled >
  </td>
</tr>
<%
end if

if isADateType then
   d= x.Value
   'Response.Write "d= "& d
   if trim(d) = "1/1/2005" then   d = Date() end if
 %>
<tr>
<td bgcolor="<%=clr%>" ><font face="Verdana" size="1" color="48576C"><b>Date </b></font></td>
<td bgcolor="<%=clr%>" ></td>
<td bgcolor="<%=clr%>" >

	<script type="text/javascript" src="inc/popupWindow.js"></script>
	<input type="text" name="asofdate" id="Text1" maxlength="10" size="8" value=<%=d%> />
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

if isPayer then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>Name Of Payer</b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
                          <select name="payer" class="inputBox">
                        <option value="" SELECTED></option>
                        <%
                        Set RS_CC= Server.CreateObject("ADODB.Recordset")
                        RS_CC.Open "select distinct Payer from fees order by 1", SQLCN, 2, 2
	                        Do While Not RS_CC.eof
	                        if RS("Payer") = RS_CC("Payer") then
	                        %>
		                        <option value="<%=RS_CC("Payer")%>" selected><%=RS_CC("Payer")%></option>
	                        <%
	                        else
	                        %>
	                        <option value="<%=RS_CC("Payer")%>"><%=RS_CC("Payer")%></option>
	                        <%
	                        end if
                        RS_CC.movenext
                        Loop
                        RS_CC.close
                        set RS_CC = nothing
                        %>
                        </select>
   <font face="Verdana"  color="48576C" size="1">  Other </font>
   <input type="text" name="PayerOther" class="inputbox" size="25" maxlength="255" ></td>
</tr>
<%
end if

if isSource then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>Source</b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
                          <select name="Source" class="inputBox">
                        <option value="" SELECTED></option>
                        <%
                        Set RS_CC= Server.CreateObject("ADODB.Recordset")
                        RS_CC.Open "select distinct Source from reservations order by 1", SQLCN, 2, 2
	                        Do While Not RS_CC.eof
	                        if RS("Source") = RS_CC("Source") then
	                        %>
		                        <option value="<%=RS_CC("Source")%>" selected><%=RS_CC("Source")%></option>
	                        <%
	                        else
	                        %>
	                        <option value="<%=RS_CC("Source")%>"><%=RS_CC("Source")%></option>
	                        <%
	                        end if
                        RS_CC.movenext
                        Loop
                        RS_CC.close
                        set RS_CC = nothing
                        %>
                        </select>
   <font face="Verdana"  color="48576C" size="1">  Other </font>
   <input type="text" name="SourceOther" class="inputbox" size="25" maxlength="255" ></td>
</tr>
<%
end if

if isProjectDetails then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>Source</b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
                          <select name="Source" class="inputBox">
                        <option value="" SELECTED></option>
                        <%
                        Set RS_CC= Server.CreateObject("ADODB.Recordset")
                        RS_CC.Open "select distinct Details from costs order by 1", SQLCN, 2, 2
	                        Do While Not RS_CC.eof
	                        if RS("Source") = RS_CC("Source") then
	                        %>
		                        <option value="<%=RS_CC("Details")%>" selected><%=RS_CC("Details")%></option>
	                        <%
	                        else
	                        %>
	                        <option value="<%=RS_CC("Details")%>"><%=RS_CC("Details")%></option>
	                        <%
	                        end if
                        RS_CC.movenext
                        Loop
                        RS_CC.close
                        set RS_CC = nothing
                        %>
                        </select>
   <font face="Verdana"  color="48576C" size="1">  Other </font>
   <input type="text" name="DetailsOther" class="inputbox" size="25" maxlength="255" ></td>
</tr>
<%
end if


if isLodger then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>Name Of Payer</b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
                          <select name="payer" class="inputBox">
                        <option value="" SELECTED></option>
                        <%
                        Set RS_CC= Server.CreateObject("ADODB.Recordset")
                        RS_CC.Open "select distinct Payer from fees order by 1", SQLCN, 2, 2
	                        Do While Not RS_CC.eof
	                        if RS("Payer") = RS_CC("Payer") then
	                        %>
		                        <option value="<%=RS_CC("Payer")%>" selected><%=RS_CC("Payer")%></option>
	                        <%
	                        else
	                        %>
	                        <option value="<%=RS_CC("Payer")%>"><%=RS_CC("Payer")%></option>
	                        <%
	                        end if
                        RS_CC.movenext
                        Loop
                        RS_CC.close
                        set RS_CC = nothing
                        %>
                        </select>
   <font face="Verdana"  color="48576C" size="1">  Other </font>
   <input type="text" name="PayerOther" class="inputbox" size="25" maxlength="255" ></td>
</tr>
<%
end if



if Not isProjectDetails AND Not isPayerHidden AND Not isSource AND Not isLodger AND Not isADateType AND NOT isAnID and NOT isCostCode and NOT isPayment and NOT isPayer then
 %>
  <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b><%=x.Name%> </b></font></td>
  <td bgcolor="<%=clr%>" ></td>
  <td bgcolor="<%=clr%>" ><input type="text" name="<%=x.Name%>" value="<%=x.Value%>" class="inputbox" size="35" maxlength="255"></td>
</tr>
<%
end if

   if clr="#DAE3F0" then clr="#C5D3E7" else clr="#DAE3F0" end if

 %>