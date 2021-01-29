<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="..\LoadEvents.asp"-->

using view
<%
'
sID =    request("sID")
Dim RsEvent 

if sID <> "" then 'edit otherwise its an add new event
	anEvent = GetEventById (sID)
	
	'set RsEvent = GetEventRsById (sID)
	'Response.Write "Rs found !! "
	
	'sTitle =  anEvent(4)
	'sSiteNotes= anEvent(6)
	'sEventDetails = anEvent(5)
	
	id = anEvent(0)
	StartTime = anEvent(1)
	tm = anEvent(2)
	EndTime = anEvent(3)
	
	Title = anEvent(4) 
	Details = anEvent(3)
	 
	eColor = anEvent(5)
	eAssShort = anEvent(6)
	eFontSize = anEvent(7)
	eCategory = anEvent(9)
	eCatA = anEvent(10)
	eCatB = anEvent(11)
	eSiteID = anEvent(11)
	
end if

if siteID <> "" then 'edit otherwise its an add new event
	siteArr = GetSiteCustBySiteId (siteID)
'	stID        =siteArr(0)
'    stAddress   =siteArr(1)
'	stPostCode  =siteArr(2)
'	stContact   =siteArr(3)
'	stPhone1    =siteArr(4)
'	stPhone2    =siteArr(5)
'	stComment   =siteArr(6)
'	cCustomerID =siteArr(7)
'	cTitle      =siteArr(8)
'	cFirstName  =siteArr(9)
'	cSurname    =siteArr(10)
'	cAddress	 =siteArr(11)
'	cAddress	 =siteArr(12)
'	cPostcode	 =siteArr(13)
'	cEmail	     =siteArr(14)
'	cPhone  	 =siteArr(15)
'	cMobile	     =siteArr(16)            
'	cComment     =siteArr(17)            
' id,Address,PostCode,Contact,phone1,phone2,comment,customerID,title,firstname,surname,address,postcode,email,phone,mobile,comment	
end if
%>

<html>
<head>
<title>Micro Calendar </title>

<script language="javascript">

function open_Event_Name() {
  popupWin = window.open('help.asp?ID=Event_Name', 'remote', 'width=300,height=200')
}
function open_Event_Date() {
  popupWin = window.open('help.asp?ID=Event_Date', 'remote', 'width=300,height=200')
}
function open_Event_Time() {
  popupWin = window.open('help.asp?ID=Event_Time', 'remote', 'width=300,height=200')
}
function open_Event_Category() {
  popupWin = window.open('help.asp?ID=Event_Category', 'remote', 'width=300,height=200')
}
function open_Event_Location() {
  popupWin = window.open('help.asp?ID=Event_Location', 'remote', 'width=300,height=200')
}
function open_Event_Description() {
  popupWin = window.open('help.asp?ID=Event_Description', 'remote', 'width=300,height=200')
}

function VerifyData() {
	if (document.frmUser.Event_Name.value == "") {
		alert("You must enter an Event Name.");
		return false;
	} else if (document.frmUser.Category.value == "") {
		alert("You must select a category.");
		return false;
	} else if ((document.frmUser.Date_Month.value == "Blank") ||
				(document.frmUser.Date_Day.value == "Blank") ||
				(document.frmUser.Date_Year.value == "Blank") ||
				(document.frmUser.Time_Hour.value == "Blank") ||
				(document.frmUser.Time_Minute.value == "Blank") ||
				(document.frmUser.Time_AMPM.value == "Blank")) {
		alert("You must complete the Date and Time fields.");
		return false;
	} else
		return true;
}
</script>

<!--#include file="style.asp"-->

</head>
<body bgcolor="#F0F0F0" vlink="#48576C" link="#48576C" alink="#000000">

v3
sID =<%=sID%><br>
sTitle =<%=sTitle%><br>
sSiteNotes =<%=sSiteNotes%>
StartTime =<%=StartTime %> <br/>
tm =<%=tm %> <br/>
EndTime =<%=EndTime %> <br/>
Title= <%=Title %> <br/>
Details= <%=Details %> <br/>
eColor= <%=eColor %> <br/>
eAssShort= <%=eAssShort %> <br/>
eFontSize= <%=eFontSize %> <br/>
eCategory= <%=eCategory %> <br/>
eCatA= <%=eCatA %> <br/>
eCatB= <%=eCatB %> <br/>
eSiteID= <%=eSiteID %> <br/>

<table border="0" cellpadding="0" cellspacing="0" width="650" align="center">
<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td width="1" bgcolor="#000000"></td>
<td colspan="3" bgcolor="black" height="35" width="648">
<font face="Verdana" size="5" color="#FFCC00"><b>&nbsp;Micro Calendar </b></font></td>
<td width="1" bgcolor="#000000"></td>
</tr>

<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
<td bgcolor="#8199DA" valign="top" width="130">

