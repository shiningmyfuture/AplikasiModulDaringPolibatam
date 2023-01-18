<?php
	include '../connection.php';

	$prodi = [];
	$id_jurusan = $_GET['id_jurusan'];
	$tampil = mysqli_query($connect, "SELECT * FROM tbl_prodi WHERE id_jurusan='$id_jurusan'");
      

    while ($data = mysqli_fetch_assoc($tampil)) {
    	array_push($prodi, $data);
    }
    
	echo json_encode(array(
		"success"=>true,
		"data"=>$prodi,
		"code"=>200,

	));
?>