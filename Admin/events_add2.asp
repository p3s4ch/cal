<!--#include file="style.asp"-->
<!--#include file="common/SQL_CN.asp"-->
<!--#include file="common/GilonHiddenURLSession.asp"-->

<%
Dim CustomersMap(300)
AddID = request("AddID")
Operator = Trim(request("Operator"))
GroupID=0
 If (AddID <> "") Then
	  SQL = "select * from cEvents WHERE ID = " & AddID
	  Set RS = SQLCN.Execute(SQL)

	  StartTime=RS("StartTime")
	  EndTime=RS("EndTime")
	  EventName=RS("Title")
	  GroupID=RS("GroupID")
	  sDetails=Rs("Details")
	  Category=Rs("Category")
	  'eCategory=Category
	  AllDay=Rs("AllDay")
	  if AllDay = 1 then
                        allDayChecked ="CHECKED"
                        else
                           allDayChecked ="UNCHECKED"
                       end if
	  CatB=Rs("CatB")
	  EventCustomerID=Rs("CustomerID")

	  sOffice=Rs("Office")
	  BillTotal=Rs("BillTotal")
	  SiteAddress=Rs("SiteAddress")
	  SitePostCode=Rs("SitePostCode")
	  Operator=Trim(Rs("Operator"))
	  SameAsBill=Rs("SameAsBill")
      duration=Rs("duration")

	  if (SameAsBill=1) then
	   isCHECKED="CHECKED"
	  else
	   isCHECKED="UNCHECKED"
	  end if


	  'Response.Write "Edit ID = " & AddID

	  if  Category = "available" then Category = "NotYetSelected" end if
  Else
	 AddID = -1
	 EventCustomerID =-1
     dim d
     iDay=request("iDay")
     iMonth= request("iMonth")
     iYear = request("iYear")

     if iDay <> "" and iMonth <> "" and iYear <> "" then
        tryDt = iDay &" "& MonthName(iMonth) &" "& iYear
        d = CDate(tryDt)
       else

         d = Date()
     end if

     StartTime =DateAdd("h",8,d)
     EndTime=DateAdd("h",9,d)
	 EventName="handyman"

	 Category = "NotYetSelected"
	 isCHECKED="UNCHECKED"
	 startTimeStr = "8:00AM"
	 endTimeStr   = "9:00AM"
	 BillTotal ="0.00"
	 duration = -1
 End If


Dim StartTimeDt
StartTimeDt = CDate(StartTime)
StartDayOfWeek     = WeekdayName(Weekday(StartTimeDt))


  noCustomerSelected = ""
  if  EventCustomerID =-1 then
    noCustomerSelected = "selected"
  End If



   min = Minute(StartTime)
   min2 = Minute(EndTime)
   hr24 = Hour(StartTime)
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

   if (operator ="") then operator = "Yanik"    end if

   'Response.Write "duration = " & duration
   Category = trim(Category)

%>


<!--#include file="common\banner.asp"-->
<script type="text/javascript" language="JavaScript"><!--
function f2(frm)
{
        //the difference between f2 and hide is that the EndDate is not touched
		var div_ref  = document.all("startTime");
		var div_ref2  = document.all("startTime2");
		if (frmUser.AllDayEvent.checked == true)
		{
				//alert("All day every day is checked");
				div_ref.style.visibility = "hidden";
				div_ref2.style.visibility = "hidden";

		}
		else
		{
			div_ref.style.visibility = "visible";
			div_ref2.style.visibility = "visible";
    	}

    	doCat(this);

}
function hide(frm)
{
		var div_ref  = document.all("startTime");
		var div_ref2  = document.all("startTime2");
		if (frmUser.AllDayEvent.checked == true)
		{
				//alert("All day every day is checked");
				div_ref.style.visibility = "hidden";
				div_ref2.style.visibility = "hidden";
				//frmUser.EndDate.innerText=frmUser.StartDate.value
		}
		else
		{
			div_ref.style.visibility = "visible";
			div_ref2.style.visibility = "visible";
    	}

}

function VerifyData()
{



  var idx;
  var subm;
  var cat;
  //idx = document.frmUser.CustomerID.selectedIndex;
  cat = document.frmUser.category[document.frmUser.category.selectedIndex].innerText;

  if (cat == "Errand" || cat == "Holiday" || cat == "Kids" || cat == "Telephone Quote" )
  {
    document.frmUser.CustomerID.value=50;
    return true;
  }


  if (cat == "_please select_")
     {
	 		  alert("Please select a category before saving");
	 		  return false;
	  }



  if ( document.frmUser.Address.value=="" )
      {
		  alert("You must either enter a Site Address or check the box that indicates Same as Billing Address");
		  return false;
      }

  if ( document.frmUser.PostCode.value =="" )
      {
     	  alert("Please either enter a Site PostCode or check the box that indicates Same as Billing Address");
  		  return false;
      }



if ( document.frmUser.Email.value =="" )
      {
     	  alert("Please enter an Email this is required for your booking");
  		  return false;
      }


 if ( document.frmUser.PostCode.value.length < 3 )
      {
     	  alert("Please enter a full PostCode");
  		  return false;
      }

 return true;


}


