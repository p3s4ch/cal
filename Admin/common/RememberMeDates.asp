

<%
FromDay= request("FromDay")
FromMonth= request("FromMonth")
FromYr= request("FromYr")
ToDay= request("ToDay")
ToMonth= request("ToMonth")
ToYr= request("ToYr")
periodID= request("periodID")
%>


<input type=hidden name=FromDay value="<%=FromDay%>" />
<input type=hidden name=FromMonth value="<%=FromMonth%>" />
<input type=hidden name=FromYr value="<%=FromYr%>" />

<input type=hidden name=ToDay value="<%=ToDay%>" />
<input type=hidden name=ToMonth value="<%=ToMonth%>" />
<input type=hidden name=ToYr value="<%=ToYr%>" />

<input type=hidden name=periodID value="<%=periodID%>" />
