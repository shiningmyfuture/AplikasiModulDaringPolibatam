<?php
	include '../../connection.php';

	$json = file_get_contents('php://input');

	// Converts it into a PHP object
	$data = json_decode($json);

	$username = $data->username;
	$nik_laboran = $data->nik_laboran;
	$password = password_hash($data->password, PASSWORD_DEFAULT);
	$no_hplaboran=$data->no_hplaboran;
	$email_laboran=$data->email_laboran;
	$alamat_laboran=$data->alamat_laboran;

	$sql1 = "SELECT * FROM tbl_laboran WHERE username='$username'";

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
		$sql2 = "INSERT INTO tbl_laboran (username, nik_laboran, password, no_hplaboran, email_laboran, alamat_laboran) VALUES (
		'$username',
		'$nik_laboran',
		'$password',
		'$no_hplaboran',
		'$email_laboran',
		'$alamat_laboran'
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