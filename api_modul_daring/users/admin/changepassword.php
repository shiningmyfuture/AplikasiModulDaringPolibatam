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
if(isset($data->username) || isset($data->password) || isset($data->newpassword)){
    $username = $data->username;
    $password = hash('sha256',($data->password));
    $newpassword = $data->newpassword;

    //GET POST BY ID FROM DATABASE
    $get_post = "SELECT * FROM `tbl_admin` WHERE username=:username AND password=:password";
    $get_stmt = $conn->prepare($get_post);
    $get_stmt->bindValue(':username', $username,PDO::PARAM_STR);
    $get_stmt->bindValue(':password', $password,PDO::PARAM_STR);
    $get_stmt->execute();
    
    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($get_stmt->rowCount() > 0){
        // FETCH POST FROM DATBASE 
        $row = $get_stmt->fetch(PDO::FETCH_ASSOC);
        $update_query = "UPDATE `tbl_admin` SET password = :password  WHERE username = :username";        
        $update_stmt = $conn->prepare($update_query);


        // DATA BINDING AND REMOVE SPECIAL CHARS AND REMOVE TAGS
        $update_stmt->bindValue(':username', htmlspecialchars(strip_tags($username)),PDO::PARAM_STR);
        $update_stmt->bindValue(':password', htmlspecialchars(strip_tags(hash ('sha256',$newpassword))),PDO::PARAM_STR);

        if($update_stmt->execute()){

          
            $apiResponse['success'] = true;
            $apiResponse['code'] = 200;
            $apiResponse['message'] = "Password Updated Successfully";

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
