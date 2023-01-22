#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    CREATE DATABASE arquitetura_core;
    \c arquitetura_core;
    CREATE SCHEMA arquitetura_core;
	GRANT ALL PRIVILEGES ON DATABASE arquitetura_core TO postgres;
EOSQL

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "arquitetura_core" <<-EOSQL
    \c arquitetura_core; 


/*
 Navicat Premium Data Transfer

 Source Server         : Database
 Source Server Type    : PostgreSQL
 Source Server Version : 150001 (150001)
 Source Host           : localhost:5432
 Source Catalog        : arquitetura_core
 Source Schema         : arquitetura_core

 Target Server Type    : PostgreSQL
 Target Server Version : 150001 (150001)
 File Encoding         : 65001

 Date: 22/01/2023 13:57:05
*/


-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_core"."categories";
CREATE TABLE "arquitetura_core"."categories" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "active" bool NOT NULL DEFAULT true
)
;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO "arquitetura_core"."categories" VALUES ('e1e068ac-ddc1-46ae-9500-3b76850c5017', 'Roupas', 't');
INSERT INTO "arquitetura_core"."categories" VALUES ('b4dcacc8-78c1-4695-9386-104337f642e1', 'Calçados', 't');
INSERT INTO "arquitetura_core"."categories" VALUES ('189e06bf-4de8-48cf-87af-6e4da8788e3e', 'Brinquedos', 't');
INSERT INTO "arquitetura_core"."categories" VALUES ('6f115ce0-91fa-4942-a82e-4dd108c4c4bb', 'Cama, Mesa e Banho', 't');

