<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

header('Content-Type: application/json');


require_once __DIR__ . '/src/conf/pdo.php';

try {
    $sql = "
        SELECT u.nome AS username, c.texto AS comment, c.curtidas
        FROM comentarios c
        JOIN usuarios u ON c.id_usuario = u.id_usuario
        ORDER BY c.curtidas DESC
        LIMIT 5;
    ";
    $stmt = $conn->query($sql);
    $comentarios = $stmt->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($comentarios);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['erro' => 'Erro ao buscar comentários: ' . $e->getMessage()]);
}