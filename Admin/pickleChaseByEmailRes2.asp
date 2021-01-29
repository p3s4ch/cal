<%@ Language=VBScript%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

chaseTable = request("emailChaseTable")
chaseID = request("AddID")
origStatus = request("origStatus")
uid = replace(Request("uid"),",","")


ToEmail = request("Email")
Response.Write "Sending a Reminder to " & ToEmail


mes = ""
IsSuccess = false

'sTo = "gilon@btconnect.com"


sFrom = Trim(Request.Form("txtFrom"))


'sTo=  Trim(Request.Form("txtTo"))

sTo = Trim(ToEmail)

'sToMob = sTo & ".replyrhixdviwgoa@24xgateway.com"

'sSubject = Trim(Request.Form("txtSubject"))
'sMailServer = "127.0.0.1"
sMailServer =  "relay.hostinguk.net"
Response.Write "<br>sMailServer =" & sMailServer
sBody = Trim(Request.Form("txtBody"))

sSubject = "Thank you for Your Reservation "
sBody="Dear, Guest , We look forward to welcoming you in one of our budget rooms." &_
      "You may now proceed with an online Web Check-in inorder to save more money on your stay." &_
      "Please click on the link inorder to read any important information regarding your booking "


if Request("__action")="TestEMail" then
	TestEMail()
end if

Sub TestEMail()

	Set objMail = Server.CreateObject("CDO.Message")
	Set objConf = Server.CreateObject("CDO.Configuration")
	Set objFields = objConf.Fields

	With objFields
		.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
		.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")  = sMailServer
		.Item("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 10
		.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
		.Update
	End With

	With objMail
		Set .Configuration = objConf
		.From = sFrom
		.To = sTo
		.Subject = sSubject
		.TextBody = sBody
	End With

    Err.Clear
	on error resume next

    objMail.Send
	if len(Err.Description) = 0 then
        mes = " Message sent to " + sTo
        mes = mes + " TESTS COMPLETED SUCCESSFULLY!"
        IsSuccess = true
    else
		mes = " " + Err.Description + " TESTS FAILED!"
	end if
	Set objFields = Nothing
	Set objConf = Nothing
	Set objMail = Nothing
End sub

Sub Alert(html)
	if IsSuccess then
		Response.Write "<div class='testRelults' id='testSuccessful'><span class='testResult'>Success:</span>" & html & "</div>"
	else
		Response.Write "<div class='testRelults' id='testFailed'><span class='testResult'>Fail:</span>" & html & "</div>"
	end if
End Sub
%>

<html>
<head>

    <meta name=vs_targetSchema content="http://schemas.microsoft.com/intellisense/ie5">
    <link rel="stylesheet" type="text/css" href="/css/winxp.blue.css" />
    <link rel="stylesheet" type="text/css" href="/css/tabs.css" />
    <style>
    .hidden{
        display: none;
    }
    </style>
</head>
<body>
<div class="screenLayout">
    <form id="form1" action="pickleEmailSent.asp?__action=EMailToSMS&tp=<%= rnd(1)*100*timer %>" method="POST" >
        <input id="__action" type="hidden" value="" />

<!--**<CONTENT>******************************************************************************************************-->

        <div class="contentLayout">
            <div class="contentContainer">
                <div class="pageContent">






                    <!-- MySQL server -->
                    <div class="tabContent">
                        <div class="formContainer">

                        New Email <br>
                        Current Status is:<input name="origStatus" size="55"               value ="<%= origStatus  %>"  > <br>
                        Please set a New Chase Status :<input name="chaseStatus" size="55" value ="<%= origStatus  %>"  > <br>

                            <% if len(mes) > 0 then	Alert(mes) end if %>
                            <fieldset>
                                <legend id="LegendName">Send Email </legend>
                                <p>
                                        <table class="formFields" cellspacing="0" width="100%">
                                            <tr>
                                                <td class="name">
                                                    <label for="txtFrom">  From  </label></td>
                                                <td>
                                                    <input type=text name="txtFrom" size="25" value = "admin@orderAhandyman.co.uk">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="name">
                                                    <label for="txtTo"> To </label></td> <td> <input name="txtTo" size="55" value = "<% Response.Write(sTo) %>"> </td>
                                            </tr>

											<tr>
												<td class="name"> Subject: </td>	<td>
													               <input name="txtSubject" size="55" value = "<% Response.Write(sSubject) %>"  >
													</td>
											</tr>

                                            <tr>
                                                <td class="name">
                                                    <label for="txtBody"> Message Body</label></td>
                                                <td rowspan="2">
                                                    <textarea name="txtBody" cols = "45" rows="20"><% Response.Write(sBody) %></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                </p>
                            </fieldset>
                            <div class="buttonsContainer">

                                 <input type="hidden" name="uid" value="<%=uid%>" />
                                 <input type="hidden" name="chaseIDColumn" value="BookingID" />

								 ID:  <input name="chaseID"   size="10" value = "'<%= chaseID  %>'"  >
								       in table: <input name="chaseTable" size="55" value = "<%= chaseTable  %>"  >
                                 <br>
                                <div class="commonButton" id="DBTestButton" title="Send Email">
                                    <button type="submit" name="bname_ok">Send</button>



                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>


</div>
</body>
</html>
