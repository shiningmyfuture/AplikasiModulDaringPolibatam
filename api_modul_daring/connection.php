<?php
	
	$connect = new mysqli("localhost","root","", "vb");

	if(!$connect) {
		echo "Connection Failed";
		exit();
	}

?>