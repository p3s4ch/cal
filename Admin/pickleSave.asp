
<%

Dim SQLCn
Set SQLCn= Server.CreateObject("ADODB.Connection")


SQLCn.ConnectionString="Provider=SQLOLEDB.1; uid=gilon9;pwd=sql78ongil; Persist Security Info=True; Initial Catalog=ruzvolk;Data Source=sql6.myhostcp.com"
SQLCn.CommandTimeout = 3000
SQLCn.Open




set RS = SQLCN.execute("select 'XYZ' gotIT")

Response.Write RS("gotIT")




'Response.Redirect "http://www.orderAroom.com/takeOff.php?SecondTry=True"




%>