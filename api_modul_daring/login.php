<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET, POST');
header("Access-Control-Allow-Headers: X-Requested-With");

	include 'connection.php';

	// Takes raw data from the request
$json = file_get_contents('php://input');

// Converts it into a PHP object
$data = json_decode($json);
	$username = $data->username;
	$password = $data->password;
	$level = $data->level;
	$tabel = null;

	if ($level === "Admin") {
		$tabel = "admin";
	}else if ($level === "Lecturer") {
		$tabel = "dosen";
	}else if ($level === "Laboratory") {
		$tabel = "laboran";
	}else if ($level === "Student") {
		$tabel = "mahasiswa";
	}else if ($level === "Guest") {
		$tabel = "guest";
	};

	$sql = "SELECT * FROM tbl_".$tabel." WHERE username='".$username."'";

	$result = $connect->query($sql);

	if ($result->num_rows > 0) {
		$admin = array();
		while ($row = $result->fetch_assoc()) {
			$admin[] = $row;
		}
		if (password_verify($password,$admin[0]["password"])) {
			http_response_code(200);
			echo json_encode(array(
			"success" => true,
			"data"=>$admin[0],
			"code"=>200,
		));
		} else {
			http_response_code(403);
			echo json_encode(array(
			"success" => false,
			"data"=> null,
			"code"=>403,
		));
		}
		} else {
		http_response_code(404);
		echo json_encode(array(
			"success"=> false,
			"data"=> null,
			"code"=>404,
		));
	}
?>