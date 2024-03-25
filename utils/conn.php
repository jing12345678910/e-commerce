<?php
// 資料庫設定
$db_host = "localhost";
$db_username = "root";
$db_password = "1234";
$db_name = "e_commerce";

// 連線資料庫
$db_link = new mysqli($db_host, $db_username, $db_password, $db_name);

// 是否連線成功
if ($db_link -> connect_error != '') {
  die('資料庫連線錯誤');
} else {
  $db_link -> query("SET NAMES'utf8'");
}
?>