<table border="0" cellpadding="0" cellspacing="0" width="130">
<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="main.asp"><font face="Verdana" size="1"><b>&nbsp;Home</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td height="5"><img src="../im/clear.gif" height="5" width="1"></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="add.asp"><font face="Verdana" size="1"><b>&nbsp;Add Event</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="events.asp"><font face="Verdana" size="1"><b>&nbsp;View/Edit Events</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="categories_add.asp"><font face="Verdana" size="1"><b>&nbsp;Add&nbsp;Category</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="categories.asp"><font face="Verdana" size="1"><b>&nbsp;View&nbsp;Categories</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td height="5"><img src="../im/clear.gif" height="5" width="1"></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15"><a href="settings.asp"><font face="Verdana" size="1"><b>&nbsp;Settings</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>



<tr>
<td height="5"><img src="../im/clear.gif" height="5" width="1"></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td bgcolor="#B0C4DE"  width="130" height="15"><a href="logout.asp"><font face="Verdana" size="1"><b>&nbsp;Log&nbsp;Out</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>

</td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
<td bgcolor="#FFFFFF" width="517" valign="top" height="200">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr>
<td bgcolor="#B0C4DE" height="15" width="100%"><font face="Verdana" size="1" color="#000000"><b>&nbsp;Add Event</b></font></td>
</tr>
<tr>
<td bgcolor="#000000" height="1" width="100%"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>

<table border="0" cellpadding="2" cellspacing="0" width="517">
<tr>
<td width="100%"><font face="Verdana" size="1"><br>


<form action="add2.asp" name="frmUser" Method="Post" onSubmit="return VerifyData()">
<table border="0" cellpadding="3" cellspacing="0" align="center">

<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>Name</b></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Event_Name();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Event_Name" class="inputbox" size="30" maxlength="255" value="nu kvar<%=sTitle%>j" />  </td>
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
<td bgcolor="#DAE3F0"><a href="javascript:open_Event_Name();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0">
	<script type="text/javascript" src="inc/popupWindow.js"></script>
	<input type="text" name="StartDate" id="StartDate" maxlength="10" size="8" value=<%=StartTime%> />
	<a href="javascript:;" 
	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=StartDate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" /></a>			

<span id=startTime>

<select name="StartHour" class="inputbox">
<% 
hourCounter = 1
Do WHILE hourCounter <= 7 %>
<option value="<%=hourCounter%>:00AM"><%=hourCounter%>:00 AM</option>
<option value="<%=hourCounter%>:15AM"><%=hourCounter%>:15 AM</option>
<option value="<%=hourCounter%>:30AM"><%=hourCounter%>:30 AM</option>
<option value="<%=hourCounter%>:45AM"><%=hourCounter%>:45 AM</option>
<% hourCounter = hourCounter + 1
Loop
%>
<option value="8:00AM" SELECTED>8:00 AM</option>
<option value="8:15AM" >8:15 AM</option>
<option value="8:30AM" >8:30 AM</option>
<option value="8:45AM" >8:45 AM</option>
<%
hourCounter = 9
Do WHILE hourCounter < 12 %>
<option value="<%=hourCounter%>:00AM"><%=hourCounter%>:00 AM</option>
<option value="<%=hourCounter%>:15AM"><%=hourCounter%>:15 AM</option>
<option value="<%=hourCounter%>:30AM"><%=hourCounter%>:30 AM</option>
<option value="<%=hourCounter%>:45AM"><%=hourCounter%>:45 AM</option>
<% hourCounter = hourCounter + 1
Loop
hourCounter = 1
Do WHILE hourCounter <12 %>
<option value="<%=hourCounter%>:00PM"><%=hourCounter%>:00 PM</option>
<option value="<%=hourCounter%>:15PM"><%=hourCounter%>:15 PM</option>
<option value="<%=hourCounter%>:30Pm"><%=hourCounter%>:30 PM</option>
<option value="<%=hourCounter%>:45Pm"><%=hourCounter%>:45 PM</option>
<% hourCounter = hourCounter + 1
Loop
%>
</select>

</span>

<script type="text/javascript" language="JavaScript"><!--
function hide(frm) 
{
		var div_ref  = document.all("startTime");
		var div_ref2  = document.all("startTime2");
		 
		if (frmUser.check1.checked == true)
		{
				//alert("All day every day is checked");
				div_ref.style.visibility = "hidden";
				div_ref2.style.visibility = "hidden";
				frmUser.EndDate.innerText=frmUser.StartDate.value
				
				
				
				
				
		}	
		else 
		{
			//alert("All day every day is not checked");	
			div_ref.style.visibility = "visible";
			div_ref2.style.visibility = "visible";

		}	
}
   

  
                      
//--></script>





<input type="checkbox" name="check1" VALUE="Yes" UNCHECKED onclick="hide(this)" > 

<font face="Verdana" size="1" color="48576C"><b>All Day Event</b></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


</td>
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
<td bgcolor="#DAE3F0"><a href="javascript:open_Event_Name();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0">
	<script type="text/javascript" src="inc/popupWindow.js"></script>
	<input type="text" name="EndDate" id="EndDate" maxlength="10" size="8" value=<%=EndTime%> />
	<a href="javascript:;"	onclick="winBRopen('cal_popup.asp?FormName=FormName&amp;FieldName=EndDate&amp;Date=<%=Date()%>&amp;CurrentDate=<%=Date()%>','popup_cal','241','206','no','no')">
	<img src="img/cal.gif" class="DatePicker" alt="Pick A Date" /></a>			

