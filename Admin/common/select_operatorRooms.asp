


<select name="Operator" class="inputBox">
<option value="" SELECTED></option>
<%

Set RSOPERATOR = Server.CreateObject("ADODB.Recordset")
RSOPERATOR.Open "select distinct name from Operators where name like '%Room.%' order by name", SQLCN, 2, 2
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

%>
</select>

