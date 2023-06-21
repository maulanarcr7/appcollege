<?php

$connection = mysqli_connect("localhost", "root", "", "db_college");
$query = mysqli_query($connection, "SELECT * FROM data_mhs");
$data = mysqli_fetch_all($query, MYSQLI_ASSOC);

echo json_encode($data);
