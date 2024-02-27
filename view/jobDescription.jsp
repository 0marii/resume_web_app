<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create Job Posting Page</title>
</head>
<body>
    <h2>Create Job Posting Form</h2>
    <form method="post" action="createJobPosting">
        <input type="text" name="title" placeholder="Job Title" required><br>
        <input type="date" name="closingDate" required><br>
        <textarea name="details" placeholder="Job Details" required></textarea><br>
        <input type="submit" value="Create Posting">
    </form>
</body>
</html>
