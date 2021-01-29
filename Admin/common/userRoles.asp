

<!--not include file="common/SQL_Cn.asp"-->


<%

'Response.Write "getUserRoles for " & Admin_ID
sql_UserRoles = "EXEC dbo.getUserRoles 0, '" & Admin_ID & "'"

'Response.Write  "<br>" & sql_UserRoles
Set RSRoles = SQLCN.Execute(sql_UserRoles)
'should we use this ....
'Session("isChannelManager") = RSRoles("isChannelManager")

isChannelManager= RSRoles("isChannelManager")

isSun=		RSRoles("isSun")
isMercury=	RSRoles("isMercury")
isVenus=	RSRoles("isVenus")
isMars=	    RSRoles("isMars")

isEarth=	RSRoles("isEarth")
isLunar=	RSRoles("isLunar")
isNeptune=	RSRoles("isNeptune")
isUranus=	RSRoles("isUranus")
isSaturn=	RSRoles("isSaturn")
isJupiter =	RSRoles("isJupiter")
isPluto =	RSRoles("isPluto")
isSky =	RSRoles("isSky")


isDebug=	RSRoles("isDebug")
isSponsor=	RSRoles("isSponsor")
isActive=	RSRoles("isActive")


isPole=		RSRoles("isPole")
isJam=		RSRoles("isJam")
isAdmin=	RSRoles("isAdmin")
isDebug=	RSRoles("isDebug")
isSponsor=	RSRoles("isSponsor")
isActive=	RSRoles("isActive")

isGilon=	RSRoles("isGilon")
isPrinter=	RSRoles("isPrinter")
isChannelManager=RSRoles("isChannelManager")
hasTimesheet=	RSRoles("hasTimesheet")
doesTimesheets=	RSRoles("doesTimesheets")
hasCashAccount=	RSRoles("hasCashAccount")
seeAllCustomers=	RSRoles("seeAllCustomers")
isUserManager  =    RSRoles("isUserManager")
hasInstructions  =  RSRoles("hasInstructions")
doesInvoices  =  RSRoles("doesInvoices")
hasTasks =  RSRoles("hasTasks")
hasInstructions=  RSRoles("hasInstructions")
doesFlights =  RSRoles("doesFlights")
seeRecruiters=	RSRoles("seeRecruiters")

showPayments=	RSRoles("showPayments")
addsPayments=	RSRoles("addsPayments")

isAudit = RSRoles("isAudit")

isJobMover=	RSRoles("isJobMover")

'or use this one
'sql_HasRole = "EXEC dbo.hasUserRole isJobMover , 0, '" & Admin_ID & "'"
'Set RSHasRole = SQLCN.Execute(sql_HasRole)

'isJobMover=	RSRoles("hasIt")


'for now just Gilon
seesAllCashAccounts =  RSRoles("seesAllCashAccounts")


%>


