
<%
uid =request("uid")
bttns = request("bttns")
filter_on = request("filter_on")

if filter_on = "" OR filter_on="INITIAL" then
   myheader="Tutorial 1"
   SQL = "select 'any text will do for now ... '"
End If
%>



<p>
<h2>Tutorial One: </h2><br>
<h2>Step One</h2><br>
Create a copy of this page  DrMars\pickle\MyWebs\calendar.uat\Admin\common\buttons<br>
                              call it tut1.yourPickleUser.Buttons.asp<br>
<h2>Step Two</h2><br>
In this file  calendar.uat\Admin\GSViewer5.asp<br>
add this line like the others<br>
         if bttns="tut1.yourPickleUser.Buttons" then  ...  etc etc<br>
<h2> Step Three</h2>
SAVE and   FTP both files to      /httpdocs/calendar.uat in same folder structure.<br>
If nothing is broken then copy same files to live prod in  /httpdocs/calendar/<br>
</p>






