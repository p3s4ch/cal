
<!--#include file="SQL_Cn.asp"-->
<!--#include file="Apopup.asp"-->


<%
AddID= request("AddID")

 If (AddID <> "") Then
	  SQL = "select * from cEvents WHERE ID = " & AddID
	  Set RS12 = SQLCN.Execute(SQL)

	  StartTime=RS12("StartTime")

	  cDt =  CDate(StartTime)
      iDay = Day(cDt)
	  iMonth = Month(cDt)
	  iYear = Year(cDt)

      DateOfPay =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)


FromDay = iDay
FromMonth = iMonth
FromYear  = iYear


Response.Write "db has StartTime as " & StartTime &"<br><br>"
end if




%>

<input type=text name=FromDay value="<%=iDay%>" class="inputbox" size="1" maxlength="20">
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
<input type=text name=FromYr value="<%=FromYear%>" class="inputbox" size="4" maxlength="55">

<script type="text/javascript" src="popupWindow.js"></script>

	<input type="text" name="asofdate" id="Text1" maxlength="20" size="8" value="<%=StartTime%>" />

	<a href="javascript:;"
	onclick="winBRopen('calMonth.asp?FormName=FormName&amp;FieldName=asofdate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="cal.gif" class="DatePicker" alt="Pick A Date" /></a>



	<a href="calMonth.asp" onclick="return popup(this, 'invrates')" >

	<img src="cal.gif" class="DatePicker" alt="Pick A Date" />
	</a>