<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common/SQL_CN.asp"-->

<%


Dim CustomersMap(300)
AddID = request("AddID")
Operator = Trim(request("Operator"))
GroupID=0
isAdmin = true

 If (AddID <> "") Then
	  SQL = "select * from cEvents WHERE ID = " & AddID
	  Set RS = SQLCN.Execute(SQL)

	  StartTime=RS("StartTime")
	  EndTime=RS("EndTime")
	  EventName=RS("Title")
	  GroupID=RS("GroupID")
	  sDetails=Rs("Details")
	  Category=Rs("Category")
	  eCategory=Category
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

	  if (SameAsBill=1) then
	   isCHECKED="CHECKED"
	  else
	   isCHECKED="UNCHECKED"
	  end if


	  'Response.Write "Edit ID = " & AddID
  Else
	  AddID = -1
	  EventCustomerID =-1

     dim d
     iDay=request("iDay")
     iMonth= request("iMonth")
     iYear = request("iYear")
     tryDt = iDay &"/"& iMonth &"/"& iYear

     if iDay <> "" and iMonth <> "" and iYear <> "" then
        d = CDate(tryDt)
       else

         d = Date()
     end if
      'Response.Write "Got date "& d

      StartTime =DateAdd("h",8,d)
      EndTime=DateAdd("h",10,d)

	  EventName="handyman"
	  isCHECKED="UNCHECKED"

	  'Response.Write "Add New"
 End If

Dim StartTimeDt
StartTimeDt = CDate(StartTime)
StartDayOfWeek     = WeekdayName(Weekday(StartTimeDt))
'Response.Write "StartDayOfWeek =" &  StartDayOfWeek

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
   if (category ="") then category = "Handyman" end if

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

  if ( document.frmUser.BillAddress.value=="")
      {
		  alert("You must enter a Billing Address");
		  return false;
      }

  if ( document.frmUser.BillPostCode.value =="" )
      {
     	  alert("You must enter a Billing Post Code");
  		  return false;
      }


 if ( document.frmUser.FromAddress.value=="" )
      {
  		  alert("You must either enter a Starting Address or check the little box that indicates Starting Address is same as Billing Address");
  		  return false;
      }


 if ( document.frmUser.FromPostCode.value =="" )
      {
        alert("You must either enter a Starting PostCode or check the little box that indicates Starting Address is same as Billing Address");
        return false;
      }

if ( document.frmUser.ToAddress.value=="" )
      {
  		  alert("You must either enter a Destination Address or check the little box that indicates Destination Address is same as Billing Address");
  		  return false;
      }


 if ( document.frmUser.ToPostCode.value =="" )
      {
        alert("You must either enter a Destination PostCode or check the little box that indicates Destination Address is same as Billing Address");
        return false;
      }



   if (( document.frmUser.BillPostCode.value.length < 3 ) ||
       ( document.frmUser.FromPostCode.value.length < 3 ) ||
       ( document.frmUser.ToPostCode.value.length   < 3 ))
        {
       	  alert("Please enter full PostCodes");
    		  return false;
        }

  return true;
}













function IsSameAsBill(frm)
{

		if (frmUser.SameAsBill.checked == true)
		{
		    frmUser.FromAddress.value = frmUser.BillAddress.value;
		    frmUser.FromPostCode.value = frmUser.BillPostCode.value;

		    if (frmUser.BillAddress.value == "")
		    {
			    alert("Billing Address is incomplete");
		    }

		}
}

function ToIsSameAsBill(frm)
{
        if (frmUser.ToSameAsBill.checked == true)
		{
			    frmUser.ToAddress.value = frmUser.BillAddress.value;
			    frmUser.ToPostCode.value = frmUser.BillPostCode.value;

				if (frmUser.BillAddress.value == "")
			    {
					alert("Billing Address is incomplete");
	    		}
		}

}

//-->
</script>

