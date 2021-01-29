

<%

'Response.Write "<BR> in searchFormX: <br> "
'Response.Write "<BR> FromDay =" & FromDay
'Response.Write "<BR> FromMonth =" & FromMonth

%>

<DIV ALIGN=center>
Between
<input type=text name=FromDay value="<%=FromDay%>" class="inputbox" size="1" maxlength="20">
<select name=FromMonth class="inputbox">
<option value=1 <%if FromMonth="1" then Response.Write "selected" end if%> >Jan</option>
<option value=2 <%if FromMonth="2" then Response.Write "selected" end if%>>Feb</option>
<option value=3 <%if FromMonth="3" then Response.Write "selected" end if%>>Mar</option>
<option value=4 <%if FromMonth="4" then Response.Write "selected" end if%>>Apr</option>
<option value=5 <%if FromMonth="5" then Response.Write "selected" end if%>>May</option>
<option value=6 <%if FromMonth="6" then Response.Write "selected" end if%>>Jun</option>
<option value=7 <%if FromMonth="7" then Response.Write "selected" end if%>>Jul</option>
<option value=8 <%if FromMonth="8" then Response.Write "selected" end if%>>Aug</option>
<option value=9 <%if FromMonth="9" then Response.Write "selected" end if%>>Sep</option>
<option value=10 <%if FromMonth="10" then Response.Write "selected" end if%>>Oct</option>
<option value=11 <%if FromMonth="11" then Response.Write "selected" end if%>>Nov</option>
<option value=12 <%if FromMonth="12" then Response.Write "selected" end if%>>Dec</option>
</select>
<input type=text name=FromYr value="<%=FromYr%>" class="inputbox" size="4" maxlength="55">

&nbsp;&nbsp;and &nbsp;  &nbsp;

<input type=text name=ToDay value="<%=ToDay%>" class="inputbox" size="1" maxlength="20">
<select name=ToMonth class="inputbox">
<option value=1 <%if ToMonth="1" then Response.Write "selected" end if%> >Jan</option>
<option value=2 <%if ToMonth="2" then Response.Write "selected" end if%>>Feb</option>
<option value=3 <%if ToMonth="3" then Response.Write "selected" end if%>>Mar</option>
<option value=4 <%if ToMonth="4" then Response.Write "selected" end if%>>Apr</option>
<option value=5 <%if ToMonth="5" then Response.Write "selected" end if%>>May</option>
<option value=6 <%if ToMonth="6" then Response.Write "selected" end if%>>Jun</option>
<option value=7 <%if ToMonth="7" then Response.Write "selected" end if%>>Jul</option>
<option value=8 <%if ToMonth="8" then Response.Write "selected" end if%>>Aug</option>
<option value=9 <%if ToMonth="9" then Response.Write "selected" end if%>>Sep</option>
<option value=10 <%if ToMonth="10" then Response.Write "selected" end if%>>Oct</option>
<option value=11 <%if ToMonth="11" then Response.Write "selected" end if%>>Nov</option>
<option value=12 <%if ToMonth="12" then Response.Write "selected" end if%>>Dec</option>
</select>
<input type=text name=ToYr value="<%=ToYr%>" class="inputbox" size="4" maxlength="55">

<br><br>
</DIV>

<table border="0" cellpadding="5" cellspacing="0" align="center"><tr>
<td bgcolor="#DAE3F0">
<table border="0" cellpadding="2" cellspacing="0" align="center">

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana, arial" size="1"  color="48576C"><b>Search for</b></font></td>
<td bgcolor="#DAE3F0"><input type="text" size="80" name="SearchFor" class="inputBox" value="<%=SearchFor%>"></td>
<td bgcolor="#DAE3F0"><font face="Verdana, arial" size="1"  color="48576C"></font></td><td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana, arial" size="1"  color="48576C"><b>CostCode is</b></font></td>
<td bgcolor="#DAE3F0"><input type="text" size="80" name="CostCode" class="inputBox" value="<%=CostCode%>"></td>
<td bgcolor="#DAE3F0"><font face="Verdana, arial" size="1"  color="48576C"></font></td><td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana, arial" size="1"  color="48576C"><b>Exclude</b></font></td>
<td bgcolor="#DAE3F0"><input type="text" size="80" name="SearchForNot" class="inputBox" value="<%=SearchForNot%>"></td>
<td bgcolor="#DAE3F0"><font face="Verdana, arial" size="1"  color="48576C"></font></td><td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">

<input type="hidden" name="uid" value="<%=uid%>" >
<input type="submit" value="Go" class="inputSubmit"></td>
</tr>

</table></td></tr>


</table>

