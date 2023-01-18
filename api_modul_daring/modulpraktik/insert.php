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
if( isset($data->id_course) && isset($data->module_type)&& isset($data->course_title)&& isset($data->course_desc) && isset($data->course_link) && isset($data->icon_link)){

	
		//Data insert ke database
		$insert_query = "INSERT INTO `tbl_modulpraktik`(id_matkul, jenis_modul, judul_modul, deskripsi_modul, modul_link, icon) 
		VALUES(:id_matkul, :jenis_modul, :judul_modul, :deskripsi_modul, :modul_link, :icon_link)";
		$insert_stmt = $conn->prepare($insert_query);
		// DATA BINDING
		$insert_stmt->bindValue(':id_matkul', htmlspecialchars(strip_tags($data->id_course)),PDO::PARAM_INT);
		$insert_stmt->bindValue(':jenis_modul', htmlspecialchars(strip_tags($data->module_type)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':judul_modul', htmlspecialchars(strip_tags($data->course_title)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':deskripsi_modul', htmlspecialchars(strip_tags($data->course_desc)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':modul_link', htmlspecialchars(strip_tags($data->course_link)),PDO::PARAM_STR);
		$insert_stmt->bindValue(':icon_link', htmlspecialchars(strip_tags($data->icon_link)),PDO::PARAM_STR);

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
else{
	// CHECK DATA VALUE IS EMPTY OR NOT
	$apiResponse['success'] = false;
    $apiResponse['message'] = 'Please fill all the fields !!!';
}
//ECHO DATA IN JSON FORMAT
echo  json_encode($apiResponse);
?>