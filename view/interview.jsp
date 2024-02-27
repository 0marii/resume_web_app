<%@page import="java.util.List"%>
<%@page import="Models.User"%>
<%@page import="Models.UserDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User List</title>
</head>
<body>
    <h2>User List</h2>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Address</th>
            <th>City</th>
            <th>Country</th>
            <th>Education Level</th>
        </tr>

        <% List<User> userList = UserDAO.getAllUsers();
           for (User user : userList) { %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getFirstName() %></td>
                <td><%= user.getLastName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getPhone() %></td>
                <td><%= user.getAddress() %></td>
                <td><%= user.getCity() %></td>
                <td><%= user.getCountry() %></td>
                <td><%= user.getEducationLevel() %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