function IsSameAsBill(frm)
{

		if (frmUser.SameAsBill.checked == true)
		{
		    frmUser.Address.value = frmUser.BillAddress.value;
		    frmUser.PostCode.value = frmUser.BillPostCode.value;
		    if (frmUser.BillAddress.value == "")
		    {
		    	alert("Billing Address is incomplete");
		    }

		}

}

function playFocus(frm)
{

		frmUser.category.focus();
		var div_cat  = document.all("catsFocus");
		div_cat.style.visibility = "hidden";
}


function catIsOK(frm)
{

		var div_cat  = document.all("catsFocus");
		cat = document.frmUser.category[document.frmUser.category.selectedIndex].value;

		if (cat == "NotYetSelected"){
			alert("you must select a category")
		    div_cat.style.visibility = "visible";
		}
		else
		    div_cat.style.visibility = "hidden";


}



//-->
</script>

<body onload="f2(this); initDuration(this); moveTo(this); playFocus(this); initTotalBillFromDB(this)">
<%
if isAdmin then
%>

    <a href="event_add_admin.asp?uid=<%=uid%>&AddId=<%=AddId%>">
       <font face="Verdana" size="1" color=green><b>&nbsp;Admin</b></font></a>

<%
end if
%>
<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr><td width="100%"><font face="Verdana" size="1"><br>





<!-- table border="0" cellpadding="2" cellspacing="0" width="517">
<tr><td width="100%"><font face="Verdana" size="1"><br -->

<!-------------------------------------------------Form------------------------------------------------------->
<form action="confirm_event.asp" name="frmUser" Method="POST" >

<table border="0" cellpadding="3" cellspacing="0" align="center">



<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Booking</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"> <%=Operator%><input type="hidden" name="Operator" value= "<%=Operator%> " > &nbsp;
</tr>


<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>


<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------blank row---------------------------------------------------------->

<!-- #include file="PricesByCategory.asp" -->

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Category</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">

<span id=catsFocus><font color=red><b>!</b></font> </span>

<script language="JavaScript">
 function doCat2(obj)
  {
   cat = document.frmUser.category.options[document.frmUser.category.selectedIndex].innerText;
   if (cat == "Errand" || cat == "Holiday" || cat == "Kids" )
      {
        //document.frmUser.CustomerID.options[i].value=50;
        document.frmUser.Surname.value="NA";
      }
 }
 </script>

<!--  #include file="cats.asp"-->


</td>
</tr>
</tr>

<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>



<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------Start Time---------------------------------------------------------->
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Start Time</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">
	<script type="text/javascript" src="inc/popupWindow.js"></script>

<%
cDtStart =  CDate(StartTime)



%>  <%=WeekdayName(WeekDay(cDtStart))%> &nbsp;

<%=Day(cDtStart)%>	&nbsp; <%=MonthName(Month(cDtStart))%> &nbsp;<%=Year(cDtStart)%>


<% if isAdmin then %>
    	 <input type="text" name="StartDate" id="StartDate" value=<%=StartTime%> />
<% else %>
		<input type="hidden" name="StartDate" id="StartDate" value=<%=StartTime%> />
<% end if %>


<span id=startTime>
<select name="StartHour" class="inputbox"  onChange="doDuration(this)" onFocus="catIsOK(this)">
<!--#include file="common/HourOptions.asp"-->
</select>
</span>

<input type="hidden" name="AllDayEvent" VALUE="0" >

</td>
<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------blank row---------------------------------------------------------->
</tr>

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C">&nbsp;&nbsp;</font></td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>

