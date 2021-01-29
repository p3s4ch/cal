<%@ Language=VBScript%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

mes = ""
IsSuccess = false

'sTo = "gilon@btconnect.com"
'sFrom = Trim(Request.Form("txtFrom"))
sFrom = "admin@orderonline.me.uk"
Response.Write "from" &  sFrom

sTo=  Trim(Request.Form("txtTo"))
sToMob =  sTo & ".rhixdviwgoa@24xgateway.com"

'sSubject = Trim(Request.Form("txtSubject"))
'sMailServer = "127.0.0.1"
'sMailServer = "mail.orderonline.me.uk"
sMailServer = "relay.hostinguk.net"

sBody = Trim(Request.Form("txtBody"))

if Request("__action")="EMailToSMS" then
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
		.To = sToMob
		.Subject = sSubject
		.TextBody = sBody
	End With

    Err.Clear
	on error resume next

    objMail.Send
    if len(Err.Description) = 0 then
        mes = " Pickle SMS TEXT sent to " + sTo
        mes = mes + " SUCCESSFULLY!"
        IsSuccess = true
    else
		mes = " " + Err.Description + " FAILED!"
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
          <div class="contentLayout">
            <div class="contentContainer">
                <div class="pageContent">
                    <div class="tabContent">
                        <div class="formContainer">
                            <% if len(mes) > 0 then	Alert(mes) end if %>
                            <%= sBody %>
                        </div>
                    </div>
                </div>
            </div>
        </div>



</div>
</body>
</html>
