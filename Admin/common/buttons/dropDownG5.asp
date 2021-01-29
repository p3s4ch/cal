




     <select name="<%= fieldName %>" class="inputBox">
                        <option value="" SELECTED></option>
                        <%

                        'reuires sql_column , sql_table
                        ' also val


                        Set RS_CC= Server.CreateObject("ADODB.Recordset")
                        RS_CC.Open "select distinct " & sql_column & " from " & sql_table & " order by 1", SQLCN, 2, 2
	                        Do While Not RS_CC.eof
	                        if val = RS_CC(sql_column) then
	                        %>
		                        <option value="<%=RS_CC(sql_column)%>" selected><%=RS_CC(sql_column)%></option>
	                        <%
	                        else
	                        %>
	                        <option value="<%=RS_CC(sql_column)%>"><%=RS_CC(sql_column)%></option>
	                        <%
	                        end if
                        RS_CC.movenext
                        Loop
                        RS_CC.close
                        set RS_CC = nothing
                        %>
                        </select>