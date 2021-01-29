



<td bgcolor="#FFFFFF"></td>
<%



for each x in RS.Fields

    isIgnored =  false
	isBlank   =  false
    isSortable = true
    isInvoice2pay = false
    isOverride = false

    myColHeader= x.name

    if InStr(x.Name,"Invoice2pay") > 0 	then isInvoice2pay = true   End If

    if InStr(x.Name,"hidden")    > 0   then isIgnored = true End If

    if InStr(x.Name,"id2") > 0  or InStr(x.Name,"InvStatus") > 0 then isBlank = true  End If



    if  isInvoice2pay then
        isOverride = true
		%>
			      <td> &nbsp; </TD> <td> &nbsp; </TD>
		<%
    End IF


	if  isBlank then
	   isOverride = true
	%>
		      <td> &nbsp; </TD>
	<%
    End IF

	myColHeader= x.name
	if not isIgnored AND not isSortable AND not isBlank  then
	   isOverride = true

	%>
	      <td> <%=myColHeader %> </TD>
	<%

    End IF

    if not isOverride AND isSortable then
    %>
		<td bgcolor="#C5D3E7" align="center">  <font face="Verdana, arial" size="1" color="#000000"><b>
		<a href="?betweenFrom=<%=betweenFrom%>&betweenTo=<%=betweenTo%>&orderby=<%=x.name%>_Desc&page=<%If NOT (orderby = "ID_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
		<%=x.name%> &nbsp;<a href="?betweenFrom=<%=betweenFrom%>&betweenTo=<%=betweenTo%>&orderby=<%=x.name%>&page=<%If NOT (orderby = "ID_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font>
		</td>
    <%
   End If



   next
%>