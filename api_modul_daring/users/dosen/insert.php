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
if(isset ($data->username) && isset($data->email_dosen) && isset($data->password)&& isset($data->nik_dosen) && isset($data->alamat_dosen) && isset($data->no_hpdosen)){

	$get_post = "SELECT * FROM `tbl_dosen` WHERE username=:username OR nik_dosen=:nik_dosen";
    $get_stmt = $conn->prepare($get_post);
	$get_stmt->bindValue(':username', htmlspecialchars(strip_tags($data->username)),PDO::PARAM_STR);
	$get_stmt->bindValue(':nik_dosen',htmlspecialchars(strip_tags($data->nik_dosen)),PDO::PARAM_STR);
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
		$insert_query = "INSERT INTO `tbl_dosen`(username,email_dosen,nik_dosen,password,no_hpdosen,alamat_dosen) VALUES(:username,:email_dosen, :nik_dosen,:password,:no_hpdosen,:alamat_dosen)";
		$insert_stmt = $conn->prepare($insert_query);
		// DATA BINDING
		$insert_stmt->bindValue(':username', htmlspecialchars(strip_tags($data->username)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':email_dosen', htmlspecialchars(strip_tags($data->email_dosen)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':nik_dosen', htmlspecialchars(strip_tags($data->nik_dosen)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':password', hash('sha256',strip_tags($data->password)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':no_hpdosen', htmlspecialchars(strip_tags($data->no_hpdosen)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':alamat_dosen', htmlspecialchars(strip_tags($data->alamat_dosen)),PDO::PARAM_STR);
		
		if($insert_stmt->execute()){
			$id_dosen = $conn->lastInsertId();
			$apiResponse['success'] = true;
			$apiResponse['message'] = 'Data Inserted Successfully';
			$apiResponse['content'] = $id_dosen;	
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