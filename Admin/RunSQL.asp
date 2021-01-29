<!--#include file="loggedin.asp"-->
<!--#include file="dsn.asp"-->
<!--#include file="common/SQL_Cn.asp"-->


<form action="RunSQL.asp" name="frmUser" Method="Post">
SQL:   <br>
Examples <br>
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Customers' ORDER BY ORDINAL_POSITION --- 22 columns<br>
<br>
<input type="text" name="sql" size =100> <br> <br>
<input type="text" name="cols" size =1>  &nbsp;<br>
SQL update<br>

<input type="text" name="sql_update"    size =100> <br> 

<input type="submit" name="Submit" value="Go">
</form>


<%

sql = request("sql")
sql_update= request("sql_update")
col_Count= request("cols")



Response.Write "<br>sql ="  & sql
Response.Write "<br>cols =" & col_Count


IF  (sql_update <> "")  then 
    Response.Write "<br> sql_update not  null ="  & sql_update & "!"
   'SQLCN.Execute(sql_update)
   Response.End
end if

   
col_Count = col_Count + 1



if sql = null then
    Response.Write "<br>sql is null"
    Response.End
end if


if sql = "" then
    Response.Write "<br>sql is empty"
    Response.End
end if

%>


<table border="1" cellpadding="3" cellspacing="1">

<%
Set RS = SQLCN.Execute(sql)

if RS.EOF then
    Response.Write "No results returned"
end if


WHILE   Not RS.EOF
        Response.Write  "<tr>  "

        colnum = 0
        while (colnum < col_Count)
		      Response.Write "<td>  "    & RS(colnum) & "</td>"
		      colnum  = colnum  + 1
		wend




        Response.Write  "</tr>"
        RS.MoveNext
WEND



%>

</table>
