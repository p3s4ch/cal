
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common/SQL_CN.asp"-->
<%

Dim CustomersMap(300)
AddID = request("AddID")
GroupID = request("GroupID")
Operator = request("Operator")

 If (GroupID > 0) Then

	  SQL = "select * from GroupEvents WHERE ID = " & GroupID
	  Set RSGrp = SQLCN.Execute(SQL)
      RangeStart=RSGrp("rangeStart")
	  RangeEnd=RSGrp("rangeEnd")

        Mon = RSGrp("Mon")
		Tue = RSGrp("Tue")
		Wed = RSGrp("Wed")
		Thu = RSGrp("Thu")
		Fri = RSGrp("Fri")
		Sat = RSGrp("Sat")
		Sun = RSGrp("Sun")
		startHr = RSGrp("startHr")
		endHr = RSGrp("endHr")
		duration = RSGrp("duration")
		recurrence = RSGrp("recurrence")
		hourlyEveryXhours = RSGrp("hourlyEveryXhours")
		dailyEveryXdays = RSGrp("dailyEveryXdays")
		monthlyOnDayXoftheMonth = RSGrp("monthlyOnDayXoftheMonth")
		monthlyEveryXmonths = RSGrp("monthlyEveryXmonths")
		yearlyOntheXofthemonth = RSGrp("yearlyOntheXofthemonth")
		yearlyOntheMonthOfX = RSGrp("yearlyOntheMonthOfX")

		if (recurrence = "hourly") then ishourlyCHECKED ="CHECKED" end if
		if (recurrence = "daily") then isdailyCHECKED ="CHECKED" end if
		if (recurrence = "weekly") then isweeklyCHECKED ="CHECKED" end if
		if (recurrence = "monthly") then ismonthlyCHECKED ="CHECKED" end if
		if (recurrence = "yearly") then isyearlyCHECKED ="CHECKED" end if



	  SQL = "select top 1 * from cEvents WHERE GroupID = " & GroupID
	  Set RS = SQLCN.Execute(SQL)
	  sDetails=Rs("Details")
	  category=Rs("Category")
	  eCategory=Category
	  AllDay=Rs("AllDay")
		  if AllDay = 1 then
					 allDayChecked ="CHECKED"
				   else
					   allDayChecked ="UNCHECKED"
		  end if
	  CatB=Rs("CatB")

  Else

	  GroupID = -1
      dim d
      d = Date()
      StartTime =d
      EndTime=d
	  EventName="handyman"
	  isCHECKED="UNCHECKED"
 End If


  'Response.Write "RangeStart="& RangeStart
  'Response.Write "RangeEnd="& RangeEnd


   min   = Minute(StartTime)
   min2  = Minute(EndTime)
   hr24  = Hour(StartTime)
   hr24_ = Hour(EndTime)

   if min < 15 then sMin = "0" & min else sMin = min  end if
   if min2 < 15 then sMin2 = "0" & min2 else sMin2 = min2  end if



   startTimeStr = hr24 & ":" & sMin & "AM"
   if hr24 = 12 then
   startTimeStr = hr24 & ":" & sMin & "PM"
   end if
   if hr24 > 12 then
   hr12 = hr24 - 12
   startTimeStr = hr12 & ":" & sMin & "PM"
   end if


   endTimeStr = hr24_ & ":" & sMin2 & "AM"
   if hr24_ = 12 then
   endTimeStr = hr24_ & ":" & sMin2 & "PM"
   end if
   if hr24_ > 12 then
   hr12_ = hr24_ - 12
   endTimeStr = hr12_ & ":" & sMin2 & "PM"
   end if

   'Response.Write "<br> CatA ="& CatA & "<br>"





%>
<!--#include file="common\banner.asp"-->
<script type="text/javascript" language="JavaScript"><!--
function hide(frm)
{
        var div_dur  = document.all("duration");
		var div_ref  = document.all("startTime");
		var div_ref2  = document.all("startTime2");
		if (frmUser.AllDayEvent.checked == true)
		{
				//alert("All day every day is checked");
				div_ref.style.visibility = "hidden";
				div_ref2.style.visibility = "hidden";
				div_dur.style.visibility = "hidden";
				//frmUser.EndDate.innerText=frmUser.StartDate.value
		}
		else
		{
			div_ref.style.visibility = "visible";
			div_ref2.style.visibility = "visible";
			div_dur.style.visibility = "visible";
    	}

}

function VerifyData()
{

    if ( document.frmUser.Details.value=="" )
        document.frmUser.Details.value = document.frmUser.Category.value;

    return true;

}


function RadioChanged(frm)
{

}



//-->
</script>

<body onload="hide(this)">

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr><td width="100%"><font face="Verdana" size="1"><br>

<!-- table border="0" cellpadding="2" cellspacing="0" width="517">
<tr><td width="100%"><font face="Verdana" size="1"><br -->

<!-------------------------------------------------Form------------------------------------------------------->
<form action="DayRangeBooked.asp" name="frmUser" Method="Post" onSubmit="return VerifyData()">

