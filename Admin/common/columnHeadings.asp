



<td bgcolor="#FFFFFF"></td>
<%



for each x in RS.Fields

    isNoHead  = false
    isIgnored =  false
	isSortable= true
    isInvoice2pay = false
    isOverride = false


    myColHeader= x.name



    'col data shown but header is blank
    if InStr(x.Name,"2pay") or InStr(x.Name,"id2") or InStr(x.Name,"_NoHead") > 0 	then isNoHead = true else isNoHead=false End If

    'col is not shown at all
    if InStr(x.Name,"hidden") > 0 	then isOverride = true else isOverride=false End If

    if InStr(x.Name,"Invoice2pay") > 0 	then isInvoice2pay = true else isInvoice2pay=false End If

    if  isNoHead or isOverride then
     isOverride = true
      	%>
			      <td> &nbsp; </TD>
		<%
    End IF


	myColHeader= x.name

	if not isIgnored AND not isSortable  then
	   isOverride = true
	%>
	      <td> <%=myColHeader %> </TD>
	<%

    End IF


    if not isOverride AND isSortable then
    %>
		<td bgcolor="#C5D3E7" align="center">  <font face="Verdana, arial" size="1" color="#000000"><b>
		<a href="?uid=<%=uid%>&bttns=<%=bttns%>&betweenFrom=<%=betweenFrom%>&betweenTo=<%=betweenTo%>&orderby=<%=x.name%>_Desc&page=<%If NOT (orderby = "ID_UP") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">-</a>&nbsp;
		<%=x.name%> &nbsp;<a href="?uid=<%=uid%>&bttns=<%=bttns%>&betweenFrom=<%=betweenFrom%>&betweenTo=<%=betweenTo%>&orderby=<%=x.name%>&page=<%If NOT (orderby = "ID_Down") Then%>1<%Else%><%=intPage%><%End If%>&SearchFor=<%=SearchFor%>&SearchWhere=<%=SearchWhere%>">+</a></b></font>
		</td>
    <%
   End If



   next
%>