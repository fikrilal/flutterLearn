<?php
header('Content-Type: application/json');
include "../flutter_api/db.php";
$id = $_POST['id'];
$name = $_POST['name'];
$email = $_POST['email'];
$stmt = $db->prepare("UPDATE users SET name = ?, email = ? WHERE
id = ?");
$result = $stmt->execute([$name, $email, $id]);
echo json_encode([
'success' => $result
]);
?>