<script language="JavaScript">
 function duration(obj)
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
	 //alert("y=" + y);
     k = new Date(y)
     alert("k before" +k);

     durationH =document.frmUser.durationHRS.options[document.frmUser.durationHRS.selectedIndex].value;

     alert("durationH" +durationH);

     k.setHours(k.getHours() + durationH);
     alert("k after" +k);

 if (obj.name == "durationHRS")
 {

	 document.getElementById('EndHRtxt').innerHTML =
	 document.frmUser.durationHRS.options[document.frmUser.durationHRS.selectedIndex].value + ":"
	 +
	 document.frmUser.durationMINS.options[document.frmUser.durationMINS.selectedIndex].value +"PM" ;

 }

}
function doDurationMINS(obj)
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
	 alert("y=" + y);

     k = new Date(y)
     alert("staring k is " +k);
     alert("staring k minutes " + k.getMinutes());

     durationM =document.frmUser.durationMINS.options[document.frmUser.durationMINS.selectedIndex].value;

     alert("duration of Minutes = " +durationM);
     var total_min = 0;
     total_min = Number(k.getMinutes()) +Number(durationM);

     alert("total_min = " +total_min);

     document.getElementById('EndMINtxt').innerHTML =total_min;


 }

 </script>




<body onload="f2(this)">

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr><td width="100%"><font face="Verdana" size="1"><br>

<!-- table border="0" cellpadding="2" cellspacing="0" width="517">
<tr><td width="100%"><font face="Verdana" size="1"><br -->

<!-------------------------------------------------Form------------------------------------------------------->
<form action="../confirm_event.asp" name="frmUser" Method="Post" onSubmit="return VerifyData()">

<table border="0" cellpadding="3" cellspacing="0" align="center">
<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C">
<h2>
Booking Man & Van
</h2>

<b>Name of operator</b></font>

<%=Operator%><input type="hidden" name="Operator" class="inputbox" size="20" maxlength="55" value= "<%=Operator%> "  >

</td>
<td bgcolor="#C5D3E7"></td>
<td bgcolor="#C5D3E7">&nbsp;

<% if GroupID>0 and category <> "available" then %>
   <a href="BlockBook.asp?AddID=<%=AddID%>">
   <font face="Verdana" size="1" color="48576C">  This event is part of a series. Click here to open series </font> </a>
<%
end if
%>
</td>

</tr>

<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------blank row---------------------------------------------------------->
</tr>
<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C">&nbsp;&nbsp;</font></td>
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
	<input type="text" name="StartDate" id="StartDate" maxlength="10" size="8" value=<%=StartTime%>  />
	<a href="javascript:;"
	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=StartDate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" /></a>

<span id=startTime>
<select name="StartHour" class="inputbox"  onChange="doDurationMINS(this)"   >
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

<input type="hidden" name="AllDayEvent" VALUE="1" <%=allDayChecked%> onclick="hide(this)" >
</td>
</tr>




<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>







<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C">Duration*&nbsp;&nbsp;</font></td>
<td bgcolor="#DAE3F0">&nbsp;&nbsp;</td>
<td bgcolor="#DAE3F0">

<font face="Verdana" size="1" color="48576C">
<select name="durationHRS" onChange="duration(this)">
<option value=0>0</option>
<option value=1 selected>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>

</select> hour(s)

<select name=durationMINS onChange="doDurationMINS(this)">
<option value=1>1</option>
<option value=2>2</option>
<option value=3>3</option>
<option value=4>4</option>
<option value=5>5</option>
<option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>

<option value=11>11</option>
<option value=12>12</option>
<option value=13>13</option>
<option value=14>14</option>
<option value=15>15</option>
<option value=16>16</option>
<option value=17>17</option>
<option value=18>18</option>
<option value=19>19</option>
<option value=20>20</option>

<option value=21>21</option>
<option value=22>22</option>
<option value=23>23</option>
<option value=24>24</option>
<option value=25>25</option>
<option value=26>26</option>
<option value=27>27</option>
<option value=28>28</option>
<option value=29>29</option>
<option value=30>30</option>

<option value=31>31</option>
<option value=32>32</option>
<option value=33>33</option>
<option value=34>34</option>
<option value=35>35</option>
<option value=36>36</option>
<option value=37>37</option>
<option value=38>38</option>
<option value=39>39</option>
<option value=40>40</option>

<option value=41>41</option>
<option value=42>42</option>
<option value=43>43</option>
<option value=44>44</option>
<option value=45>45</option>
<option value=46>46</option>
<option value=47>47</option>
<option value=48>48</option>
<option value=49>49</option>
<option value=50>50</option>

<option value=51>51</option>
<option value=52>52</option>
<option value=53>53</option>
<option value=54>54</option>
<option value=55>55</option>
<option value=56>56</option>
<option value=57>57</option>
<option value=58>58</option>
<option value=59>59</option>

</select> minutes


</font>&nbsp;

<font face="Verdana" size="1" color="48576C">
*includes loading plus journey time
</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


