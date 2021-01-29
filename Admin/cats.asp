
<%

RS1= SQLCN.Execute("select ID from Operators where [Name] = '"& Operator &"'")
opID = RS1("ID")

%>


<select id="category" name="category" class="inputBox" onChange="doCat(this); doCat2(this)" >

<%
  if Category = "NotYetSelected" then noneIsSelected="selected" end if

%>
<option value="NotYetSelected" <%=noneIsSelected%> >_please select_</option>

<%




Set RSCATEGORY = Server.CreateObject("ADODB.Recordset")




sqlSource = "Categories"
'if isJam then sqlSource="Categories where where OperatorsIDs like +'%20%' " end if
sqlSource="Categories where OperatorsIDs like '%"    & opID &  "%' "

'sqlSource="Categories where Is4Guest=1"

RSCATEGORY.Open sqlSource, SQLCN, 2, 2
Do While Not RSCATEGORY.eof

    if trim(RSCATEGORY("Category")) <> "available" then
		if Category = trim(RSCATEGORY("Category")) then
		%>
		<option value="<%=RSCATEGORY("Category")%>" selected><%=RSCATEGORY("Category")%></option>
		<%
		else
		%>
		<option value="<%=RSCATEGORY("Category")%>"><%=RSCATEGORY("Category")%></option>
		<%
		end if
	end if
RSCATEGORY.movenext
Loop
RSCATEGORY.close
set RSCATEGORY = nothing
%>
</select> &nbsp