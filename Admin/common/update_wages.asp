
<%
Response.Write "v2"

AddID = request("AddID")

If (AddID <> "" ) Then
         addID = request("addID")
         asofdate = request("asofdate")
	      yr  =request("yr")
	   	  period =request("period")
	   	  ref =request("ref")
	   	  bothNI =request("bothNI")
	   	  empleeNI =request("empleeNI")
	   	  gross =request("gross")
	   	  tax =request("tax")
	     net =request("net")



		 cDt =  CDate(request("asofdate"))
	     sqlDate =Month(cDt) & "/" & Day(cDt)& "/" &Year(cDt)



          sql ="exec  [dbo].[add_dbo.Wages] "   & addID   & ", " &_
	 						                yr       & ", " &_
	 						                period   & ", " &_
	 						                ref      & ", " &_
	 						                bothNI   & ", " &_
	 						                empleeNI &", " &_
	 						                gross    & ", " &_
	 						                tax      & ", " &_
	 						                net      & ", '" &_
                                            sqlDate     & "' "




        set RS = SQLCN.execute(sql)
        if isDebug=1 then
             Response.Write sql
        end if
        'Response.End
        'Response.Write "<br> AddID : " & RS("MyID")
        Response.Write "<HR>"
End If
%>
