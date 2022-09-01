SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `projeto` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `projeto`;

DROP TABLE IF EXISTS `competencias`;
CREATE TABLE `competencias` (
  `id_comp` int(11) NOT NULL,
  `competencia` varchar(255) DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `competencias` (`id_comp`, `competencia`, `id_curr`) VALUES
(3, 'Empatia', 7);

DROP TABLE IF EXISTS `curriculo`;
CREATE TABLE `curriculo` (
  `id_curr` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefone` varchar(14) DEFAULT NULL,
  `curso` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `curriculo` (`id_curr`, `nome`, `email`, `telefone`, `curso`) VALUES
(7, 'Gabriel Oliveira Sampaio', 'sampas@email.com', '(11)9 1234-123', 'Informática para Internet');

DROP TABLE IF EXISTS `educacao`;
CREATE TABLE `educacao` (
  `id_educ` int(11) NOT NULL,
  `instituicao` varchar(255) DEFAULT NULL,
  `curso` varchar(255) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `educacao` (`id_educ`, `instituicao`, `curso`, `inicio`, `fim`, `id_curr`) VALUES
(2, 'Etec Profª Maria Cristina Medeiros', 'Informática para Internet', '2021-01-28', '2023-12-16', 7);

DROP TABLE IF EXISTS `experiencia`;
CREATE TABLE `experiencia` (
  `id_exp` int(11) NOT NULL,
  `empresa` varchar(255) DEFAULT NULL,
  `ocupacao` varchar(255) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fim` date DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `experiencia` (`id_exp`, `empresa`, `ocupacao`, `inicio`, `fim`, `id_curr`) VALUES
(1, 'Centro Paula Sousa', 'Estagiário', '2022-09-20', '2023-09-20', 7);

DROP TABLE IF EXISTS `habilidades`;
CREATE TABLE `habilidades` (
  `id_hab` int(11) NOT NULL,
  `habilidade` varchar(255) DEFAULT NULL,
  `id_curr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `habilidades` (`id_hab`, `habilidade`, `id_curr`) VALUES
(8, 'Lógica', 7);

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `cpf`, `tipo`) VALUES
(1, 'Gabriel Oliveira Sampaio', 'sampas@email.com', '81dc9bdb52d04dc20036dbd8313ed055', '123.123.123-12', 2);


ALTER TABLE `competencias`
  ADD PRIMARY KEY (`id_comp`),
  ADD KEY `id_curr` (`id_curr`);

ALTER TABLE `curriculo`
  ADD PRIMARY KEY (`id_curr`);

ALTER TABLE `educacao`
  ADD PRIMARY KEY (`id_educ`),
  ADD KEY `id_curr` (`id_curr`);

ALTER TABLE `experiencia`
  ADD PRIMARY KEY (`id_exp`),
  ADD KEY `id_curr` (`id_curr`);

ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`id_hab`),
  ADD KEY `id_curr` (`id_curr`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `competencias`
  MODIFY `id_comp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `curriculo`
  MODIFY `id_curr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `educacao`
  MODIFY `id_educ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `experiencia`
  MODIFY `id_exp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `habilidades`
  MODIFY `id_hab` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `competencias`
  ADD CONSTRAINT `competencias_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);

ALTER TABLE `educacao`
  ADD CONSTRAINT `educacao_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);

ALTER TABLE `experiencia`
  ADD CONSTRAINT `experiencia_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);

ALTER TABLE `habilidades`
  ADD CONSTRAINT `habilidades_ibfk_1` FOREIGN KEY (`id_curr`) REFERENCES `curriculo` (`id_curr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
