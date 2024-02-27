<%@page import="Models.Application"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="jobApplicationBean" class="Models.Application" scope="session" />
<jsp:setProperty property="*" name="jobApplicationBean" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Application Form</title>
    </head>
    <body>
        <h2>Job Application Form</h2>
        <form method="post" action="apply" enctype="multipart/form-data">
            <textarea name="motivation" placeholder="Why are you applying for this position?" required></textarea><br>
            <input type="file" name="resume" required><br>
            <input type="submit" value="Submit Application">
        </form>
    </body>
</html>
