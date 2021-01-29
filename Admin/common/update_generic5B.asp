
<%
'Response.Write "update_generic <br> Request.Form.Count="& Request.Form.Count & "<br>"
tableName = Request("tableName")
'Response.Write "tableName="& tableName & "<br>"
Response.Write "Request.Form.Count="& Request.Form.Count & "<br>"



'Response.End

Response.Write "update_generic5B <br>"

ignoreLastXparams = request("ignoreLastXparams")
addID = request("addID")
Response.Write "addID="& addID & "<br>"
Response.Write "Request.Form.Count="& Request.Form.Count & "<br>"
Response.Write "ignoreLastXparams="& ignoreLastXparams & "<br>"
addID="-1"

'If (AddID <> "" ) Then
    addID = request("addID")
    uid = request("uid")
	'cDt =  CDate(Dt)
	'sqlDate  =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)


	    sql ="exec  [dbo].[add_" & tableName & "] "

        For x = 1 to Request.Form.Count - ignoreLastXparams
		             sql = sql & "'"& Request.Form.Item(x) & "' , "
		Next

		sql = sql & "'"& Request.Form.Item(x) &"'"


        If isDebug then
           Response.Write "<br>" & sql
        End If
        set RS = SQLCN.execute(sql)
        Response.Write "<br> Update Successful! ID : "

        sql = Replace(sql,"'","")
        sql = "update_generic5:: " & sql
        logger = "exec [dbo].[add_dbo.Logs] -1, " & uid &", '" &  sql & "'"
        'Response.Write logger

        SQLCN.execute(logger)

        Response.Write "<HR>"
'End If
%>

