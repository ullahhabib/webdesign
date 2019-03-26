<%-- 
    Document   : profile
    Created on : Mar 22, 2019, 11:11:37 PM
    Author     : saraq
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    String zip = request.getParameter("zip");
    String email = request.getParameter("email");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql?zeroDateTimeBehavior=convertToNull","root","123456"); 
     Statement st = conn.createStatement();
            ResultSet rs;
            int i = st.executeUpdate("insert into record values('"+firstname+"','"+lastname+"','"+address+"','"+city+"','"+state+"','"+zip+"','"+email+"')");
            if(i > 0){
                response.sendRedirect("dashboard.html");
            }else{
             
            }
        %>
</table>
