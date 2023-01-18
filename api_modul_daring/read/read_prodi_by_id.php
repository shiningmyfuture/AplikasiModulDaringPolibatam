<?php

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header("Content-Type: application/json; charset=UTF-8");


// Connect to the MySQL database
require '../conn.php';

// Check if a URL parameter was provided
if (isset($_GET['id'])) {
  $id = $_GET['id'];

  // Escape the id to prevent SQL injection attacks
  $id = $con->real_escape_string($id);

  // Retrieve the data from the tables using a JOIN clause
  //"SELECT tbl.id, tbl.nama, tbl_prodi.nama_prodi FROM tbl JOIN tbl_prodi ON tbl.id = tbl_prodi.prodi_id ORDER by tbl.id ASC";
  // $query = "SELECT t1., t2. FROM table1 AS t1 INNER JOIN table2 AS t2 ON t1.id=t2.id WHERE t1.id=$id";
  /////
  $query = "SELECT t1.id_jurusan, t1.nama_jurusan, t2.id_jurusan, t2.nama_prodi FROM tbl_jurusan AS t1 INNER JOIN tbl_prodi AS t2 
  ON t1.id_jurusan=t2.id_jurusan WHERE t1.id_jurusan=$id";
  // $query = "SELECT t1.id_jurusan, t1.nama_jurusan, t2.id_prodi, t2.nama_prodi FROM tbl_jurusan AS t1 INNER JOIN tbl_prodi AS t2 
  // ON t2.id_prodi=t1.id_jurusan WHERE t2.id_prodi=$id_prodi";
  $result = $con->query($query);
  $data = $result->fetch_assoc();

  // Convert the data to a JSON objectz
  $jsonData = json_encode($data);

  // Output the JSON object
  echo $jsonData;

} 
else {
  echo 'Add "id_jurusan", example : api.php?id=1';
}