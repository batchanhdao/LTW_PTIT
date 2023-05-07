<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>EmailList</title>
        <link rel="stylesheet" href="styles/main.css" type="text/css"/>
    </head>
    <body>
        <h1>Join our email list</h1>
        <p>To join our email list, enter your name and
            email address below.</p>
        <form action="emailList" method="post">
            <input type="hidden" name="action" value="add">

            <label for="email">Email:</label><br>
            <input type="email" placeholder="Email:" value="${user.email}" name="email" id="email" > <br>
            <div class = "error">${messageEmail}</div>
            
<!--            <label>Phone Number:</label><br>
            <input type="text" placeholder="Phone Number:" name="phoneNumber" ><br>-->

            <label>First Name:</label><br>
            <input type="text" placeholder="First Name:" value="${user.firstName}" name="firstName" ><br>
            <div class = "error">${messageName}</div>
            
            <label>Last Name:</label><br>
            <input type="text" placeholder="Last Name:" value="${user.lastName}" name="lastName" ><br>
            <div class = "error">${messageHo}</div>
            <!--                

            <label>Gender:</label><br>
            <input type="radio" name="gender" value="male"> male
            <input type="radio" name="gender" value="female"> female<br>-->
            
            <h4>I am interested in these types of music:</h4>
            <select multiple size="4" id="music" name="music" >
                <option value="Rock">Rock</option>
                <option value="Country">Country</option>
                <option value="Bluegrass">Bluegrass</option>
                <option value="Folk">Folk</option>
            </select><br>
            
<!--            <div class = "error">${message}</div>-->

            <!--<label>&nbsp;</label>-->
            <br>   
            <input type="submit" value="Submit" id="submit">
            <input type="reset" value="Reset" id="reset">

        </form>

    </body>
</html>
