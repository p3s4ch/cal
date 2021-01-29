


<!--#include file="SQL_Cn.asp"-->
<!--#include file="MySQL_Cn2.asp"-->


<%


sql = "SELECT top 3 * FROM reservations"
'SQLCN.Execute(sql)

i=1

Set RS_CC= Server.CreateObject("ADODB.Recordset")
RS_CC.Open    sql,    SQLCN, 2, 2

		    Do While Not RS_CC.eof
                BookingID =  RS_CC("BookingID")
				Response.Write RS_CC("BookingID")
				Response.Write "<br>"

				sql_insert = "INSERT INTO reservations (BookingID) values (" & BookingID & ")"
				MySQL_Cn2.Execute(sql_insert)

        i=i+1

		RS_CC.movenext
		Loop
		RS_CC.close
		set RS_CC = nothing


%>
