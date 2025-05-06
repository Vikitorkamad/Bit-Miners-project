<?php
function decryptEnvKey($encrypted, $base64Key) {
    $key = base64_decode($base64Key);

    // AES-256-CBC requer IV de 16 bytes — combine os dois no início do valor criptografado
    $data = base64_decode($encrypted);
    $iv = substr($data, 0, 16);
    $cipherText = substr($data, 16);

    return openssl_decrypt($cipherText, 'AES-256-CBC', $key, OPENSSL_RAW_DATA, $iv);
}

require_once __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->load();

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
            <p>Olá, estamos felizes em tê-lo conosco.</p>
            <p>Segue abaixo seu código para o resgate da sua capa:</p>
            <div class="code">0A0A-0A0A</div>
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
    "to" => "0001062748@senaimgaluno.com.br",
    "subject" => "Bem-vindo ao BitMiners!",
    "html" => $htmlContent
];

$headers = [
    "Authorization: Bearer $apiKey",
    "Content-Type: application/json"
];

$ch = curl_init($url);

curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($payload));
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$response = curl_exec($ch);

if (curl_errno($ch)) {
    echo 'Erro: ' . curl_error($ch);
} else {
    $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    echo "Status Code: $httpCode\n";
    echo "Resposta: $response\n";
}

curl_close($ch);
?>


