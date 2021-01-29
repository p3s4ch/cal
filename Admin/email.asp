<%@ Language=VBScript%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

mes = ""
IsSuccess = false

sTo = "gilon@btconnect.com"
sFrom = Trim(Request.Form("txtFrom"))
sSubject = Trim(Request.Form("txtSubject"))
sMailServer = "127.0.0.1"
sBody = Trim(Request.Form("txtBody"))

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
    <form id="form1" action="email.asp?__action=TestEMail&tp=<%= rnd(1)*100*timer %>" method="POST" >
        <input id="__action" type="hidden" value="" />

<!--**<CONTENT>******************************************************************************************************-->
      
        <div class="contentLayout">
            <div class="contentContainer">
                <div class="pageContent">
                    
                            
                    
                    
                    
                    <div id="screenTabs">
                        <div id="tabs">
					    <ul>
					        <li><a href="test_msaccess.asp"><span>New Messages</span></a></li> 
						    <li><a href="test_msaccess.asp"><span>Instructions</span></a></li>
						    <li class="last" id="current"><a href="test_mail.asp"><span>Pickle Alert</span></a></li>
					    </ul>
				    </div>
                    </div>
                    <!-- MySQL server -->
                    <div class="tabContent">
                        <div class="formContainer">
                        
                        <p>Send alerts to other team members and jam operators
                        Cannot make an appointment. Last minute Customer cancellations.
                         
                        </p>
                           
                           
                           
                            <% if len(mes) > 0 then	Alert(mes) end if %>
                            <fieldset>
                                <legend id="LegendName">Test send mail</legend>
                                <p>
                                        <table class="formFields" cellspacing="0" width="100%">
                                            <tr>
                                                <td class="name">
                                                    <label for="txtFrom">
                                                        From</label></td>
                                                <td>
                                                    <input name="txtFrom" size="25" value = "<% Response.Write(sFrom) %>">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="name">
                                                    <label for="txtSubject">
                                                        Subject</label></td>
                                                <td>
                                                    <input name="txtSubject" size="25" value="<% Response.Write(sSubject) %>">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="name">
                                                    <label for="txtBody">
                                                        Message Body</label></td>
                                                <td rowspan="2">
                                                    <textarea name="txtBody" cols = "35" rows="4"><% Response.Write(sBody) %></textarea>
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
                                <div class="commonButton" id="DBTestButton" title="Send Alert">
                                    <button type="submit" name="bname_ok">Send</button><span>Send</span></div>
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
