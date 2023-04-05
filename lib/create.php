<?php
header('Content-Type: application/json');
include "http://172.16.109.59/flutter_api/db.php";
$name = $_POST['name'];
$email = (int) $_POST['email'];
$stmt = $db->prepare("INSERT INTO users (name, email) VALUES (?,
?)");
$result = $stmt->execute([$name, $email]);
echo json_encode([
'success' => $result
]);
?>
