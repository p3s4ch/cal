


     <select name="roomType" class="inputBox">
                        <option value="" SELECTED></option>
                        <%
                        Set RS_CC= Server.CreateObject("ADODB.Recordset")
                        RS_CC.Open "select distinct RoomType from dbo.Rooms order by 1", SQLCN, 2, 2
	                        Do While Not RS_CC.eof
	                        if val = RS_CC("RoomType") then
	                        %>
		                        <option value="<%=RS_CC("RoomType")%>" selected><%=RS_CC("RoomType")%></option>
	                        <%
	                        else
	                        %>
	                        <option value="<%=RS_CC("RoomType")%>"><%=RS_CC("RoomType")%></option>
	                        <%
	                        end if
                        RS_CC.movenext
                        Loop
                        RS_CC.close
                        set RS_CC = nothing
                        %>
                        </select>