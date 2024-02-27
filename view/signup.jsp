<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create Account Job Applicant Page</title>
    <style>
        /* Add your custom styles for the header here */
        body {
            font-family: Arial, sans-serif;
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
    </style>
</head>
<body>

<div class="nav-bar">
    <a href="login.jsp">Login</a>
    <a href="jobsView.jsp">Jobs View</a>
    <!-- Add more navigation links as needed -->
</div>

<h2>Create Account</h2>
<%-- Display error message if any --%>

<form method="post" action="signup">
    <input type="text" name="firstName" placeholder="First Name" value="" required><br>
    <input type="text" name="lastName" placeholder="Last Name" value="" required><br>   
    <input type="email" name="email" placeholder="you@example.com" required><br>
    <input type="tel" name="phone" placeholder="Phone" required><br>
    <input type="text" name="address" placeholder="1234 Main St" required><br>
    <input type="text" name="country" placeholder="Country" value="" required><br>
    <input type="text" name="city" placeholder="City" value="" required><br>
    <label for="educationLevel">Highest Level of Education:</label><br>
    <select id="educationLevel" name="educationLevel">
        <option value="College Diploma">College Diploma</option>
        <option value="Bachelor">Bachelor</option>
        <option value="Master">Master</option>
        <option value="PhD">PhD</option>
    </select><br>
    <input type="submit" value="Register">
</form>

</body>
</html>
