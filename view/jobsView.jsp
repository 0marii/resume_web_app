<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Jobs</title>
    <!-- Add your styles here -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .nav-bar {
            background-color: #333;
            overflow: hidden;
        }

        .nav-bar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        .nav-bar a:hover {
            background-color: #ddd;
            color: black;
        }

        h2 {
            color: #333;
            margin: 20px 0;
        }

        .job-posting {
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .job-posting h3 {
            color: #4caf50;
        }

        .job-posting p {
            color: #666;
            margin: 10px 0;
        }

        .apply-button {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-top: 10px;
            cursor: pointer;
        }

        .apply-button:hover {
            background-color: #45a049;
        }

        .login-message {
            color: #FF0000;
        }
    </style>
</head>
<body>

<div class="nav-bar">
    <a href="login.jsp">Login</a>
    <a href="signup.jsp">Signup</a>
</div>

<h2>Available Jobs</h2>

<%
    String userEmail = (String) session.getAttribute("userEmail");

    try {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "admin");
        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM JobPostings");

        while(rs.next()) {
            int postingId = rs.getInt("PostingID");
            String title = rs.getString("Title");
            java.sql.Date closingDate = rs.getDate("ClosingDate");
            String details = rs.getString("Details");
%>
            <div class="job-posting">
                <h3><%= title %></h3>
                <p>Posting ID: <%= postingId %></p>
                <p>Closing Date: <%= closingDate %></p>
                <p>Details: <%= details %></p>
                <%
                    if (userEmail != null && !userEmail.isEmpty()) {
                %>
                        <button class="apply-button" onclick="location.href='jobApplication.jsp?postingId=<%= postingId %>';">Apply</button>
                <%
                    } else {
                %>
                        <p class="login-message">Login to apply for the job.</p>
                <%
                    }
                %>
            </div>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>