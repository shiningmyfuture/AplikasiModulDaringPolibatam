<?php
	include '../../connection.php';

	$admin = [];

	$tampil = mysqli_query($connect, "SELECT * FROM tbl_admin order by id_admin asc");
      

    while ($data = mysqli_fetch_assoc($tampil)) {
    	array_push($admin, $data);
    }
    
	echo json_encode(array(
		"success"=>true,
		"data"=>$admin,
		"code"=>200,

	));
?>