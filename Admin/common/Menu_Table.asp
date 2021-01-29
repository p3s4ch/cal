
<!--#include file="GilonHiddenURLSession_NoHello.asp"-->
<!--#include file="userRoles.asp"-->
<!--#include file="func_logger.asp"-->

<%
if isPrinter=0  then
%>
<table border="0" cellpadding="0" cellspacing="0" width="130">
<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
<a href="GSViewer5.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Home</b></font></a></td>
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
if isGilon then
%>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="GSViewer5.asp?bttns=UserRoles.Buttons&SearchFor=adi.u&uid=<%=uid%>&filter_on=INITIAL"><font face="Verdana" size="1"><b>&nbsp;Manage Users</b></font></a></td></tr>

<%
end if
%>


<%
if isGilon then
%>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="GSViewer5.asp?bttns=Tasks.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Tasks 2 Do</b></font></a></td></tr>

<%
end if
%>

<%
if isGilon then
%>
<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="GSViewer5.asp?bttns=Instructions.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Instructions</b></font></a></td></tr>





<%
end if
%>


<%
if isGilon then
%>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GSViewer5.asp?bttns=Adi.Buttons&SearchFor=adi.u&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Adi Record</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GSViewer5.asp?bttns=Errors.Buttons&SearchFor=adi.u&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Error Reports</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="GSViewer5.asp?bttns=Accounts.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Financial Reports</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="Lodgers.asp?uid=<%=uid%>" ><font face="Verdana" size="1"><b>&nbsp;Lodgers</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="fees.asp?uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Fees</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="projects.asp?uid=<%=uid%>&ByGroup=y"><font face="Verdana" size="1" color=green><b>&nbsp;Projects</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GSViewer5.asp?bttns=Timesheet.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1" color=black ><b>&nbsp;Timesheets.DEV</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


<tr><td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GSViewer5.asp?bttns=EruvAccount.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1" color=black ><b>&nbsp;EruvAccount.Buttons</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="GSViewer5.asp?bttns=EruvAccount.Buttons&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Account</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>


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

  <tr><td bgcolor="#B0C4DE" width="130" height="15">
         <a href="GSViewer5.asp?bttns=Payroll.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1" color=black ><b>&nbsp;Payroll</b></font></a></td></tr>
     <tr><td bgcolor="#000000" height="1"></td></tr>


   <tr><td bgcolor="#000000" height="1"></td></tr>
   <tr><td bgcolor="#B0C4DE" width="130" height="15">
          <a href="GSViewer5.asp?bttns=Gilon.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1"><b>&nbsp;Gilon</b></font></a></td></tr>
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

<tr><td bgcolor="#000000" height="1"></td></tr>
<tr><td bgcolor="#B0C4DE" width="130" height="15">&nbsp;</td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

  <tr><td bgcolor="#000000" height="1"></td></tr>
   <tr><td bgcolor="#B0C4DE" width="130" height="15">
       <a href="pickle.Laws/PickleLaws.htm"><font face="Verdana" size="1"><b>&nbsp;Laws</b></font></a></td></tr>


<tr>
<td bgcolor="#B0C4DE" width="130" height="15">
    <a href="GSViewer5.asp?bttns=PriceAlert.Buttons&FilterOn=INITIAL&uid=<%=uid%>"><font face="Verdana" size="1" color=red><b>&nbsp;Alerts</b></font></a></td></tr>
<tr><td bgcolor="#000000" height="1"></td></tr>

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
                  <a href="http://orderonline.me.uk/room/Reservations.php?uid=<%=uid%>">
                  <font face="Verdana" size="1"><b>&nbsp;Reservations.php</b></font></a></td></tr>
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
    <a href="GSViewer5.asp?bttns=Payments.Buttons&uid=<%=uid%>&filter_on=INITIAL"><font face="Verdana" size="1"><b>&nbsp;Payments</b></font></a></td></tr>
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

