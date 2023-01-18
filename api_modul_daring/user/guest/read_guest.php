<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");

// INCLUDING DATABASE AND MAKING OBJECT
require '../../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

$apiResponse['success'] = true;
$apiResponse['code'] = 200;
$apiResponse['message'] = "";
$apiResponse['content'] = null;
	
$data = json_decode(file_get_contents("php://input"));

if(isset($data->id_guest) ){
//IF HAS ID PARAMETER
    $orderid = filter_var($data->id_guest, FILTER_VALIDATE_INT,[
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
$sql = is_numeric($orderid) ? "SELECT * FROM `tbl_guest` WHERE id_guest='$orderid'" : "SELECT * FROM `tbl_guest`"; 
$stmt = $conn->prepare($sql);
$stmt->execute();

//CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
if($stmt->rowCount() > 0){
    // CREATE POSTS ARRAY
    $posts_array = [];
    
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $post_data = [
            'id_guest' => $row['id_guest'],
            'username' => $row['username'],
            'password' => $row['password'],
            'email_guest' => $row['email_guest'],
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