<span id=startTime2>

<select name="EndHour" class="inputbox">
<% 
hourCounter = 1
Do WHILE hourCounter <= 7 %>
<option value="<%=hourCounter%>:00AM"><%=hourCounter%>:00 AM</option>
<option value="<%=hourCounter%>:15AM"><%=hourCounter%>:15 AM</option>
<option value="<%=hourCounter%>:30AM"><%=hourCounter%>:30 AM</option>
<option value="<%=hourCounter%>:45AM"><%=hourCounter%>:45 AM</option>
<% hourCounter = hourCounter + 1
Loop
%>

<option value="8:00AM" SELECTED>8:00 AM</option>
<option value="8:15AM" >8:15 AM</option>
<option value="8:30AM" >8:30 AM</option>
<option value="8:45AM" >8:45 AM</option>
<%
hourCounter = 9
Do WHILE hourCounter < 12 %>
<option value="<%=hourCounter%>:00AM"><%=hourCounter%>:00 AM</option>
<option value="<%=hourCounter%>:15AM"><%=hourCounter%>:15 AM</option>
<option value="<%=hourCounter%>:30AM"><%=hourCounter%>:30 AM</option>
<option value="<%=hourCounter%>:45AM"><%=hourCounter%>:45 AM</option>
<% hourCounter = hourCounter + 1
Loop


hourCounter = 1
Do WHILE hourCounter < 12 %>
<option value="<%=hourCounter%>:00PM"><%=hourCounter%>:00 PM</option>
<option value="<%=hourCounter%>:15PM"><%=hourCounter%>:15 PM</option>
<option value="<%=hourCounter%>:30Pm"><%=hourCounter%>:30 PM</option>
<option value="<%=hourCounter%>:45Pm"><%=hourCounter%>:45 PM</option>
<% hourCounter = hourCounter + 1
Loop
%>
</select>

</span>
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
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Category</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Event_Category();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><select name="Category" class="inputBox">
<option value="" SELECTED></option>

<%
Set RSCATEGORY = Server.CreateObject("ADODB.Recordset")
RSCATEGORY.Open "Categories", Conn, 2, 2

Do While Not RSCATEGORY.eof
if eCategory = RSCATEGORY("Category") then 
%>
<option value="<%=RSCATEGORY("Category")%>" selected><%=RSCATEGORY("Category")%></option>
<%
else
%>
<option value="<%=RSCATEGORY("Category")%>"><%=RSCATEGORY("Category")%></option>
<%
end if


RSCATEGORY.movenext
Loop

RSCATEGORY.close
set RSCATEGORY = nothing
%>
</select></td>
</tr>
</tr>
<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C">&nbsp;&nbsp;</font></td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
<td bgcolor="#C5D3E7">&nbsp;&nbsp;</td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Site</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Event_Category();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><select name="SiteID" class="inputBox">
<option value="-1" selected>select or add new</option>
<%
Set RSSites = Server.CreateObject("ADODB.Recordset")
RSSites.Open "vSites", SQLCN, 2, 2

Do While Not RSSites.eof
%>
<option value="<%=RSSites("ID")%> "> <%=RSSites("Address")%>,<%=RSSites("PostCode")%> </option>
<%
RSSites.movenext
Loop
RSSites.close
set RSSites = nothing
%>
</select></td>
</tr>


<tr>
<td bgcolor="#C5D3E7"><font face="Verdana" size="1" color="48576C"><b>New Site</b><br><font color="#000000">(Address)</font></font></td>
<td bgcolor="#C5D3E7"><a href="javascript:open_Event_Location();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#C5D3E7"><input type="text" name="Address" class="inputbox" size="30" maxlength="255"><font face="Verdana" size="1" color="48576C"><b>&nbsp;Post Code</b></font><input type="text" name="PostCode" class="inputbox" size="10" maxlength="255"></td>
</tr>

<tr>
<td bgcolor="#DAE3F0"><font face="Verdana" size="1" color="48576C"><b>Description</b></font></td>
<td bgcolor="#DAE3F0"><a href="javascript:open_Event_Description();"><font face="Verdana" size="1" color="#FF0000"><b>?</b></font></a></td>
<td bgcolor="#DAE3F0"><textarea name="Description" class="inputbox" cols="45" rows="5"></textarea>
</td>
</tr>

<tr>
<td align="right" valign="bottom"><input type="reset" name="Reset" value="Reset" class="inputSubmit"></td>
<td>&nbsp;</td>
<td valign="bottom"><input type="submit" name="Submit" value="Add Event" class="inputSubmit">
</td>
</tr>
</table>
</form>

</font></td>
</tr>
</table></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>

<tr>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
<td colspan="3" align="center" bgcolor="#B0C4DE" height="30">
<font face="Verdana" size="1"><br>&copy;2007 Micro Software Ltd,</font></td>
<td width="1" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>


<tr>
<td height="1" colspan="5" bgcolor="#000000"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
</table>


</body>
</html>
<!--#include file="dsn2.asp"-->