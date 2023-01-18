<?php
	include '../../connection.php';

	$id_admin=$data->id_admin;

	$sql = mysqli_query($connect, "DELETE FROM tbl_admin WHERE id_admin");
    
	echo json_encode(array(
		"success"=>true,
		"data"=>$admin,
		"code"=>200,

	));
?>