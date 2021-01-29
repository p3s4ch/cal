


<div align=center>
<select name="Month" class="inputBox" >
<option value="1" <%if iMonth="1" then Response.Write "selected" end if %>  > January</option>
<option value="2" <% if iMonth="2" then Response.Write "selected" end if %> > February</option>
<option value="3" <%if iMonth="3" then Response.Write "selected" end if %> > March</option>
<option value="4" <% if iMonth="4" then Response.Write "selected" end if %> > April</option>
<option value="5" <% if iMonth="5" then Response.Write "selected" end if %> > May</option>
<option value="6" <% if iMonth="6" then Response.Write "selected" end if %>> June</option>
<option value="7" <% if iMonth="7" then Response.Write "selected" end if %>> July</option>
<option value="8" <% if iMonth="8" then Response.Write "selected" end if %>> August</option>
<option value="9" <% if iMonth="9" then Response.Write "selected" end if %>> September</option>
<option value="10" <% if iMonth="10" then Response.Write "selected" end if %>> October</option>
<option value="11" <% if iMonth="11" then Response.Write "selected" end if %>> November</option>
<option value="12" <% if iMonth="12" then Response.Write "selected" end if %>> December</option>
</select>
Year <input type="text" name="Year" id="Year" maxlength="4" size="2" value="<%=iYear%>" />


</div>
<br>

<% if isAdmin then %>
<div align=center>
<font face="Verdana, arial" size="1"  color="48576C"><b>Search for</b></font>

<input type="text" size="80" name="SearchFor" class="inputBox" value="<%=SearchFor%>" >
</div>
<%end if %>

<br>
<div align=center>
<input type="hidden" name="uid" value="<%=uid%>" >
<input type="submit" value="Show" class="inputSubmit" >
</div>


