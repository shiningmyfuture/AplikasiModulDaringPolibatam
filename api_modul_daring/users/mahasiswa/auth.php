<?php
// SET HEADER
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");

// INCLUDING DATABASE AND MAKING OBJECT
require '../database.php';
$db_connection = new Database();
$conn = $db_connection->dbConnection();

$apiResponse['success'] = true;
$apiResponse['code'] = 200;
$apiResponse['message'] = "";
$apiResponse['content'] = null;
	
$data = json_decode(file_get_contents("php://input"));

if(isset ($data->username) && isset($data->password) && $data->username!="" && $data->password!="")
{
//IF HAS ID PARAMETER
    $username=$data->username;
    // $password=$data->password;
    $password=hash('sha256',($data->password));
    //$passhash=hash('sha256',$password);
}
else {
	$apiResponse['success'] = false;
	$apiResponse['code'] = 200;
	$apiResponse['message'] = "Username dan Password harus di isi";
	$apiResponse['content'] = null;
	echo json_encode($apiResponse);
	return;
}

// MAKE SQL QUERY
// IF GET POSTS ID, THEN SHOW POSTS BY ID OTHERWISE SHOW ALL POSTS
// $sql = "SELECT * FROM `users` WHERE (username='$username' OR email='$username') AND password= hash('sha256','$password')";
$sql = "SELECT * FROM `tbl_mahasiswa` WHERE username='$username'  AND password= '$password'";
$stmt = $conn->prepare($sql);
$stmt->execute();

//CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
if($stmt->rowCount() > 0){
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $post_data = [
            'id_mhs' => $row['id_mhs'],
            'username' => $row['username'],
            'password' => $row['password']
        ];
        // PUSH POST DATA IN OUR $posts_array ARRAY
		
		$apiResponse['success'] = true;
		$apiResponse['code'] = 200;
		$apiResponse['message'] = "Login berhasil !!!";
		$apiResponse['content']=$post_data;
		
    }
	echo json_encode($apiResponse);
}
else{
	$apiResponse['success'] = false;
	$apiResponse['code'] = 200;
	$apiResponse['message'] = "Email atau Password anda salah";
    //IF THER IS NO POST IN OUR DATABASE
    echo json_encode($apiResponse);
}
?>