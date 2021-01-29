<!-- This is a GenericMini to be called with table name-->
<!--#include file="dsn.asp"-->
<!--#include file="body.asp"-->
<!--#include file="common/SQL_Cn.asp"-->
<!--#include file="style.asp"-->
<!--#include file="common\banner.asp"-->


<!--#include file="common/GilonHiddenURLSession_NoHello.asp"-->



<%
orderBy = Replace(request("orderby"),"_","  ")
SearchWhere = request("SearchWhere")
SearchFor = request("SearchFor")
betweenFrom= request("betweenFrom")
betweenTo= request("betweenTo")
DeleteID = request("DeleteID")
AddID = request("AddID")
Submit = request("Submit")


     SQL = "select u.ID , Admin_ID , Admin_Pass,  u.id LoginAsThem, c.ID Customer, c.FirstName , c.Surname   from Users u left join Customers c on u.CustomerID = c.ID " & SQL_Where

 Response.Write  SQL

%>


<!--#include file="GenericSQLViewerPart2.asp"-->
