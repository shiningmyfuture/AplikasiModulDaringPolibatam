<?php
	include '../../connection.php';

	$mahasiswa = [];

	$tampil = mysqli_query($connect, "SELECT * FROM tbl_mahasiswa order by id_mhs asc");
      

    while ($data = mysqli_fetch_assoc($tampil)) {
    	array_push($mahasiswa, $data);
    }
    
	echo json_encode(array(
		"success"=>true,
		"data"=>$mahasiswa,
		"code"=>200,

	));
?>