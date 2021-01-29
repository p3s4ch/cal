<%

mes = ""
IsSuccess = false

'sTo = "gilon@btconnect.com"
sFrom = Trim(Request.Form("txtFrom"))
sFrom ="guzvolk@hotmail.com"

sTo=  Trim(Request.Form("txtTo"))
sToOp=  Trim(Request.Form("txtToOp"))
sToMob = sTo & ".rhixdviwgoa@24xgateway.com"
sToMob2 = sToOp & ".rhixdviwgoa@24xgateway.com"
'sToMob2="guzvolk@hotmail.com"


'sSubject = Trim(Request.Form("txtSubject"))
'sMailServer = "127.0.0.1"
'sMailServer = "mail.orderonline.me.uk"
sMailServer = "relay.hostinguk.net"
sBody = Trim(Request.Form("txtBody"))
sBodyOp = Trim(Request.Form("txtBodyOp"))

if Request("pickleStatus")="pickleOn" then
    Response.Write "will send as pickleOn"
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
	Response.Write "<br>sent sFrom " & sFrom &"<br>"
    Response.Write "sent to " & sToMob &"<br>"


    Err.Clear
	on error resume next

    objMail.Send

    'SMS TXT to operator
    With objMail
		Set .Configuration = objConf
		.From = sFrom
		.To =  sToMob2
		.Subject = sSubject
		.TextBody = sBodyOp
	End With

     Response.Write "<br>sent sFrom " & sFrom &"<br>"
     Response.Write "sent to " & sToMob2 &"<br>"

    Err.Clear
	on error resume next

    objMail.Send




    if len(Err.Description) = 0 then
        mes = " Pickle SMS sent to " + sTo + " AND to "+sToOp
        mes = mes + "<br>" + sBody
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
<div class="screenLayout">
          <div class="contentLayout">
            <div class="contentContainer">
                <div class="pageContent">
                    <div class="tabContent">
                        <div class="formContainer">
                            <% if len(mes) > 0 then	Alert(mes) end if %>

                        </div>
                    </div>
                </div>
            </div>
        </div>

</div>
