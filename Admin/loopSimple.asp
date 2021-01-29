




<%

        i=1
		Set RS_CC= Server.CreateObject("ADODB.Recordset")
		RS_CC.Open    mysql,    SQLCN, 2, 2
		    Do While Not RS_CC.eof

			%>

				<tr>
				  <td bgcolor="<%=clr%>" ><font face="Verdana"  color="48576C" size="1">  <b>  Room(s) </b></font></td>
				  <td bgcolor="<%=clr%>" > </td>
				  <td bgcolor="<%=clr%>" > <input type="text"  name="RoomType<%=i%>" value="<%=RS_CC("RoomType")%>" class="inputbox" size="30" maxlength="55">
				                           <input type="text"  name="RoomNum<%=i%>"   value="<%=RS_CC("RoomNum")%>" class="inputbox" size="20" maxlength="55">
				  </td>
				  </td>
                </tr>
			<%

        i=i+1

		RS_CC.movenext
		Loop
		RS_CC.close
		set RS_CC = nothing
%>








