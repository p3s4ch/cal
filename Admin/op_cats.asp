
<%

RS1= SQLCN.Execute("select ID from Operators where [Name] = '"& Operator &"'")
opID = RS1("ID")

%>


<select id="category" name="category" class="inputBox" " >

<%
  if Category = "NotYetSelected" then noneIsSelected="selected" end if

%>
<option value="NotYetSelected" <%=noneIsSelected%> >_please select_</option>

<%

Set RS_CC= Server.CreateObject("ADODB.Recordset")
RS_CC.Open "select distinct Category from OperatorCategory   where Operator =  '"& Operator &"'" , SQLCN, 2, 2
Do While Not RS_CC.eof

    if trim(RS_CC("Category")) <> "available" then
		if Category = trim(RS_CC("Category")) then
		%>
		<option value="<%=RS_CC("Category")%>" selected><%=RS_CC("Category")%></option>
		<%
		else
		%>
		<option value="<%=RS_CC("Category")%>"><%=RS_CC("Category")%></option>
		<%
		end if
	end if
RS_CC.movenext
Loop
RS_CC.close
set RS_CC = nothing
%>
</select> &nbsp