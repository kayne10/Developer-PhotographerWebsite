<?php
if(isset($_POST['submit'])) {
	$msg = 'Subject: ' .$_POST['subject'] ."\n"
		.'Name: ' .$_POST['name'] . "\n"
		.'Email: ' .$_POST['email'] . "\n"
		.'Message: ' .$_POST['message'];
	mail('troy.kayne@colorado.edu', 'Sample Contact Form', $msg);
	header('location: contact-me-thanks.php');
}
else {
	header('location: contact-me.php');
	exit(0);
}
?>