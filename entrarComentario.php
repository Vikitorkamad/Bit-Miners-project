<?php

header('Content-Type: application/json; charset=UTF-8');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Methods: POST');

require_once __DIR__ . '/src/conf/pdo.php';

function gerarCodigo($email) {
    $hash = md5($email);
    return substr($hash, 0, 5) . '-' . substr($hash, 5, 5) . '-' . substr($hash, 10, 5) . '-' . substr($hash, 15, 5) . '-' . substr($hash, 20, 5);
}

try {
    $raw = file_get_contents('php://input');
    $data = json_decode($raw, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Payload JSON inválido');
    }

    $email = $data['email'] ?? null;
    $username = $data['username'] ?? null;
    $comment = $data['comment'] ?? null;

    if (!$email || !$username || !$comment) {
        throw new Exception('Campos E-mail, Nome de usuário e Comentário são obrigatórios');
    }

    // Verifica se o email ou username já existem
    $sql = "SELECT DISTINCT u.id_usuario FROM usuarios u LEFT JOIN comentarios c ON u.id_usuario = c.id_usuario
            WHERE u.email = :email OR u.nome = :username OR c.texto = :comentario;";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':email' => $email,
        ':username' => $username,
        ':comentario' => $comment
    ]);
    $jaExiste = $stmt->rowCount() > 0;

    if ($jaExiste) {
        http_response_code(400);
        echo json_encode([
            'success' => false,
            'error'   => 'E-mail, nome de usuário ou comentario já cadastrado.'
        ]);
        exit;
    }

    // Gera o código e data
    $codigo = gerarCodigo($email);
    $date = date('Y-m-d');

    // Insere o código
    $sql = "INSERT INTO codigos (codigo, usado) VALUES (:codigo, 0)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([':codigo' => $codigo]);

    $codigoId = $conn->lastInsertId();

    // Insere o usuário
    $sql = "INSERT INTO usuarios (nome, email, id_codigo) VALUES (:nome, :email, :codigoId)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':nome' => $username,
        ':email' => $email,
        ':codigoId' => $codigoId
    ]);

    $usuarioId = $conn->lastInsertId();

    // Insere o comentário
    $sql = "INSERT INTO comentarios (id_usuario, texto, data_comentario) VALUES (:usuarioId, :texto, :data)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([
        ':usuarioId' => $usuarioId,
        ':texto' => $comment,
        ':data' => $date
    ]);

    echo json_encode([
        'success'  => true,
        'insertId' => $conn->lastInsertId()
    ]);

    $emailPayload = json_encode(['email' => $email]);
    
    $ch = curl_init('http://localhost/bitMiners/enviarEmail.php'); // ou o caminho correto no seu servidor
    curl_setopt_array($ch, [
        CURLOPT_POST           => true,
        CURLOPT_POSTFIELDS     => $emailPayload,
        CURLOPT_HTTPHEADER     => [
            'Content-Type: application/json',
            'Content-Length: ' . strlen($emailPayload)
        ],
        CURLOPT_RETURNTRANSFER => true
    ]);
    
    $response = curl_exec($ch);
    $curlErr  = curl_errno($ch);
    $curlMsg  = curl_error($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    
    curl_close($ch);
    
    // Opcional: loga ou trata falhas no envio
    if ($curlErr || $httpCode >= 400) {
        error_log("Erro ao enviar e-mail: ($httpCode) $curlMsg - $response");
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