<%
dim dsn
dim Conn
dsn="DBQ=" & Server.Mappath("configdb.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};"
Set Conn = Server.CreateObject("ADODB.Connection")
Conn.Open dsn
%>