<!--#include file="common/SQL_Cn.asp" -->
<!--#include file="common/GilonHiddenURLSession.asp"-->
<!--#include file="common/update_customers.asp"-->
<!--#include file="common/Apopup.asp"-->



<%

orderBy = request.querystring("orderby")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")
Category0 = trim(request("Category"))
mob=request("mobile")
Operator = trim(request("Operator"))

moveToName= request("moveToName")
cpTo= request("cpTo")
mvTo= request("mvTo")




'Response.Write  "CustomerID=" & CustomerID
'Response.Write  "<br>"

if Category0 = "Telephone Quote" and Operator= "Gilon" then
    Response.Write "Its a telephone quote for Gilon <br>"
    Operator= "Lachie"
    cpTo="1"
    moveToName="Gilon"
end if




%>
<!--#include file="common/cancel_event.asp"-->
<%


SiteAddress0   = replace (request("Address"), "'" , "")
SitePostCode0  = replace (request("PostCode"), "'" , "")

'Response.Write "<br>"
'Response.Write "AddID = " & AddID
'Response.Write "<br>"

StartDate = request("StartDate")
StartHour = request("StartHour")
EndDate = request("EndDate")
EndHour = request("EndHour")
Details0 = replace (request("Details"), "'" , "")
Assigned = replace (request("Assigned"), "'" , "")
AllDay =request("AllDayEvent")
CatB = request("CatB")
Office0 = request("Office")

SameAsBill  = request("SameAsBill")
Phone    = request("Phone")
BillTotal = trim(request("BillTotal"))

if CustomerID      = "" then CustomerID =0 end if
if BillTotal   = "" then BillTotal=0 end if
if BillTotal   = "undefined" then BillTotal=0 end if
if SameAsBill  = "" then  SameAsBill =0 end if

x= StartDate & " " & StartHour
z= EndDate & " " & EndHour
cDtStart =  CDate(x)
cDtEnd   =  CDate(z)
StartTime =Month(cDtStart) & "/" & Day(cDtStart)& "/" &Year(cDtStart)& " " & StartHour
Endtime   =Month(cDtEnd) & "/" & Day(cDtEnd)& "/" &Year(cDtEnd)& " " & EndHour

StartTime  	="'" & StartTime 	&"'"
EndTime    	="'" & EndTime		&"'"
Title  		="'" & Title  		&"'"
Details 		="'" & Details0		&"'"
Category      ="'" & Category0 	&"'"
Office        ="'" & Office0    	&"'"
SiteAddress   ="'" & SiteAddress0 	&"'"
SitePostCode 	="'" & SitePostCode0 &"'"
Color 		="'" & Color  		&"'"
Operator 		="'" & Operator		&"'"



if AllDay = "" then AllDay =0 end if
if CatB = "" then CatB =0 end if
if CustomerID = "" then CustomerID =0 end if
if BillTotal = "" then BillTotal =0 end if
if SameAsBill = "" then SameAsBill =0 end if
if siteID = "" then siteID =0 end if
if GroupID = "" then GroupID =0 end if



If (mvTo = "1") Then
     Response.Write "move from " & Operator & " to "   & moveToName & "<br>"
     Operator = "'"&moveToName&"'"

End If


If (DeleteID <> "") then
    msg="Cancelling " & category0 & " on " & Day(cDtStart)&  "/" & Month(cDtStart)& " at " & StartHour &_
    " booking # "& id & ". " & SiteAddress0 & "," & SitePostCode0 &". Tel 0208 2424825"

else

    sql="exec addEvent " & AddID & "," & StartTime    & "," & EndTime    & "," & Title  & "," & Details &_
					       "," & Category    & "," & AllDay     & "," & CatB   & "," & CustomerID &_
					       "," & Office      & "," & BillTotal  & "," & SiteAddress  & "," & SitePostCode &_
					       "," & SameAsBill  & "," & siteID     & "," & GroupID 	 & "," & Color & "," & Operator

    Set RS = SQLCN.Execute(sql)

 Set RS2 = SQLCN.Execute("select  * from ProcResult")
 WHILE  Not RS2.EOF
		 color = "green"
		 id = RS2("ID")
		 if id = -1 then color = "red" end if
		 Response.Write  "<h3><br> <font color="&color& "><b>"

		 Response.Write  "Please confirm booking: </h3></b></font>"
		 'Response.Write  RS2("comment") & "</h3></b></font>"
		 RS2.MoveNext
WEND


If (cpTo = "1") Then
        Response.Write "Now copy from " & Operator & " to " & moveToName & "<br>"
        Operator = "'"&moveToName&"'"
        AddID = -1
        sql="exec addEvent " & AddID & "," & StartTime    & "," & EndTime    & "," & Title  & "," & Details &_
					   "," & Category    & "," & AllDay     & "," & CatB   & "," & CustomerID &_
					   "," & Office      & "," & BillTotal  & "," & SiteAddress  & "," & SitePostCode &_
					   "," & SameAsBill  & "," & siteID     & "," & GroupID 	 & "," & Color & "," & Operator
		Set RS = SQLCN.Execute(sql)
		'except if its a telephone quote
		if Category0 = "Telephone Quote" and trim(request("Operator"))= "Gilon" then
                Operator= "'Lachie'"
        end if
