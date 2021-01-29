<%

Dim Connection
Dim ConnectionString
Dim RS3
Dim SQL

'declare the SQL statement that will query the database
SQL = "SELECT * FROM reservations"



'define the connection string, specify database driver
ConnString = "DRIVER={MySQL ODBC 3.51 Driver}; SERVER=79.171.34.90; DATABASE=spiderdb; UID=mary1;PASSWORD=$3Awi6h9; OPTION=3"

'create an instance of the ADO connection and recordset objects
Set Connection = Server.CreateObject("ADODB.Connection")
Set RS3 = Server.CreateObject("ADODB.Recordset")


Connection.Open ConnString

RS3.Open SQL,Connection


If RS3.EOF Then
	Response.Write("No records returned.")
Else
Do While NOT RS3.Eof
	Response.write RS3("Email")
	Response.write "<br>"
	RS3.MoveNext
Loop
End If

RS3.Close
Set RS3=nothing
Connection.Close
Set Connection=nothing
%>
