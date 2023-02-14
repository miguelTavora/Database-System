#---------------------------------------------------------------------------------------------------------------------------------------------

#ARTISTAS e TIPO DE ARTISTAS

#------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO artista (`nomeArtistico`) VALUES ('Lil Peep'),('Lil Skies'),('PNG'),('Bones'),('Juice WRLD'),('XXXTentacion'),
('convolk'),('2pac'),('Eminem'),('Blackbear'),('Post Malone'),('Suicideboys'),('Pouya'),('RAMIREZ'),('ThreeDaysGrace'),
('Night Lovell'),('Imagine Dragons'),('Ghostmane'),('Pink Floyd'),('Nirvana'),('Khalid');

INSERT INTO tipo_artista (`idArtista`,`musico`) VALUES (1,true),(2,true),(3,true),(4,true),(5,true),(6,true),(7,true),
(8,true),(9,true),(10,true),(11,true),(12,true),(13,true),(14,true),(15,true),(16,true),(17,true),(18,true),(19,true),
(20,true),(21,true);

UPDATE tipo_artista SET `escritor_musica` = true WHERE `idArtista` = 1; 
UPDATE tipo_artista SET `escritor_musica` = true WHERE `idArtista` = 4;
UPDATE tipo_artista SET `escritor_musica` = true WHERE `idArtista` = 5;
UPDATE tipo_artista SET `escritor_musica` = true WHERE `idArtista` = 6;
UPDATE tipo_artista SET `escritor_musica` = true WHERE `idArtista` = 8;
UPDATE tipo_artista SET `escritor_musica` = true WHERE `idArtista` = 9;
UPDATE tipo_artista SET `escritor_musica` = true WHERE `idArtista` = 10;
UPDATE tipo_artista SET `escritor_musica` = true WHERE `idArtista` = 13;
UPDATE tipo_artista SET `escritor_musica` = true WHERE `idArtista` = 20;


INSERT INTO artista (`nomeArtistico`) VALUES('João Pecados'),('Heath Ledger'),('Emily Willis'),('Liya Silver'),('Lexi Belle'),
('Lexi Lore'),('Gina Valentina'),('Gia Paige'),('Alex Blake'),('Genebra Belluci'),('Lisa Ann'),('Lena Paul'),('Daisy Filipe'),('Sarah Vandella'),
('Bree Olsen'),('Erica Fontes'),('Ariana Marie'),('Purple Bitch'),('Dillion Harper'),('Skylar Vox'),('Alice Redlips'),('Riley Reid'),('Lana Rhoades'),
('Patricia Guerreiro');


INSERT INTO tipo_artista(`ator`,`idArtista`) VALUES (true,22),(true,23),(true,24),(true,25),(true,26),(true,27),(true,28),(true,29),
(true,30),(true,31),(true,32),(true,33),(true,34),(true,35),(true,36),(true,37),(true,38),(true,39),(true,40),(true,41),(true,42),(true,43),
(true,44),(true,45);

UPDATE tipo_artista SET `poeta` = true WHERE `idArtista` = 22;
UPDATE tipo_artista SET `realizador` = true WHERE `idArtista` = 22;
UPDATE tipo_artista SET `fotografo` = true WHERE `idArtista` = 22;
UPDATE tipo_artista SET `musico` = true WHERE `idArtista` = 22;
UPDATE tipo_artista SET `escritor_musica` = true WHERE `idArtista` = 22;
UPDATE tipo_artista SET `realizador` = true WHERE `idArtista` = 23;
UPDATE tipo_artista SET `fotografo` = true WHERE `idArtista` = 34;


INSERT INTO artista (`nomeArtistico`) VALUES ('Cindy Sherman'),('Robert Frank'),('Eliot Porter'),('Imogen Cunningham'),
('Frans Lanting'),('Paul Strand'),('Weegee'),('Richard Avedon'),('Don McCullin'),('Edward Western'),('Man Ray'),
('David Bailey');

INSERT INTO tipo_artista (`idArtista`,`fotografo`) VALUES (46,true),(47,true),(48,true),(49,true),(50,true),(51,true),
(52,true),(53,true),(54,true),(55,true),(56,true),(57,true);


INSERT INTO artista (`nomeArtistico`) VALUES ('Fernando Pessoa'),('Sophia de Mello Breyner Andresen'),('Florbela Espanca'),('Eugénio de Andrade'),
('Miguel Torga'),('Herberto Helder'),('David Mourão Ferreira'),('José Saramago'),('Almada Negreiros'),('Vitorino Nemésio'),('Almeida Garrett'),
('Camilo Castelo Branco');


INSERT INTO tipo_artista (`idArtista`,`poeta`) VALUES (58,true),(59,true),(60,true),(61,true),(62,true),(63,true),
(64,true),(65,true),(66,true),(67,true),(68,true),(69,true);

INSERT INTO artista (`nomeArtistico`) VALUES ('Martin Scorsese'),('Marlon Brando'),('Steven Spielberg'),('Orson Welles'),
('Quentin Tarantino');

