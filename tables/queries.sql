# ----------------------------------------------

# PESQUISA NOS UTILIZADORES

#-----------------------------------------------

# ------- utilizadores com nacionalidade portuguesa -----
SELECT * FROM utilizador WHERE nacionalidade='Portugal';

# ------- número de utilizadores com nacionalidade portuguesa ----- 
SELECT COUNT(*) FROM utilizador WHERE nacionalidade='Portugal';

# ------- número de utilizadores com nacionalidade canadiana ----- 
SELECT COUNT(*) FROM utilizador WHERE nacionalidade='Canada';

# -------  Data de nascimento superior a 1999-01-01 -------
SELECT * FROM utilizador WHERE dataNascimento > "1999-01-01";

# -------  Utilizador administrador -------
SELECT * FROM utilizador WHERE admin = 1;



# ----------------------------------------------

# PESQUISA NOS CRIADORES DE CONTEUDO

#-----------------------------------------------

#------ Procurar os indices tipos artista que são fotografos ----------------
SELECT * FROM tipo_artista WHERE fotografo = 1;

#------ Procurar os nomes dos artistas que são fotografos ----------------
SELECT * FROM artista WHERE idArtista IN (SELECT idArtista FROM tipo_artista WHERE fotografo = 1);

#------ Procurar os nomes dos artistas que são fotografos e atores ----------------
SELECT * FROM artista WHERE idArtista IN (SELECT idArtista FROM tipo_artista WHERE fotografo = 1 AND ator = 1);


# ----------------------------------------------

# PESQUISA NOS COMENTARIOS

#-----------------------------------------------

#------ Procurar todos os comentarios de um utilizador ----------------
SELECT * FROM comentario WHERE idUtilizador = 1;

#------ Procurar todos os comentarios de um conteudo ----------------
SELECT * FROM comentario WHERE idConteudo = 1;

#------ Procurar todos os comentarios dados dia 23 ----------------
SELECT * FROM comentario WHERE data = '2019-06-23';


# ----------------------------------------------

# PESQUISA NAS CLASSIFICAÇÔES

#-----------------------------------------------

#------ Procurar todos as classificações de valor 9 ----------------
SELECT * FROM classificacao WHERE valor = 9;

#------ Procurar todos as classificações do conteudo 1 ----------------
SELECT * FROM classificacao WHERE idConteudo = 1;

#------ Procurar todos as classificações do utilizador 1 ----------------
SELECT * FROM classificacao WHERE idUtilizador = 1;


# ----------------------------------------------

# PESQUISA NOS CONTEUDOS

#-----------------------------------------------

#------ Procurar todos os conteudos landacados depois de 1993 ----------------
SELECT * FROM conteudo WHERE lancamento > '1993-01-01';

#------ Procurar todos os conteudos landacados pelo primeiro utilizador ----------------
SELECT * FROM conteudo WHERE idUtilizador = 1;

# ----------------------------------------------

# PESQUISA NOS FILMES

#-----------------------------------------------

#------ Procura os filmes publicados pelo realizador 73 -------------
SELECT * FROM filmes WHERE idRealizador = 73;

#------ Procura o conteudo de um filme baseado no seu id -------------
SELECT * FROM conteudo WHERE idConteudo IN (SELECT idConteudo FROM filmes WHERE idConteudo = 6);

# ----------------------------------------------

# PESQUISA NOS POEMAS

#-----------------------------------------------

#------ Procura os poemas publicados pelo poeta 58 -------------
SELECT * FROM poema WHERE idPoeta = 58;

#------ Procura os conteudos do poema com id 16 -------------
SELECT * FROM conteudo WHERE idConteudo IN (SELECT idConteudo FROM poema WHERE idConteudo = 16);

