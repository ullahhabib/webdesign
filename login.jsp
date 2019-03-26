<%-- 
    Document   : login
    Created on : Mar 22, 2019, 6:18:21 PM
    Author     : saraq
--%>
<%@ page import ="java.sql.*" %>
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
            
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=convertToNull","root","123456");
            Statement st = conn.createStatement();
          
            ResultSet rs;
            rs = st.executeQuery("select * from userinfo where email='" + email + "' and password='" + password + "'");
            if(rs.next()){
                email = rs.getString("email");
                password = rs.getString("password");
                if(email.equals(email) && password.equals(password))
                {
                    session.setAttribute("email", email);
                    session.setAttribute("password", password);
                    response.sendRedirect("dashboard.html");
                }
            }else{
                response.sendRedirect("index.html");
                rs.close();
            }
        %>
    </body>
</html>
