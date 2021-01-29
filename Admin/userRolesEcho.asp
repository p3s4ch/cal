

<!--#include file="common/SQL_Cn.asp"-->

<h2 ALIGN=CENTER>UserRoles  </h2>

<%

Response.Write "this is using UserRoles <br> " & Admin_ID
sql_UserRoles = "EXEC dbo.getUserRoles 20, 'Doll456' "
Response.Write  "<br>" & sql_UserRoles
Set RSRoles = SQLCN.Execute(sql_UserRoles)

Response.Write "<br> isChannelManager=" & RSRoles("isChannelManager")
'this works but i am not sure of the value
Session("isChannelManager") = RSRoles("isChannelManager")


Response.Write "<br> isChannelManager=" & RSRoles("isChannelManager")
Response.Write "<br> isPole=" & RSRoles("isPole")
Response.Write "<br> isPole=" & RSRoles("isPole")
Response.Write "<br> isJam=" & RSRoles("isJam")
Response.Write "<br> isAdmin=" & RSRoles("isAdmin")
Response.Write "<br> isDebug=" & RSRoles("isDebug")
Response.Write "<br> isSponsor=" & RSRoles("isSponsor")
Response.Write "<br> isActive=" & RSRoles("isActive")
Response.Write "<br> isGilon=" & RSRoles("isGilon")


Response.Write "<br> *** Can we set this in the Session ... "



Response.Write "<br> .... success  isChannelManager = " &  Session("isChannelManager")


%>


