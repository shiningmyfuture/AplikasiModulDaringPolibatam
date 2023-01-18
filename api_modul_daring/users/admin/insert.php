<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

// GET DATA FORM REQUEST
$data = json_decode(file_get_contents("php://input"));

//CREATE MESSAGE ARRAY AND SET EMPTY
$apiResponse['success'] = true;
$apiResponse['code'] = 200;
$apiResponse['message'] = "";
$apiResponse['content'] = null;

// CHECK IF RECEIVED DATA FROM THE REQUEST
if(isset ($data->username) && isset($data->email_admin) && isset($data->password)&& isset($data->alamat_admin) && isset($data->no_hpadmin)){

	$get_post = "SELECT * FROM `tbl_admin` WHERE username=:username OR email_admin=:email_admin";
    $get_stmt = $conn->prepare($get_post);
	$get_stmt->bindValue(':username', htmlspecialchars(strip_tags($data->username)),PDO::PARAM_STR);
	$get_stmt->bindValue(':email_admin',htmlspecialchars(strip_tags($data->email_admin)),PDO::PARAM_STR);
    $get_stmt->execute();
	
    
    //CEK username atau email yang telah ada
    if($get_stmt->rowCount() > 0){
        
        // Data Sudah ada dan tidak bisa di insert ke database
        $apiResponse['success'] = false;
		$apiResponse['code'] = 200;
		$apiResponse['message'] = "Data Already exist";
 
    }
    else{
		//Data insert ke database
		$insert_query = "INSERT INTO `tbl_admin`(username,email_admin,password,no_hpadmin,alamat_admin) VALUES(:username,:email_admin,:password,:no_hpadmin,:alamat_admin)";
		$insert_stmt = $conn->prepare($insert_query);
		// DATA BINDING
		$insert_stmt->bindValue(':username', htmlspecialchars(strip_tags($data->username)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':email_admin', htmlspecialchars(strip_tags($data->email_admin)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':password', hash('sha256',strip_tags($data->password)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':no_hpadmin', htmlspecialchars(strip_tags($data->no_hpadmin)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':alamat_admin', htmlspecialchars(strip_tags($data->alamat_admin)),PDO::PARAM_STR);
		
		if($insert_stmt->execute()){
			$id_admin = $conn->lastInsertId();
			$apiResponse['success'] = true;
			$apiResponse['message'] = 'Data Inserted Successfully';
			$apiResponse['content'] = $id_admin;	
		}else{		
			$apiResponse['success'] = false;
			$apiResponse['message'] = 'Data not Inserted';
		}    
    }  
    

	
}
else{
	// CHECK DATA VALUE IS EMPTY OR NOT
	$apiResponse['success'] = false;
    $apiResponse['message'] = 'Please fill all the fields !!!';
}
//ECHO DATA IN JSON FORMAT
echo  json_encode($apiResponse);
?>