INSERT INTO tipo_artista (`idArtista`,`realizador`) VALUES (70,true),(71,true),(72,true),(73,true),(74,true);

UPDATE tipo_artista SET `realizador` = true WHERE `idArtista` = 46;

#---------------------------------------------------------------------------------------------------------------------------------------------

#UTILIZADORES

#------------------------------------------------------------------------------------------------------------------------------------------------




INSERT INTO utilizador(`username`,`password`,`nacionalidade`,`dataNascimento`,`admin`)VALUES ('tixa','123456','Portugal',DATE '2001-07-19',2),('daisy','123456','Portugal',DATE '2000-03-25',2),
('johnny','123456','United States',DATE '1995-10-02',1),('barao','123456','Canada',DATE '1999-04-28', 1),('domp','123456','Germany',DATE '1999-01-06',0),
('conde','123456','France',DATE '1997-07-19',0),('regente','123456','Spain',DATE '1999-10-21',0);


#---------------------------------------------------------------------------------------------------------------------------------------------

#CONTEUDO FOTOGRAFIA

#------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`) VALUES ('Foto mar',DATE '2019-06-21', 1,12);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`) VALUES ('Foto pontes',DATE '2019-06-21', 1,16);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`) VALUES ('Foto praia',DATE '2019-06-21', 1,18);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`) VALUES ('Foto praia',DATE '2019-06-21', 1);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`) VALUES ('Foto flores',DATE '2020-01-05', 2);

#CONTEUDO FILMES
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`resumo`) VALUES ('Trying to drink',DATE '2019-02-15', 4,'Drop of a chair');
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`resumo`) VALUES ('The police are after me',DATE '2017-10-15', 5,'Da police are afta me');
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`resumo`) VALUES ('Get out of the boat',DATE '2018-12-15', 3,'It goes down Mike');
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`) VALUES ('Tell the time',DATE '2019-01-05', 7,18);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`) VALUES ('Yeah boy',DATE '2019-02-01', 6);

#CONTEUDO MUSICA

INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`)VALUES('Awful things',DATE '1993-02-15',4);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`)VALUES('Save that shit',DATE '2007-02-09',3,16);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`)VALUES('Nowadays',DATE '2019-03-15',2);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`)VALUES('Drugdealer',DATE '2002-02-25',5,18);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`)VALUES('Heldaghost',DATE '2019-05-13',6);

#CONTEUDO POEMAS
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`)VALUES('Mar Salgado',DATE '1932-02-15',2,16);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`)VALUES('Liberdade',DATE '1945-10-05',1);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`)VALUES('Saudades',DATE '1920-03-10',4);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`)VALUES('Nevoa',DATE '1933-02-15',3);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`)VALUES('Conselho',DATE '1935-08-15',5,12);

#CONTEUDO FOTOGRAFIA 2
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`) VALUES ('Foto Lobo Tribal',DATE '2016-06-21', 4);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`) VALUES ('Foto Olho do relógio',DATE '2017-04-01', 1,12);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`) VALUES ('Foto Auto retrato Caravaggio',DATE '2020-06-21', 3);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`) VALUES ('Foto Tigre no escuro',DATE '2015-09-11', 1);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`) VALUES ('Foto elefante na água',DATE '2019-06-01', 2);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`) VALUES ('Foto sol',DATE '2019-05-09', 5,16);

