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
if(isset ($data->username) && isset($data->email_laboran) && isset($data->password)&& isset($data->nik_laboran) && isset($data->alamat_laboran) && isset($data->no_hplaboran)){

	$get_post = "SELECT * FROM `tbl_laboran` WHERE username=:username OR nik_laboran=:nik_laboran";
    $get_stmt = $conn->prepare($get_post);
	$get_stmt->bindValue(':username', htmlspecialchars(strip_tags($data->username)),PDO::PARAM_STR);
	$get_stmt->bindValue(':nik_laboran',htmlspecialchars(strip_tags($data->nik_laboran)),PDO::PARAM_STR);
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
		$insert_query = "INSERT INTO `tbl_laboran`(username,email_laboran,nik_laboran,password,no_hplaboran,alamat_laboran) VALUES(:username,:email_laboran, :nik_laboran,:password,:no_hplaboran,:alamat_laboran)";
		$insert_stmt = $conn->prepare($insert_query);
		// DATA BINDING
		$insert_stmt->bindValue(':username', htmlspecialchars(strip_tags($data->username)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':email_laboran', htmlspecialchars(strip_tags($data->email_laboran)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':nik_laboran', htmlspecialchars(strip_tags($data->nik_laboran)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':password', hash('sha256',strip_tags($data->password)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':no_hplaboran', htmlspecialchars(strip_tags($data->no_hplaboran)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':alamat_laboran', htmlspecialchars(strip_tags($data->alamat_laboran)),PDO::PARAM_STR);
		
		if($insert_stmt->execute()){
			$id_laboran = $conn->lastInsertId();
			$apiResponse['success'] = true;
			$apiResponse['message'] = 'Data Inserted Successfully';
			$apiResponse['content'] = $id_laboran;	
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