


     <select name="<%=fieldName%>" class="inputBox">
			<option value="" SELECTED></option>
			<%
			Set RS_CC= Server.CreateObject("ADODB.Recordset")
			RS_CC.Open "select distinct Admin_ID cash_account from dbo.UserRoles where [Role] = 'hasCashAccount' order by 1", SQLCN, 2, 2
			    Do While Not RS_CC.eof
				currentVal=RS_CC("cash_account")
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