

<%
if xDay =""  then
   xDay = "3"
End If

if xMonth =""  then
   xMonth = "9"
End If

if xYear =""  then
   xYear = "2014"
End If




%>

<input type=text name=iDay value="<%=xDay%>" class="inputbox" size="1" maxlength="20">

<select name=iMonth class="inputbox">
<option value=1 <%if xMonth="1" then Response.Write "selected" end if%> >Jan</option>
<option value=2 <%if xMonth="2" then Response.Write "selected" end if%>>Feb</option>
<option value=3 <%if xMonth="3" then Response.Write "selected" end if%>>Mar</option>
<option value=4 <%if xMonth="4" then Response.Write "selected" end if%>>Apr</option>
<option value=5 <%if xMonth="5" then Response.Write "selected" end if%>>May</option>
<option value=6 <%if xMonth="6" then Response.Write "selected" end if%>>Jun</option>
<option value=7 <%if xMonth="7" then Response.Write "selected" end if%>>Jul</option>
<option value=8 <%if xMonth="8" then Response.Write "selected" end if%>>Aug</option>
<option value=9 <%if xMonth="9" then Response.Write "selected" end if%>>Sep</option>
<option value=10 <%if xMonth="10" then Response.Write "selected" end if%>>Oct</option>
<option value=11 <%if xMonth="11" then Response.Write "selected" end if%>>Nov</option>
<option value=12 <%if xMonth="12" then Response.Write "selected" end if%>>Dec</option>
</select>
<input type=text name=iYear value="<%=xYr%>" class="inputbox" size="4" maxlength="55">
&nbsp;



