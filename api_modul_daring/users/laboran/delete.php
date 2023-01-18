<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: DELETE");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

$apiResponse['success'] = true;
$apiResponse['code'] = 200;
$apiResponse['message'] = "";
$apiResponse['content'] = null;

//CHECKING, IF ID AVAILABLE ON $data
if(isset($data->id_laboran)){
    $post_id = $data->id_laboran;
    //GET POST BY ID FROM DATABASE
    // YOU CAN REMOVE THIS QUERY AND PERFORM ONLY DELETE QUERY
    $check_post = "SELECT * FROM `tbl_laboran` WHERE id_laboran=:post_id";
    $check_post_stmt = $conn->prepare($check_post);
    $check_post_stmt->bindValue(':post_id', $post_id,PDO::PARAM_INT);
    $check_post_stmt->execute();
    //CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
    if($check_post_stmt->rowCount() > 0){
        //DELETE POST BY ID FROM DATABASE
        $delete_post = "DELETE FROM `tbl_laboran` WHERE id_laboran=:post_id";
        $delete_post_stmt = $conn->prepare($delete_post);
        $delete_post_stmt->bindValue(':post_id', $post_id,PDO::PARAM_INT);
        
        if($delete_post_stmt->execute()){
            $apiResponse['message'] = "Post Deleted Successfully";
        }else{
            $apiResponse['success'] = false;
            $apiResponse['message'] = "Post Not Deleted";
        }
        
    }else{
            $apiResponse['success'] = false;
            $apiResponse['message'] = "ID Not Found";
    }
    // ECHO MESSAGE IN JSON FORMAT
    echo  json_encode($apiResponse);
}
else {
    $apiResponse['success'] = false;
    $apiResponse['message'] = "ID Needed";  
    echo  json_encode($apiResponse);
}
?>