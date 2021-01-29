
<!--#include file="GilonHiddenURLSession_NoHello.asp"-->
<!--#include file="userRoles.asp"-->

<%
if isPrinter=0  then
%>
<table border="0" cellpadding="0" cellspacing="0" width="130">
<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
<a href="main.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Diaries</b></font></a></td>
</tr>
<tr>
<td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td>
</tr>
<tr>
<td bgcolor="#B0C4DE" width="130" height="15"> &nbsp;&nbsp;</td>
</tr>

<%
else
%>
   <table border="0" cellpadding="0" cellspacing="0" width="10">

<%
end if
%>


<%
if doesFlights then
%>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="GSViewer5.asp?bttns=Flights.Buttons&SearchFor=adi.u&uid=<%=uid%>&filter_on=INITIAL"><font face="Verdana" size="1"><b>&nbsp;Flights</b></font></a></td></tr>

<%
end if
%>

<%
if isUserManager then
%>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="GSViewer5.asp?bttns=UserRoles.Buttons&SearchFor=adi.u&uid=<%=uid%>&filter_on=INITIAL"><font face="Verdana" size="1"><b>&nbsp;Manage Users</b></font></a></td></tr>

<%
end if
%>


<%
if hasTasks then
%>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="GSViewer5.asp?bttns=Tasks.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Tasks 2 Do</b></font></a></td></tr>

<%
end if
%>

<%
if hasInstructions then
%>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="GSViewer5.asp?bttns=Instructions.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Instructions</b></font></a></td></tr>

<%
end if
%>


<%
if isSponsor then
%>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GSViewer5.asp?bttns=Adi.Buttons&SearchFor=adi.u&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Adi Record</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GSViewer5.asp?bttns=Errors.Buttons&SearchFor=adi.u&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Error Reports</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>



<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Fees.asp?SearchFor=adi.u.house.materials&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Building Materials</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Fees.asp?SearchFor=adi.u.house.richard&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Payments to builder</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Fees.asp?SearchFor=adi.u.house&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;All Building Costs</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<%
end if
%>





<%
if seesAllCashAccounts then
%>


<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GSViewer5.asp?bttns=CashAccounts.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;All Cash Accounts</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<%
end if
%>





<%
if isGilon then
%>


<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="CostsByCat.asp?doGroupByCC=1&doGroupByCCIsSet=yes&uid=<%=uid%>"><font face="Verdana" size="1" color=black ><b>&nbsp;Report 10: Expenses</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="report3.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Report 3: Financial Reports</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GilDev.asp?uid=<%=uid%>"><font face="Verdana" size="1" color=red ><b>&nbsp;Gil Dev </b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td height="5">&nbsp;</td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="ChadUtils.asp?uid=<%=uid%>"><font face="Verdana" size="1" color=red ><b>&nbsp;Chad Utils </b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td height="5">&nbsp;</td></tr>


<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="imports.asp?uid=<%=uid%>"><font face="Verdana" size="1" color=green ><b>&nbsp;Imports </b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td height="5">&nbsp;</td></tr>


<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Lodgers.asp?uid=<%=uid%>" ><font face="Verdana" size="1"><b>&nbsp;Lodgers</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>



<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="ScannedDocsIndex.asp?uid=<%=uid%>"><font face="Verdana" size="1" color=red ><b>&nbsp;Scanned Docs</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td height="5">&nbsp;</td></tr>


<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="TelephoneBook.asp?uid=<%=uid%>"><font face="Verdana" size="1" color=red><b>&nbsp;TelephoneBook</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="logs.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Audit Logs</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="AvailSlots.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Available Slots</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="DayRange.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Day Range</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="MonthView.asp?Operator=Ronit&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Ronit`s Calendar</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="MultiMonthView.asp?Operator=Ronit&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Ronit`s MultiMonthView</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="MultiMonthView.asp?Operator=Gilon&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Gilon MultiMonthView</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="generic.asp?uid=<%=uid%>&tablename=Logs"><font face="Verdana" size="1"><b>&nbsp;Logs</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr>

<tr><td height="5">&nbsp;</td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="DirectorsAcc.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Directors Account</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Advertisers_add.asp?uid=<%=uid%>"><font face="Verdana" size="1" color=black><b>&nbsp;Add&nbsp;Advertiser</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Advertisers.asp?uid=<%=uid%>"><font face="Verdana" size="1" color=black ><b>&nbsp;Advertisers</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td height="5">&nbsp;</td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="fees.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Fees</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Payments.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Payments</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="projects.asp?uid=<%=uid%>&ByGroup=y"><font face="Verdana" size="1" color=green><b>&nbsp;Projects</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="buscard_pc.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Credit Card PC</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<%
end if
%>


<%
if customerID > 0 and ReqInv > 0 then
%>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="invoices4u.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Account</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<%
end if
%>


<%

if showBillashersOwnCards then
%>
<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="buscard_billy.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Billahser Card</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15"> &nbsp;  </td></tr>

<%
end if
%>




<%
if uid <> 394 and isContractor then
%>
<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Account_x.asp?uid=<%=uid%> "><font face="Verdana" size="1"><b>&nbsp;Contractor Account</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15"> &nbsp;  </td></tr>

<%
end if
%>






<%
if ( uid <> 394 ) and ( isContractor or isAdmin  ) then
%>
<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="rates_admin.asp?uid=<%=uid%> "><font face="Verdana" size="1"><b>&nbsp;Rates </b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15"> &nbsp;  </td></tr>


<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="ActionRequired.asp?uid=<%=uid%> "><font face="Verdana" size="1"><b>&nbsp;Action Required </b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15"> &nbsp;  </td></tr>

<%
end if
%>