<script language="JavaScript">
 function doDuration(obj)
 {
     x = document.frmUser.StartDate.value + " " + document.frmUser.StartHour.value;

	 D_Y=x.substring(6,10);
	 D_M=x.substring(0,2);
	 D_D=x.substring(3,5);
     idx = x.indexOf(":")
     D_DH=x.substring(idx-2,idx);
     D_MM=x.substring(idx+1,idx+3);
     D_N= x.substring(x.length-2);

     //alert("D_DH=" + D_DH );
     //alert("D_MM=" + D_MM );

     y= D_D +"/"+ D_M +"/"+ D_Y +" "+D_DH +":"+ D_MM + " "+  D_N
	 //alert("doDuration ");

     startDt = new Date(y)
     durMin = document.frmUser.duration.options[document.frmUser.duration.selectedIndex].durMin;
     durHr  = document.frmUser.duration.options[document.frmUser.duration.selectedIndex].durHr;

	 total_min = Number(startDt.getMinutes()) +Number(durMin);
	 total_hrs = Number(startDt.getHours()) +Number(durHr);

	 if (total_min > 60)
	   total_min = Number(total_min) - 60;

	 //alert("total_min less 60 ="   + total_min);

     endTimeStr = "12:00PM";

     if (total_hrs > 12 )
     {
         x = total_hrs - 12;
         endTimeStr = x + ":00PM";
     }
     if (total_hrs < 12 )
     {
         endTimeStr = total_hrs + ":00AM";
     }
     if (total_hrs > 24 )
	 {
	          x = total_hrs - 24;
	          endTimeStr = x + ":00AM";
	          alert("Total hours is past midnight please remember to change the END date !");

     }

     document.frmUser.EndHour.value = endTimeStr;
	 //Now set BillTotal
	 document.frmUser.BillTotal.value = document.frmUser.duration.options[document.frmUser.duration.selectedIndex].price;
	 //}
}



function initDuration(obj)
{

     duration =  document.frmUser.DBduration.value;
     //alert ("init duration =" + duration);

     i = 0;
     if (document.frmUser.duration.options[i].value == duration)	   document.frmUser.duration.selectedIndex = i;

	i++;  if (document.frmUser.duration.options[i].value == duration)  document.frmUser.duration.selectedIndex = i;
    i++;  if (document.frmUser.duration.options[i].value == duration)  document.frmUser.duration.selectedIndex = i;
    i++;  if (document.frmUser.duration.options[i].value == duration)  document.frmUser.duration.selectedIndex = i;
	i++;  if (document.frmUser.duration.options[i].value == duration)  document.frmUser.duration.selectedIndex = i;
    i++;  if (document.frmUser.duration.options[i].value == duration)  document.frmUser.duration.selectedIndex = i;
	i++;  if (document.frmUser.duration.options[i].value == duration)  document.frmUser.duration.selectedIndex = i;
	i++;  if (document.frmUser.duration.options[i].value == duration)  document.frmUser.duration.selectedIndex = i;
	i++;  if (document.frmUser.duration.options[i].value == duration)  document.frmUser.duration.selectedIndex = i;

}

function initTotalBillFromDB(obj)
{

     document.frmUser.BillTotal.value = document.frmUser.tempX.value;
}

</script>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C">Duration</font></td>
<td bgcolor="#DAE3F0">&nbsp;&nbsp;</td>

<td bgcolor="#DAE3F0">

<input type=hidden name=DBduration value=<%=duration%> >

 <select name=duration onFocus="catIsOK(this)" onChange="doDuration(this);">
 <option durMin=0 durHr=1  value=60  price=0.00 >1 hour </option>
 <option durMin=0 durHr=2  value=120 price=0.00 >2 hours &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;.&nbsp;&nbsp;&nbsp;&nbsp;............................................</option>
 <option durMin=0 durHr=3  value=180 price=0.00 >3 hours &nbsp;</option>
 <option durMin=0 durHr=4  value=240 price=0.00 >4 hours &nbsp;</option>
 <option durMin=0 durHr=5  value=300 price=0.00 >5 hours &nbsp;</option>
 <option durMin=0 durHr=6  value=360 price=0.00 >6 hours &nbsp;</option>
 <option durMin=0 durHr=7  value=420 price=0.00 >7 hours &nbsp;</option>
 <option durMin=0 durHr=8  value=480 price=0.00 >8 hours &nbsp;</option>
 <option durMin=0 durHr=0  value=-1  price=0.00 ></option>
 <option durMin=0 durHr=0  value=-1  price=0.00 ></option>
 <option durMin=0 durHr=0  value=-1  price=0.00 ></option>
 </select>

 <font face="Verdana" size="1" color="48576C"><b>End Time</b></font>



 <% if isAdmin then %>

     	 <input type="text" name="EndDate" id="EndDate" maxlength="10" size="8" value=<%=EndTime%>  />
 <% else %>

 		<input type="hidden" name="EndDate" id="EndDate" maxlength="10" size="8" value=<%=EndTime%> readonly="readonly" />

<% end if %>


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

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C">&nbsp;&nbsp;</font></td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>


<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------End Time---------------------------------------------------------->




<% if isAdmin then %>
    <!--#include file="customer.asp"-->
<% else %>
     <!--#include file="customerOnly.asp"-->
<% end if  %>







<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">  <input type="checkbox" name="SameAsBill" VALUE="1" <%=isCHECKED%> onclick="IsSameAsBill(this)" >
                        <font face="Verdana" size="1" color="48576C"><b>Same as Billing Address:</b>
                        </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>



