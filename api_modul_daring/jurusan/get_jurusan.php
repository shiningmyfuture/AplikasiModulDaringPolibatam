<?php
	include '../connection.php';

	$jurusan = [];

	$tampil = mysqli_query($connect, "SELECT * FROM tbl_jurusan order by id_jurusan asc");
      

    while ($data = mysqli_fetch_assoc($tampil)) {
    	array_push($jurusan, $data);
    }
    
	echo json_encode(array(
		"success"=>true,
		"data"=>$jurusan,
		"code"=>200,

	));
?>