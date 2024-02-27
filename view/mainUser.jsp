<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
 
 <title>User Dashboard</title>
 <style>
        /* Add some basic sty to the navigation buttons */
        .nav-button {
            background-color: #333;
            color: #fff;
            padding: 10px;
            border: none;
            margin: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .nav-button:hover {
            background-color: #555;
        }
        /* Add some basic styling to the main content area */
        main {
            padding: 20px;
            background-color: #f5f5f5;
            flex: 1;
        }
    </style>
</head>
<body>
    <div>
        <button class="nav-button" onclick="location.href='jobDescription.jsp';">Create a new job</button>
        <button class="nav-button" onclick="location.href='jobApplication.jsp';">Show jobs Applications</button>
        <button class="nav-button" onclick="location.href='jobsView.jsp';">View Jobs</button>
        <button class="nav-button" onclick="location.href='ViewApplication.jsp';">View Offers</button>
        <button class="nav-button" onclick="location.href='login.jsp';">log out</button>
    </div>
    <main>
        <h1>Admin dashboard</h1>
        <!-- The main content goes here -->
        <div id="chart-container">
            <!-- A chart or other data visualization will be displayed here -->
        </div>
    </main>
</body>
</html>