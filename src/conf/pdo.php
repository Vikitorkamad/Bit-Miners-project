<?php

    require_once __DIR__ . '/../../vendor/autoload.php'; // <-- Caminho ajustado

    $dotenv = Dotenv\Dotenv::createImmutable(__DIR__ . '/../../'); // <-- Aponta para a raiz do projeto
    $dotenv->load();

//arquivo de configuração do pdo para conexão com o banco 

    $host = $_SERVER['DB_HOST'];
    $user = $_SERVER['DB_USER'];
    $pass = $_SERVER['DB_PASS'];
    $name = $_SERVER['DB_NAME'];
    //$porta = 3306;

    try{
        $conn = new PDO("mysql:host=$host;dbname=$name", $user, $pass);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch(PDOException $e){
        die("Erro ao conectar ao banco: " . $e->getMessage());
    }


