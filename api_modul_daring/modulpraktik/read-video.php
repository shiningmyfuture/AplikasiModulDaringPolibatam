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

if(isset($data->id) ){
//IF HAS ID PARAMETER
    $orderid = filter_var($data->id, FILTER_VALIDATE_INT,[
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
$sql = is_numeric($orderid) ? "SELECT * FROM tbl_modulpraktik  WHERE id='$orderid' AND jenis_modul = 'Link' ORDER BY judul_modul ASC" : "SELECT * FROM tbl_modulpraktik WHERE jenis_modul = 'Link' ORDER BY judul_modul ASC"; 
$stmt = $conn->prepare($sql);
$stmt->execute();

//CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
if($stmt->rowCount() > 0){
    // CREATE POSTS ARRAY
    $posts_array = [];
    
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $post_data = [
            'id_modul' => $row['id_modul'],
            'id_matkul' => $row['id_matkul'],
            'jenis_modul' => $row['jenis_modul'],
            'judul_modul' => $row['judul_modul'],
            'modul_file' => $row['modul_file'],
            'modul_link' => $row['modul_link'],
            'icon' => $row['icon'],
            
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