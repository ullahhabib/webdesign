<%-- 
    Document   : fuelquote
    Created on : Mar 24, 2019, 10:12:43 PM
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
            String gallonRequested= request.getParameter("gallonsRequested");
            String deliveryAddress = request.getParameter("deliveryAddress");
            String deliveryDate = request.getParameter("deliveryDate");
            String price = "4";
            String totalAmount = request.getParameter("totalAmount");
            String email = request.getParameter("email");
            // totalAmount =parseInt(gallonRequested)*parseInt(price);
           
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=convertToNull","root","123456");
            Statement st = conn.createStatement();
            ResultSet rs;
            //int i = st.executeUpdate("insert into fuelquote values('"+gallonRequested+"','"+deliveryAddress+"',STR_TO_DATE('"+deliveryDate+"', '%m/%d/%Y'),'"+price+"','"+totalAmount+"','"+email+"')");
            int i = st.executeUpdate("insert into fuelquote values('"+gallonRequested+"','"+deliveryAddress+"',(STR_TO_DATE('"+deliveryDate+"','%m/%d/%Y')),'"+price+"','"+totalAmount+"','"+email+"')");
            if(i > 0){
                response.sendRedirect("dashboard.html");
            }else{
                response.sendRedirect("index.html");
            }
            
            
        %>
    </body>
</html>
