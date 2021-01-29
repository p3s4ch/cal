


     <select name="<%=fieldName%>" class="inputBox">
			<option value="" SELECTED></option>
			<%
			Set RS_CC= Server.CreateObject("ADODB.Recordset")
			RS_CC.Open "select distinct [Role] from dbo.UserRoles order by 1", SQLCN, 2, 2
				Do While Not RS_CC.eof
				currentVal=RS_CC("Role")
				if val = currentVal then

				%>
					<option value="<%=currentVal%>" selected><%=currentVal%></option>
				<%
				else
				%>
				<option value="<%=currentVal%>">  <%=currentVal%></option>
				<%
				end if
			RS_CC.movenext
			Loop
			RS_CC.close
			set RS_CC = nothing
			%>
	</select>