</td>
</tr>



<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------blank row---------------------------------------------------------->
</tr>
<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C">&nbsp;&nbsp;</font></td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>
<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------End Time---------------------------------------------------------->
<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>End Time</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0">
	<input type="hidden" name="EndDate" id="EndDate" maxlength="10" size="8" value=<%=EndTime%> />
<span id=startTime2>
        <b id="EndHRtxt" >12 </b>
        :
        <b id="EndMINtxt">23 </b>
        &nbsp;
        <b id="EndAMtxt"> PM </b>

		<input type="hidden" name="EndHour" class="inputbox" value="15:23 PM" size=8 disabled>
</span>



</td>
<!-------------------------------------------------------------------------------------------------------->
<!-----------------------------------blank row---------------------------------------------------------->
</tr>


<!--#include file="customer.asp"-->


<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">  <input type="checkbox" name="SameAsBill" VALUE="1" <%=isCHECKED%> onclick="IsSameAsBill(this)" >
                        <font face="Verdana" size="1" color="48576C"><b>Check box if starting from is the same as Billing Address:</b>
                        </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>


<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Starting From Pickup Address</b></font></td>
<td bgcolor="#C5D3E7"></td>
<td bgcolor="#C5D3E7"><input type="text" name="FromAddress" class="inputbox" size="50" maxlength="255" value= "<%=SiteAddress%>" >
<font face="Verdana" size="1" color="48576C"><b>&nbsp;Post Code</b></font>
<input type="text" name="FromPostCode" class="inputbox" size="10" maxlength="255" value= "<%=trim(SitePostCode)%>" ></td>
</tr>




<tr>
<td bgcolor="#DAE3F0">&nbsp;&nbsp;</td>
<td bgcolor="#DAE3F0">&nbsp;&nbsp;</td>
<td bgcolor="#DAE3F0">&nbsp;&nbsp;</td>
</tr>


<tr>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7"><input type="checkbox" name="ToSameAsBill" VALUE="1" <%=isCHECKED%> onclick="ToIsSameAsBill(this)" >
                        <font face="Verdana" size="1" color="48576C"><b>Check box if Destination Address is the same as Billing Address:</b>
                        </font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr>



<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Destination To Address:</b></font></td>
<td bgcolor="#C5D3E7"></td>
<td bgcolor="#C5D3E7"><input type="text" name="ToAddress" class="inputbox" size="50" maxlength="255" value= "<%=SiteAddress%>" >
<font face="Verdana" size="1" color="48576C"><b>&nbsp; Post Code</b></font>
<input type="text" name="ToPostCode" class="inputbox" size="10" maxlength="255" value= "<%=trim(SitePostCode)%>" ></td>
</tr>




<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Driver Instruction Details</b></font></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><textarea name="Details" class="inputbox" cols="85" rows="5" > <%=sDetails%> </textarea>
</td>
</tr>


<tr>
<td bgcolor="#C5D3E7""><font face="Verdana" size="1" color="48576C"><b>Office</b></font></td>
<td bgcolor="#C5D3E7""></td>
<td bgcolor="#C5D3E7""><textarea name="Office" class="inputbox" cols="85" rows="5"> <%=sOffice%> </textarea>
</td>
</tr>


<tr>
<td bgcolor="#C5D3E7""><font face="Verdana" size="1" color="48576C"><b>2nd loader required to carry goods </b></font></td>
<td bgcolor="#C5D3E7""></td>
<td bgcolor="#C5D3E7""><input type="checkbox" name="2ndloader"></td>
</tr>



<tr>
<td bgcolor="#C5D3E7""><font face="Verdana" size="1" color="48576C"><b>Total Bill </b></font></td>
<td bgcolor="#C5D3E7""></td>
<td bgcolor="#C5D3E7""><input type="text" name="BillTotal" value="<%=BillTotal%>" class="inputbox" size="10" maxlength="255"></td>
</tr>
<tr>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"></td>
<td bgcolor="#DAE3F0"><input type="hidden" name="AddId" value=<%=AddId%> class="inputbox" size="30" maxlength="255"></td>
</tr>

<tr>
<td align="right" valign="bottom"> &nbsp; </td>
<td>&nbsp;</td>
<td valign="bottom"><input type="submit" name="Submit" value="Add" class="inputSubmit"> &nbsp; &nbsp;
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
<!--#include file="dsn2.asp"-->
