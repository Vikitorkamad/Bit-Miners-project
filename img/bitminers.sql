-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14/05/2025 às 14:58
-- Versão do servidor: 8.4.0
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bitminers`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `codigos`
--

CREATE TABLE `codigos` (
  `id_codigo` int NOT NULL,
  `codigo` varchar(29) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usado` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `codigos`
--

INSERT INTO `codigos` (`id_codigo`, `codigo`, `usado`) VALUES
(1, 'AB12-CD34', 1),
(2, '549A-3Q2I', 1),
(3, 'L3R0-L3R0', 0),
(4, 'M1NG-U4L9', 0),
(5, 'H4H4-H3H3', 1),
(6, 'KJF5-92J1', 0),
(16, '2a2ee-7990b-efe50-c4625-38636', 0),
(17, '5f177-272b6-7a69c-573dc-1de61', 0),
(19, 'c74cc-4de46-a79e2-1005b-e3443', 0),
(23, '920ee-08b8d-82d5d-4bc4b-4ed77', 0),
(25, 'fb80d-cb599-6b048-47b39-b8b14', 0),
(26, 'eecea-baae0-07439-eb879-33f08', 0),
(27, '58df8-83f06-0e1e5-1f57d-e6828', 0),
(28, '09bf1-261d4-88e40-660be-9f7f3', 0),
(29, '977f4-a2f91-a8e78-2b397-c59b6', 0),
(30, 'b152a-f65b3-1cb33-0f46d-145e3', 0),
(31, 'e5547-05ca6-8e9f1-4e34e-3ccfd', 0),
(32, 'f3e4d-e3bae-dc3ac-dbaa0-aa3ff', 0),
(33, '29162-56860-6a942-7e95a-7d32c', 0),
(34, '541cd-dc97f-05485-dde5b-c4d84', 0),
(37, 'de973-f0cd4-853fe-7c6c3-af86d', 0),
(38, '9930d-53698-6e55c-9897b-bcd96', 0),
(39, '63fe6-3c028-bff11-e4b59-0c144', 0),
(40, 'd2919-17c25-10293-95ed9-0a414', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int NOT NULL,
  `id_usuario` int NOT NULL,
  `texto` text NOT NULL,
  `data_comentario` date NOT NULL,
  `curtidas` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `id_usuario`, `texto`, `data_comentario`, `curtidas`) VALUES
(1, 1, 'O filme é incrivel, serio mesmo que obra de arte, nunca joguei minecraft mas definitivamente agora eu tenho que pegar pra jogar com uns amigos.', '2025-04-03', 4),
(2, 2, 'Filme incrível, ótimos personagens(muito bem desenvolvidos) e uma historia tocante, \nquando o Steve fala \"receba\" então kkkkk, ótimo filme ', '2025-04-21', 6),
(3, 3, 'O JackBlack ficou perfeito nesse papel, Steve é muito saliente com essa barriguinha.', '2025-04-18', 2),
(4, 4, 'Só faltou o portal do Aether nesse filme.', '2025-04-19', 17),
(5, 5, 'que dfilme bom se ta loko meno. Me fez querer minerar e craftar o dia todo.', '2025-04-14', 5),
(6, 6, 'É UMA MERDA, CADE O HEROBRINE?????????? ASSISTI SÓ POR ELE E NADA', '2025-05-17', 1),
(7, 8, 'eu amei', '2025-05-08', 3),
(8, 9, 'Simplizmente o melhor fiume que jah vi na mina ezistessia', '2025-05-08', 8),
(9, 12, 'Esse filme é como minha primeira vez na casa de apostas... Achei que não ganharia nada e no fim o filme ganhou meu coração <3', '2025-05-08', 2),
(10, 13, 'a a folou a folou iu fink', '2025-05-08', 3),
(11, 16, 'Filme fraco ', '2025-05-08', 1),
(12, 17, 'Martelo 🔨🔨🔨', '2025-05-08', 13),
(13, 18, 'filme muito bom 10/10 sem defeitos', '2025-05-12', 4),
(14, 19, 'Eu sou HerickGaymer', '2025-05-12', 5),
(15, 20, 'Que filme top dms, chorei', '2025-05-12', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `nome` varchar(63) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_codigo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `id_codigo`) VALUES
(1, 'PedrinhoDoGrau57', '0000960461@senaimgaluno.com.br', 1),
(2, 'EpicMiner777', 'cletin906@gmail.com', 2),
(3, 'GolQuadrado', '0001069012@senaimgaluno.com.br', 3),
(4, 'VikitorPvP', '0001068985@senaimgaluno.com.br', 4),
(5, 'MacacodaBanana', '0001060491@senaimgaluno.com.br', 5),
(6, 'SuusZedao', '0001060941@senaimgaluno.com.br', 6),
(8, 'acleide', 'acleide@gmail.com', 16),
(9, 'Roberto', 'roberto@gmail.com', 17),
(12, 'Krovis', 'batista@gmail.com', 26),
(13, 'Clovis', 'clovis@gmail.com', 27),
(16, 'naosei', 'naosei@gmail.com', 30),
(17, 'Jota', 'jota@gmail.com', 31),
(18, 'Trabson', 'seloko@gmail.com', 32),
(19, 'LeroLeroLero', 'HerickGaymer@gmail.com', 33),
(20, 'Isper11', 'ispe679@gmail.com', 34),
(23, 'Clóvis Mato', 'matoclovis@gmail.com', 37),
(24, 'Singas', 'gabinetemb7@gmail.com', 38),
(25, '24453', 'asasasa@gmail.com', 39),
(26, 'fdhgsdfdsg', 'aadasfad@gmail.com', 40);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `codigos`
--
ALTER TABLE `codigos`
  ADD PRIMARY KEY (`id_codigo`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Índices de tabela `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `id_codigo` (`id_codigo`),
  ADD UNIQUE KEY `id_codigo_2` (`id_codigo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `codigos`
--
ALTER TABLE `codigos`
  MODIFY `id_codigo` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_codigo`) REFERENCES `codigos` (`id_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
