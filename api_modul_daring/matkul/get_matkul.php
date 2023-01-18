<?php
	include '../connection.php';

	$matkul = [];
	$id_prodi = $_GET['id_prodi'];
	$tampil = mysqli_query($connect, "SELECT * FROM tbl_matakuliah WHERE id_prodi='$id_prodi'");
      

    while ($data = mysqli_fetch_assoc($tampil)) {
    	array_push($matkul, $data);
    }
    
	echo json_encode(array(
		"success"=>true,
		"data"=>$matkul,
		"code"=>200,

	));
?>