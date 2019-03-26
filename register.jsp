<%-- 
    Document   : register
    Created on : Mar 22, 2019, 12:04:52 PM
    Author     : saraq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import = 'java.sql.*' %>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
           
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=convertToNull","root","123456");
            Statement st = conn.createStatement();
            ResultSet rs;
            int i = st.executeUpdate("insert into userinfo values('"+email+"','"+password+"','"+repassword+"')");
            if(i > 0){
                response.sendRedirect("dashboard.html");
            }else{
                response.sendRedirect("index.html");
            }
            
            
        %>
    </body>
</html>