-- ----------------------------
-- Table structure for cities
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_core"."cities";
CREATE TABLE "arquitetura_core"."cities" (
  "id" int4 NOT NULL,
  "id_district" int4 NOT NULL,
  "name" varchar(250) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of cities
-- ----------------------------
INSERT INTO "arquitetura_core"."cities" VALUES (1, 1, 'Castelo de Paiva');
INSERT INTO "arquitetura_core"."cities" VALUES (2, 1, 'Espinho');
INSERT INTO "arquitetura_core"."cities" VALUES (3, 1, 'Estarreja');
INSERT INTO "arquitetura_core"."cities" VALUES (4, 1, 'Santa Maria da Feira');
INSERT INTO "arquitetura_core"."cities" VALUES (5, 1, 'Ílhavo');
INSERT INTO "arquitetura_core"."cities" VALUES (7, 1, 'Murtosa');
INSERT INTO "arquitetura_core"."cities" VALUES (6, 1, 'Mealhada');
INSERT INTO "arquitetura_core"."cities" VALUES (8, 1, 'Oliveira de Azeméis');
INSERT INTO "arquitetura_core"."cities" VALUES (9, 1, 'Oliveira do Bairro');
INSERT INTO "arquitetura_core"."cities" VALUES (10, 1, 'Ovar');
INSERT INTO "arquitetura_core"."cities" VALUES (11, 1, 'São João da Madeira');
INSERT INTO "arquitetura_core"."cities" VALUES (12, 1, 'Sever do Vouga');
INSERT INTO "arquitetura_core"."cities" VALUES (13, 1, 'Vagos');
INSERT INTO "arquitetura_core"."cities" VALUES (14, 1, 'Vale de Cambra');
INSERT INTO "arquitetura_core"."cities" VALUES (15, 1, 'Águeda');
INSERT INTO "arquitetura_core"."cities" VALUES (16, 1, 'Albergaria-a-Velha');
INSERT INTO "arquitetura_core"."cities" VALUES (17, 1, 'Anadia');
INSERT INTO "arquitetura_core"."cities" VALUES (18, 1, 'Arouca');
INSERT INTO "arquitetura_core"."cities" VALUES (19, 1, 'Aveiro');
INSERT INTO "arquitetura_core"."cities" VALUES (20, 2, 'Castro Verde');
INSERT INTO "arquitetura_core"."cities" VALUES (21, 2, 'Cuba');
INSERT INTO "arquitetura_core"."cities" VALUES (22, 2, 'Ferreira do Alentejo');
INSERT INTO "arquitetura_core"."cities" VALUES (23, 2, 'Mértola');
INSERT INTO "arquitetura_core"."cities" VALUES (24, 2, 'Moura');
INSERT INTO "arquitetura_core"."cities" VALUES (25, 2, 'Odemira');
INSERT INTO "arquitetura_core"."cities" VALUES (26, 2, 'Ourique');
INSERT INTO "arquitetura_core"."cities" VALUES (27, 2, 'Serpa');
INSERT INTO "arquitetura_core"."cities" VALUES (28, 2, 'Vidigueira');
INSERT INTO "arquitetura_core"."cities" VALUES (29, 2, 'Aljustrel');
INSERT INTO "arquitetura_core"."cities" VALUES (30, 2, 'Almodôvar');
INSERT INTO "arquitetura_core"."cities" VALUES (31, 2, 'Alvito');
INSERT INTO "arquitetura_core"."cities" VALUES (32, 2, 'Barrancos');
INSERT INTO "arquitetura_core"."cities" VALUES (33, 2, 'Beja');
INSERT INTO "arquitetura_core"."cities" VALUES (34, 3, 'Esposende');
INSERT INTO "arquitetura_core"."cities" VALUES (35, 3, 'Fafe');
INSERT INTO "arquitetura_core"."cities" VALUES (36, 3, 'Guimarães');
INSERT INTO "arquitetura_core"."cities" VALUES (37, 3, 'Póvoa de Lanhoso');
INSERT INTO "arquitetura_core"."cities" VALUES (38, 3, 'Terras de Bouro');
INSERT INTO "arquitetura_core"."cities" VALUES (39, 3, 'Vieira do Minho');
INSERT INTO "arquitetura_core"."cities" VALUES (40, 3, 'Vila Nova de Famalicão');
INSERT INTO "arquitetura_core"."cities" VALUES (41, 3, 'Vila Verde');
INSERT INTO "arquitetura_core"."cities" VALUES (42, 3, 'Vizela');
INSERT INTO "arquitetura_core"."cities" VALUES (43, 3, 'Amares');
INSERT INTO "arquitetura_core"."cities" VALUES (44, 3, 'Barcelos');
INSERT INTO "arquitetura_core"."cities" VALUES (45, 3, 'Braga');
INSERT INTO "arquitetura_core"."cities" VALUES (46, 3, 'Cabeceiras de Basto');
INSERT INTO "arquitetura_core"."cities" VALUES (47, 3, 'Celorico de Basto');
INSERT INTO "arquitetura_core"."cities" VALUES (48, 4, 'Miranda do Douro');
INSERT INTO "arquitetura_core"."cities" VALUES (49, 4, 'Mirandela');
INSERT INTO "arquitetura_core"."cities" VALUES (50, 4, 'Mogadouro');
INSERT INTO "arquitetura_core"."cities" VALUES (51, 4, 'Torre de Moncorvo');
INSERT INTO "arquitetura_core"."cities" VALUES (52, 4, 'Vila Flor');
INSERT INTO "arquitetura_core"."cities" VALUES (53, 4, 'Vimioso');
INSERT INTO "arquitetura_core"."cities" VALUES (54, 4, 'Vinhais');
INSERT INTO "arquitetura_core"."cities" VALUES (55, 4, 'Alfândega da Fé');
INSERT INTO "arquitetura_core"."cities" VALUES (56, 4, 'Bragança');
INSERT INTO "arquitetura_core"."cities" VALUES (57, 4, 'Carrazeda de Ansiães');
INSERT INTO "arquitetura_core"."cities" VALUES (58, 4, 'Freixo de Espada à Cinta');
INSERT INTO "arquitetura_core"."cities" VALUES (59, 4, 'Macedo de Cavaleiros');
INSERT INTO "arquitetura_core"."cities" VALUES (60, 5, 'Oleiros');
INSERT INTO "arquitetura_core"."cities" VALUES (61, 5, 'Penamacor');
INSERT INTO "arquitetura_core"."cities" VALUES (62, 5, 'Proença-a-Nova');
INSERT INTO "arquitetura_core"."cities" VALUES (63, 5, 'Sertã');
INSERT INTO "arquitetura_core"."cities" VALUES (64, 5, 'Vila de Rei');
INSERT INTO "arquitetura_core"."cities" VALUES (65, 5, 'Vila Velha de Ródão');
INSERT INTO "arquitetura_core"."cities" VALUES (66, 5, 'Belmonte');
INSERT INTO "arquitetura_core"."cities" VALUES (67, 5, 'Castelo Branco');
INSERT INTO "arquitetura_core"."cities" VALUES (68, 5, 'Covilhã');
INSERT INTO "arquitetura_core"."cities" VALUES (69, 5, 'Fundão');
INSERT INTO "arquitetura_core"."cities" VALUES (70, 5, 'Idanha-a-Nova');
INSERT INTO "arquitetura_core"."cities" VALUES (71, 6, 'Góis');
INSERT INTO "arquitetura_core"."cities" VALUES (72, 6, 'Lousã');
INSERT INTO "arquitetura_core"."cities" VALUES (73, 6, 'Mira');
INSERT INTO "arquitetura_core"."cities" VALUES (74, 6, 'Miranda do Corvo');
INSERT INTO "arquitetura_core"."cities" VALUES (75, 6, 'Montemor-o-Velho');
INSERT INTO "arquitetura_core"."cities" VALUES (76, 6, 'Oliveira do Hospital');
INSERT INTO "arquitetura_core"."cities" VALUES (77, 6, 'Pampilhosa da Serra');
INSERT INTO "arquitetura_core"."cities" VALUES (78, 6, 'Penacova');
INSERT INTO "arquitetura_core"."cities" VALUES (79, 6, 'Penela');
INSERT INTO "arquitetura_core"."cities" VALUES (80, 6, 'Soure');
INSERT INTO "arquitetura_core"."cities" VALUES (81, 6, 'Tábua');
INSERT INTO "arquitetura_core"."cities" VALUES (82, 6, 'Vila Nova de Poiares');
INSERT INTO "arquitetura_core"."cities" VALUES (83, 6, 'Arganil');
INSERT INTO "arquitetura_core"."cities" VALUES (84, 6, 'Cantanhede');
INSERT INTO "arquitetura_core"."cities" VALUES (85, 6, 'Coimbra');
INSERT INTO "arquitetura_core"."cities" VALUES (86, 6, 'Condeixa-a-Nova');
INSERT INTO "arquitetura_core"."cities" VALUES (87, 6, 'Figueira da Foz');
INSERT INTO "arquitetura_core"."cities" VALUES (88, 7, 'Montemor-o-Novo');
INSERT INTO "arquitetura_core"."cities" VALUES (89, 7, 'Mora');
INSERT INTO "arquitetura_core"."cities" VALUES (90, 7, 'Mourão');
INSERT INTO "arquitetura_core"."cities" VALUES (91, 7, 'Portel');
INSERT INTO "arquitetura_core"."cities" VALUES (92, 7, 'Redondo');
INSERT INTO "arquitetura_core"."cities" VALUES (93, 7, 'Reguengos de Monsaraz');
INSERT INTO "arquitetura_core"."cities" VALUES (94, 7, 'Vendas Novas');
INSERT INTO "arquitetura_core"."cities" VALUES (95, 7, 'Viana do Alentejo');
INSERT INTO "arquitetura_core"."cities" VALUES (96, 7, 'Vila Viçosa');
INSERT INTO "arquitetura_core"."cities" VALUES (97, 7, 'Alandroal');
INSERT INTO "arquitetura_core"."cities" VALUES (98, 7, 'Arraiolos');
INSERT INTO "arquitetura_core"."cities" VALUES (99, 7, 'Borba');
INSERT INTO "arquitetura_core"."cities" VALUES (100, 7, 'Estremoz');
INSERT INTO "arquitetura_core"."cities" VALUES (101, 7, 'Évora');
INSERT INTO "arquitetura_core"."cities" VALUES (102, 8, 'Lagoa (Algarve)');
INSERT INTO "arquitetura_core"."cities" VALUES (103, 8, 'Lagos');
INSERT INTO "arquitetura_core"."cities" VALUES (104, 8, 'Loulé');
INSERT INTO "arquitetura_core"."cities" VALUES (105, 8, 'Monchique');
INSERT INTO "arquitetura_core"."cities" VALUES (106, 8, 'Olhão');
INSERT INTO "arquitetura_core"."cities" VALUES (107, 8, 'Portimão');
INSERT INTO "arquitetura_core"."cities" VALUES (108, 8, 'São Brás de Alportel');
INSERT INTO "arquitetura_core"."cities" VALUES (109, 8, 'Silves');
INSERT INTO "arquitetura_core"."cities" VALUES (110, 8, 'Tavira');
INSERT INTO "arquitetura_core"."cities" VALUES (111, 8, 'Vila do Bispo');
INSERT INTO "arquitetura_core"."cities" VALUES (112, 8, 'Vila Real de Santo António');
INSERT INTO "arquitetura_core"."cities" VALUES (113, 8, 'Albufeira');
INSERT INTO "arquitetura_core"."cities" VALUES (114, 8, 'Alcoutim');
INSERT INTO "arquitetura_core"."cities" VALUES (115, 8, 'Aljezur');
INSERT INTO "arquitetura_core"."cities" VALUES (116, 8, 'Castro Marim');
INSERT INTO "arquitetura_core"."cities" VALUES (117, 8, 'Faro');
INSERT INTO "arquitetura_core"."cities" VALUES (118, 9, 'Gouveia');
INSERT INTO "arquitetura_core"."cities" VALUES (119, 9, 'Guarda');
INSERT INTO "arquitetura_core"."cities" VALUES (120, 9, 'Manteigas');
INSERT INTO "arquitetura_core"."cities" VALUES (121, 9, 'Meda');
INSERT INTO "arquitetura_core"."cities" VALUES (122, 9, 'Pinhel');
INSERT INTO "arquitetura_core"."cities" VALUES (123, 9, 'Sabugal');
INSERT INTO "arquitetura_core"."cities" VALUES (124, 9, 'Seia');
INSERT INTO "arquitetura_core"."cities" VALUES (125, 9, 'Trancoso');
INSERT INTO "arquitetura_core"."cities" VALUES (126, 9, 'Vila Nova de Foz Côa');
INSERT INTO "arquitetura_core"."cities" VALUES (127, 9, 'Aguiar da Beira');
INSERT INTO "arquitetura_core"."cities" VALUES (128, 9, 'Almeida');
INSERT INTO "arquitetura_core"."cities" VALUES (129, 9, 'Celorico da Beira');
INSERT INTO "arquitetura_core"."cities" VALUES (130, 9, 'Figueira de Castelo Rodrigo');
INSERT INTO "arquitetura_core"."cities" VALUES (131, 9, 'Fornos de Algodres');
INSERT INTO "arquitetura_core"."cities" VALUES (132, 10, 'Caldas da Rainha');
INSERT INTO "arquitetura_core"."cities" VALUES (133, 10, 'Castanheira de Pêra');
INSERT INTO "arquitetura_core"."cities" VALUES (134, 10, 'Figueiró dos Vinhos');
INSERT INTO "arquitetura_core"."cities" VALUES (135, 10, 'Leiria');
INSERT INTO "arquitetura_core"."cities" VALUES (136, 10, 'Marinha Grande');
INSERT INTO "arquitetura_core"."cities" VALUES (137, 10, 'Nazaré');
INSERT INTO "arquitetura_core"."cities" VALUES (138, 10, 'Óbidos');
INSERT INTO "arquitetura_core"."cities" VALUES (139, 10, 'Pedrógão Grande');
INSERT INTO "arquitetura_core"."cities" VALUES (140, 10, 'Peniche');
INSERT INTO "arquitetura_core"."cities" VALUES (141, 10, 'Pombal');
INSERT INTO "arquitetura_core"."cities" VALUES (142, 10, 'Porto de Mós');
INSERT INTO "arquitetura_core"."cities" VALUES (143, 10, 'Alcobaça');
INSERT INTO "arquitetura_core"."cities" VALUES (144, 10, 'Alvaiázere');
INSERT INTO "arquitetura_core"."cities" VALUES (145, 10, 'Ansião');
INSERT INTO "arquitetura_core"."cities" VALUES (146, 10, 'Batalha');
INSERT INTO "arquitetura_core"."cities" VALUES (147, 10, 'Bombarral');
INSERT INTO "arquitetura_core"."cities" VALUES (148, 11, 'Lisboa');
INSERT INTO "arquitetura_core"."cities" VALUES (149, 11, 'Loures');
INSERT INTO "arquitetura_core"."cities" VALUES (150, 11, 'Lourinhã');
INSERT INTO "arquitetura_core"."cities" VALUES (151, 11, 'Mafra');
INSERT INTO "arquitetura_core"."cities" VALUES (152, 11, 'Oeiras');
INSERT INTO "arquitetura_core"."cities" VALUES (153, 11, 'Sintra');
INSERT INTO "arquitetura_core"."cities" VALUES (154, 11, 'Sobral de Monte Agraço');
INSERT INTO "arquitetura_core"."cities" VALUES (155, 11, 'Torres Vedras');
INSERT INTO "arquitetura_core"."cities" VALUES (156, 11, 'Vila Franca de Xira');
INSERT INTO "arquitetura_core"."cities" VALUES (157, 11, 'Amadora');
INSERT INTO "arquitetura_core"."cities" VALUES (158, 11, 'Odivelas');
INSERT INTO "arquitetura_core"."cities" VALUES (159, 11, 'Alenquer');
INSERT INTO "arquitetura_core"."cities" VALUES (160, 11, 'Arruda dos Vinhos');
INSERT INTO "arquitetura_core"."cities" VALUES (161, 11, 'Azambuja');
INSERT INTO "arquitetura_core"."cities" VALUES (162, 11, 'Cadaval');
INSERT INTO "arquitetura_core"."cities" VALUES (163, 11, 'Cascais');
INSERT INTO "arquitetura_core"."cities" VALUES (164, 12, 'Crato');
INSERT INTO "arquitetura_core"."cities" VALUES (165, 12, 'Elvas');
INSERT INTO "arquitetura_core"."cities" VALUES (166, 12, 'Fronteira');
INSERT INTO "arquitetura_core"."cities" VALUES (167, 12, 'Gavião');
INSERT INTO "arquitetura_core"."cities" VALUES (168, 12, 'Marvão');
INSERT INTO "arquitetura_core"."cities" VALUES (169, 12, 'Monforte');
INSERT INTO "arquitetura_core"."cities" VALUES (170, 12, 'Nisa');
INSERT INTO "arquitetura_core"."cities" VALUES (171, 12, 'Ponte de Sor');
INSERT INTO "arquitetura_core"."cities" VALUES (172, 12, 'Portalegre');
INSERT INTO "arquitetura_core"."cities" VALUES (173, 12, 'Sousel');
INSERT INTO "arquitetura_core"."cities" VALUES (174, 12, 'Alter do Chão');
INSERT INTO "arquitetura_core"."cities" VALUES (175, 12, 'Arronches');
INSERT INTO "arquitetura_core"."cities" VALUES (176, 12, 'Avis');
INSERT INTO "arquitetura_core"."cities" VALUES (177, 12, 'Campo Maior');
INSERT INTO "arquitetura_core"."cities" VALUES (178, 12, 'Castelo de Vide');
INSERT INTO "arquitetura_core"."cities" VALUES (179, 13, 'Maia');
INSERT INTO "arquitetura_core"."cities" VALUES (180, 13, 'Marco de Canaveses');
INSERT INTO "arquitetura_core"."cities" VALUES (181, 13, 'Matosinhos');
INSERT INTO "arquitetura_core"."cities" VALUES (182, 13, 'Paços de Ferreira');
INSERT INTO "arquitetura_core"."cities" VALUES (183, 13, 'Paredes');
INSERT INTO "arquitetura_core"."cities" VALUES (184, 13, 'Penafiel');
INSERT INTO "arquitetura_core"."cities" VALUES (185, 13, 'Porto');
INSERT INTO "arquitetura_core"."cities" VALUES (186, 13, 'Póvoa de Varzim');
INSERT INTO "arquitetura_core"."cities" VALUES (187, 13, 'Santo Tirso');
INSERT INTO "arquitetura_core"."cities" VALUES (188, 13, 'Valongo');
INSERT INTO "arquitetura_core"."cities" VALUES (189, 13, 'Vila do Conde');
INSERT INTO "arquitetura_core"."cities" VALUES (190, 13, 'Vila Nova de Gaia');
INSERT INTO "arquitetura_core"."cities" VALUES (191, 13, 'Trofa');
INSERT INTO "arquitetura_core"."cities" VALUES (192, 13, 'Amarante');
INSERT INTO "arquitetura_core"."cities" VALUES (193, 13, 'Baião');
INSERT INTO "arquitetura_core"."cities" VALUES (194, 13, 'Felgueiras');
INSERT INTO "arquitetura_core"."cities" VALUES (195, 13, 'Gondomar');
INSERT INTO "arquitetura_core"."cities" VALUES (196, 13, 'Lousada');
INSERT INTO "arquitetura_core"."cities" VALUES (197, 14, 'Cartaxo');
INSERT INTO "arquitetura_core"."cities" VALUES (198, 14, 'Chamusca');
INSERT INTO "arquitetura_core"."cities" VALUES (199, 14, 'Constância');
INSERT INTO "arquitetura_core"."cities" VALUES (200, 14, 'Coruche');
INSERT INTO "arquitetura_core"."cities" VALUES (201, 14, 'Entroncamento');
INSERT INTO "arquitetura_core"."cities" VALUES (202, 14, 'Ferreira do Zêzere');
INSERT INTO "arquitetura_core"."cities" VALUES (203, 14, 'Golegã');
INSERT INTO "arquitetura_core"."cities" VALUES (204, 14, 'Mação');
INSERT INTO "arquitetura_core"."cities" VALUES (205, 14, 'Rio Maior');
INSERT INTO "arquitetura_core"."cities" VALUES (206, 14, 'Salvaterra de Magos');
INSERT INTO "arquitetura_core"."cities" VALUES (207, 14, 'Santarém');
INSERT INTO "arquitetura_core"."cities" VALUES (208, 14, 'Sardoal');
INSERT INTO "arquitetura_core"."cities" VALUES (209, 14, 'Tomar');
INSERT INTO "arquitetura_core"."cities" VALUES (210, 14, 'Torres Novas');

-- ----------------------------
-- Table structure for collectors
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_core"."collectors";
CREATE TABLE "arquitetura_core"."collectors" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "latitude" int4 NOT NULL,
  "longitude" int4 NOT NULL,
  "address" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'A'::text,
  "id_city" int4 NOT NULL
)
;

