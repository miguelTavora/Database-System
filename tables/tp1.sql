CREATE DATABASE IF NOT EXISTS sbd;

USE sbd;
#show databases;

SET GLOBAL local_infile = 'ON';

#SHOW VARIABLES LIKE "secure_file_priv";

#SHOW VARIABLES LIKE "local_infile";

CREATE TABLE `artista` (
	`idArtista` int AUTO_INCREMENT,
	`nomeArtistico` varchar(255) NOT NULL,
    PRIMARY KEY(`idArtista`)
);

CREATE TABLE `tipo_artista` (
	`idArtista` int NOT NULL UNIQUE,
	`poeta` bool NOT NULL DEFAULT false,
	`realizador` bool NOT NULL DEFAULT false,
	`fotografo` bool NOT NULL DEFAULT false,
	`ator` bool NOT NULL DEFAULT false,
    `musico` bool NOT NULL DEFAULT false,
    `escritor_musica` bool NOT NULL DEFAULT false
);

ALTER TABLE `tipo_artista` ADD CONSTRAINT `fk_tipo_artista` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE;

CREATE TABLE `utilizador` (
	`idUtilizador` int AUTO_INCREMENT,
    `username` varchar(25) NOT NULL,
    `password` varchar(50) NOT NULL,
	`nacionalidade` varchar(150) NOT NULL,
    `reputacao` float NOT NULL DEFAULT 0,
    `dataNascimento` date NOT NULL,
	`bloqueado` BOOL DEFAULT FALSE,
    `admin` INT DEFAULT 0,
    PRIMARY KEY(`idUtilizador`)
);

CREATE TABLE `conteudo` (
	`idConteudo` int AUTO_INCREMENT,
    `titulo` varchar(100) NOT NULL,
    `resumo` varchar(1000),
    `lancamento` date NOT NULL,
    `idUtilizador` int NOT NULL,
    `atividade` bool DEFAULT FALSE,
    `escalao` int DEFAULT 3,
    PRIMARY KEY(`idConteudo`)
    
);

ALTER TABLE `conteudo` ADD CONSTRAINT `fk_id_utilizador` FOREIGN KEY (`idUtilizador`) REFERENCES `utilizador` (`idUtilizador`) ON DELETE CASCADE;

CREATE TABLE `classificacao` (
	`idConteudo` int NOT NULL,
    `idUtilizador` int NOT NULL,
    `valor` int NOT NULL,
    `data` date NOT NULL
);

ALTER TABLE `classificacao` ADD CONSTRAINT `fk_classificacao_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`idConteudo`) ON DELETE CASCADE;
ALTER TABLE `classificacao` ADD CONSTRAINT `fk_classificacao_utilizador` FOREIGN KEY (`idUtilizador`) REFERENCES `utilizador` (`idUtilizador`) ON DELETE CASCADE;

CREATE TABLE `comentario` (
	`idComentario` int AUTO_INCREMENT,
    `texto` varchar(300) NOT NULL,
    `data` date NOT NULL,
    `idConteudo` int NOT NULL,
    `idUtilizador` int NOT NULL,
	PRIMARY KEY(`idComentario`)
);

ALTER TABLE `comentario` ADD CONSTRAINT `fk_comentario_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`idUtilizador`) ON DELETE CASCADE;
ALTER TABLE `comentario` ADD CONSTRAINT `fk_comentario_utilizador` FOREIGN KEY (`idUtilizador`) REFERENCES `utilizador` (`idUtilizador`) ON DELETE CASCADE;

CREATE TABLE `filmes` (
	`conteudo` longblob NOT NULL,
    `dataCarregamento` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `idConteudo` int NOT NULL,
    `idArtista` int NOT NULL
    
);

ALTER TABLE `filmes` ADD CONSTRAINT `fk_filme_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`idConteudo`) ON DELETE CASCADE;
ALTER TABLE `filmes` ADD CONSTRAINT `fk_ifilme_artista` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE;

CREATE TABLE `musica` (
	`conteudo` longblob NOT NULL,
    `dataCarregamento` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `letra` mediumtext NOT NULL,
    `idConteudo` int NOT NULL
);

ALTER TABLE `musica` ADD CONSTRAINT `fk_musica_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`idConteudo`) ON DELETE CASCADE;


CREATE TABLE `artista_participante` (
	`idConteudo` int NOT NULL,
	`idArtista` int NOT NULL
    
);

ALTER TABLE `artista_participante` ADD CONSTRAINT `fk_id_artista_participante` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE;
ALTER TABLE `artista_participante` ADD CONSTRAINT `fk_id_conteudo_artista_participante` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`idConteudo`) ON DELETE CASCADE;

CREATE TABLE `fotografia` (
	`conteudo` mediumblob NOT NULL,
    `dataCarregamento` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `idConteudo` int NOT NULL,
    `idArtista` int NOT NULL
    
);

ALTER TABLE `fotografia` ADD CONSTRAINT `fk_fotografia_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`idConteudo`) ON DELETE CASCADE;
ALTER TABLE `fotografia` ADD CONSTRAINT `fk_id_fotografo` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE;

CREATE TABLE `poema` (
	`conteudo` mediumtext NOT NULL,
    `dataCarregamento` DATETIME DEFAULT CURRENT_TIMESTAMP,
	`idConteudo` int NOT NULL,
    `idArtista` int NOT NULL

);

ALTER TABLE `poema` ADD CONSTRAINT `fk_poema_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`idConteudo`) ON DELETE CASCADE;
ALTER TABLE `poema` ADD CONSTRAINT `fk_id_poeta` FOREIGN KEY (`idArtista`) REFERENCES `artista` (`idArtista`) ON DELETE CASCADE;

#show tables;
/*
CREATE TABLE `nacionalidades` (
	`nacionalidade` varchar(100),
    size ENUM('Afghanistan','Albania','Algeria','Andorra','Angola')
);*/

