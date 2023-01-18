<?php
	include '../../connection.php';

	$guest = [];

	$tampil = mysqli_query($connect, "SELECT * FROM tbl_guest order by id_guest asc");
      

    while ($data = mysqli_fetch_assoc($tampil)) {
    	array_push($guest, $data);
    }
    
	echo json_encode(array(
		"success"=>true,
		"data"=>$guest,
		"code"=>200,

	));
?>