<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="obj" class="Models.User" scope="session" />
<jsp:setProperty property="*" name="obj" />
<!DOCTYPE html>

<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        .container {
            width: 300px;
            padding: 16px;
            background-color: white;
            margin: 0 auto;
            margin-top: 100px;
            border-radius: 4px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: none;
            color: white;
            background-color: #5C6BC0;
        }
        .error-message {
            color: red;
            margin-bottom: 10px;
        }
        .nav-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .nav-button {
            padding: 10px;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }
        .nav-button.view-jobs {
            background-color: #3498db;
        }
        .nav-button.sign-up {
            background-color: #2ecc71;
        }
    </style>
</head>
<body>
    <div class="container">
        <form method="post" action="">
            Email: <input type="text" name="email" required><br>
            Password: <input type="password" name="password" required><br>
            <input type="submit" value="Login">
        </form>
        <div class="nav-container">
            <button class="nav-button view-jobs" onclick="location.href='jobsView.jsp';">View Jobs</button>
            <button class="nav-button sign-up" onclick="location.href='signup.jsp';">Sign up</button>
        </div>
   </div>
</body>
</html>
<% 
    String userEmail = request.getParameter("email");
    String userPassword = request.getParameter("password");
    
    if ("POST".equalsIgnoreCase(request.getMethod()) && userEmail != null) {
        Connection c = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            c = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "admin");
            String query = "SELECT count(*) FROM JOBAPPLICANTS WHERE Email = ?";
            pstmt = c.prepareStatement(query);
            pstmt.setString(1, userEmail);
            rs = pstmt.executeQuery();
            
            if (userEmail.equals("admin@mail")) {
                response.sendRedirect("mainAdmin.jsp");
            } else if (rs.next()) {
                int count = rs.getInt(1);
                
                if (count > 0) {
                    // Set the user email in the session
                    session.setAttribute("userEmail", userEmail);
                    // Redirect to the jobs view page
                    response.sendRedirect("jobsView.jsp");
                } else {
                    out.println("<div class='error-message'>Invalid email. Please try again.</div>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (c != null) try { c.close(); } catch (SQLException ignore) {}
        }
    }
%>