-- ----------------------------
-- Records of collectors
-- ----------------------------

-- ----------------------------
-- Table structure for districts
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_core"."districts";
CREATE TABLE "arquitetura_core"."districts" (
  "id" int4 NOT NULL,
  "name" varchar(250) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of districts
-- ----------------------------
INSERT INTO "arquitetura_core"."districts" VALUES (1, 'Aveiro');
INSERT INTO "arquitetura_core"."districts" VALUES (2, 'Beja');
INSERT INTO "arquitetura_core"."districts" VALUES (3, 'Braga');
INSERT INTO "arquitetura_core"."districts" VALUES (4, 'Bragança');
INSERT INTO "arquitetura_core"."districts" VALUES (5, 'Castelo Branco');
INSERT INTO "arquitetura_core"."districts" VALUES (6, 'Coimbra');
INSERT INTO "arquitetura_core"."districts" VALUES (7, 'Évora');
INSERT INTO "arquitetura_core"."districts" VALUES (8, 'Faro');
INSERT INTO "arquitetura_core"."districts" VALUES (9, 'Guarda');
INSERT INTO "arquitetura_core"."districts" VALUES (10, 'Leiria');
INSERT INTO "arquitetura_core"."districts" VALUES (11, 'Lisboa');
INSERT INTO "arquitetura_core"."districts" VALUES (12, 'Portalegre');
INSERT INTO "arquitetura_core"."districts" VALUES (13, 'Porto');
INSERT INTO "arquitetura_core"."districts" VALUES (14, 'Santarém');
INSERT INTO "arquitetura_core"."districts" VALUES (15, 'Setúbal');
INSERT INTO "arquitetura_core"."districts" VALUES (16, 'Viana do Castelo');
INSERT INTO "arquitetura_core"."districts" VALUES (17, 'Vila Real');
INSERT INTO "arquitetura_core"."districts" VALUES (18, 'Viseu');
INSERT INTO "arquitetura_core"."districts" VALUES (31, 'Ilha da Madeira');
INSERT INTO "arquitetura_core"."districts" VALUES (32, 'Ilha de Porto Santo');
INSERT INTO "arquitetura_core"."districts" VALUES (41, 'Ilha de Santa Maria');
INSERT INTO "arquitetura_core"."districts" VALUES (42, 'Ilha de São Miguel');
INSERT INTO "arquitetura_core"."districts" VALUES (43, 'Ilha Terceira');
INSERT INTO "arquitetura_core"."districts" VALUES (44, 'Ilha da Graciosa');
INSERT INTO "arquitetura_core"."districts" VALUES (45, 'Ilha de São Jorge');
INSERT INTO "arquitetura_core"."districts" VALUES (46, 'Ilha do Pico');
INSERT INTO "arquitetura_core"."districts" VALUES (47, 'Ilha do Faial');
INSERT INTO "arquitetura_core"."districts" VALUES (48, 'Ilha das Flores');
INSERT INTO "arquitetura_core"."districts" VALUES (49, 'Ilha do Corvo');

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_core"."events";
CREATE TABLE "arquitetura_core"."events" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "active" bool NOT NULL DEFAULT true
)
;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO "arquitetura_core"."events" VALUES ('c0486ad4-8bba-441f-b859-5f635b171f2b', 'Contentor cheio', 't');
INSERT INTO "arquitetura_core"."events" VALUES ('025a4c9c-5d37-4587-944f-b8715b196fde', 'Contentor precisa de manutenção', 't');
INSERT INTO "arquitetura_core"."events" VALUES ('76b00a9a-eb6c-4eee-ba10-7a55dee1a6a8', 'Aviso', 't');
INSERT INTO "arquitetura_core"."events" VALUES ('709667bd-803e-473f-acde-0e588cf52bfe', 'Informação', 't');
INSERT INTO "arquitetura_core"."events" VALUES ('424c30ce-5a53-43bc-b80c-439eb06d2426', 'event new #1', 't');

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_core"."items";
CREATE TABLE "arquitetura_core"."items" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "category_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "active" bool NOT NULL DEFAULT true,
  "reserved" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO "arquitetura_core"."items" VALUES ('287fff2c-7193-46d4-bf07-083e580becfc', 'description item #1', 'e1e068ac-ddc1-46ae-9500-3b76850c5017', 't', 'f');
