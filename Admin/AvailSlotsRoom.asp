
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common/SQL_CN.asp"-->
<%

Dim CustomersMap(300)
AddID = request("AddID")
GroupID = -1

 If (AddID <> "") Then
	  SQL = "select * from cEvents WHERE ID = " & AddID
	  Set RS = SQLCN.Execute(SQL)

	  StartTime=RS("StartTime")
	  EndTime=RS("EndTime")
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
	  EventCustomerID=Rs("CustomerID")

	  Operator=Rs("Operator")

       GroupID=RS("GroupID")

	  'Response.Write "Edit ID = " & AddID
  Else
	  AddID = -1
	  EventCustomerID =-1
      GroupID = -1

	  dim d
      d = Date()
      StartTime =d
      EndTime=d
	  EventName="handyman"
	  isCHECKED="UNCHECKED"

	  'Response.Write "Add New"
 End If


  noCustomerSelected = ""
  if  EventCustomerID =-1 then
    noCustomerSelected = "selected"
  End If


  If (GroupID > 0 ) Then
  		Response.Write "<br> GroupID="&GroupID
  		SQL = "select * from GroupEvents WHERE ID = " & GroupID
          Response.Write SQL


  		Set RSGrp = SQLCN.Execute(SQL)
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



  		Response.Write "<br>using recurrence="& recurrence
  		Response.Write "<br>yearlyOntheXofthemonth="& yearlyOntheXofthemonth

  		if (recurrence = "hourly") then ishourlyCHECKED ="CHECKED" end if
  		if (recurrence = "daily") then isdailyCHECKED ="CHECKED" end if
  		if (recurrence = "weekly") then isweeklyCHECKED ="CHECKED" end if
  		if (recurrence = "monthly") then ismonthlyCHECKED ="CHECKED" end if
  		if (recurrence = "yearly") then isyearlyCHECKED ="CHECKED" end if


   Else
      Response.Write "<br> GroupID  empty <br>"
   End If


   min   = Minute(StartTime)
   min2  = Minute(EndTime)
   hr24  = Hour(StartTime)
   hr24_ = Hour(EndTime)

   if (operator ="") then operator = "Yanik"    end if
   if (category ="") then category = "Handyman" end if


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
				frmUser.EndDate.innerText=frmUser.StartDate.value
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

    return true;

}


function RadioChanged(frm)
{

}



//-->
</script>

<body onload="hide(this)">

<b> Open a Room </b>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr><td width="100%"><font face="Verdana" size="1"><br>


<!-- table border="0" cellpadding="2" cellspacing="0" width="517">
<tr><td width="100%"><font face="Verdana" size="1"><br -->

<!-------------------------------------------------Form------------------------------------------------------->
<form action="AvailSlotsBookedRoom.asp" name="frmUser" Method="Post" onSubmit="return VerifyData()">

<table border="0" cellpadding="3" cellspacing="0" align="center">
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Name of Room </b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">


<!-------------------------------------------------Operators------------------------------------------------------->
<!--#include file="common/select_operatorRooms.asp"-->
<!-------------------------------------------------Operators------------------------------------------------------->

&nbsp;

<input type="hidden" name="duration" value="60" />
<input type="hidden" name="StartHour" value="17" />
<input type="hidden" name="EndHour" value="18" />
<input type="hidden" name="Category" value="available" />
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C">&nbsp;&nbsp;</td>
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
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
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
	<input type="text" name="StartDate" id="fromRange" maxlength="10" size="8" value=<%=StartTime%> />
	<a href="javascript:;"
	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=fromRange&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" /></a>

 &nbsp; <font face="Verdana" size="1" color="48576C"><b> AND &nbsp;</b></font>

	<script type="text/javascript" src="inc/popupWindow.js">
	</script>
	<input type="text" name="EndDate" id="EndDate" maxlength="10" size="8" value=<%=EndTime%> />
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
    <input type="reset" name="Reset" value="Reset" class="inputSubmit">
	<input type="hidden" name="uid" value="<%=uid%>" >
</td>
<td>&nbsp;</td>
<td valign="bottom"><input type="submit" name="Submit" value="Add" class="inputSubmit"></font>
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