<table border="0" cellpadding="3" cellspacing="0" align="center">


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Calendar</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"> <%=Operator%><input type="hidden" name="Operator" value= "<%=Operator%> " > &nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>


<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------blank row---------------------------------------------------------->




<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C">&nbsp;&nbsp;</font></td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>
<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------Start Time---------------------------------------------------------->
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Start </b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">


<span id=startTime>
<select name="StartHour" class="inputbox">
<%
hourCounter = 1
Do WHILE hourCounter <= 6

  strTime = hourCounter &":00AM"
  strTimeDisplay = hourCounter &":00 AM"
  if startTimeStr=strTime then selected ="SELECTED" else  selected ="" end if%>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <%strTime = hourCounter &":30AM"

  strTimeDisplay = hourCounter &":30 AM"

  if startTimeStr=strTime then selected ="SELECTED" else  selected ="" end if%>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

<% hourCounter = hourCounter + 1
   Loop
  '-------------------------------------------------------------------------
  hourCounter = 7
  Do WHILE hourCounter < 12

  strTime = hourCounter &":00AM"
  strTimeDisplay = hourCounter &":00 AM"
  if startTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <%strTime = hourCounter &":15AM"
  strTimeDisplay = hourCounter &":15 AM"
  if startTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <% strTime = hourCounter &":30AM"
  strTimeDisplay = hourCounter &":30 AM"
  if startTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <% strTime = hourCounter &":45AM"
  strTimeDisplay = hourCounter &":45 AM"
  if startTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

<%

 hourCounter = hourCounter + 1
 Loop

  hourCounter = 0
  Do WHILE hourCounter < 12

  if hourCounter = 0  then
  hr = 12
  else
  hr = hourCounter
  end if

  strTime = hr &":00PM"
  strTimeDisplay = hr &":00 PM"
  if startTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <%strTime = hr &":15PM"
  strTimeDisplay = hr &":15 PM"
  if startTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <%strTime = hr &":30PM"
  strTimeDisplay = hr &":30 PM"
  if startTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <%strTime = hr &":45PM"
  strTimeDisplay = hr &":45 PM"
  if startTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

<%

hourCounter = hourCounter + 1
Loop

%>
</select>
</span>

<input type="checkbox" name="AllDayEvent" VALUE="1" <%=allDayChecked%> onclick="hide(this)" >
<font face="Verdana" size="1" color="48576C"><b>All Day </b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</td>
<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------blank row---------------------------------------------------------->
</tr>
<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C">&nbsp;&nbsp;</font></td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Duration</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">
						<select name="duration" class="inputBox">
						<option value="5" >5 minutes</option>
						<option value="15" >15 minutes</option>
						<option value="30" >30 minutes</option>
						<option value="60" >1 hour</option>
						<option value="120" SELECTED>2 hours</option>
						<option value="180" >3 hours</option>
						<option value="240" >4 hours</option>
						<option value="480" >8 hours</option>
						</select>
</td>
</tr>



<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>



<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------End Time---------------------------------------------------------->
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>End </b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">


<span id=startTime2>

<select name="EndHour" class="inputbox">

<%
hourCounter = 1
Do WHILE hourCounter <= 6

  strTime = hourCounter &":00AM"
  strTimeDisplay = hourCounter &":00 AM"
  if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if%>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <%strTime = hourCounter &":30AM"
  strTimeDisplay = hourCounter &":30 AM"
  if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if%>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

<% hourCounter = hourCounter + 1
   Loop
  '-------------------------------------------------------------------------
  hourCounter = 7
  Do WHILE hourCounter < 12

  strTime = hourCounter &":00AM"
  strTimeDisplay = hourCounter &":00 AM"
  if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <%strTime = hourCounter &":15AM"
  strTimeDisplay = hourCounter &":15 AM"
  if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <% strTime = hourCounter &":30AM"
  strTimeDisplay = hourCounter &":30 AM"
  if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <% strTime = hourCounter &":45AM"
  strTimeDisplay = hourCounter &":45 AM"
  if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

<% hourCounter = hourCounter + 1
Loop
hourCounter = 0
Do WHILE hourCounter <12

  if hourCounter = 0  then
  hr = 12
  else
  hr = hourCounter
  end if




  strTime = hr &":00PM"
  strTimeDisplay = hr &":00 PM"
  if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <%strTime = hr &":15PM"
  strTimeDisplay = hr &":15 PM"
  if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <%strTime = hr &":30PM"
  strTimeDisplay = hr &":30 PM"
  if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

  <%strTime = hr &":45PM"
  strTimeDisplay = hr &":45 PM"
  if endTimeStr=strTime then selected ="SELECTED" else  selected ="" end if %>
  <option value="<%=strTime%>"  <%=selected%> >  <%=strTimeDisplay%>  </option>

<% hourCounter = hourCounter + 1
Loop
%>
</select>

</span>
</td>
</tr>

<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------blank row---------------------------------------------------------->

<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>


<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Category</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">
<select name="Category" class="inputBox">

