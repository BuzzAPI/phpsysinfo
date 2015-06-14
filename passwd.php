<?php 
// Enable or disable login protect
$password_enabled=TRUE;

// set de user and pass
$user = "admin";
$pass = "password";

if($password_enabled){
	$validated = ($_SERVER['PHP_AUTH_USER']==$user && $_SERVER['PHP_AUTH_PW']==$pass);
	if (!$validated) {
	  header('WWW-Authenticate: Basic realm="PHPsysInfo"');
	  header('HTTP/1.0 401 Unauthorized');
	  die ("Not authorized");
	}
}
