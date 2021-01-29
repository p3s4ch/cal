
<%
Dim i
On Error Resume Next
Response.Write "common\update_generic7 "
Response.Write "<br>"
Response.Write "PART ONE : Build SQL using form "
Response.Write "<br>Request.Form.Count="& Request.Form.Count & "<br>"
tableName = Request("tableName")
procName = Request("procName")
Response.Write "nonSqlPMs ="& nonSqlPMs & "<br>"
Response.Write "procName  ="& procName & "<br>"

addID = request("addID")
uid = request("uid")
nonSqlPMs = request("nonSqlPMs")

sql ="exec  dbo." & procName & " "
'old :
'sql = sql & Request.Form.Item("AddId") & "," & uid & ","
'new style where AddId and uid are part of the sql :


For x = 1 to Request.Form.Count - nonSqlPMs
			 sql = sql & "'"& Request.Form.Item(x) & "' , "
Next
sql = sql & "'"& Request.Form.Item(x) &"'"

If Err.Number <> 0 Then
   ' Error Occurred / Trap it
   Response.Write "<b>Error found in PART ONE ! <b> <br> Did you use GET , you must use HTTP POST "

   On Error Goto 0 ' But don't let other errors hide!
   ' Code to cope with the error here
End If
On Error Goto 0 ' Reset error handling.

Response.Write "<br>======================================================================="
Response.Write "<br>  "&  sql
Response.Write "<br>======================================================================="

'======================================= PART TWO ==========================================
Response.Write "<br> PART TWO "
Response.Write "set RS = SQLCN.execute(sql)"

' Turn on error Handling
On Error Resume Next
   Response.Write "This SQL may blow  <br>"

   set RS = SQLCN.execute(sql)

   MyID = RS("MyID")
   Response.Write "<br> Update Successful! MyID : " & MyID
   Response.Write "<br> "
' Error Handler
If Err.Number <> 0 Then
   Response.Write "<b>Error found in PART TWO ! </b><br> CANNOT either MyID not returned or cannot execute SQL  " & sql
End If
On Error Goto 0 ' Reset error handling.

%>

