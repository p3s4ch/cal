
<%

Response.Write "<br>update_eventNote <br>"

groupID = request("groupID")
AddID = request("AddID")
DeleteID = request("DeleteID")
Operator0 = request("Operator")

StartTime0 = request("StartDate")
EndTime0 = request("StartDate")
Details0 = trim(request("Details"))

Category0 = trim(request("Category"))
Color0 = trim(request("Color"))

if groupID ="" then groupID     = 0 end if
if AddID ="" then AddID     = -1 end if
if Category0 ="" then Category0="Note" end if
if Color0 ="" then Color0     ="yellow" end if


Response.Write "<br>update_eventTask v3 groupID = "& groupID &"<br>"
Response.Write "<br>StartTime0 = "& StartTime0 &"<br>"
Response.Write "<br>EndTime0 = "& EndTime0 &"<br>"
Response.Write "<br>Details0 = "& Details0 &"<br>"
Response.Write "<br>Operator0 = "& Operator0 &"<br>"
Response.Write "<br>Category0 = "& Category0 &"<br>"
Response.Write "<br>Color0 = "& Color0 &"<br>"


'CatA = request("CatA")
CatB = request("CatB")

StartTime  	="'" & StartTime0 	&"'"
Details 		="'" & Details0		&"'"
Category        ="'" & Category0 	&"'"
Office          ="'" & Office0    	&"'"
SiteAddress     ="'" & SiteAddress0 	&"'"
SitePostCode 	="'" & SitePostCode0 &"'"
Color 		    ="'" & Color0  		&"'"
Operator 		="'" & Operator0		&"'"


'AllDay = 1 ASSUMED FOR NOW
 Response.Write "<br>"

sql="exec [dbo].[addEventNoteAllDay] " & AddID & "," & StartTime  &_
							 "," & Details &_
							 "," & Category    &_
							 "," & groupID   &_
							 "," & Color &  "," & Operator


submit = request("submit")
if submit = "Delete" and AddID >0  then
   sql = "delete from cEvents where ID =" & AddID
end if
Response.Write sql
set RS = SQLCN.execute(sql)

Response.Write "<HR>"

%>








