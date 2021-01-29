

<%

if isContractor <> 0 then
    Set RSOPERATOR = SQLCN.Execute("select distinct Admin_ID Name from UserRoles where [Role]='hasDiary' or [Role]='isARoom' " )
	Response.Write "<input type=hidden name=Operator value=" & RSOPERATOR("Name") &" >"
	Response.Write "&nbsp; " & RSOPERATOR("Name") &"<br>"
else

%>
<select name="Operator" class="inputBox">
<option value="" SELECTED></option>
<%

Set RSOPERATOR = Server.CreateObject("ADODB.Recordset")
RSOPERATOR.Open "Operators", SQLCN, 2, 2
	Do While Not RSOPERATOR.eof
	if Operator = RSOPERATOR("Name") then
	%>
		<option value="<%=RSOPERATOR("Name")%>" selected><%=RSOPERATOR("Name")%></option>
	<%
	else
	%>
	<option value="<%=RSOPERATOR("Name")%>"><%=RSOPERATOR("Name")%></option>
	<%
	end if
RSOPERATOR.movenext
Loop
RSOPERATOR.close
set RSOPERATOR = nothing

end if
%>
</select>

