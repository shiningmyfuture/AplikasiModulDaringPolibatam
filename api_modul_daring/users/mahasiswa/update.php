<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: PUT");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

$apiResponse['success'] = true;
$apiResponse['code'] = 200;
$apiResponse['message'] = "";
$apiResponse['content'] = null;
// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

//CHECKING, IF ID AVAILABLE ON $data
if(isset($data->id_mhs)){
    $post_id = $data->id_mhs;
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `tbl_mahasiswa` WHERE id_mhs=:post_id";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':post_id', $post_id,PDO::PARAM_INT);
    $get_stmt->execute();
	
    
    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
        
        // FETCH POST FROM DATBASE 
        $row = $get_stmt->fetch(PDO::FETCH_ASSOC);
        
        // CHECK, IF NEW UPDATE REQUEST DATA IS AVAILABLE THEN SET IT OTHERWISE SET OLD DATA
        $post_email = isset($data->email_mhs) ? $data->email_mhs : $row['email_mhs'];
        $post_password = isset($data->password) ? $data->password : $row['password'];

        
        $update_query = "UPDATE `tbl_mahasiswa` SET username = :username, password = :password, status = :status 
        WHERE id = :id";
        
        $update_stmt = $conn->prepare($update_query);
        
        // DATA BINDING AND REMOVE SPECIAL CHARS AND REMOVE TAGS
        $update_stmt->bindValue(':email', htmlspecialchars(strip_tags($post_email)),PDO::PARAM_STR);
        $update_stmt->bindValue(':password', htmlspecialchars(strip_tags($post_password)),PDO::PARAM_STR);
        $update_stmt->bindValue(':status', htmlspecialchars(strip_tags($post_status)),PDO::PARAM_STR);
        $update_stmt->bindValue(':id', $post_id,PDO::PARAM_INT);
        
        
        if($update_stmt->execute()){
			$apiResponse['success'] = true;
			$apiResponse['code'] = 200;
			$apiResponse['message'] = "Data updated successfully";
        }else{
			$apiResponse['success'] = true;
			$apiResponse['code'] = 200;
			$apiResponse['message'] = "Data Not Updated";
        }   
    }
    else{
		$apiResponse['success'] = false;
		$apiResponse['code'] = 200;
		$apiResponse['message'] = "ID Not Found";
    }  
    
    echo  json_encode($apiResponse);
    
}
?>