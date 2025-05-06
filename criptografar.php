<?php
function encryptApiKey($apiKey, $base64Key) {
    $key = base64_decode($base64Key);

    // Gera IV aleatório (16 bytes)
    $iv = openssl_random_pseudo_bytes(16);

    // Criptografa com AES-256-CBC
    $encrypted = openssl_encrypt($apiKey, 'AES-256-CBC', $key, OPENSSL_RAW_DATA, $iv);

    // Junta IV + dado criptografado e codifica em base64
    return base64_encode($iv . $encrypted);
}

// 👇 SUA CHAVE DA API EM TEXTO PURO AQUI
$apiKey = 're_B9YZQgtd_GUvNTtA6eeywzKjY9hVXyjuL';

// 👇 SUA CHAVE MESTRA BASE64 AQUI (deve ter 32 bytes quando decodificada)
$appKey = 'LhTZz8DoMfLYPiFo98M0E1WCF8sV8SBiz88nkU0YfEg=';// exemplo

$encrypted = encryptApiKey($apiKey, $appKey);

echo "API KEY criptografada:\n";
echo $encrypted . "\n";
