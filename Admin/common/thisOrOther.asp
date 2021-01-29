



 <tr>
  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>   <%=fieldThis%>   </b></font></td>
  <td bgcolor="<%=clr%>" > </td>
  <td bgcolor="<%=clr%>" >
	   <select name="<%=fieldThis%>" class="inputBox">
						  <option value="" SELECTED></option>
						  <%
						  Set RS_CC= Server.CreateObject("ADODB.Recordset")
						  RS_CC.Open SQL_DropDown, SQLCN, 2, 2
							Do While Not RS_CC.eof
							if selectedValue = RS_CC("dropDown") then
							%>
								<option value="<%=RS_CC("dropDown")%>" selected><%=RS_CC("dropDown")%></option>
							<%
							else
							%>
							<option value="<%=RS_CC("dropDown")%>"><%=RS_CC("dropDown")%></option>
							<%
							end if
						  RS_CC.movenext
						  Loop
						  RS_CC.close
						  set RS_CC = nothing
						  %>
	</select>
   <font face="Verdana"  color="48576C" size="1">  Other </font>
   <input type="text" name="<%=fieldOther%>" class="inputbox" size="25" maxlength="255" ></td>
</tr>
