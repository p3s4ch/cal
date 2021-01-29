<html>
<head>
<title>Ocean12 ASP Calendar Manager</title>
<!--#include file="style.asp"-->
</head>
<body bgcolor="#F0F0F0" vlink="#48576C" link="#48576C" alink="#000000">
<font face="Verdana" size="1">
<%If (Request("ID") = "Settings_Admin_ID") Then%>
<font color="48576C"><b>Admin ID</b></font><br><br>
This is ID that will be used for logging into the control panel.
<%ElseIf (Request("ID") = "Settings_Abbreviate_Days") Then%>
<font color="48576C"><b>Abbreviate Days</b></font><br><br>
Choosing this will display the abbreviated version of the day names on the calendar.
<%ElseIf (Request("ID") = "Settings_Abbreviate_Months") Then%>
<font color="48576C"><b>Abbreviate Months</b></font><br><br>
Choosing this will display the abbreviated version of the month names on the calendar.
<%ElseIf (Request("ID") = "Settings_Event_Display") Then%>
<font color="48576C"><b>Display Category Name</b></font><br><br>
Choosing this will display the category name of the event on the calendar.  Leaving this unchecked will display the name of the event on the calendar.
<%ElseIf (Request("ID") = "Settings_Page_Title") Then%>
<font color="48576C"><b>Page Title</b></font><br><br>
This is what will appear in the title bar of the web browser when viewing the calendar.
<%ElseIf (Request("ID") = "Settings_Background_Color") Then%>
<font color="48576C"><b>Background Color</b></font><br><br>
Background color of the calendar.
<%ElseIf (Request("ID") = "Settings_Font_Color") Then%>
<font color="48576C"><b>Font Color</b></font><br><br>
Default font color of the calendar.
<%ElseIf (Request("ID") = "Settings_Link_Color") Then%>
<font color="48576C"><b>Link Color</b></font><br><br>
Default link color of the calendar.
<%ElseIf (Request("ID") = "Settings_Hover_Link_Color") Then%>
<font color="48576C"><b>Hover Link Color</b></font><br><br>
Default hover link color of the calendar.
<%ElseIf (Request("ID") = "Settings_Visited_Link_Color") Then%>
<font color="48576C"><b>Visited Link Color</b></font><br><br>
Default visited link color of the calendar.
<%ElseIf (Request("ID") = "Settings_Active_Link_Color") Then%>
<font color="48576C"><b>Active Link Color</b></font><br><br>
Default active link color of the calendar.
<%ElseIf (Request("ID") = "Settings_Weekday_Font") Then%>
<font color="48576C"><b>Weekday Font</b></font><br><br>
Font face of the weekday names.
<%ElseIf (Request("ID") = "Settings_Weekday_Font_Size") Then%>
<font color="48576C"><b>Weekday Font Size</b></font><br><br>
Font size of the weekday names.
<%ElseIf (Request("ID") = "Settings_Weekday_Font_Color") Then%>
<font color="48576C"><b>Weekday Font Color</b></font><br><br>
Font color of the weekday names.
<%ElseIf (Request("ID") = "Settings_Weekday_Background_Color") Then%>
<font color="48576C"><b>Weekday Background Color</b></font><br><br>
Background color of the weekday name cells.
<%ElseIf (Request("ID") = "Settings_Date_Font") Then%>
<font color="48576C"><b>Date Font</b></font><br><br>
Font face of the day numbers.
<%ElseIf (Request("ID") = "Settings_Date_Font_Size") Then%>
<font color="48576C"><b>Date Font Size</b></font><br><br>
Font size of the day numbers.
<%ElseIf (Request("ID") = "Settings_Date_Font_Color") Then%>
<font color="48576C"><b>Date Font Color</b></font><br><br>
Font color of the day numbers.
<%ElseIf (Request("ID") = "Settings_Date_Background_Color") Then%>
<font color="48576C"><b>Date Background Color</b></font><br><br>
Background color of the day cells.
<%ElseIf (Request("ID") = "Settings_Event_Font") Then%>
<font color="48576C"><b>Event Font</b></font><br><br>
Font face of the event listings.
<%ElseIf (Request("ID") = "Settings_Event_Font_Size") Then%>
<font color="48576C"><b>Event Font Size</b></font><br><br>
Font size of the event listings.
<%ElseIf (Request("ID") = "Settings_Event_Font_Color") Then%>
<font color="48576C"><b>Event Font Color</b></font><br><br>
Font color of the event listings.
<%ElseIf (Request("ID") = "Settings_Cell_Background_Color") Then%>
<font color="48576C"><b>Blank Cell Background Color</b></font><br><br>
Background color of the empty cells on the calendar (cells which come before the first and after the last days of the month).
<%ElseIf (Request("ID") = "Settings_Cell_Width") Then%>
<font color="48576C"><b>Cell Width</b></font><br><br>
Width of the day cells.
<%ElseIf (Request("ID") = "Settings_Cell_Height") Then%>
<font color="48576C"><b>Cell Height</b></font><br><br>
Height of the day cells.
<%ElseIf (Request("ID") = "Settings_Border_Size") Then%>
<font color="48576C"><b>Border Size</b></font><br><br>
Size of the calendar border.
<%ElseIf (Request("ID") = "Settings_Border_Color") Then%>
<font color="48576C"><b>Border Color</b></font><br><br>
Color of the calendar border.
<%ElseIf (Request("ID") = "Settings_Header") Then%>
<font color="48576C"><b>Header</b></font><br><br>
HTML code that will appear on the page above the calendar code.
<%ElseIf (Request("ID") = "Settings_Footer") Then%>
<font color="48576C"><b>Header</b></font><br><br>
HTML code that will appear on the page after the calendar code.
<%ElseIf (Request("ID") = "Settings_Password") Then%>
<font color="48576C"><b>Password</b></font><br><br>
This is the password that will be used for logging into the control panel.
<%ElseIf (Request("ID") = "Event_Name") Then%>
<font color="48576C"><b>Event Name</b></font><br><br>
This is the name of the event.
<%ElseIf (Request("ID") = "Event_Date") Then%>
<font color="48576C"><b>Event Date</b></font><br><br>
This is the date of the event.
<%ElseIf (Request("ID") = "Event_Time") Then%>
<font color="48576C"><b>Event Time</b></font><br><br>
This is the time of the event.
<%ElseIf (Request("ID") = "Event_Category") Then%>
<font color="48576C"><b>Event Category</b></font><br><br>
This is the category of the event.  You can create these categories by clicking on the "add category" link on the control panel navigation bar.
<%ElseIf (Request("ID") = "Event_Location") Then%>
<font color="48576C"><b>Event Location</b></font><br><br>
This is the location of the event.
<%ElseIf (Request("ID") = "Event_Description") Then%>
<font color="48576C"><b>Event Description</b></font><br><br>
This is the description of the event.
<%End If%>
</font>
</body>
</html>