INSERT INTO "arquitetura_core"."items" VALUES ('1d04760d-0d36-48de-a753-5ce901e12e47', 'description item #2', 'e1e068ac-ddc1-46ae-9500-3b76850c5017', 't', 'f');
INSERT INTO "arquitetura_core"."items" VALUES ('397b0a01-9efb-4e9c-87f5-864bbc338eb1', 'description item #3', 'e1e068ac-ddc1-46ae-9500-3b76850c5017', 't', 'f');
INSERT INTO "arquitetura_core"."items" VALUES ('30c0466e-6c9b-44b7-b3f3-08752621b496', 'description item #4', 'e1e068ac-ddc1-46ae-9500-3b76850c5017', 't', 'f');

-- ----------------------------
-- Table structure for store_categories
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_core"."store_categories";
CREATE TABLE "arquitetura_core"."store_categories" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "store_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "category_id" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of store_categories
-- ----------------------------

-- ----------------------------
-- Table structure for store_items
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_core"."store_items";
CREATE TABLE "arquitetura_core"."store_items" (
  "id" int4 NOT NULL,
  "store_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "item_id" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of store_items
-- ----------------------------

-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_core"."stores";
CREATE TABLE "arquitetura_core"."stores" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "address" text COLLATE "pg_catalog"."default" NOT NULL,
  "latitude" int4 NOT NULL,
  "longitude" int4 NOT NULL,
  "active" bool NOT NULL DEFAULT true,
  "id_city" int4 NOT NULL
)
;

