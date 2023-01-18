<?php
	include '../connection.php';

	$json = file_get_contents('php://input');

	// Converts it into a PHP object
	$data = json_decode($json);

	$nama_jurusan = $data->nama_jurusan;
	

	$sql1 = "SELECT * FROM tbl_jurusan WHERE nama_jurusan='$nama_jurusan'";

	$check = $connect->query($sql1);
	$reason = "";
	$code = 200;
	
	$success = true;
	if ($check->num_rows > 0) {
		$success = false;
		$reason = "Sorry, the major is already exist";
		$code = 400;
		# code...
	}else{
		$sql2 = "INSERT INTO tbl_jurusan (nama_jurusan) VALUES (
		'$nama_jurusan'
		)";
		$result = $connect->query($sql2);
		if (!$result) {
			$success = false;
			$reason = "Failed to add major";
			$code = 400;

		}
	}
	echo json_encode(array(
		"success"=>$success,
		"data"=>$reason,
		"code"=>$code,

	));

?>