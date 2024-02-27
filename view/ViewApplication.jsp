<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Application Data</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .delete-button {
            background-color: #FF4081;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }
    </style>
    <script>
        function confirmDelete(applicationId) {
            var confirmDelete = confirm("Are you sure you want to delete this application?");
            if (confirmDelete) {
                window.location.href = "deleteApplication.jsp?applicationId=" + applicationId;
            }
        }
    </script>
</head>
<body>
    <h2>Job Application Data</h2>
    
    <table border="1">
        <tr>
            <th>Application ID</th>
            <th>Applicant ID</th>
            <th>Job ID</th>
            <th>Motivation</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        
        <%
            try {
                Class.forName("oracle.jdbc.OracleDriver");
                Connection c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "admin");
                Statement s = c.createStatement();
                ResultSet rs = s.executeQuery("SELECT * FROM JobApplications");

                while (rs.next()) {
                    int applicationId = rs.getInt("ApplicationID");
                    int applicantId = rs.getInt("ApplicantID");
                    int jobId = rs.getInt("JobID");
                    String motivation = rs.getString("Motivation");
                    String status = rs.getString("Status");
        %>
                    <tr>
                        <td><%= applicationId %></td>
                        <td><%= applicantId %></td>
                        <td><%= jobId %></td>
                        <td><%= motivation %></td>
                        <td><%= status %></td>
                        <td>
                            <button class="delete-button" onclick="confirmDelete(<%= applicationId %>)">Delete</button>
                        </td>
                    </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    
</body>
</html>
