<html>
<head>
	<title>Thank You</title>
<style type="text/css">
	.confirmation h1 h3{
		font-family: 'FontAwesome';
  		src: url('../fonts/fontawesome-webfont.eot?v=4.4.0');
  		src: url('../fonts/fontawesome-webfont.eot?#iefix&v=4.4.0') format('embedded-opentype'), url('../fonts/fontawesome-webfont.woff2?v=4.4.0') format('woff2'), url('../fonts/fontawesome-webfont.woff?v=4.4.0') format('woff'), url('../fonts/fontawesome-webfont.ttf?v=4.4.0') format('truetype'), url('../fonts/fontawesome-webfont.svg?v=4.4.0#fontawesomeregular') format('svg');
  		font-weight: normal;
  		font-style: normal;
	}
</style>
</head>
<body>
	<div class="confirmation">
		<h1>Message Sent!</h1>
		<h3>Thank you for contacting me</h3>
	</div>

<?php
    // Grab our POSTed form values
    // Note that whatever is enclosed by $_POST[""] matches the form input elements
    $contactSubject = $_POST["subject"]
    $contactName = $_POST["name"];
    $contactEmail = $_POST["email"];
    $contactMessage = $_POST["message"];
 
    // Connect to our DB with mysql_connect(<server>, <username>, <password>)
    $sql_connection = mysql_connect("troykaynedesignandphoto.com", "troykayne1", "Zan!3qPr7");
 
    mysql_select_db("contacting", $sql_connection);
 
    // Probably should check to make sure the connection was successful
    // But I'm too lazy...
    $sql = "INSERT INTO communication (
                subject,
                name,
                email,
                message,
                ContactDateCreated
            )
            VALUES (
                '$contactSubject'
                '$contactName',
                '$contactEmail',
                '$contactMessage',
                NOW()
            )"
 
    mysql_query($sql, $sql_connection);
 
    mysql_close($sql_connection);
?>
</body>
</html>
