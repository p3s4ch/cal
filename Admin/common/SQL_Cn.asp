<%


'ASP HOST SqlServer 
Dim SQLCn
Set SQLCn= Server.CreateObject("ADODB.Connection")


SQLCn.ConnectionString="Provider=SQLOLEDB.1; uid=gilon9;pwd=sql78ongil; Persist Security Info=True; Initial Catalog=ruzvolk;Data Source=sql6.myhostcp.com"
'SQLCn.ConnectionString="Provider=SQLOLEDB.1; uid=gilon9;pwd=sql78ongil; Persist Security Info=True; Initial Catalog=ruzvolk;Data Source=ASP-HOST"
SQLCn.CommandTimeout = 3000
SQLCn.Open


'ASP HOST Access mdb
'Dim aspMdb
'Set aspMdb= Server.CreateObject("ADODB.Connection")
'WebCn.ConnectionString = "Provider=SQLOLEDB.1;uid=gilon8;pwd=sql78ongil;Persist Security Info=True;Initial Catalog=ruzvolk;Data Source=SQLSERVER10"
'WebCn.CommandTimeout = 3000
'WebCn.Open

'15 Oak Access mdb
'Dim mdbCn
'Set mdbCn= Server.CreateObject("ADODB.Connection")
'mdbCn.ConnectionString = "Provider=SQLOLEDB.1;uid=gilon8;pwd=sql78ongil;Persist Security Info=True;Initial Catalog=ruzvolk;Data Source=SQLSERVER10"
'mdbCn.CommandTimeout = 3000
'mdbCn.Open

%>
