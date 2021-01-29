

<!--not include file="common/SQL_Cn.asp"-->


<%

'Response.Write "getUserRoles for " & Admin_ID
sql_UserRoles = "EXEC dbo.getUserRoles 0, '" & Admin_ID & "'"

Response.Write  "<br>" & sql_UserRoles
Set RSRoles = SQLCN.Execute(sql_UserRoles)
'should we use this ....
'Session("isChannelManager") = RSRoles("isChannelManager")

isChannelManager= RSRoles("isChannelManager")
isPole=		RSRoles("isPole")
isJam=		RSRoles("isJam")
isAdmin=	RSRoles("isAdmin")
isDebug=	RSRoles("isDebug")
isSponsor=	RSRoles("isSponsor")
isActive=	RSRoles("isActive")
isGilon=	RSRoles("isGilon")
isPrinter=	RSRoles("isPrinter")
seeRecruiters=	RSRoles("seeRecruiters")

%>


