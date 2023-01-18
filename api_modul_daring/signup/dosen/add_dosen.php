<?php
	include '../../connection.php';

	$json = file_get_contents('php://input');

	// Converts it into a PHP object
	$data = json_decode($json);

	$username = $data->username;
	$nik_dosen = $data->nik_dosen;
	$password = password_hash($data->password, PASSWORD_DEFAULT);
	$no_hpdosen=$data->no_hpdosen;
	$email_dosen=$data->email_dosen;
	$alamat_dosen=$data->alamat_dosen;

	$sql1 = "SELECT * FROM tbl_dosen WHERE username='$username'";

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
		$sql2 = "INSERT INTO tbl_dosen (username, nik_dosen, password, no_hpdosen, email_dosen, alamat_dosen) VALUES (
		'$username',
		'$nik_dosen',
		'$password',
		'$no_hpdosen',
		'$email_dosen',
		'$alamat_dosen'
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