
<%
Response.Write "v3"

groupID = request("groupID")
AddID = request("AddID")





rangeFrom = request("StartDate")
rangeTo = request("EndDate")
startHr = request("StartHour")
endHr = request("EndHour")

duration = request("duration")
AllDay= request("AllDayEvent")

recurrence = request("recurrence")
hourlyEveryXhours = request("hourlyEveryXhours")
dailyEveryXdays = request("dailyEveryXdays")
mon = request("mon")
tue = request("tue")
wed = request("wed")
thu = request("thu")
fri = request("fri")
sat = request("sat")
sun = request("sun")
monthlyOnDayXoftheMonth = request("monthlyOnDayXoftheMonth")
monthlyEveryXmonths= request("monthlyEveryXmonths")
yearlyOntheXofthemonth= request("yearlyOntheXofthemonth")
yearlyOntheMonthOfX= request("yearlyOntheMonthOfX")

Operator = request("Operator")
Category = request("Category")
Details = request("Details")
Assigned = request("Assigned")
BillTotal = request("BillTotal")



x= "1 Jan 2008 " & startHr
z= "1 Jan 2008 " & endHr

cDtStart =  CDate(x)
cDtEnd   =  CDate(z)

startHr = hour(cDtStart)
startMin= Minute(cDtStart)

endHr = hour(cDtEnd)
endMin =Minute(cDtEnd)

recurrence = "'"& recurrence & "'"
color      = "'"& color  	 & "'"
yearlyOntheMonthOfX = 1

d = CDate(rangeFrom)
d1 = "'" & Day(d) & " " &  MonthName( Month(d)) & " "  & year(d) & "'"
d = CDate(rangeTo)
d2 = "'" & Day(d) & " " &  MonthName( Month(d)) & " "  & year(d) & "'"

Response.Write "<br>update_eventNote <br>"


DeleteID = request("DeleteID")
Operator0 = request("Operator")
StartTime0 = request("StartDate")
EndTime0 = request("EndDate")
Details0 = trim(request("Details"))
Category0 = trim(request("Category"))
Color0 = trim(request("Color"))

if groupID ="" then groupID     = 0 end if
if AddID ="" then AddID     = -1 end if
if Category0 ="" then Category0="Note" end if

Response.Write "<br>update_eventTask v3 groupID = "& groupID &"<br>"
Response.Write "<br>StartTime0 = "& StartTime0 &"<br>"
Response.Write "<br>EndTime0 = "& EndTime0 &"<br>"
Response.Write "<br>Details0 = "& Details0 &"<br>"
Response.Write "<br>Operator0 = "& Operator0 &"<br>"
Response.Write "<br>Category0 = "& Category0 &"<br>"
Response.Write "<br>Color0 = "& Color0 &"<br>"


'CatA = request("CatA")
CatB = request("CatB")

StartTime  	    ="'" & StartTime0 	&"'"
EndTime  	    ="'" & EndTime0 	&"'"
Details 		="'" & Details0		&"'"
Category        ="'" & Category0 	&"'"
Office          ="'" & Office0    	&"'"
SiteAddress     ="'" & SiteAddress0 	&"'"
SitePostCode 	="'" & SitePostCode0 &"'"
Color 		    ="'" & Color0  		&"'"
Operator 		="'" & Operator0		&"'"


'AllDay = 1 ASSUMED FOR NOW
 Response.Write "<br>"

sql="exec [dbo].[addEventNoteAllDayMulti] " & groupID & "," & StartTime  &_
							 "," & EndTime  &_
							 "," & Details &_
							 "," & Category    &_
							  "," & Color &  "," & Operator

'WARNING ! DANGER groupID > 0 must be valid otherwise tons of events will be wiped out

submit = request("submit")
if submit = "Delete" and groupID > 0 then
  sql = "delete from cEvents where groupID =" & groupID
end if
Response.Write sql
set RS = SQLCN.execute(sql)

Response.Write "<HR>"

%>








