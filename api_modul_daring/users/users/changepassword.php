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
if(isset($data->email) || isset($data->password) || isset($data->newpassword)){
    $email = $data->email;
    $password = $data->password;
    $newpassword = $data->newpassword;
    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `users` WHERE email=:email AND password=:password";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':email', $email,PDO::PARAM_STR);
    $get_stmt->bindValue(':password', $password,PDO::PARAM_STR);
    $get_stmt->execute();
	
    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
        // FETCH POST FROM DATBASE 
        $row = $get_stmt->fetch(PDO::FETCH_ASSOC);
        $update_query = "UPDATE `users` SET password = :password  WHERE email = :email";        
        $update_stmt = $conn->prepare($update_query);


        // DATA BINDING AND REMOVE SPECIAL CHARS AND REMOVE TAGS
        $update_stmt->bindValue(':email', htmlspecialchars(strip_tags($email)),PDO::PARAM_STR);
        $update_stmt->bindValue(':password', htmlspecialchars(strip_tags($newpassword)),PDO::PARAM_STR);

        if($update_stmt->execute()){

          
			$apiResponse['success'] = true;
			$apiResponse['code'] = 200;
			$apiResponse['message'] = "Password updated successfully";
        }else{
			$apiResponse['success'] = false;
			$apiResponse['code'] = 200;
			$apiResponse['message'] = "Password Not Updated";
        }   
    }
    else{
		$apiResponse['success'] = false;
		$apiResponse['code'] = 200;
		$apiResponse['message'] = "Old Password Wrong!!";
    }  
    
    echo  json_encode($apiResponse);
    
}
