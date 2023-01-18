<?php
	include '../../connection.php';

	$laboran = [];

	$tampil = mysqli_query($connect, "SELECT * FROM tbl_laboran order by id_laboran asc");
      

    while ($data = mysqli_fetch_assoc($tampil)) {
    	array_push($laboran, $data);
    }
    
	echo json_encode(array(
		"success"=>true,
		"data"=>$laboran,
		"code"=>200,

	));
?>