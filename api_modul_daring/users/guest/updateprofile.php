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
if(isset($data->username)){
    $username = $data->username;
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `tbl_guest` WHERE username=:username";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':username', $username,PDO::PARAM_STR);
    $get_stmt->execute();
	
    
    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
        
        // FETCH POST FROM DATBASE 
        $row = $get_stmt->fetch(PDO::FETCH_ASSOC);
        
        // CHECK, IF NEW UPDATE REQUEST DATA IS AVAILABLE THEN SET IT OTHERWISE SET OLD DATA
        $post_newusername = isset($data->newusername) ? $data->newusername : $row['username'];
        $post_username = isset($data->username) ? $data->username : $row['username'];
        $post_email_guest = isset($data->email_guest) ? $data->email_guest : $row['email_guest'];
        
        $update_query = "UPDATE `tbl_guest` SET  username = :newusername, email_guest =:email_guest
        WHERE username = :username";
        
        $update_stmt = $conn->prepare($update_query);
        
        // DATA BINDING AND REMOVE SPECIAL CHARS AND REMOVE TAGS
        $update_stmt->bindValue(':username', htmlspecialchars(strip_tags($post_username)),PDO::PARAM_STR);
        $update_stmt->bindValue(':newusername', htmlspecialchars(strip_tags($post_newusername)),PDO::PARAM_STR);
        $update_stmt->bindValue(':email_guest', htmlspecialchars(strip_tags($post_email_guest)),PDO::PARAM_STR);

        //$update_stmt->bindValue(':id', $post_id,PDO::PARAM_INT);
        
        
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
		$apiResponse['message'] = "Email Not Found";
    }  
    
    echo  json_encode($apiResponse);
    
}
?>