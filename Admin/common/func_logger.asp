

<%
Function  gc_logger (uid,msg)

   msg = Replace(msg,"'","")

   sql_logs = "exec [dbo].[add_dbo.Logs] -1, "& uid &", '"& msg &"'"
   set RS = SQLCN.execute(sql_logs)

end Function

%>
