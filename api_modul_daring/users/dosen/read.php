<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

$apiResponse['success'] = true;
$apiResponse['code'] = 200;
$apiResponse['message'] = "";
$apiResponse['content'] = null;
	
$data = json_decode(file_get_contents("php://input"));

if(isset($data->id_dosen) ){
//IF HAS ID PARAMETER
    $orderid = filter_var($data->id_dosen, FILTER_VALIDATE_INT,[
        'options' => [
            'default' => 'all_posts',
            'min_range' => 1
        ]
    ]);
}
else {
    $orderid = 'all_posts';
}
// MAKE SQL QUERY
// IF GET POSTS ID, THEN SHOW POSTS BY ID OTHERWISE SHOW ALL POSTS
$sql = is_numeric($orderid) ? "SELECT * FROM `tbl_dosen` WHERE id_dosen='$orderid'" : "SELECT * FROM `tbl_dosen`"; 
$stmt = $conn->prepare($sql);
$stmt->execute();

//CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
if($stmt->rowCount() > 0){
    // CREATE POSTS ARRAY
    $posts_array = [];
    
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $post_data = [
            'id_dosen' => $row['id_dosen'],
            'username' => $row['username'],
            'password' => $row['password'],
            'nik_dosen' => $row['nik_dosen'],
            'no_hpdosen' => $row['no_hpdosen'],
            'email_dosen' => $row['email_dosen'],
            'alamat_dosen' => $row['alamat_dosen'],
        ];
        // PUSH POST DATA IN OUR $posts_array ARRAY
		if(isset($data->orderid)){
			$apiResponse['content']=$post_data;
		}
		else {
			array_push($posts_array, $post_data);
		}
    }
    //SHOW POST/POSTS IN JSON FORMAT
	if(!isset($data->orderid)){
		$apiResponse['content']=$posts_array;
	}
	echo json_encode($apiResponse);
}
else{
	$apiResponse['success'] = false;
	$apiResponse['code'] = 200;
	$apiResponse['messages'] = "No Data Found";
    //IF THER IS NO POST IN OUR DATABASE
    echo json_encode($apiResponse);
}
?>