End If



    Response.Write "<br>"
    Response.Write  "<h2>"
    Response.Write   request("Operator") & " - " & request("Category")
    Response.Write   " on " & WeekdayName(Weekday(cDtStart))&" " & Day(cDtStart)&  "/"& Month(cDtStart) & "/" & Year(cDtStart)& " at " & StartHour    & "<br> "
    Response.Write   "Customer  &nbsp;:" &  CusTitle & " &nbsp;" &  Name & " &nbsp; &nbsp; " & Surname & "<br>"
    Response.Write   "Site Address :" &  SiteAddress0 & " &nbsp; &nbsp; " & SitePostCode0 & "<br>"
    Response.Write   "Details:" & "  " & Details0 & "<br>"
    Response.Write   "Office:" & "  " & Office0 & "<br>"
    Response.Write   "Estimated Bill excluding materials &nbsp; &pound;" & BillTotal & "<br>"

	Response.Write  "<font size=2>"
    Response.Write  "Please discuss the price at the start of the apponitment before any work is started<br>"
    Response.Write  "There is no obligation to proceed<br>"
    Response.Write  "You may cancel at any time. Please do so online<br>"

    Response.Write  "Payment should be made immediately after satisfactory completion of work directly to the handyman.<br>"
    Response.Write  "Some of our independent contractors do not accept cheques<br>"
    Response.Write  "A later payment must be agreed in advance and incur a different price, <a href=""admin\rates_cus.asp?uid=" &uid &""" onclick=""return popup(this, 'invrates')"" >see our 30-Day Invoice Rates.</a><br>"
    Response.Write  "<br>"

	Response.Write  "</font>"

    Response.Write  "Please make a note of your booking number # "& id &" <br>"
    Response.Write  "<hr>"
    'Response.Write  "This number should please be given to the customer and also recorded in the telephone message </h1></b></font>"
    Response.Write  "<br><hr>"
    Response.Write  "<br><br><br><a href=events_add.asp?uid=" & uid &"&AddID=" &id &"><font color=red>click here to delete or to make correction</font></a>"

   msg="Confirming " & category0 & " on " & Day(cDtStart)&  "/" & Month(cDtStart)& " at " & StartHour &_
   " booking # "& id & ". " & SiteAddress0 & "," & SitePostCode0 &". orderAhandyman.com"
'End if not cancel
End IF



CusTitle = request("Title")
Name = request("Name")
Surname   = request("Surname")
'Email = request("Email")
Phone = Trim(request("Phone"))
Mobile= request("Mobile")
if Phone <> "" then Phone = " or "& Phone End IF



Op_msg="Book " & CusTitle &"."& Name &" "& Surname &" "& category0 & " on " & Day(cDtStart)&  "/" & Month(cDtStart)& " at " & StartHour &_
". " & SiteAddress0 & "," & SitePostCode0 & " " & Mobile & Phone
If (DeleteID <> "") then
    Op_msg="Cancel " & CusTitle &"."& Name &" "& Surname &" "& category0 & " on " & Day(cDtStart)&  "/" & Month(cDtStart)& " at " & StartHour &_
    ". " & SiteAddress0 & "," & SitePostCode0 & " " & Mobile & Phone
End IF


if category0 = "Telephone Quote" then
    'Response.Write "<br><font color=green>Telephone Quote</font><br>"

    msg="Confirming " & category0 & " on " & Day(cDtStart)&  "/" & Month(cDtStart)& " at " & StartHour &_
    ". " & SiteAddress0 & "," & SitePostCode0 &"."

    Op_msg="Please call " & CusTitle &"."& Name &" "& Surname &" "& category0 & " on " & Day(cDtStart)&  "/" & Month(cDtStart)& " at " & StartHour &_
    ". " & SiteAddress0 & "," & SitePostCode0 & " " & Mobile & " " & Phone
end if






SQL_Operator = "select * from Operators where AutoText=1 AND Name =" & Operator
Set RS_Operator = SQLCN.Execute(SQL_Operator)
if RS_Operator.EOF then
  Response.Write "<br><font color=red>Note: No AutoText record for operator:"& Operator &"</font><br>"
else
  Op_Mob = RS_Operator("Mobile")
  if IsNull(Op_Mob) OR Len(Trim(Op_Mob))=0 then
      Response.Write "<br><font color=red>Note: No mobile found</font><br>"
  end if
end if

if IsNull(Op_Mob) OR Len(Trim(Op_Mob))=0 then Op_Mob="07881966867" End If

'Response.Write "<br>using mob= " & Op_Mob & "<br>"
%>

<br>




<p align=centre>

   <form id="form1" action="main.asp?__action=EMailToSMS&tp=<%= rnd(1)*100*timer %>" method="POST" >
       <input id="__action" type="hidden" value="" />

    <div align=center>
       <h3><font color=red>
       Your changes cannot be accepted unless you click the button below !</font></h3>

       <input type=radio name=pickleStatus value=pickleOn checked /> Send Auto SMS Text to Customer <%=mob%> and to Operator:<%=request("Operator")%> (Recommended) <br />


       <input type=radio name=pickleStatus value=pickleOff /> Do not send SMS
       <input type=hidden  value="admin@orderAhandyman.com" name="txtFrom" />
       <input type=hidden value="<%=msg%>" name=txtBody />
       <input type=hidden value="<%=mob%>" name=txtTo />
       <input type=hidden value="<%=Op_Mob%>" name=txtToOp />
       <input type=hidden value="<%=Op_msg%>" name=txtBodyOp />

       <input type=hidden value="<%=uid%>" name=uid />

        <br> <br>
         <input type=submit value="Click here to submit"  size=250 />
   </div>
   </form>
</p>
