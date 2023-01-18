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
if(isset ($data->username) && isset($data->id_jurusan) && isset($data->id_prodi) && isset($data->id_matkul)){

	// $get_post = "SELECT * FROM `mhs`";
	$get_post = "SELECT * FROM `tbl_mahasiswa`";
    $get_stmt = $conn->prepare($get_post);
	$get_stmt->bindValue(':username', htmlspecialchars(strip_tags($data->username)),PDO::PARAM_STR);
    $get_stmt->execute();
	
    
    //CEK username atau username yang telah ada
    if($get_stmt->rowCount() > 0){
        
        // Data Sudah ada dan tidak bisa di insert ke database
        // $apiResponse['success'] = false;
		// $apiResponse['code'] = 200;
		// $apiResponse['message'] = "Data Already exist";
 
		//Data insert ke database
		$insert_query = "INSERT INTO `matkul_mhs` (username ,id_jurusan, id_prodi, id_matkul) 
		VALUES (:username, :id_jurusan, :id_prodi, :id_matkul)";
		$insert_stmt = $conn->prepare($insert_query);
		// DATA BINDING
		$insert_stmt->bindValue(':username', htmlspecialchars(strip_tags($data->username)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':id_jurusan', htmlspecialchars(strip_tags($data->id_jurusan)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':id_prodi', htmlspecialchars(strip_tags($data->id_prodi)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':id_matkul', htmlspecialchars(strip_tags($data->id_matkul)),PDO::PARAM_STR);
		
		if($insert_stmt->execute()){
			$id_matkul_mhs = $conn->lastInsertId();
			$apiResponse['success'] = true;
			$apiResponse['message'] = 'Data Inserted Successfully';
			$apiResponse['content'] = $id_matkul_mhs;	
		}else{		
			$apiResponse['success'] = false;
			$apiResponse['message'] = 'Data not Inserted';
		}    
    }
    else{
		$apiResponse['success'] = false;
    	$apiResponse['message'] = 'Username not Register!!!';
    }  
    

	
}
else{
	// CHECK DATA VALUE IS EMPTY OR NOT
	$apiResponse['success'] = false;
    $apiResponse['message'] = 'Please fill all the fields !!!';
}
//ECHO DATA IN JSON FORMAT
echo  json_encode($apiResponse);