-- ----------------------------
-- Records of stores
-- ----------------------------
INSERT INTO "arquitetura_core"."stores" VALUES ('bde8569a-8254-4bc9-864d-26ab69067865', 'store #2', 'address', 10, 20, 't', 3);
INSERT INTO "arquitetura_core"."stores" VALUES ('749cec25-7446-44fb-932d-e9df8f325fa8', 'store 1 (alterado)', 'address (alterado)', 98, 99, 'f', 3);
INSERT INTO "arquitetura_core"."stores" VALUES ('35f80b90-cb05-48ed-a0a7-c5f6dc00287d', 'store #3', 'address', 10, 20, 't', 3);
INSERT INTO "arquitetura_core"."stores" VALUES ('728a4fa8-1240-4cba-89fe-57abc06932c5', 'store #4', 'address', 10, 20, 't', 3);
INSERT INTO "arquitetura_core"."stores" VALUES ('d3c88e53-1c47-4fdd-96f8-5e15cd738b28', 'store #5', 'address', 10, 20, 't', 3);

-- ----------------------------
-- Indexes structure for table categories
-- ----------------------------
CREATE UNIQUE INDEX "categories_name_key" ON "arquitetura_core"."categories" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table categories
-- ----------------------------
ALTER TABLE "arquitetura_core"."categories" ADD CONSTRAINT "categories_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table cities
-- ----------------------------
CREATE UNIQUE INDEX "cities_name_key" ON "arquitetura_core"."cities" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table cities
-- ----------------------------
ALTER TABLE "arquitetura_core"."cities" ADD CONSTRAINT "pk_id_cities" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table collectors
-- ----------------------------
ALTER TABLE "arquitetura_core"."collectors" ADD CONSTRAINT "collectors_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table districts
-- ----------------------------
CREATE UNIQUE INDEX "districts_name_key" ON "arquitetura_core"."districts" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table districts
-- ----------------------------
ALTER TABLE "arquitetura_core"."districts" ADD CONSTRAINT "pk_id_districts" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table events
-- ----------------------------
CREATE UNIQUE INDEX "events_name_key" ON "arquitetura_core"."events" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table events
-- ----------------------------
ALTER TABLE "arquitetura_core"."events" ADD CONSTRAINT "events_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table items
-- ----------------------------
CREATE UNIQUE INDEX "items_description_key" ON "arquitetura_core"."items" USING btree (
  "description" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table items
-- ----------------------------
ALTER TABLE "arquitetura_core"."items" ADD CONSTRAINT "items_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table store_categories
-- ----------------------------
ALTER TABLE "arquitetura_core"."store_categories" ADD CONSTRAINT "store_categories_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table store_items
-- ----------------------------
ALTER TABLE "arquitetura_core"."store_items" ADD CONSTRAINT "pk_id_store_items" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table stores
-- ----------------------------
ALTER TABLE "arquitetura_core"."stores" ADD CONSTRAINT "stores_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table cities
-- ----------------------------
ALTER TABLE "arquitetura_core"."cities" ADD CONSTRAINT "cities_id_district_fkey" FOREIGN KEY ("id_district") REFERENCES "arquitetura_core"."districts" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table collectors
-- ----------------------------
ALTER TABLE "arquitetura_core"."collectors" ADD CONSTRAINT "collectors_id_city_fkey" FOREIGN KEY ("id_city") REFERENCES "arquitetura_core"."cities" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table items
-- ----------------------------
ALTER TABLE "arquitetura_core"."items" ADD CONSTRAINT "item_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "arquitetura_core"."categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table store_categories
-- ----------------------------
ALTER TABLE "arquitetura_core"."store_categories" ADD CONSTRAINT "store_categories_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "arquitetura_core"."categories" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "arquitetura_core"."store_categories" ADD CONSTRAINT "store_categories_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "arquitetura_core"."stores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table store_items
-- ----------------------------
ALTER TABLE "arquitetura_core"."store_items" ADD CONSTRAINT "store_items_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "arquitetura_core"."items" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "arquitetura_core"."store_items" ADD CONSTRAINT "store_items_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "arquitetura_core"."stores" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table stores
-- ----------------------------
ALTER TABLE "arquitetura_core"."stores" ADD CONSTRAINT "stores_id_city_fkey" FOREIGN KEY ("id_city") REFERENCES "arquitetura_core"."cities" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
    
EOSQL


