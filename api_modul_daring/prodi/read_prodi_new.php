<?php
    include '../connection.php';

    $id_jurusan = $_GET['id_jurusan'];

    $sql = "SELECT * FROM tbl_prodi CROSS JOIN tbl_jurusan
            ON
            tbl_prodi.id_jurusan=tbl_jurusan.id_jurusan
            WHERE
            tbl_prodi.id_jurusan='$id_jurusan'
            ";
    $result = $connect->query($sql);

    if ($result->num_rows > 0) {
        $prodi = array();
        while ($row = $result->fetch_assoc()) {
            $prodi[] = $row;            
        }
        echo json_encode(array(
            "success"=> true,
            "prodi"=>$prodi,
        ));
    }else {
        echo json_encode(array(
            "success"=> false,
        ));
    }
?>