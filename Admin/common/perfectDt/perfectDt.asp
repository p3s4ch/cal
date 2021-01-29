

<!--#include file="SQL_Cn.asp"-->

<%
   	AddId = trim(request("ID"))
   	tempID = AddId
   	if (AddId ="") or isNull(AddId) Then
	    AddId = "-1"
	    tempID = 1
	end if


	set RS = SQLCN.Execute("select top 1 * from Cheques where ID = " & tempID )


%>



<form name=perfectDat>




<input type=text name=iDay value="<%=iDay%>" class="inputbox" size="1" maxlength="20">
<select name=iMonth class="inputbox">
<option value=1 <%if iMonth="1" then Response.Write "selected" end if%> >Jan</option>
<option value=2 <%if iMonth="2" then Response.Write "selected" end if%>>Feb</option>
<option value=3 <%if iMonth="3" then Response.Write "selected" end if%>>Mar</option>
<option value=4 <%if iMonth="4" then Response.Write "selected" end if%>>Apr</option>
<option value=5 <%if iMonth="5" then Response.Write "selected" end if%>>May</option>
<option value=6 <%if iMonth="6" then Response.Write "selected" end if%>>Jun</option>
<option value=7 <%if iMonth="7" then Response.Write "selected" end if%>>Jul</option>
<option value=8 <%if iMonth="8" then Response.Write "selected" end if%>>Aug</option>
<option value=9 <%if iMonth="9" then Response.Write "selected" end if%>>Sep</option>
<option value=10 <%if iMonth="10" then Response.Write "selected" end if%>>Oct</option>
<option value=11 <%if iMonth="11" then Response.Write "selected" end if%>>Nov</option>
<option value=12 <%if iMonth="12" then Response.Write "selected" end if%>>Dec</option>
</select>
<input type=text name=iYr value="<%=iYr%>" class="inputbox" size="4" maxlength="55">

<input type="text" name="Year" size=6>



<input type="button" value="Choose.." onClick = "window.open('kid.htm?OpenForm','new_win','width=150,height=150');">

<a href="javascript:" onClick = "window.open('kid.html?iYear=777&OpenForm','new_win','width=150,height=150');" >

<img src=cal/cal.gif />



</a>

</form>