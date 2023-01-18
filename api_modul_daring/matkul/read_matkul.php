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
$id_prodi = $_GET['id_prodi'];

if(isset($data->id_prodi) ){
//IF HAS ID PARAMETER
    $orderid = filter_var($data->id_prodi, FILTER_VALIDATE_INT,[
        'options' => [
            'default' => 'all_posts',
            'min_range' => 1
        ]
    ]);
}
else {
    $orderid = 'all_posts';
}
// MAKE SQL QUERY
// IF GET POSTS ID, THEN SHOW POSTS BY ID OTHERWISE SHOW ALL POSTS
$sql = "SELECT * FROM tbl_matakuliah CROSS JOIN tbl_prodi
            ON
            tbl_matakuliah.id_prodi=tbl_prodi.id_prodi
            WHERE
            tbl_matakuliah.id_prodi='$id_prodi'
            ";; 
$stmt = $conn->prepare($sql);
$stmt->execute();

//CHECK WHETHER THERE IS ANY POST IN OUR DATABASE
if($stmt->rowCount() > 0){
    // CREATE POSTS ARRAY
    $posts_array = [];
    
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $post_data = [
            'id_matkul' => $row['id_matkul'],
            'kode_matkul' => $row['kode_matkul'],
            'nama_matkul' => $row['nama_matkul'],
            'id_prodi' => $row['id_prodi'],
        ];
        // PUSH POST DATA IN OUR $posts_array ARRAY
        if(isset($data->orderid)){
            $apiResponse['content']=$post_data;
        }
        else {
            array_push($posts_array, $post_data);
        }
    }
    //SHOW POST/POSTS IN JSON FORMAT
    if(!isset($data->orderid)){
        $apiResponse['content']=$posts_array;
    }
    echo json_encode($apiResponse);
}
else{
    $apiResponse['success'] = false;
    $apiResponse['code'] = 200;
    $apiResponse['messages'] = "No Data Found";
    //IF THER IS NO POST IN OUR DATABASE
    echo json_encode($apiResponse);
}
?>