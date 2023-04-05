<?php
header('Content-Type: application/json');
include "../flutter_api/db.php";
$stmt = $db->prepare("SELECT id, name, email FROM users");
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($result);
?>