<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Site Address</b></font></td>
<td bgcolor="#C5D3E7"></td>
<td bgcolor="#C5D3E7"><input type="text" name="Address" class="inputbox" size="50" maxlength="255" value= "<%=SiteAddress%>" >
<font face="Verdana" size="1" color="48576C"><b>&nbsp;Post Code</b></font>
<input type="text" name="PostCode" class="inputbox" size="10" maxlength="255" value= "<%=trim(SitePostCode)%>" ></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Details</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><textarea name="Details" class="inputbox" cols="85" rows="5" onFocus="catIsOK(this)"> <%=sDetails%> </textarea>
</td>
</tr>




<% if isAdmin then %>
<tr>
<td bgcolor="#C5D3E7""><font face="Verdana" size="1" color="48576C"><b>Office</b></font></td>
<td bgcolor="#C5D3E7""></td>
<td bgcolor="#C5D3E7""><textarea name="Office" class="inputbox" cols="85" rows="5"> <%=sOffice%> </textarea>
</td>
</tr>
<% else %>
<input type=hidden name=office value=<%=sOffice%> >
<% end if  %>

<tr>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">

<input type="hidden" name="AddId" value=<%=AddId%> class="inputbox" size="30" maxlength="255">
<input type="hidden" name="tempX" value=<%=BillTotal%> >

</td>
</tr>

<tr>
<td bgcolor="#DAE3F0"> &nbsp;  &nbsp; </td>
<td bgcolor="#DAE3F0"> &nbsp;  &nbsp; </td>
<td bgcolor="#DAE3F0"> &nbsp;  &nbsp; </td>
</tr>

<tr>
<td bgcolor="#C5D3E7""><font face="Verdana" size="1" color="48576C"><b>Estimated Total Bill   &nbsp;  </b></font></td>
<td bgcolor="#C5D3E7""></td>
<td bgcolor="#C5D3E7""><input type="text" name="BillTotal" value="<%=BillTotal%>" class="inputbox"

size="10" maxlength="255"  <% if isCustomer then %> readonly <% end if%> >  &nbsp;  &nbsp;
<font face="Verdana" size="1" color="48576C"> * Excluding materials. The final price may vary. If in doubt please call 0788 1966867.
<input type="hidden" name="cash"           VALUE="1" >
<input type="hidden" name="cheque"         VALUE="1" >
<input type="hidden" name="card"  VALUE="1" > &nbsp;</font></td>
</tr>



<script type="text/javascript" language="JavaScript">
<!--
function moveTo(obj)
{


		var div_a  = document.all("moveTowho");
		if (( frmUser.cpTo != null) && ( frmUser.mvTo != null))
		{
			if ( (frmUser.cpTo.checked == true) || (frmUser.mvTo.checked == true) )
			{
					div_a.style.visibility = "visible";
			}
			else
			{
					div_a.style.visibility  = "hidden";

			}
    	}
}

function mvToClick(obj)
{
		frmUser.cpTo.checked = false;
		moveTo(obj);
}

function cpToClick(obj)
{
		frmUser.mvTo.checked = false;
		moveTo(obj);
}

-->





</script>

<tr>
<td bgcolor="#DAE3F0"> &nbsp;  &nbsp; </td>
<td bgcolor="#DAE3F0"> &nbsp;  &nbsp; </td>
<td bgcolor="#DAE3F0">

<% if isAdmin then %>

<input type="checkbox" name="cpTo" VALUE="1"  onclick="cpToClick(this)">
                        <font face="Verdana" size="1" color="48576C"><b>copy
                        <input type="checkbox" name="mvTo" VALUE="1"  onclick="mvToClick(this)" >
						move to other calendar:</b></font>&nbsp;
						<span id="moveTowho">
						<select name=moveToName>
						<option value="" SELECTED></option>
                            <%
                            Set RSOPERATOR = Server.CreateObject("ADODB.Recordset")
                            RSOPERATOR.Open "Operators", SQLCN, 2, 2
	                            Do While Not RSOPERATOR.eof
	                            %>
		                            <option value="<%=RSOPERATOR("Name")%>"><%=RSOPERATOR("Name")%></option>
	                            <%
	                        RSOPERATOR.movenext
                            Loop
                            RSOPERATOR.close
                            set RSOPERATOR = nothing
                            %>

						</select>

						</span>

<% end if %>

</td>
</tr>


<tr>
<td align="right" valign="bottom"> &nbsp; </td>
<td>&nbsp;</td>

<td valign="bottom">
                   <input type="hidden"  name="uid" value="<%=uid%>" >
                   <input type="submit" name="Submit" value="Save" class="inputSubmit" onclick="return VerifyData()"> &nbsp; &nbsp;
                   <input type="submit"  name="Submit" value="Delete" class="inputSubmit"></font></td>
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
