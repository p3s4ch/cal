For x = 1 to Request.Form.Count - 1
			pm=Request.Form.Item(x)
			if InStr(pm.Name,"0") then
			    Response.Write "</br> accept as a pm.Name:  " & pm.Name 
			    sql = sql & "'"& Request.Form.Item(x) & "' , "
			Else
				Response.Write "</br> dont accept as a col:  " & pm.Name
			End If
Next



exec  dbo.anyG_18c_2dsR8Chalokim_4i4fdec1_txt1



Response.Write "</br> Session.LCID :" & Session.LCID


 
t1=formatDateTime(Now,0)
Response.Write "</br> t1:" t1
Response.Write "</br> t1:" t1


d_now = Date()
d = split(DateAdd("d",0,d_now),"/")
s = d(2) & "-" & d(0) & "-" & d(1)


' change format from 22/06/2019 10:29:45 to yyyy-dd-mm 
spits = split(date(), "/")
fullSpit = d(2) & "-" & d(0) & "-" & d(1)
Response.Write "</br> fullSpit :" & fullSpit