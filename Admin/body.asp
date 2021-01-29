<%
dim RSBODY
dim SQLBODY
Set RSBODY = Server.CreateObject("ADODB.Recordset")
SQLBODY = "SELECT * from Settings"
RSBODY.Open SQLBODY, Conn, 1, 3
%>