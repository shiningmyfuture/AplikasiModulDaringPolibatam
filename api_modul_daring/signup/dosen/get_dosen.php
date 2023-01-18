<?php
	include '../../connection.php';

	$dosen = [];

	$tampil = mysqli_query($connect, "SELECT * FROM tbl_dosen order by id_dosen asc");
      

    while ($data = mysqli_fetch_assoc($tampil)) {
    	array_push($dosen, $data);
    }
    
	echo json_encode(array(
		"success"=>true,
		"data"=>$dosen,
		"code"=>200,

	));
?>