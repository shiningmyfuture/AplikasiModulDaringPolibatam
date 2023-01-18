<?php
	include '../../connection.php';

	$json = file_get_contents('php://input');

	// Converts it into a PHP object
	$data = json_decode($json);

	$username = $data->username;
	$password = password_hash($data->password, PASSWORD_DEFAULT);
	$no_hpadmin=$data->no_hpadmin;
	$email_admin=$data->email_admin;
	$alamat_admin=$data->alamat_admin;

	$sql1 = "SELECT * FROM tbl_admin WHERE username='$username'";

	$check = $connect->query($sql1);
	$reason = "";
	$code = 200;
	
	$success = true;
	if ($check->num_rows > 0) {
		$success = false;
		$reason = "Sorry, username is already exist";
		$code = 400;
		# code...
	}else{
		$sql2 = "INSERT INTO tbl_admin (username, password, no_hpadmin, email_admin, alamat_admin) VALUES (
		'$username',
		'$password',
		'$no_hpadmin',
		'$email_admin',
		'$alamat_admin'
		)";
		$result = $connect->query($sql2);
		if (!$result) {
			$success = false;
			$reason = "Failed to sign up";
			$code = 400;

		}
	}
	echo json_encode(array(
		"success"=>$success,
		"data"=>$reason,
		"code"=>$code,

	));

?>