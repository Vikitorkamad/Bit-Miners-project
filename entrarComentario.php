<?php

header('Content-Type: application/json; charset=UTF-8');

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Methods: POST');

require_once __DIR__ . '/src/conf/pdo.php';

function gerarCodigo($email) {
    // Gera um hash a partir do email
    $hash = md5($email);
    
    // Converte o hash em um código com formato XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
    $codigo = substr($hash, 0, 5) . '-' . substr($hash, 5, 5) . '-' . substr($hash, 10, 5) . '-' . substr($hash, 15, 5) . '-' . substr($hash, 20, 5);
    
    return $codigo;
}

try {
    // 1) Recebe e decodifica o JSON
    $raw = file_get_contents('php://input');
    $data = json_decode($raw, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Payload JSON inválido');
    }

    // 2) Validação dos dados
    $email = $data['email'] ?? null;
    $username = $data['username'] ?? null;
    $comment = $data['comment'] ?? null;
    if ($email === null || $username === null || $comment === null) {
        throw new Exception('Campos E-mail, Nome de usuario e Comentario são obrigatórios');
    }
    $codigo = gerarCodigo($email);
    $date = date('Y-m-d');

    // 3) Executa os INSERTs
    $sql = "INSERT INTO codigos (codigo, usado) VALUES (:codigo, 0)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':codigo' => $codigo
    ]);

    $sql = "SELECT id_codigo FROM codigos WHERE codigo = :codigo";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':codigo' => $codigo
    ]);
    $codigoId = $stmt->fetchColumn();

    $sql = "INSERT INTO usuarios (nome, email, id_codigo) VALUES (:nome, :email, :codigoId)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':nome' => $username,
        ':email' => $email,
        ':codigoId' => $codigoId
    ]);

    $sql = "SELECT id_usuario FROM usuarios WHERE email = :email";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':email' => $email
    ]);
    $usuarioId = $stmt->fetchColumn();

    $sql = "INSERT INTO comentarios (id_usuario, texto, data_comentario) VALUES (:usuarioId, :texto, :data)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':usuarioId' => $usuarioId,
        ':texto' => $comment,
        ':data' => $date
    ]);

    // 4) Responde com sucesso
    echo json_encode([
        'success'  => true,
        'insertId' => $conn->lastInsertId()
    ]);

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
