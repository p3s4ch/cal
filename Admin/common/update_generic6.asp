
<%
Dim i
On Error Resume Next
Response.Write "common\update_generic6 "
Response.Write "<br>"
Response.Write "</br>  PART ONE : Build SQL using form "

Response.Write "</br>  ----------------1---------------- "
k=Request.Form.Count
Response.Write "<br>Request.Form.Count="& k & "<br>"
Response.Write "</br>  ----------------2---------------- "

tableName = Request("tableName")
procName = Request("procName")
Response.Write "tableName="& tableName & "<br>"
Response.Write "procName="& procName & "<br>"

Response.Write "</br>PART ONE step 2 : Build SQL using form "
addID = request("addID")
uid = request("uid")
addID = 13790

Response.Write "</br>  ----------------3---------------- "
sql = ""
Response.Write "PART ONE step 3 : Build SQL using form "
			sql_part_one = sql_part_one & "  "& Request.Form.Item(1)  
			Response.Write "</br>sql_part_one="& sql_part_one & "<br>"
			Response.Write "</br>  --- x is  "& 1 &" --- "
			
sql_part_two = " "			
For x = 2 to 20 
			sql_part_two = sql_part_two & " , '"& Request.Form.Item(x) & " ' "
			Response.Write  sql_part_two 
			Response.Write "</br>  --- x is  "& x &" --- "
Next


Response.Write "</br> sql_part_two: " & sql_part_two & "</br>"

sql_part_three = " "		
For x = 21 to k - 5
            sql_part_three = sql_part_three & ",'"& Request.Form.Item(x) & " ' "
			Response.Write  "sql_part_three="& sql_part_three 
			Response.Write "</br>  ----------------"& x &"---------------- "
Next

sql = sql & "'"& Request.Form.Item(x) &"'"

sql=sql_part_one & sql_part_two & sql_part_three


Response.Write "</br>  *****************************************</br>  "
Response.Write sql
Response.Write "</br>  *****************************************</br>  "

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

