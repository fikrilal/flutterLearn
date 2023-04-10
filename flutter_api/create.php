<?php
header('Content-Type: application/json');
include "../flutter_api/db.php";
$name = $_POST['name'];
$email = $_POST['email'];
$stmt = $db->prepare("INSERT INTO `users` (`id`, `name`, `email`) VALUES (NULL, ?, ?)");
$result = $stmt->execute([$name, $email]);
echo json_encode(['success' => $result]);
?>