<?php

header('Content-Type: application/json; charset=UTF-8');

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: Content-Type');
header('Access-Control-Allow-Methods: POST');

require_once __DIR__ . '/src/conf/pdo.php';

try {
    // 1) Recebe e decodifica o JSON
    $raw = file_get_contents('php://input');
    $data = json_decode($raw, true);

    if (json_last_error() !== JSON_ERROR_NONE) {
        throw new Exception('Payload JSON inválido');
    }

    // 2) Validação dos dados
    $email = $data['email'] ?? null;
    if ($email === null) {
        throw new Exception('Campos E-mail é obrigatórios');
    }

    // 3)Consulta usuario e codigo
    $sql = "SELECT u.nome, c.codigo FROM usuarios u JOIN codigos c ON u.id_codigo = c.id_codigo WHERE u.email = :email";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':email', $email);
    $stmt->execute();

    $resultado = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($resultado) {
        $nome = $resultado['nome'];
        $codigo = $resultado['codigo'];
    } else {
        http_response_code(404);
        echo json_encode(['erro' => 'Usuário não encontrado']);
        exit;
    }
    // 4) Envia o email
    function decryptEnvKey($encrypted, $base64Key) {
        $key = base64_decode($base64Key);
    
        // AES-256-CBC requer IV de 16 bytes — combine os dois no início do valor criptografado
        $data = base64_decode($encrypted);
        $iv = substr($data, 0, 16);
        $cipherText = substr($data, 16);
    
        return openssl_decrypt($cipherText, 'AES-256-CBC', $key, OPENSSL_RAW_DATA, $iv);
    }
    
    require_once __DIR__ . '/vendor/autoload.php';
    
    $apiKey = decryptEnvKey($_SERVER['ENCRYPTED_API_KEY'], $_SERVER['APP_KEY']);
    
    $url = "https://api.resend.com/emails";

    $htmlContent = '
    <!DOCTYPE html>
    <html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                margin: 0;
                padding: 0;
            }
            .container {
                width: 100%;
                max-width: 600px;
                margin: auto;
                background-color: #ffffff;
                border-radius: 5px;
                overflow: hidden;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }
            .header {
                background-color: #4CAF50;
                color: white;
                padding: 20px;
                text-align: center;
            }
            .content {
                padding: 20px;
            }
            .code {
                font-size: 24px;
                font-weight: bold;
                color: #dc3545;
                text-align: center;
                margin: 20px 0;
            }
            .btn {
                display: block;
                width: 100%;
                padding: 12px;
                text-align: center;
                background-color: #dc3545;
                color: #ffffff;
                text-decoration: none;
                border-radius: 5px;
                font-weight: bold;
                margin: 20px 0;
            }
            .btn:hover {
                background-color: #c82333;
            }
            .footer {
                background-color: #f4f4f4;
                text-align: center;
                padding: 15px;
                font-size: 12px;
                color: #777777;
            }
            .image {
                text-align: center;
                margin: 20px 0;
            }
            .image img {
                max-width: 150px;
                height: auto;
            }
            @media (max-width: 600px) {
                .btn {
                    font-size: 16px;
                }
                .code {
                    font-size: 20px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header">
                <h1>Bem-vindo!</h1>
            </div>
            <div class="content">
                <p>Olá ' . $nome .'! Estamos felizes em tê-lo conosco.</p>
                <p>Segue abaixo seu código para o resgate da sua capa:</p>
                <div class="code">'. $codigo .'</div>
                <p>Use o código em nosso site para receber à sua capa exclusiva:</p>
                <div class="image">
                    <img src="https://preview.redd.it/new-unreleased-eyeblossom-cape-v0-i1tob9hgrp3e1.png?width=276&format=png&auto=webp&s=d43ce1f0e708f60e2279e94cb64f22d1233080ba" alt="Imagem da Capa">
                </div>
                <a href="https://www.seusite.com" class="btn">Visite Nosso Site</a>
                <p>Atenciosamente,<br>Equipe BitMiners</p>
            </div>
            <div class="footer">
                Este é um e-mail automático. Não responda a este endereço.
            </div>
        </div>
    </body>
    </html>';

    $payload = [
        "from" => "noreply@bitminers.shop",
        "to" => $email,
        "subject" => "Bem-vindo ao BitMiners!",
        "html" => $htmlContent
    ];
    error_log('Enviar payload: ' . json_encode($payload));

    $headers = [
        "Authorization: Bearer $apiKey",
        "Content-Type: application/json"
    ];
    
    // Inicializa o cURL
    $ch = curl_init($url);

    // Configurações do cURL
    curl_setopt_array($ch, [
        CURLOPT_POST           => true,
        CURLOPT_POSTFIELDS     => json_encode($payload),
        CURLOPT_HTTPHEADER     => $headers,
        CURLOPT_RETURNTRANSFER => true,
        // CURLOPT_TIMEOUT     => 10,      // opcional: limite de tempo
        // CURLOPT_VERBOSE     => true,    // mantenha apenas para debug
    ]);

    // Executa a requisição
    $response = curl_exec($ch);
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $curlErr  = curl_errno($ch);
    $curlMsg  = curl_error($ch);

    // Fecha o handle
    curl_close($ch);

    // Tratamento de erros de cURL
    if ($curlErr) {
        error_log("cURL error ({$curlErr}): {$curlMsg}");
        http_response_code(500);
        echo json_encode([
            'success' => false,
            'error'   => "Erro de conexão: {$curlMsg}"
        ]);
        exit;
    }

    // Tratamento de resposta HTTP
    if ($httpCode >= 200 && $httpCode < 300) {
        // Sucesso (200 OK ou 202 Accepted)
        echo json_encode([
            'success'  => true,
            'mensagem' => "E-mail enviado com sucesso para {$email}"
        ]);
    } else {
        // Falha na API externa
        error_log("Resend API HTTP {$httpCode}: {$response}");
        http_response_code($httpCode);
        echo json_encode([
            'success'  => false,
            'error'    => "Falha ao enviar e-mail. HTTP {$httpCode}",
            'resposta' => json_decode($response, true)
        ]);
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