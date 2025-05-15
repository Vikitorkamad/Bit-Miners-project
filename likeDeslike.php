<?php

header('Content-Type: application/json; charset=UTF-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Methods: POST');

require_once __DIR__ . '/src/conf/pdo.php';

try {
    $raw = file_get_contents('php://input');
    $data = json_decode($raw, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Payload JSON inválido');
    }

    $username = $data['username'] ?? null;
    $valor = $data['valor'] ?? null;

    if (!isset($username, $valor)) {
        throw new Exception('Parâmetros incompletos');
    }


    if($valor==1){
        $sql = "UPDATE comentarios c
            JOIN usuarios u ON c.id_usuario = u.id_usuario
            SET c.curtidas = IFNULL(c.curtidas, 0) + 1
            WHERE u.nome = :username;";
        $stmt = $conn->prepare($sql);
        $stmt->execute([':username' => $username]);
    }
    else if($valor==0){
        $sql = "UPDATE comentarios c
            JOIN usuarios u ON c.id_usuario = u.id_usuario
            SET c.curtidas = IFNULL(c.curtidas, 0) - 1
            WHERE u.nome = :username;";
        $stmt = $conn->prepare($sql);
        $stmt->execute([':username' => $username]);
    }


} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'error'   => 'Erro no banco de dados: ' . $e->getMessage()
    ]);
} catch (Exception $e) {
    http_response_code(400);
    echo json_encode([
        'success' => false,
        'error'   => $e->getMessage()
    ]);
}