#CONTEUDO MUSICA 2
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`)VALUES('Smells like teen spirit',DATE '1993-02-15',6);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`)VALUES('Lithium',DATE '1993-03-15',3,12);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`)VALUES('Get Out Alive',DATE '2007-02-15',1);
INSERT INTO conteudo (`titulo`,`lancamento`,`idUtilizador`,`escalao`)VALUES('Rap God',DATE '2010-02-15',5,12);



#FOTOGRAFIA

INSERT INTO fotografia (`conteudo`,`idConteudo`,`idArtista`) VALUES (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/mar.png"),1, 46);
INSERT INTO fotografia (`conteudo`,`idConteudo`,`idArtista`) VALUES (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/bridge.jpg"),2, 46);
INSERT INTO fotografia (`conteudo`,`idConteudo`,`idArtista`) VALUES (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/daisy1.png"),3, 47);
INSERT INTO fotografia (`conteudo`,`idConteudo`,`idArtista`) VALUES (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/daisy2.png"),4, 47);
INSERT INTO fotografia (`conteudo`,`idConteudo`,`idArtista`) VALUES (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/flores.jpg"),5, 48);
INSERT INTO fotografia (`conteudo`,`idConteudo`,`idArtista`) VALUES (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/wolf.jpg"),21, 46);
INSERT INTO fotografia (`conteudo`,`idConteudo`,`idArtista`) VALUES (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/olho_relogio.jpg"),22, 47);
INSERT INTO fotografia (`conteudo`,`idConteudo`,`idArtista`) VALUES (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/auto.jpg"),23, 48);
INSERT INTO fotografia (`conteudo`,`idConteudo`,`idArtista`) VALUES (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tigre.jpg"),24, 47);
INSERT INTO fotografia (`conteudo`,`idConteudo`,`idArtista`) VALUES (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/elefante.jpg"),25, 47);
INSERT INTO fotografia (`conteudo`,`idConteudo`,`idArtista`) VALUES (load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sol.jpg"),26, 46);


#---------------------------------------------------------------------------------------------------------------------------------------------

#FILMES
INSERT INTO filmes(`conteudo`,`idConteudo`, `idArtista`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/chair.mp4"),6,46);
INSERT INTO filmes(`conteudo`,`idConteudo`, `idArtista`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Da_police.mp4"),7,71);
INSERT INTO filmes(`conteudo`,`idConteudo`, `idArtista`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/go_down.mp4"),8,72);
INSERT INTO filmes(`conteudo`,`idConteudo`, `idArtista`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tell_clock.mp4"),9,73);
INSERT INTO filmes(`conteudo`,`idConteudo`, `idArtista`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Yeah_boy.mp4"),10,73);


INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (6,22),(6,25);
INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (7,22),(6,27),(6,32);
INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (8,22),(6,26);
INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (9,22);
INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (10,22),(10,23),(10,24),(10,25);


#---------------------------------------------------------------------------------------------------------------------------------------------

#MUSICA
INSERT INTO musica(`conteudo`,`letra`,`idConteudo`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Lil Peep - Awful Things ft. Lil Tracy.mp3")
,'Bother me, tell me awful things
You know I love it when you do that
Helps me get through this without you
Bother me, tell me awful things
You know I love it when you do that
Helps me get through this without you
Bother me, tell me awful things
You know I love it when you move that on me
Love it when you do that on me
You like attention, I find it obvious
She makes it obvious for me
She feels the tension
Its just the two of us, its just the two of us tonight
Burn me down til Im nothin but memories
I get it, girl (I get it, girl)
I get it, girl
Burn me down til Im nothin but memories
I get it, girl (I get it, girl)
Im not the one
Bother me, tell me awful things
You know I love it when you do that
Helps me get through this without you
Bother me, tell me awful things
You know I love it when you move that on me
Love it when you do that on me
Dont you turn your back on me
Let your teardrops fall on me
Speeding away, the city in the rear view
Heart racing whenever Im near you
Goth Boi jumpin on stage
Carry me away, carry me away
Burn me down til theres nothing left
I will scream your name with my last breath
Take off your favorite dress
Lay your head on my chest
Diamonds, rubies and gems
You can have all of them
Bother me, tell me awful things
You know I love it when you do that
Helps me get through this without you
Bother me, tell me awful things
You know I love it when move that on me
Love it when you do that on me',11);

INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (11,1);

INSERT INTO musica(`conteudo`,`letra`,`idConteudo`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Lil Peep - Save That Shit.mp3")
,'Fuck my life, cant save that girl
Dont tell me you could save that shit
All she want is payback for the way I always play that shit
You aint getting nothing, now Im saying
Dont tell me you is
Nothin like them other motherfuckers
I can make you rich (I can make you rich)
I can make you this, baby, I can make you that
I can take you there, but baby, you wont make it back
Growing sick of this and I dont wanna make you sad
Do I make you scared? Baby, wont you take me back?
Nothin like them other motherfuckers
I can make you rich (I can make you rich)
Nothin like them other motherfuckers
I can make you rich (I can make you rich)
Fuck my life, cant save that girl
Dont tell me you could save that shit
All she want is payback for the way I always play that shit
You aint getting nothing, now Im saying
Dont tell me you is
Nothin like them other motherfuckers
I can make you rich (I can make you rich)
I can make you this, baby, I can make you that
I can take you there, but baby, you wont make it back
Growing sick of this and I dont wanna make you sad
Do I make you scared? Baby, wont you take me back?
Down another lonely road, I go
Just another lonely road, oh
I just wanna know, I just gotta know
Do you wanna glow? Baby, we could glow
Fuck my life, cant save that girl
Dont tell me you could save that shit
All she want is payback for the way I always play that shit
You aint getting nothing, now Im saying
Dont tell me you is
Nothin like them other motherfuckers
I can make you rich (I can make you rich)
I can make you this, baby, I can make you that
I can take you there, but baby, you wont make it back
Growing sick of this and I dont wanna make you sad
Do I make you scared? Baby, wont you take me back?
Do I make you scared? Baby, wont you take me back?
Nothin like them other motherfuckers
I can make you rich (I can make you rich)',12);

INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (12,1);

INSERT INTO musica(`conteudo`,`letra`,`idConteudo`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Lil Skies - Nowadays.mp3")
,"CashMoneyAP
Aye, aye, aye
Nowadays Im too cool for a girlfriend
Nowadays I don't know when the world spins
Live your life like we die when the world ends
So it's alright every time we fuckin' break a sin
Nowadays shit's not the same
Life switch lanes, now these hoes act strange
And I lost my grip on the world in bliss
It's so, it's so
Aye, it's so lonely on the east side
I don't give a fuck, I keep it real I'm not gon' let it slide
Now she see me up, she let me fuck
Want me to cum inside?
Broski going dumb, hopped in the car, he said he down to ride
You a little pup, stop playing tough, ain't make no sacrifice
Yeah, smokin' cookie for my appetite
I don't trust nobody, people talking and be telling lies
We just wanna win and shock them all and catch 'em by surprise
I was saucin' down until we up and then we all rise, yeah
But niggas don't stick to the G-code, balling on my haters
I think that I'm stuck in beast mode
Make it through the foul run to the line and make the free throw
I think that I'm D. Rose, do 'em like I'm Deebo
Aye, but I like to fade away
I got these diamonds on me, and these bitches all in my face
And you wanna be a star, and you wanna win the race
But you cannot rock with me 'cause I was caught on the chase
Nowadays I'm too cool for a girlfriend
Nowadays I don't know when the world spins
Live your life like we die when the world ends
So it's alright every time we fuckin' break a sin
Nowadays shit's not the same
Life switch lanes, now these hoes act strange
And I lost my grip on the world in bliss
It's so, it's so
I think it's so damn strange what these people be saying
I can never even listen to a word that they say
I'm on the west side, that's the best side
By the cliff smoking blicks, that's the best high
And I got a shawty with the best eyes
Talking shit girl, why you putting up a fight?
I'm in my own world, far from the satellites
They want my information, they get no conversation
'Cause nowadays everybody calling
I need a manager 'cause I can't really fuck with nobody (I can't really fuck with nobody, so)
Aye, but I like to fade away
I got these diamonds on me, and these bitches all in my face
And you wanna be a star, and you wanna win the race
But you cannot rock with me 'cause I was caught on the chase
Nowadays I'm too cool for a girlfriend
Nowadays I don't know when the world spins
Live your life like we die when the world ends
So it's alright every time we fuckin' break a sin",13);

INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (13,2);


INSERT INTO musica(`conteudo`,`letra`,`idConteudo`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/PNG - DRUGDEALER.mp3")
,"Antes era Drug Dealer
Eu vinha da escolha cheio de droga na mochila
Shawty, para foder comigo as bitches fazem fila
Antes era Drug Dealer
Antes era Drug Dealer
Eu vinha da escolha cheio de droga na mochila
Shawty, para foder comigo as bitches fazem fila
Antes era Drug Dealer

Começei a vender droga com 14
10 anos depois olha pra mim, eu sou cantor
Se eu foder contigo vou-te tornar famosa
Por isso é melhor tu me dares o meu valor
Gang shit, o pirata consеguiu sair do poço
Já passamos por tanto, juro vai ser tudo nosso
Meti a puta a chupar, e еla engasgou-se
Mas não parou, that’s how i know she a boss
Sei que ela é pro a fazer blowjobs
Já não vendo droga tou a viver melhor
Dentro do corsa, mas saio dele cada vez com mais notas
Aos 15 anos a primeira mota
Passado duas semanas troquei-a por droga
Portanto se não gostas podes ir embora
Se não for dinheiro, o assunto não importa

3k’s numa week, what you know about that?
Eu já vi tanto guito, viciei-me em contar cash
Duas bitches na minha dick, Thats a whole lotta ass
They be twerkin’ to the beat, porque o guito vem fast
Tu és um broke boy, yah bitch I said that
Tou a chegar ao topo, e a tua click where they at?
Se ela me deu topo, foi só troco, não é payback
Mas isso não é new shit, goes like way back
Tava só na school a ver notas
I’m talking about cash, não é provas
Trynna get them dollars
Eu trouxe weed e mais umas ten bottles
Eu não quero essa bitch, i just want them models
Bora
Eu vejo clown nesses boys a tentar me tocar
Tipo q o clout desse boy n apareçeu do ar
Eu tou sempre no estudio com o tele a soar
Não é só atuar, que eu tou a somar
Tou com hoes tipo casa da playboy
Tu queres conflito, I’m like fuck what you say boy
Click tá com guito, eu só conto aos 100
Isso tá bom beat, but you sound all the same
Vi a tua bitch lá na festa , q-queres câos
Nem se veio orientar, mesmo assim levou 10 paus
Tu sempre foste soft, why you acting so wreck now?
Baby tá no spot, and she’s screaming so damn loud

Antes era Drug Dealer
Eu vinha da escolha cheio de droga na mochila
Shawty, para foder comigo as bitches fazem fila
Antes era Drug Dealer
Antes era Drug Dealer
Eu vinha da escolha cheio de droga na mochila
Shawty, para foder comigo as bitches fazem fila
Antes era Drug Dealer

Eu tou com os meus slimes a fazer fumaça
Dentro d’uma nave a viajar para o espaço
Tu mandas a branca que a gente traça
Eu não pago as putas, foi duas de graça
Tenho um cartão de credito que nunca me abandona
Sou fiel ao gang como o Messi e o Barcelona
Se a morte chegar, eu tou ready para ir embora
Se a morte chegar, eu tou ready para ir embora
Parte uma ganza da placa
Abre mais uma garrafa
Combino ouro com prata
Não visto roupa barata
Se há problema a gente trata
Baby girl não sejas chata
Tou c’o Alex e o Pirata
Tou c’o Alex e o Pirata
Entro na after party eu tive com o diabo
Assinei o contrato, fizemos um pacto baseado em lealdade
Mas eu não lhe devo nada, cumpri a minha parte, ‘tou a ir p’ra outro lugar

Antes era Drug Dealer
Eu vinha da escolha cheio de droga na mochila
Shawty, para foder comigo as bitches fazem fila
Antes era Drug Dealer
Antes era Drug Dealer
Eu vinha da escolha cheio de droga na mochila
Shawty, para foder comigo as bitches fazem fila
Antes era Drug Dealer",14);

INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (14,3);

INSERT INTO musica(`conteudo`,`letra`,`idConteudo`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Bones - heldaghost.mp3")
,"I've held a ghost
And it slipped through my fingertips
I've lost all hope
I want nothing to do with this
If we don't leave
We will burn with this town
If everything was everything
I would never have to worry about anything
I've held a ghost
And it slipped through my fingertips
And I worry about you
And I worry about you
I don't know why you're doing it
But it's not good and it's not healthy- it's not right
Not that I'm saying you don't have it together, I'm sure you do
You're a genius, you really are. You're a genius
I know",15);

INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (15,4);

INSERT INTO musica(`conteudo`,`letra`,`idConteudo`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Smells Like Teen Spirit Nirvana.mp3"),"
Load up on guns, bring your friends
It's fun to lose and to pretend
She's over-bored and self-assured
Oh no, I know a dirty word
Hello, hello, hello, how low
Hello, hello, hello, how low
Hello, hello, hello, how low
Hello, hello, hello
With the lights out, it's less dangerous
Here we are now, entertain us
I feel stupid and contagious
Here we are now, entertain us
A mulatto, an albino, a mosquito, my libido
Yeah, hey
I'm worse at what I do best
And for this gift I feel blessed
Our little group has always been
And always will until the end
Hello, hello, hello, how low
Hello, hello, hello, how low
Hello, hello, hello, how low
Hello, hello, hello
With the lights out, it's less dangerous
Here we are now, entertain us
I feel stupid and contagious
Here we are now, entertain us
A mulatto, an albino, a mosquito, my libido
Yeah, hey
And I forget just why I taste
Oh yeah, I guess it makes me smile
I found it hard, it's hard to find
Oh well, whatever, never mind
Hello, hello, hello, how low
Hello, hello, hello, how low
Hello, hello, hello, how low
Hello, hello, hello
With the lights out, it's less dangerous
Here we are now, entertain us
I feel stupid and contagious
Here we are now, entertain us
A mulatto, an albino, a mosquito, my libido
A denial, a denial, a denial, a denial, a denial
A denial, a denial, a denial, a denial",27);

INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (27,20);

INSERT INTO musica(`conteudo`,`letra`,`idConteudo`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Lithium.mp3"),"
I'm so happy
'Cause today I found my friends
They're in my head, I'm so ugly
That's okay 'cause so are you
Broke our mirrors
Sunday morning is everyday for all I care
And I'm not scared, light my candles
In a daze 'cause I've found God
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah, yeah
I'm so lonely
That's okay, I shaved my head
And I'm not sad and just maybe
I'm to blame for all I've heard
I'm not sure, I'm so excited
I can't wait to meet you there
And I don't care, I'm so horny
That's okay, my will is good
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah, yeah
I like it, I'm not gonna crack
I miss you, I'm not gonna crack
I love you, I'm not gonna crack
I killed you, I'm not gonna crack
I like it, I'm not gonna crack
I miss you, I'm not gonna crack
I love you, I'm not gonna crack
I killed you, I'm not gonna crack
I'm so happy
'Cause today I found my friends
In my head, I'm so ugly
That's okay 'cause so are you
Broke our mirrors
Sunday morning is everyday for all I care
And I'm not scared
Light my candles in a daze
'Cause I've found God
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah
Yeah, yeah, yeah, yeah, yeah
I like it, I'm not gonna crack
I miss you, I'm not gonna crack
I love you, I'm not gonna crack
I killed you, I'm not gonna crack
I like it, I'm not gonna crack
I miss you, I'm not gonna crack
I love you, I'm not gonna crack
I killed you, I'm not gonna crack",28);

INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (28,20);

INSERT INTO musica(`conteudo`,`letra`,`idConteudo`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Three Days Grace - Get Out Alive.mp3"),"
No time for goodbye, he said
As he faded away
Don't put your life in someone's hands
They're bound to steal it away
Don't hide your mistakes
'Cause they'll find you, burn you
Then he said
If you want to get out alive
Run for your life
If you want to get out alive
Run for your life
This is my last time, she said
As she faded away
It's hard to imagine
But one day you'll end up like me
Then she said
If you want to get out alive
Oh oh run for your life
If you want to get out alive
Oh oh run for your life
If you want to get out alive (if you want to get out alive)
Oh oh run for your life (life)
If you want to get out alive (if you want to get out alive)
Oh oh run for your life
If I stay, it won't be long
Till I'm burning on the inside
If I go, I can only hope
That I make it to the other side
If you want to get out alive
Oh oh run for your life
If you want to get out alive
Hold on for your life
If you want to get out alive (if you want to get out alive)
Oh oh run for your life
If you want to get out alive (if you want to get out alive)
Hold on for your life
If I stay, it won't be long
Till I'm burning on the inside
If I go, I can only hope
That I make it to the other side
If I stay, it won't be long
Till I'm burning on the inside
If I go, if I go
Burning on the inside
Burning on the inside
Burning on the inside",29);

INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (29,15);

INSERT INTO musica(`conteudo`,`letra`,`idConteudo`)VALUES(load_file("C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Eminem - Rap God.mp3"),"
Look, I was gonna go easy on you
Not to hurt your feelings
But I'm only going to get this one chance
Something's wrong, I can feel it
(Six minutes)
Just a feeling I've got
Like something's about to happen
But I don't know what
If that means what I think it means
We're in trouble, big trouble
And if he is as bananas as you say
I'm not taking any chances
You are just what the doc ordered
I'm beginnin' to feel like a Rap God, Rap God
All my people from the front to the back nod, back nod
Now, who thinks their arms are long enough
To slap box, slap box?
They said I rap like a robot, so call me Rap-bot
But for me to rap like a computer
It must be in my genes
I got a laptop in my back pocket
My pen'll go off when I half-cock it
Got a fat knot from that rap profit
Made a livin' and a killin' off it
Ever since Bill Clinton was still in office
With Monica Lewinsky feelin' on his nutsack
I'm an MC still as honest
But as rude and as indecent as all hell
Syllables, skill-a-holic (Kill 'em all with)
This flippity dippity-hippity hip-hop
You don't really wanna get into a pissin' match
With this rappity brat, packin' a MAC
In the back of the Ac'
Backpack rap crap, yap-yap, yackety-yack
And at the exact same time
I attempt these lyrical acrobat stunts
While I'm practicin' that
I'll still be able to break a motherfuckin' table
Over the back of a couple of faggots and crack it in half
Only realized it was ironic
I was signed to Aftermath after the fact
How could I not blow?
All I do is drop F-bombs
Feel my wrath of attack
Rappers are havin' a rough time period
Here's a maxi pad
It's actually disastrously bad for the wack
While I'm masterfully constructing this masterpiece as
'Cause I'm beginnin' to feel like a Rap God, Rap God
All my people from the front to the back nod, back nod
Now, who thinks their arms are long enough to slap box, slap box?
Let me show you maintainin' this shit ain't that hard, that hard
Everybody wants the key and the secret
To rap immortality like Ι have got
Well, to be truthful the blueprint's
Simply rage and youthful exuberance
Everybody loves to root for a nuisance
Hit the Earth like an asteroid
Did nothing but shoot for the Moon since (Pew!)
MCs get taken to school with this music
'Cause I use it as a vehicle to 'bus the rhyme'
Now I lead a new school full of students
Me? I'm a product of Rakim
Lakim Shabazz, 2Pac, N.W.A, Cube, hey Doc, Ren
Yella, Eazy, thank you, they got Slim
Inspired enough to one day grow up
Blow up and be in a position
To meet Run–D.M.C., induct them
Into the motherfuckin' Rock and Roll Hall of Fame
Even though I'll walk in the church
And burst in a ball of flames
Only Hall of Fame I'll be inducted in
Is the alcohol of fame
On the wall of shame
You fags think it's all a game
'Til I walk a flock of flames
Off a plank and, tell me what in the fuck are you thinkin'?
Little gay-lookin' boy
So gay I can barely say it with a straight face
Lookin' boy (Ha-ha!)
You're witnessin' a massacre
Like you're watching a church gathering take place, lookin' boy
'Oy vey, that boy's gay!'—that's all they say, lookin' boy
You get a thumbs up, pat on the back
And a 'way to go' from your label every day, lookin' boy
Hey, lookin' boy! What you say, lookin' boy?
I get a 'hell yeah' from Dre, lookin' boy
I'ma work for everything I have
Never asked nobody for shit
Get outta my face, lookin' boy!
Basically, boy, you're never gonna be capable
Of keepin' up with the same pace, lookin' boy, 'cause—
I'm beginnin' to feel like a Rap God, Rap God
All my people from the front to the back nod, back nod
The way I'm racin' around the track
Call me NASCAR, NASCAR
Dale Earnhardt of the trailer park, the White Trash God
Kneel before General Zod
This planet's Krypton—no, Asgard, Asgard
So you'll be Thor, I'll be Odin
You rodent, I'm omnipotent
Let off, then I'm reloadin'
Immediately with these bombs, I'm totin'
And I should not be woken
I'm the walkin' dead, but I'm just a talkin' head
A zombie floatin'
But I got your mom deep-throatin'
I'm out my Ramen Noodle
We have nothin' in common, poodle
I'm a Doberman, pinch yourself in the arm
And pay homage, pupil
It's me, my honesty's brutal
But it's honestly futile if I don't
Utilize what I do though
For good at least once in a while
So I wanna make sure somewhere in this
Chicken scratch I scribble and doodle enough rhymes
To maybe try to help get some people through tough times
But I gotta keep a few punchlines
Just in case, 'cause even you unsigned
Rappers are hungry lookin' at me like it's lunchtime
I know there was a time where once I
Was king of the underground
But I still rap like I'm on my Pharoah Monch grind
So I crunch rhymes, but sometimes when you combine
Appeal with the skin color of mine
You get too big and here they come tryin'
To censor you like that one line
I said on 'I'm Back' from The Mathers LP 1 when I
Tried to say I'll take seven kids from Columbine
Put 'em all in a line, add an AK-47, a revolver and a 9
See if I get away with it now
That I ain't as big as I was, but I'm
Morphin' into an immortal, comin' through the portal
You're stuck in a time warp from 2004 though
And I don't know what the fuck that you rhyme for
You're pointless as Rapunzel with fuckin' cornrows
You write normal? Fuck being normal!
And I just bought a new raygun from the future
Just to come and shoot ya, like when Fabolous made Ray J mad
'Cause Fab said he looked like a fag at Mayweather's pad
Singin' to a man while he played piano
Man, oh man, that was a 24-7 special on the cable channel
So Ray J went straight to the radio station
The very next day, 'Hey Fab, I'ma kill you!'
Lyrics comin' at you at supersonic speed (J.J. Fad)
Uh, summa-lumma, dooma-lumma, you assumin' I'm a human
What I gotta do to get it through to you I'm superhuman?
Innovative and I'm made of rubber
So that anything you say is ricochetin' off of me
And it'll glue to you and
I'm devastating, more than ever demonstrating
How to give a motherfuckin' audience
A feeling like it's levitating
Never fading, and I know the haters are forever waiting
For the day that they can say I fell off, they'll be celebrating
'Cause I know the way to get 'em motivated
I make elevating music, you make elevator music
'Oh, he's too mainstream.'
Well, that's what they do when they get jealous
They confuse it
'It's not hip-hop, it's pop, —'cause I found a hella way to fuse it
With rock, shock rap with Doc
Throw on 'Lose Yourself' and make 'em lose it
I don't know how to make songs like that
I don't know what words to use.
Let me know when it occurs to you
While I'm rippin' any one of these
S that versus you
It's curtains, I'm inadvertently hurtin' you
How many verses I gotta murder to
Prove that if you were half as nice
Your songs you could sacrifice virgins too?
Ugh, school flunky, pill junkie
But look at the accolades these skills brung me
Full of myself, but still hungry
I bully myself 'cause I make me do
What I put my mind to
And I'm a million leagues above you
Ill when I speak in tongues
But it's still tongue-in-cheek fuck you
I'm drunk, so, Satan, take the fucking wheel
I'ma sleep in the front seat
Bumpin' Heavy D and the Boyz
Still 'Chunky but Funky'
But in my head there's something
I can feel tugging and struggling
Angels fight with devils
And here's what they want from me
They're askin' me to eliminate some of the women hate
But if you take into consideration the bitter hatred
I have, then you may be a little patient
And more sympathetic to the situation
And understand the discrimination
But fuck it, life's handin' you lemons?
Make lemonade then!
But if I can't batter the women
How the fuck am I supposed to bake them a cake then?
Don't mistake him for Satan; it's a fatal mistake
If you think I need to be overseas and take a vacation
To trip a broad, and make her fall on her face and
Don't be a retard — Be a king? Think not
Why be a king when you can be a God?",30);

INSERT INTO artista_participante(`idConteudo`,`idArtista`) VALUES (30,9);


#POEMAS
INSERT INTO poema(`conteudo`,`idConteudo`, `idArtista`)VALUES('
Ó mar salgado, quanto do teu sal<br>
São lágrimas de Portugal!<br>
Por te cruzarmos, quantas mães choraram,<br>
Quantos filhos em vão rezaram!<br>
Quantas noivas ficaram por casar<br>
Para que fosses nosso, ó mar!<br>
<br>
Valeu a pena? Tudo vale a pena<br>
Se a alma não é pequena.<br>
Quem quer passar além do Bojador<br>
Tem que passar além da dor,<br>
Deus ao mar o perigo e o abismo deu,<br>
Mas nele é que espelhou o céu.',16,58);
INSERT INTO poema(`conteudo`,`idConteudo`, `idArtista`)VALUES('
Aqui nesta praia onde<br>
Não há nenhum vestígio de impureza,<br>
Aqui onde há somente<br>
Ondas tombando initerruptamente,<br>
Puro espaço e lúcida unidade,<br>
Aqui o tempo apaixonadamente<br>
Encontra a própria liberdade.',17,59);
INSERT INTO poema(`conteudo`,`idConteudo`, `idArtista`)VALUES('
Saudades! Sim, talvez e porque não?...<br>
Se o sonho foi tão alto e forte<br>
Que pensara vê-lo até à morte<br>
Deslumbrar-me de luz o coração!<br>
<br>
Esquecer! Para quê?... Ah, como é vão<br>
Que tudo isso, Amor, nos não importe<br>
Se ele deixou beleza que conforte<br>
Deve-nos ser sagrado como o pão.<br>
<br>
Quantas vezes, Amor, já te esqueci,<br>
Para mais doidamente me lembrar<br>
Mais decididamente me lembrar de ti!<br>
<br>
E quem me dera que fosse sempre assim:<br>
Quanto menos quisesse recordar<br>
Mais saudade andasse presa a mim',18,60);
INSERT INTO poema(`conteudo`,`idConteudo`, `idArtista`)VALUES('
A névoa involve a montanha,<br>
Húmido, um frio desceu.<br>
O que é esta mágoa estranha<br>
Que o coração me prendeu?<br>
<br>
Parece ser a tristeza<br>
De alguém de quem sou actor,<br>
Com fantasiada viveza<br>
Tornada já minha dor.<br>
<br>
Mas, não sei porquê, me dói\<br>
Qual se fora eu a ilusão;<br>
E há névoa em tudo o que foi<br>
E frio em meu coração.',19,58);
INSERT INTO poema(`conteudo`,`idConteudo`, `idArtista`)VALUES('
Cerca de grandes muros quem te sonhas.<br>
Depois, onde é visível o jardim<br>
Através do portão de grade dada,<br>
Põe quantas flores são as mais risonhas,<br>
Para que te conheçam só assim.<br>
Onde ninguém o vir não ponhas nada.<br>
<br>
Faze canteiros como os que outros têm,<br>
Onde os olhares possam entrever<br>
O teu jardim como lho vais mostrar.<br>
Mas onde és teu, e nunca o vê ninguém,<br>
Deixa as flores que vêm do chão crescer<br>
E deixa as ervas naturais medrar.<br>
<br>
Faze de ti um duplo ser guardado;<br>
E que ninguém, que veja e fite, possa<br>
Saber mais que um jardim de quem tu és –<br>
Um jardim ostensivo e reservado,<br>
Por trás do qual a flor nativa roça<br>
A erva tão pobre que nem tu a vês…',20,58);


#---------------------------------------------------------------------------------------------------------------------------------------------

#COMENTARIO

#------------------------------------------------------------------------------------------------------------------------------------------------



INSERT INTO comentario (`texto`,`data`,`idConteudo`,`idUtilizador`) VALUES ('Gosto muito','2019-06-23',1,1);
INSERT INTO comentario (`texto`,`data`,`idConteudo`,`idUtilizador`) VALUES ('Podia estar melhor','2019-06-24',2,1);
INSERT INTO comentario (`texto`,`data`,`idConteudo`,`idUtilizador`) VALUES ('Está porreiro','2019-06-23',1,2);
INSERT INTO comentario (`texto`,`data`,`idConteudo`,`idUtilizador`) VALUES ('Está um bocado escuro','2019-06-25',1,3);
INSERT INTO comentario (`texto`,`data`,`idConteudo`,`idUtilizador`) VALUES ('Um foco um bocado mau','2019-06-25',2,3);
INSERT INTO comentario (`texto`,`data`,`idConteudo`,`idUtilizador`) VALUES ('Ganda praia','2019-06-25',1,3);
INSERT INTO comentario (`texto`,`data`,`idConteudo`,`idUtilizador`) VALUES ('Muito amarelo','2019-06-25',1,4);
INSERT INTO comentario (`texto`,`data`,`idConteudo`,`idUtilizador`) VALUES ('As cores do céu estão interessantes','2019-06-25',4,1);
INSERT INTO comentario (`texto`,`data`,`idConteudo`,`idUtilizador`) VALUES ('As cabanas são muito pequenas','2019-06-25',4,2);

#---------------------------------------------------------------------------------------------------------------------------------------------

#CLASSIFICAO

#------------------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO classificacao (`idConteudo`,`idUtilizador`,`valor`,`data`) VALUES (1,1,8,'2019-06-22'),(1,2,8,'2019-06-25'),(1,3,7,'2019-06-23'),(1,4,7,'2019-06-25'),
(2,1,8,'2019-06-24'),(3,2,10,'2019-06-25'),(3,3,9,'2019-06-25'),(3,4,9,'2019-06-25');

INSERT INTO classificacao (`idConteudo`,`idUtilizador`,`valor`,`data`) VALUES (5,1,10,'2020-06-22'),(5,2,9,'2020-06-22'),(5,3,10,'2020-06-22'),(5,4,10,'2020-06-22'),(4,2,7,'2020-01-03'),(15,5,6,'2019-06-23'),(13,4,7,'2019-06-25'),
(6,1,8,'2019-06-24'),(6,2,7,'2019-06-24'),(10,2,3,'2019-06-25'),(9,4,4,'2019-06-25'),(8,3,4,'2019-06-25'),(7,5,6,'2019-06-25'),(11,5,2,'2019-06-25'),(17,5,6,'2019-06-25'),(17,1,9,'2019-06-25');
