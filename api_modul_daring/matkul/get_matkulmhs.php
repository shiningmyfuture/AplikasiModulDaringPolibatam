<?php
	include '../connection.php';

	$matkul_mhs = [];
	$id_mhs = $_GET['id_mhs'];
	$tampil = mysqli_query($connect, "SELECT * FROM tbl_matkulmhs INNER JOIN tbl_matakuliah ON tbl_matakuliah.id_matkul = tbl_matkulmhs.id_matkul WHERE id_mhs='$id_mhs'");
      

    while ($data = mysqli_fetch_assoc($tampil)) {
    	array_push($matkul_mhs, $data);
    }
    
	echo json_encode(array(
		"success"=>true,
		"data"=>$matkul_mhs,
		"code"=>200,

	));
?>