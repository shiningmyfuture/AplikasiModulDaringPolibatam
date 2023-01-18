<?php
	include '../../connection.php';

	$json = file_get_contents('php://input');

	// Converts it into a PHP object
	$data = json_decode($json);

	$username = $data->username;
	$nim_mhs = $data->nim_mhs;
	$password = password_hash($data->password, PASSWORD_DEFAULT);
	$no_hpmhs=$data->no_hpmhs;
	$email_mhs=$data->email_mhs;
	$alamat_mhs=$data->alamat_mhs;

	$sql1 = "SELECT * FROM tbl_mahasiswa WHERE username='$username'";

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
		$sql2 = "INSERT INTO tbl_mahasiswa (username, nim_mhs, password, no_hpmhs, email_mhs, alamat_mhs) VALUES (
		'$username',
		'$nim_mhs',
		'$password',
		'$no_hpmhs',
		'$email_mhs',
		'$alamat_mhs'
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