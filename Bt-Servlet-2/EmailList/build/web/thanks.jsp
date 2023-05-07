<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>emailList</title>
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    </head>

    <body>
        <h1>Thanks for joining our email list</h1>

        <p>Here is the information that you entered:</p>

        <label>Email:</label>
        <span>${user.email}</span><br>
        <!--    <label>Phone Number:</label>
            <span>${user.phoneNumber}</span><br>-->
        <label>First Name:</label>
        <span>${user.firstName}</span><br>
        <label>Last Name:</label>
        <span>${user.lastName}</span><br>
        <!--    <label>Gender:</label>
            <span>${user.gender}</span><br>-->
        <p>We will use this email to notify you whenever
            we have new releases for these types of music:</p>
        <span>${user.music}</span>
        
        <p>To enter another email address, click on the Back 
            button in your browser or the Return button shown 
            below.</p>

        <form action="" method="get">
            <input type="hidden" name="action" value="join">
            <input type="submit" value="Return" id="return">
        </form>

    </body>
</html>
