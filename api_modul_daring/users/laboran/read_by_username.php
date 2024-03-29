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

if(isset($data->username) ){
//IF HAS ID PARAMETER
    $username =$data->username;
}
else {
	$apiResponse['success'] = false;
	$apiResponse['code'] = 200;
	$apiResponse['messages'] = "Username cannot be empty";
    echo json_encode($apiResponse);
	return;
}
// MAKE SQL QUERY
// IF GET POSTS ID, THEN SHOW POSTS BY ID OTHERWISE SHOW ALL POSTS
//$sql = "SELECT * FROM `users` WHERE email='$email'" ; 
$sql = "SELECT * FROM `tbl_laboran` WHERE username='$username'" ; 
$stmt = $conn->prepare($sql);
$stmt->execute();

//CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
if($stmt->rowCount() > 0){
    // CREATE POSTS ARRAY
    $posts_array = [];
    
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $post_data = [
            'id_laboran' => $row['id_laboran'],
            'username' => $row['username'],
            'email_laboran' => $row['email_laboran'],
            'password' => $row['password'],
        ];
        // PUSH POST DATA IN OUR $posts_array ARRAY
		if(isset($data->username)){
			$apiResponse['content']=$post_data;
		}
		else {
			array_push($posts_array, $post_data);
		}
    }
    //SHOW POST/POSTS IN JSON FORMAT
	if(!isset($data->username)){
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