<option value="Holiday" SELECTED>Holiday</option>
<option value="Reminder" >Reminder</option>
<option value="Task" >Task</option>

</select> &nbsp

<font face="Verdana" size="1" color="48576C"><b>Colour</b></font>

<select name="Color" class="inputBox">

<option value="87CEEB" SELECTED>blue</option>
<option value="F0E68C"> yellow</option>
<option value="90EE90"> green</option>
<option value="FFA500"> orange</option>
</select>






</td>
</tr>
</tr>

<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>

<tr>
<td bgcolor="#DAE3F0">
<input type="radio" name="recurrence" VALUE="weekly" <%=isweeklyCHECKED%> >
        <font face="Verdana" size="1" color="48576C"><b>                       Weekly:</font>
</td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">

        <font face="Verdana" size="1" color="48576C">Every &nbsp; <input type="text" name="EveryXweeks" size=1> &nbsp; week(s) on:




        &nbsp;<input type="checkbox" name="mon" value=1> Monday&nbsp;
		&nbsp;<input type="checkbox" name="tue" value=1> Tuesday &nbsp;
		&nbsp;<input type="checkbox" name="wed" value=1> Wednesday &nbsp;
		&nbsp;<input type="checkbox" name="thu" value=1> Thursday &nbsp;
		&nbsp;<input type="checkbox" name="fri" value=1> Friday &nbsp;
		&nbsp;<input type="checkbox" name="sat" value=1> Saturday &nbsp;
        &nbsp;<input type="checkbox" name="sun" value=1> Sunday &nbsp;







        </font>


</td>
</tr>


<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>


<tr>
<td bgcolor="#DAE3F0">
<input type="radio" name="recurrence" VALUE="monthly" <%=ismonthlyCHECKED%> >
        <font face="Verdana" size="1" color="48576C"><b>      Monthly: </b>
</td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C">
        Day  &nbsp; <input type="text" name="monthlyOnDayXoftheMonth" size=1 value=5> &nbsp;of every
        <input type="text" name="monthlyEveryXmonths" size=1 value=1> &nbsp; months(s)
         &nbsp; </font></td>
</tr>


<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>


<tr>
<td bgcolor="#DAE3F0">
<input type="radio" name="recurrence" VALUE="yearly" <%=isyearlyCHECKED%> >
        <font face="Verdana" size="1" color="48576C"><b>                     Yearly:</font>
</td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C">
            Every year on the &nbsp;<input type="text" name="yearlyOntheXofthemonth" value=10 size=1> &nbsp; of
        &nbsp;





         <select name="yearlyOntheMonthOfX">

				            <option value=1>January</option>
				            <option value=2>February</option>
				            <option value=3>March</option>
				            <option value=4>April</option>
				            <option value=5>May</option>
				            <option value=6>June</option>
				            <option value=7>July</option>
				            <option value=8>August</option>

				            <option value=9>September</option>
				            <option value=10>October</option>
				            <option value=11>November</option>
				            <option value=12>December</option>
		            </select>

         </font>
</td>
</tr>

<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>

<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------Start Range From---------------------------------------------------------->
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Between &nbsp;</font></td>
<td bgcolor="#DAE3F0"></td>

<td bgcolor="#DAE3F0">
	<script type="text/javascript" src="inc/popupWindow.js"></script>
	<input type="text" name="StartDate" id="fromRange" maxlength="10" size="8" value=<%=RangeStart%> />
	<a href="javascript:;"
	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=fromRange&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" /></a>

 &nbsp; <font face="Verdana" size="1" color="48576C"><b> AND &nbsp;</b></font>

	<script type="text/javascript" src="inc/popupWindow.js">
	</script>

	<input type="text" name="EndDate" id="EndDate" maxlength="10" size="8" value=<%=RangeEnd%> />
	<a href="javascript:;"	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=EndDate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" /></a>
</td>
</tr>

<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>



<tr>

<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Details</b></font></td>
<td bgcolor="#DAE3F0"></td>

<td bgcolor="#DAE3F0"> <textarea name="Details" class="inputbox" cols="35" rows="4"> <%=sDetails%> </textarea>  </td>

</tr>



<tr>
<td bgcolor="#C5D3E7"> &nbsp; &nbsp;</td>
<td bgcolor="#C5D3E7"> &nbsp; &nbsp;</td>
<td bgcolor="#C5D3E7"> &nbsp; &nbsp;</td>
</tr>


<tr>
<td align="right" valign="bottom">

	<input type="hidden" name="uid" value="<%=uid%>" >
	<input type="hidden" name="groupID" value="<%=GroupID%>" >


</td>
<td>&nbsp;</td>
<td valign="bottom">

<input type="submit" name="Submit" value="Delete" class="inputSubmit">
<input type="submit" name="Submit" value="Add" class="inputSubmit">

</font>
</td>
</tr>

</table>
</form>

<!--/td></tr></table-->
<!--/td></tr></table-->
</tr>

</table>
</td></tr>
<!--#include file="common\copyright.asp"-->
</table>

</body>
</html>
<!--#include file="dsn2.asp"-->