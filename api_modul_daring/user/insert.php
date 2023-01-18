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
if(isset ($data->username) && isset($data->email_mhs) && isset($data->password)&& isset($data->nim_mhs)&& isset($data->alamat_mhs) && isset($data->no_hpmhs)){

	$get_post = "SELECT * FROM `tbl_mahasiswa` WHERE username=:username OR nim_mhs=:nim_mhs";
    $get_stmt = $conn->prepare($get_post);
	$get_stmt->bindValue(':username', htmlspecialchars(strip_tags($data->username)),PDO::PARAM_STR);
	$get_stmt->bindValue(':nim_mhs', htmlspecialchars(strip_tags($data->nim_mhs)),PDO::PARAM_STR);
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
		$insert_query = "INSERT INTO `tbl_mahasiswa`(username,email_mhs,password,nim_mhs,no_hpmhs,alamat_mhs) VALUES(:username,:email_mhs,:password,:nim_mhs,:no_hpmhs,:alamat_mhs)";
		$insert_stmt = $conn->prepare($insert_query);
		// DATA BINDING
		$insert_stmt->bindValue(':username', htmlspecialchars(strip_tags($data->username)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':email_mhs', htmlspecialchars(strip_tags($data->email_mhs)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':password', sha1(strip_tags($data->password)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':nim_mhs', htmlspecialchars(strip_tags($data->nim_mhs)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':no_hpmhs', htmlspecialchars(strip_tags($data->no_hpmhs)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':alamat_mhs', htmlspecialchars(strip_tags($data->alamat_mhs)),PDO::PARAM_STR);

		if($insert_stmt->execute()){
			$id_mhs = $conn->lastInsertId();
			$apiResponse['success'] = true;
			$apiResponse['message'] = 'Data Inserted Successfully';
			$apiResponse['content'] = $id_mhs;	
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