<%
if isCustomer or isGuest then
%>
<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="rates_cus.asp?uid=<%=uid%> "><font face="Verdana" size="1"><b>&nbsp;Rates </b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15"> &nbsp;  </td></tr>

<%
end if
%>




<%
if   hasTimesheet or doesTimesheets then
%>


   <tr><td bgcolor="#000000" height="1"></td></tr>
	<tr><td bgcolor="#B0C4DE" width="130" height="15">
		<a href="TimesheetX.asp?Admin_ID=<%=Admin_ID%>&uid=<%=uid%>&iDay=12&iMonth=9&iYear=2014"><font face="Verdana" size="1" color=black ><b>&nbsp;Timesheets</b></font></a></td></tr>
	<tr><td bgcolor="#000000" height="1"></td></tr>


    <tr><td bgcolor="#B0C4DE" width="130" height="15">
         <a href="GSViewer5.asp?bttns=Payroll.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1" color=black ><b>&nbsp;Payroll</b></font></a></td></tr>
     <tr><td bgcolor="#000000" height="1"></td></tr>

<%
end if
%>





<%
if isGilon then
%>



   <tr><td bgcolor="#000000" height="1"></td></tr>
   <tr><td bgcolor="#B0C4DE" width="130" height="15">
          <a href="GSViewer5.asp?uid=<%=uid%>&myheader=Invoices&where_sql= where Status='Unpaid'&bttns=Invoice.Buttons&mysql=select top 10 * from invoices"><font face="Verdana" size="1"><b>&nbsp;Invoices</b></font></a></td></tr>
   <tr><td bgcolor="#000000" height="1"></td></tr>








<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Configuration.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Configuration</b></font></a></td></tr>



<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">&nbsp;</td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">&nbsp;</td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>



<%
end if
%>

<%
if doesInvoices then
%>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="events.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Events</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Configuration.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Configuration</b></font></a></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">&nbsp;</td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">&nbsp;</td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GSViewer5.asp?bttns=Invoice.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Invoices</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<%
end if
%>








<%
if isChannelManager or isJam then
%>
  <tr><td bgcolor="#000000" height="1"></td></tr>
  <tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="ChannelBook.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;ChannelBook</b></font></a></td></tr>
  <tr><td bgcolor="#000000" height="1"></td></tr>


  <tr><td bgcolor="#000000" height="1"></td></tr>
  	        <tr><td bgcolor="#B0C4DE" width="130" height="15">
  	            <a href="Reservations.asp?uid=<%=uid%>&myheader=Next.7.Days.Checkins&filter=CheckinsT7&periodID=700">
  	            <font face="Verdana" size="1"><b>&nbsp;Reservations</b></font></a></td></tr>
   <tr><td bgcolor="#000000" height="1"></td></tr>


  <tr><td bgcolor="#000000" height="1"></td></tr>
	        <tr><td bgcolor="#B0C4DE" width="130" height="15">
	            <a href="GSViewer5.asp?bttns=ReservationReports.Buttons&FilterOn=INITIAL&uid=<%=uid%>">
	            <font face="Verdana" size="1"><b>&nbsp;Reports</b></font></a></td></tr>
   <tr><td bgcolor="#000000" height="1"></td></tr>


  <tr><td bgcolor="#000000" height="1"></td></tr>
	        <tr><td bgcolor="#B0C4DE" width="130" height="15">
	            <a href="GSViewer5.asp?bttns=Errors.Buttons&handler=INITIAL&FilterOn=INITIAL&uid=<%=uid%>">
	            <font face="Verdana" size="1"><b>&nbsp;Reports Errors</b></font></a></td></tr>
   <tr><td bgcolor="#000000" height="1"></td></tr>



   <tr><td bgcolor="#000000" height="1"></td></tr>
	        <tr><td bgcolor="#B0C4DE" width="130" height="15">
	            <a href="RoomsInventory.asp?iMnth=9&iYear=2014&uid=<%=uid%>&myheader=RoomsInventory">
	            <font face="Verdana" size="1"><b>&nbsp;RoomsInventory</b></font></a></td></tr>
      <tr><td bgcolor="#000000" height="1"></td></tr>



<%
end if
%>




<%
if uid=20 or isGilon then
%>



<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="gilonsJobs.asp?uid=<%=uid%>&Operator=Tom"><font face="Verdana" size="1"><b>&nbsp;Gilon's Jobs</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="gilonsJobsJan.asp?uid=<%=uid%>&Operator=Tom"><font face="Verdana" size="1" color=red><b>&nbsp;Gilon's Jobs Jan</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="invoicedJobs.asp?uid=<%=uid%>&Operator=Tom"><font face="Verdana" size="1"><b>&nbsp;Invoiced Jobs</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="externalJobs.asp?uid=<%=uid%>&Operator=Tom"><font face="Verdana" size="1"><b>&nbsp;External Jobs</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="contractor_bal.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Balance</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>



<%
end if
%>






<%
if showPayments then
%>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Payments.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Payments</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<%
end if
%>


<%
if uid=394 or isGilon then
%>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="gilonsJobsPaul.asp?uid=<%=uid%>&Operator=Tom"><font face="Verdana" size="1" color=red><b>&nbsp;Gilon's Jobs Paul</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<%
end if
%>





<%
if hasCashAccount then
%>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="cashAccount.asp?uid=<%=uid%>&periodID=75" > <font face="Verdana" size="1"><b>&nbsp;Cash Account</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<%
end if
%>



<%
if isPrinter=0  then
%>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE"  width="130" height="15">
<a href="logout.asp"><font face="Verdana" size="1"><b>&nbsp;Log&nbsp;Out </b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"><img src="../im/clear.gif" height="1" width="1"></td></tr>
<%
end if
%>

</table>

