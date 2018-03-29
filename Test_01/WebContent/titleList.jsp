<%@ page language="java" contentType="text/html; charset=utf-8" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="project.TitleDAO,project.Title"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Test-newsTitle</title>
  </head>
  
  <body>
  <table border="1">
      <tr>
          <td>id</td>
          <td>车牌号</td>
          <td>日期</td>
      </tr>
        <%
           TitleDAO dao=new TitleDAO();
           List<Title> list =dao.readFirstTitle();    
           for(Title tl:list)
           {%>
          <tr>
              <td><%=tl.getId() %></td>
              <td><%=tl.getPlate_number() %></td>
              <td><%=tl.getDate() %></td>
          </tr>
            <%}
       %>
  </table>
  </body>
</html>