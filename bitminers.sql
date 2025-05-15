-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/05/2025 às 14:34
-- Versão do servidor: 10.4.32-MariaDB
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
  `id_codigo` int(11) NOT NULL,
  `codigo` varchar(29) NOT NULL,
  `usado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `codigos`
--

INSERT INTO `codigos` (`id_codigo`, `codigo`, `usado`) VALUES
(18, 'ea6e4-053f6-afb35-2cafc-70a31', 0),
(19, '1377c-23f57-6173a-8e956-35ab4', 0),
(20, 'a14de-08471-7bb80-bc247-8101b', 0),
(21, '60a97-304ca-f0753-e3855-3108e', 0),
(22, 'c3dec-0bed8-bc68f-837f7-a9694', 0),
(23, '85ed1-0b459-ff501-4b163-804b9', 0),
(24, '7e9dd-20cfc-9e59f-98067-176a3', 0),
(25, 'cd4b0-45b8c-16147-e54b7-8c57d', 0),
(26, 'fa1d2-5e3ac-4b7a9-ea6b7-9a872', 0),
(27, 'bd5e7-0af23-8cc93-bf174-7c9aa', 0),
(28, 'ddc31-bf1a3-c7762-116ec-d5a0f', 0),
(29, '9b1f7-44d8a-9ea5c-2d9aa-3fcf8', 0),
(30, '5dc62-11eaa-0410d-8dc9a-128af', 0),
(31, '2ae51-d2e6a-3f74e-aec59-184ab', 0),
(32, 'bf16d-0ea78-2998f-f712a-73e5d', 0),
(33, 'cc57e-b3aa6-4d57c-c9a8b-18bc2', 0),
(34, '04db2-76f3b-2ab4e-1e597-804f6', 0),
(35, '77cd4-ea2d0-ff1bd-6722b-a1c8d', 0),
(36, '0a5d7-6e9d5-379d8-a14ec-7d15a', 0),
(37, '9f3ac-17b46-9cd42-d75ba-92d78', 0),
(38, 'eeb94-9dc5f-4812a-b2f03-63a42', 0),
(39, '3a6c0-f472b-ec984-46e93-021ca', 0),
(40, 'a524e-77ed6-c9e85-0b752-a6b4d', 0),
(41, '7d8f2-301cb-719ad-3d9c8-27a6b', 0),
(42, 'e1306-c2b87-4dd26-3a8f5-1199a', 0),
(43, 'ba52a-8d109-30541-0cf2c-473da', 0),
(44, '8e9bc-7fc45-1bd9a-6a0ec-94a10', 0),
(45, '44dc7-f05ae-ff910-3bce2-07d6b', 0),
(46, '0ff72-ae19b-cb2d7-0ae93-4d71e', 0),
(47, 'd3ac0-bcce5-7ff20-315b6-89fc1', 0),
(48, '1a12c-0037a-8790f-f1c4d-5183c', 0),
(49, '64ed5-4fc18-155c7-85bc3-998df', 0),
(50, 'e8a6b-d4f71-6b3ce-9e294-62f77', 0),
(51, '1b8e7-bd3c4-d11e5-1cae6-fb28d', 0),
(52, '7c1ad-1123e-558bf-b22f4-c69ee', 0),
(53, 'f3eab-0a37c-9725e-74b19-2b5ca', 0),
(54, '56da9-301ba-eab55-a9e9f-541c0', 0),
(55, 'e5c3a-93fbb-c7a03-c4c69-8dc16', 0),
(56, 'aee17-4b150-87f96-cd6ff-431a8', 0),
(57, '38c29-7fdae-0b0c1-ef723-a8d59', 0),
(58, 'd47e0-8a75e-3e77a-2f1cc-99bba', 0),
(59, 'c85e2-0f4cc-19bba-a0733-43b5d', 0),
(60, '11478-385ee-489bc-31a6f-7b4c8', 0),
(61, '908ce-f26b5-f4f97-d8e70-90a11', 0),
(62, 'a49cf-05ec3-e4182-8c69e-cf7d0', 0),
(63, 'c031d-9347e-3c921-1ed85-501b7', 0),
(64, 'b3d18-c1244-58f73-b8f14-9fbd3', 0),
(65, '70a95-9f4ae-4a02d-b329e-a516c', 0),
(66, '49a3d-8356e-920f1-6debc-a2170', 0),
(67, '55f7b-cd85e-b9a3d-1e047-2a98f', 0),
(68, '7a1d2-fb0ae-5e3d9-4b28a-7dfce', 0),
(69, 'e3c6a-912be-a34f0-671d2-69ee5', 0),
(70, '65dc3-b1904-392ad-b57ee-116f8', 0),
(71, 'cf9ea-321b4-c08d1-97cae-e3f4b', 0),
(72, '78b1f-1e4de-a9cf3-4b5c2-0f4bb', 0),
(73, '2dfb0-c416a-6592e-9e813-4c6dd', 0),
(74, '9147a-28c3e-e9ba7-3c00a-82fb0', 0),
(75, 'bce41-7a249-7f3c2-e09f4-4da9c', 0),
(76, '84f17-f0d92-b31e8-594cd-d7c4f', 0),
(77, '2e0d8-3b5e4-148c9-830a4-1974e', 0),
(78, 'c01de-57bf3-4398a-d0c2b-58b1f', 0),
(79, 'ef416-28c4a-8c0e9-5b174-2cd37', 0),
(80, 'd7a4c-c8f1e-120b3-e5947-7e0a3', 0),
(81, 'b123f-4a90c-f8031-298ed-43ce9', 0),
(82, '5a8d4-c2eb3-9307d-d41ec-1b4fa', 0),
(83, '6f290-1dc83-e540a-9b2c7-3a8de', 0),
(84, 'e3f01-dc57a-bc398-201f3-905ac', 0),
(85, 'a9cde-f4802-134eb-871b0-d5c23', 0),
(86, 'd8f92-4a713-2cb4e-967a8-1b3cf', 0),
(87, '9ac53-e27d8-0f9b1-46d2e-58b7a', 0),
(88, '7e2d1-4c39f-a6b72-e5d1f-8b4a0', 0),
(89, '1b4f8-2d95e-70ac3-59e84-c7e93', 0),
(90, 'f5c2a-93847-6e0b1-d2f5c-0b7e1', 0),
(91, '3e0d9-b7841-45f0a-9c372-2a1e8', 0),
(92, '8a9c4-21e6f-dc540-3b7a0-591c2', 0),
(93, '2c87d-5e9a1-4f308-cd712-7e045', 0),
(94, '6b0d3-8a241-7f3b2-e4c97-1f82a', 0),
(95, 'e9a32-5f01b-6c874-8db17-0a39f', 0),
(96, '4f8ac-7d193-2e0b4-9ac52-3b71d', 0),
(97, 'b90a7-c5e1d-4782a-fd631-8e490', 0),
(98, '7d12e-490c8-15b3f-6a729-4f1e3', 0),
(99, '0c5f9-a381d-9e742-5c128-7a6bd', 0),
(100, 'd4a8e-2f079-6b14d-3e907-95b1f', 0),
(101, '3b7e1-c40a8-7d29f-1f643-0d28a', 0),
(102, '8f2d7-3bc19-9e805-a4712-6bc9d', 0),
(103, '5a41c-d28f0-1b376-c0a59-9d814', 0),
(104, '9e207-56a3d-48719-b3f24-20c67', 0),
(105, 'c6371-8d29e-7a04c-f58b1-4d0e2', 0),
(106, '1d3a7-6b9f2-48e5c-7a012-9f3bd', 0),
(107, '7f24e-9c81d-2a5b3-dc479-1586a', 0),
(108, 'c25b8-40d7a-6f193-bd7e2-03a9f', 0),
(109, '5e7c0-91a2b-3fd47-e816c-b237d', 0),
(110, 'a83df-1b947-5c2e0-9d307-42f1b', 0),
(111, '3f1a7-7b58d-e19f2-4c7ea-0d5b8', 0),
(112, '98b4c-2d173-61f5a-cd7b9-84702', 0),
(113, '0e37d-9f25a-48c6b-a3712-d5849', 0),
(114, '6d29f-a8473-15c2e-9e0f1-73a45', 0),
(115, 'f7b9e-36a21-c50d8-18e9f-29b7c', 0),
(116, '24c8a-7f59d-e2b40-96f31-4d0b2', 0),
(117, 'd3a7f-58129-b7e40-4a1cd-8b6e0', 0),
(118, '85c1d-42a97-0f6b3-5d89e-1c7a3', 0),
(119, '0a19e-7b4c3-9d2f6-8e057-cf321', 0),
(120, 'c97f3-2b8d0-64e1f-a25c9-70b48', 0),
(121, 'f42d1-5ac70-19e4b-7f623-9a07e', 0),
(122, '7eb60-3f1a9-cd825-46b1f-02d9c', 0),
(123, '89ad4-1b7f0-5e632-8ca9d-f02b5', 0),
(124, 'd0587-6ac12-3b497-e14f0-5d9e3', 0),
(125, '5b29f-e6173-04ac8-7d32e-b0481', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `texto` text NOT NULL,
  `data_comentario` date NOT NULL,
  `curtidas` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `id_usuario`, `texto`, `data_comentario`, `curtidas`) VALUES
(9, 10, 'O filme é incrivel, serio mesmo que obra de arte, nunca joguei minecraft mas definitivamente agora eu tenho que pegar pra jogar com uns amigos.', '2025-05-15', 143),
(10, 11, 'Filme incrível, ótimos personagens(muito bem desenvolvidos) e uma historia tocante.', '2025-05-15', 177),
(11, 12, 'O JackBlack ficou perfeito nesse papel, Steve é muito saliente com essa barriguinha.', '2025-05-15', 58),
(12, 13, 'Só faltou o portal do Aether nesse filme.☁☁', '2025-05-15', 157),
(13, 14, 'É UMA MERDA, CADE O HEROBRINE?????????? ASSISTI SÓ POR ELE E NADA', '2025-05-15', 13),
(14, 15, 'Gostei muito do filme mas acho que ele podia ter uma duração maior. Ansioso para o 2.', '2025-05-15', 193),
(15, 16, 'eu não assisti o filme', '2025-05-15', 125),
(16, 17, 'AMOOOOO MINERAFTTTTTTTTTT', '2025-05-15', 45),
(17, 18, 'Explodiu meu coração de tanta nostalgia.', '2025-05-15', 49),
(18, 19, 'Faltou mais dinamite! Muito calmo.', '2025-05-15', 110),
(19, 20, 'Construções muito bem feitas, me inspirou.', '2025-05-15', 1),
(20, 21, 'A trilha sonora tá no ponto certo!', '2025-05-15', 75),
(21, 22, 'Achei o roteiro meio previsível, mas legal.', '2025-05-15', 170),
(22, 23, 'Ver a vila ser destruída foi triste 😭', '2025-05-15', 26),
(23, 24, 'A skin do Steve tá linda.', '2025-05-15', 18),
(24, 25, 'Eu queria ter visto o Ender Dragon mais.', '2025-05-15', 13),
(25, 26, 'Nota 10, assistiria de novo fácil.', '2025-05-15', 10),
(26, 27, 'Muito blá blá blá e pouca ação.', '2025-05-15', 10),
(27, 28, 'O creeper tava fofo demais.', '2025-05-15', 21),
(28, 29, 'Coloca o Notch no próximo filme, por favor.', '2025-05-15', 72),
(29, 30, 'Cenas emocionantes e bem dirigidas.', '2025-05-15', 96),
(30, 31, 'Não entendi nada, mas gostei.', '2025-05-15', 67),
(31, 32, 'O fim foi inesperado, adorei!', '2025-05-15', 44),
(32, 33, 'Filme bem feito, mas faltou mais ação.', '2025-05-15', 19),
(33, 34, 'O piglin foi o melhor personagem.', '2025-05-15', 164),
(34, 35, 'Quero o filme do Nether agora!', '2025-05-15', 162),
(35, 36, 'Assisti com meus filhos, todos amaram.', '2025-05-15', 119),
(36, 37, 'Faltou parkour com slime blocks.', '2025-05-15', 108),
(37, 38, 'Muito melhor do que eu esperava!', '2025-05-15', 184),
(38, 39, 'O portal do fim ficou lindo na tela.', '2025-05-15', 194),
(39, 40, 'Enderman me deu pesadelos, parabéns.', '2025-05-15', 20),
(40, 41, 'Golem foi herói demais.', '2025-05-15', 114),
(41, 42, 'A ovelha rosa roubou a cena.', '2025-05-15', 110),
(42, 43, 'Faltou Wither, mas tudo bem.', '2025-05-15', 7),
(43, 44, 'Explosões bem feitas, adorei.', '2025-05-15', 105),
(44, 45, 'A bota do Steve brilhou.', '2025-05-15', 103),
(45, 46, 'Redstone bem representado, ufa.', '2025-05-15', 1),
(46, 47, 'Gostei da caverna, bem realista.', '2025-05-15', 95),
(47, 48, 'O dragão parecia real de verdade!', '2025-05-15', 71),
(48, 49, 'Cena na lava foi tensa.', '2025-05-15', 72),
(49, 50, 'Tijolos com textura fiel ao game.', '2025-05-15', 144),
(50, 51, 'Planta carnívora kkkk não esperava.', '2025-05-15', 106),
(51, 52, 'Arqueiro do bem, achei fofo.', '2025-05-15', 94),
(52, 53, 'Comida pixelada deu fome kkk.', '2025-05-15', 154),
(53, 54, 'Muito mob, fiquei tenso.', '2025-05-15', 85),
(54, 55, 'Comandos muito bem integrados.', '2025-05-15', 165),
(55, 56, 'Cena de pesca relaxante.', '2025-05-15', 170),
(56, 57, 'Pistão invertido foi hilário.', '2025-05-15', 155),
(57, 58, 'A iluminação do filme ficou surreal.', '2025-05-15', 64),
(58, 59, 'Adorei o zumbi dançante, kkkkk.', '2025-05-15', 52),
(59, 60, 'As pedras estavam super bem texturizadas.', '2025-05-15', 70),
(60, 61, 'A grama parecia de verdade, muito linda.', '2025-05-15', 194),
(61, 62, 'Cena da fornalha foi top demais.', '2025-05-15', 157),
(62, 63, 'Steve tá em todas, mito!', '2025-05-15', 2),
(63, 64, 'A mina secreta era realmente secreta rs.', '2025-05-15', 141),
(64, 65, 'A vaca voadora me pegou de surpresa.', '2025-05-15', 98),
(65, 66, 'O baú do tesouro no final foi emocionante.', '2025-05-15', 66),
(66, 67, 'Comandos bem usados na batalha final.', '2025-05-15', 37),
(67, 68, 'Muito minério brilhando, top visual.', '2025-05-15', 185),
(68, 69, 'A caverna com eco ficou realista.', '2025-05-15', 15),
(69, 70, 'A poção do herói foi épica.', '2025-05-15', 120),
(70, 71, 'O Nether tava lindo e assustador.', '2025-05-15', 153),
(71, 72, 'O slime teve muito carisma.', '2025-05-15', 4),
(72, 73, 'Creeper do bem é canon agora.', '2025-05-15', 159),
(73, 74, 'O poço de lava me deu medo.', '2025-05-15', 186),
(74, 75, 'Camuflagem no bioma ficou show.', '2025-05-15', 50),
(75, 76, 'Barco atravessando o rio no por do sol foi lindo.', '2025-05-15', 92),
(76, 77, 'Lobo salvando o personagem, cena 10/10.', '2025-05-15', 108),
(77, 78, 'O Bicho de Ferro no filme foi um personagem icônico.', '2025-05-15', 65),
(78, 79, 'Chave Mestra desbloqueou meus sentimentos pelo filme.', '2025-05-15', 1),
(79, 80, 'A Espada de Fogo queimou todas as minhas expectativas.', '2025-05-15', 10),
(80, 81, 'O Pescador Maluco trouxe leveza para a trama.', '2025-05-15', 44),
(81, 82, 'Mago das Sombras fez mágica de verdade.', '2025-05-15', 192),
(82, 83, 'Cavaleiro do Bloco me lembrou do meu personagem favorito.', '2025-05-15', 26),
(83, 84, 'Construtor Ninja foi rápido e preciso.', '2025-05-15', 153),
(84, 85, 'Vassoura Voadora voou alto na minha opinião.', '2025-05-15', 86),
(85, 86, 'Explorador dos Caves revelou muitos segredos.', '2025-05-15', 173),
(86, 87, 'Torre de Observação teve a melhor vista da história.', '2025-05-15', 6),
(87, 88, 'Flecha Certeira nunca erra um comentário.', '2025-05-15', 110),
(88, 89, 'Ferreiro Mestre forjou momentos inesquecíveis.', '2025-05-15', 131),
(89, 90, 'Arqueiro Fantasma me deixou sem palavras.', '2025-05-15', 124),
(90, 91, 'Guardião do Portal protegeu a narrativa.', '2025-05-15', 26),
(91, 92, 'Lava em Chamas aqueceu os corações.', '2025-05-15', 157),
(92, 93, 'Serpente do Nether deslizou com estilo.', '2025-05-15', 107),
(93, 94, 'Escudo de Ferro foi meu favorito para proteção.', '2025-05-15', 64),
(94, 95, 'Luz da Redstone iluminou tudo.', '2025-05-15', 198),
(95, 96, 'Mina Abandonada escondeu muitos mistérios.', '2025-05-15', 199),
(96, 97, 'Bicho de Creeper explodiu em popularidade.', '2025-05-15', 198);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(63) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `id_codigo`) VALUES
(10, 'PedrinhoDoGrau57', '0000960461@senaimgaluno.com.br', 18),
(11, 'EpicMiner777', 'cletin906@gmail.com', 19),
(12, 'GolQuadrado', '0001069012@senaimgaluno.com.br', 20),
(13, 'MacacodaBanana', '0001060491@senaimgaluno.com.br', 21),
(14, 'SuusZedao', '0001060941@senaimgaluno.com.br', 22),
(15, 'Pietro-rasgador', '0001067366@senaimgaluno.com.br', 23),
(16, 'junindelas', 'junindugrau@gmail.com', 24),
(17, 'Pietro', '0001061055@senaimgaluno.com.br', 25),
(18, 'CaveiraSkull', 'user1@example.com', 26),
(19, 'CreeperLoko', 'user2@example.com', 27),
(20, 'BuilderZika', 'user3@example.com', 28),
(21, 'SteveSupremo', 'user4@example.com', 29),
(22, 'ZumbiFan', 'user5@example.com', 30),
(23, 'MineradorBr', 'user6@example.com', 31),
(24, 'BlocoQueAnda', 'user7@example.com', 32),
(25, 'SpawnaTudo', 'user8@example.com', 33),
(26, 'NoobPower', 'user9@example.com', 34),
(27, 'MestreDoRedstone', 'user10@example.com', 35),
(28, 'Pixelado123', 'user11@example.com', 36),
(29, 'NetoDoNotch', 'user12@example.com', 37),
(30, 'CraftadorX', 'user13@example.com', 38),
(31, 'HerobrineFake', 'user14@example.com', 39),
(32, 'VacaJumper', 'user15@example.com', 40),
(33, 'CavadorDeTudo', 'user16@example.com', 41),
(34, 'BlocoEmChamas', 'user17@example.com', 42),
(35, 'OlhoDeEnder', 'user18@example.com', 43),
(36, 'PistaoReverso', 'user19@example.com', 44),
(37, 'ComandoMaster', 'user20@example.com', 45),
(38, 'CactoCraft', 'user21@example.com', 46),
(39, 'PortalLover', 'user22@example.com', 47),
(40, 'EndermanX', 'user23@example.com', 48),
(41, 'GolemDeFerro', 'user24@example.com', 49),
(42, 'OvelhaRosa', 'user25@example.com', 50),
(43, 'WitherBala', 'user26@example.com', 51),
(44, 'ExplodeTudo', 'user27@example.com', 52),
(45, 'BotaDeDiamante', 'user28@example.com', 53),
(46, 'RedstonerPro', 'user29@example.com', 54),
(47, 'Cavernoso', 'user30@example.com', 55),
(48, 'DragaoNoEnd', 'user31@example.com', 56),
(49, 'LavaRapida', 'user32@example.com', 57),
(50, 'Tijoludo', 'user33@example.com', 58),
(51, 'PlantaPvP', 'user34@example.com', 59),
(52, 'ArqueiroFeliz', 'user35@example.com', 60),
(53, 'MineChef', 'user36@example.com', 61),
(54, 'MobAleatorio', 'user37@example.com', 62),
(55, 'RaioDeComando', 'user38@example.com', 63),
(56, 'PescadorCraft', 'user39@example.com', 64),
(57, 'PistaoDoido', 'user40@example.com', 65),
(58, 'GamerDoBloco', 'user41@example.com', 66),
(59, 'ZumbiChic', 'user42@example.com', 67),
(60, 'PedraLisa', 'user43@example.com', 68),
(61, 'GramaAlta', 'user44@example.com', 69),
(62, 'FornalhaXP', 'user45@example.com', 70),
(63, 'SuperSteve', 'user46@example.com', 71),
(64, 'MinaSecreta', 'user47@example.com', 72),
(65, 'VacaVoadora', 'user48@example.com', 73),
(66, 'Bauzudo', 'user49@example.com', 74),
(67, 'ComandoOP', 'user50@example.com', 75),
(68, 'MineradorLoko', 'user51@example.com', 76),
(69, 'GuardiaoDaCaverna', 'user52@example.com', 77),
(70, 'PoçãoMaluco', 'user53@example.com', 78),
(71, 'CorredorDoNether', 'user54@example.com', 79),
(72, 'BlocoDeSlime', 'user55@example.com', 80),
(73, 'CreeperDoBem', 'user56@example.com', 81),
(74, 'PocoDeLava', 'user57@example.com', 82),
(75, 'CamufladoNoBioma', 'user58@example.com', 83),
(76, 'BarcoRapido', 'user59@example.com', 84),
(77, 'LoboFiel', 'user60@example.com', 85),
(78, 'BichoDeFerro', 'user61@example.com', 86),
(79, 'ChaveMestra', 'user62@example.com', 87),
(80, 'EspadaDeFogo', 'user63@example.com', 88),
(81, 'PescadorMaluco', 'user64@example.com', 89),
(82, 'MagoDasSombras', 'user65@example.com', 90),
(83, 'CavaleiroDoBloco', 'user66@example.com', 91),
(84, 'ConstrutorNinja', 'user67@example.com', 92),
(85, 'VassouraVoadora', 'user68@example.com', 93),
(86, 'ExploradorDosCaves', 'user69@example.com', 94),
(87, 'TorreDeObservação', 'user70@example.com', 95),
(88, 'FlechaCerteira', 'user71@example.com', 96),
(89, 'FerreiroMestre', 'user72@example.com', 97),
(90, 'ArqueiroFantasma', 'user73@example.com', 98),
(91, 'GuardiaoDoPortal', 'user74@example.com', 99),
(92, 'LavaEmChamas', 'user75@example.com', 100),
(93, 'SerpenteDoNether', 'user76@example.com', 101),
(94, 'EscudoDeFerro', 'user77@example.com', 102),
(95, 'LuzDaRedstone', 'user78@example.com', 103),
(96, 'MinaAbandonada', 'user79@example.com', 104),
(97, 'BichoDeCreeper', 'user80@example.com', 105);

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
  MODIFY `id_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT de tabela `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
