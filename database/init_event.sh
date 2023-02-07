#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
	CREATE DATABASE arquitetura_event;
    \c arquitetura_event;
    CREATE SCHEMA arquitetura_event;
	GRANT ALL PRIVILEGES ON DATABASE arquitetura_event TO postgres;
 
EOSQL

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "arquitetura_event" <<-EOSQL
	\c arquitetura_event; 
    
/*
 Navicat Premium Data Transfer

 Source Server         : Database
 Source Server Type    : PostgreSQL
 Source Server Version : 150001 (150001)
 Source Host           : localhost:5432
 Source Catalog        : arquitetura_event
 Source Schema         : arquitetura_event

 Target Server Type    : PostgreSQL
 Target Server Version : 150001 (150001)
 File Encoding         : 65001

 Date: 07/02/2023 19:21:53
*/


-- ----------------------------
-- Table structure for collectors
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_event"."collectors";
CREATE TABLE "arquitetura_event"."collectors" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "address" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'A'::text
)
;

-- ----------------------------
-- Records of collectors
-- ----------------------------
INSERT INTO "arquitetura_event"."collectors" VALUES ('adbfe7cc-9053-45be-8a5d-cf13cd758dd4', 'address 55', 'D');
INSERT INTO "arquitetura_event"."collectors" VALUES ('0ce56fb5-e65d-40f0-a259-986ad6031d4c', 'address 55', 'D');
INSERT INTO "arquitetura_event"."collectors" VALUES ('8df77a3a-7b84-4204-80f5-fe8dad753712', 'address 55', 'D');
INSERT INTO "arquitetura_event"."collectors" VALUES ('345dbc49-71e5-43f5-b5fa-52b7e94306e1', 'address 55', 'D');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e3488f1e-1b3a-4574-8e30-b9df41986fbd', 'Lagos', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('8eac3b88-7974-4270-abe9-8af1ed150936', 'FIÃES', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('1f6e7b5a-7939-4209-8233-0e0bae05b84c', 'Desfeita', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('fe6b85fd-3c18-4f99-ac54-94056ed01f75', 'MOURIZ', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('0215c70c-9a65-4f80-a351-2f74d689368b', 'Aradas', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('f68d29be-f05f-437f-b947-93b7e786c91e', 'Moreira do Rei e Várzea Cova', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('7ef5de52-482c-44b8-9253-8f516e982144', 'Parede', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('fc2e866e-f2b8-4632-9b58-a5ff77e9da91', 'Ouca', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('aae82ab3-e8e2-469b-b1ba-14b103433983', 'Faro', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e2e6e464-08f4-4eaa-abd5-98bf34757c84', 'PALMELA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('86000e53-559f-4d12-aab2-a040d9ed7f0a', 'Costa da Caparica', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('b928d4ee-af81-4a95-b770-07b9c83c0ac8', 'Terramonte', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('8452297a-2cc8-430d-9dff-b4b9d3f4de3a', 'Póvoa de Penafirme', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('98090452-8167-4928-8448-c831a06cc6fc', 'Ferragudo', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('6637c3e0-5af1-416d-a098-f29e614eff0d', 'Serena', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('9e5edf3c-07fc-4268-8fbc-5ea44423a994', 'PAÇOS DE BRANDÃO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('a1f11b9f-67af-47f8-ab60-0ea6be18f671', 'BARCELINHOS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('c5a9de71-8b02-4c2a-85a3-c73b797e9d99', 'Crestelo', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('6062da4c-6168-42c5-8c32-49bcc4c18a3b', 'GONDAR', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e7dbf70a-5ebb-4ea4-975f-303596e0c0ef', 'Camarenal', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('8d458096-da67-432a-a37a-eefd3d1ee19f', 'S. Vicente, Sta Eulália, Barbacena, Vila Fernando, Terrugem, Vila Boim', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('55b56f91-27a8-49c2-908a-d7b6faa3f384', 'CASTELÕES', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('92f1b153-4e3a-4103-a028-45b7f57c6a2a', 'RECAREI', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('8a7e4cef-c3de-481f-88fb-cf48e5c398e9', 'ALTO DO PINTADO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('ba7e1e47-3953-4458-95cb-da39863416e4', 'QUEIMA FERRO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('434705f1-2c14-47f6-8033-bc1e4e8facff', 'TOMAR RUA CORONEL LUIS ANTONIO APARACIO ESCOLA DOS TEMPLARIOS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('7e3bdc9d-a943-45e7-ab75-bcde5cb05fb9', 'BOMBARRAL', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('d5b1481b-e78a-48ff-8b4a-c3d9d6bcb93b', 'Rua Rei Ramiro', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('58930d2e-06d4-4d86-8084-5383c4e57915', 'Arroja', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('5fb4fbd3-a340-4939-b7dd-7912993ff9de', 'ALGÉS, LINDA-A-VELHA E CRUZ QUEBRADA-DAF', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('45b84c82-ce66-48e6-9b66-a3261e17c3a8', 'RAMALDE', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('18648130-e8df-40df-822b-cc2a75acddab', 'BENAVENTE', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('f6dcffe9-5178-45db-8350-40b082993ef6', 'RORIZ', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('4ce51abc-5c8c-4c4e-9353-ea411817640b', 'Laranjeira', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('de4e99a1-8e46-4386-b747-51fd60a67d63', 'Casal dos Claros', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('a813c424-2d9e-4f66-b4a0-250de959bf63', 'Póvoa de Varzim, Beiriz e Argivai', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('c2105570-61ba-4244-9730-fd40736043af', 'AGUALVA E MIRA-SINTRA Av dos Bombeiros Voluntarios Escola Matias Aires', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('88f5f6b9-5192-4091-9c57-ef7bcb059fd2', 'PARQUE Industral de Lagoa', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('10560bac-27cc-48c3-b524-12db6b53cb59', 'São Pedro da Trafaria', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('30cff826-bd2f-442e-97f8-4ebe35d30188', 'ALCOBAÇA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('227587ee-4a2d-48dc-811c-e955c51f10cb', 'PONTINHA E FAMÕES', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e9033b90-7baf-49cd-a2e7-3b4dde99472a', 'R.VILARES-ARCOZELO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('4baef0a5-e671-4dcf-a599-a529d3fd7254', 'AVELEDA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('6779bf1b-9996-4ffa-80d5-e70c88ef80ae', 'TRAVESSA FIGUEIRA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('a5b8d172-ff6e-45e6-ad49-e76c67594cd8', 'BARREIRO E LAVRADIO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('eae387ff-cd9b-4b6b-a19f-5f92b667cf9d', 'SOUTO DA CARPALHOSA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('d51a87c5-29ab-491c-8b8c-820bec61233d', 'UNIÃO DE FREGUESIAS DE MONTE E QUEIMADEL', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('8fa036af-00bd-4e8c-a595-34b07dd79690', 'CABEÇA SANTA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('ceaf7b24-62ea-4c83-abbd-689155f3eb97', 'Ranholas (FA)', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('3381f426-57b0-4b34-9f19-2c1c4023185e', 'São João do Estoril', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('48652e2b-8c56-4766-bf38-84065f3af609', 'MARRAZES', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('7fa7fa7d-5e8d-469e-8216-d50c390ea122', 'AZINHAL', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('fdcfd3b7-bf8e-4000-9fe6-8dd325030a3b', 'Vila de Rei', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('d1fc5024-06ae-412f-ac78-662f52acf137', 'Cacilhas', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('80e49bc5-1d49-4de9-8beb-f9b4746582fc', 'PEDROUÇOS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('d3f261d2-9821-4014-9ee7-183c50d922ee', 'Lagos', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('a02bec80-ee14-4139-b96f-0ae96a1b6209', 'RONFE Av. Monsenhor H. Araujo', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('1962b760-f5c3-46a2-9816-1165b752af5c', 'FERREIROS E GONDIZALVES', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('fbb5793a-5d3d-47ec-a717-0936e36f2db5', 'Fernão Ferro', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('ed568933-4e45-4e1b-8e91-05f4640dff63', 'FAFE', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('7bca50d4-7979-404d-be27-259999c720f8', 'Frechas', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('ed6cc534-531e-4622-9b57-a7c32c9054d2', 'VILA VELHA DE RÓDÃO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('9a49f916-b77f-4ca8-b688-33a6fb61cef5', 'CINFÃES', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e7d2ed58-c989-4555-a670-a13619d35f3b', 'ALCANHÕES', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('a8c94172-dfb3-419b-a9e3-d6d848c34cf4', 'TOMAR TRAVESSA JACOME RATTON - CIRE', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('17e06af2-83c8-403b-9042-70a7287cf652', 'Sº COSME', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('d214d517-6509-47d2-aa41-8eaa7a91d032', 'LARGO DAS EIRAS - CERDEIRA DO COA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('fe70fe49-e3e6-4d45-9dde-cb1afc6b50cd', 'PÓVOA DE LANHOSO (NOSSA SENHORA DO AMPAR', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('56fd1a3b-eec2-486c-a020-5cb48879c137', 'MACEDO DE CAVALEIROS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('42500d42-e703-43d1-abe3-835ef0625fd8', 'UNIÃO DE FREGUESIAS DE FREITAS E VILA CO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('1614b905-63c9-4e71-aebf-36a3cde0bc9d', 'VILA ALVA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('1145bc4a-e889-4387-beec-1f6137e2c089', 'Samardã', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('3b46636b-7b81-4be1-bd47-44b1d613167e', 'LORDELO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('80e7446c-b5b6-43fe-9f59-5fcff3ec2aa2', 'ESPERANÇA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('073c6431-b6b9-43f6-a9c2-1e8c5623999a', 'VALE', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('c3f49b16-0585-4494-9bf6-ae867eb6c16e', 'CORONADO (SÃO ROMÃO E SÃO MAMEDE)', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('962129b2-c5bf-409c-8781-18c408f11954', 'LITEIROS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('4ac72a35-12ca-4759-97af-8122153efd31', 'QUINTA DO CONDE', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('19993e74-31ff-4639-8d12-e515c1857a7f', 'Vila Fria', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('18acc5f5-99a4-4425-9748-37c3a7129256', 'SELMES', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('a434730b-e9a3-4e58-b9c0-85fe165cd71b', 'Moita', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('40934332-b480-470f-b801-b29cdae5920d', 'VIALONGA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('59aaec25-4d4a-432e-8f26-227016d640d6', 'Talheirinhos', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('01798f8f-386e-4536-90bf-42043a9b00ba', 'Ucha', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('03f5a8e9-c332-43f8-96ce-ada1b4d92bda', 'Marmeleira', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('0b08fc04-4fd3-4a68-aafe-4396ce802301', 'VIALONGA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('6a3f396e-1450-472d-a202-6dc912f1f7cc', 'R.PINHAL MIUDO-S.F.MARINHA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('bd832151-6a8a-4358-98fd-b12d72a4945f', 'CARVOEIRA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('5cec6a2b-f049-49be-b1d9-a6b53cc6be79', 'Entroncamento', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('b139940f-918e-4e52-8f24-7702e66fc652', 'VILA VELHA DE RÓDÃO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('72fb6a6b-0397-4bcf-9bb7-618a5c2846be', 'Salicos', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('85a916c1-3850-4837-9ecf-3a37bd140825', 'Cheiras', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('f55bb7ef-11ab-4d9b-93be-606d8389b07a', 'CARVOEIRO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('69571faa-3b7d-4bb6-902d-80ef9f0cd655', 'SÃO VICENTE', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('8bdc04fd-e097-4cf6-9fd0-caeb09a3c467', 'PRADO E REMOÃES', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('4c48977c-5cc1-4fed-939a-3601ab36562a', 'Oliv. Azeméis - Outro Lugar', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('d2f8ae62-419d-47f4-b321-30cebfb5607e', 'NABAIS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('cf3ecb27-82f4-40fb-8a25-013522728774', 'BENEDITA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e6d1f1c3-bf21-4769-94f6-b4939899c7bb', 'MILHARADO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('5e03407c-dade-4bd4-b34c-3afdb89b2f5e', 'Alva de Pataias', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('08e803e6-452b-4b6f-b14a-2898795bdfe9', 'Dona Maria', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('cf04566e-d641-4218-95b0-f31ed57ae353', 'Alpiarça', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('6fb38af6-69f8-4798-b44d-94cfb32cfe30', 'Farilhão', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('32f86440-c4ba-4396-a470-04381c097f0b', 'Pedroso', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('9d9cc4e3-c0af-473e-840c-a07bd731c5fc', 'Praia da Luz', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('2e52d0b5-ff2e-4bd9-9205-f6bacc6360ba', 'Carrasqueira', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e6c911e7-b7f2-405b-968d-4ce812b43d1d', 'COSTA DA CAPARICA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('b4e99857-ba06-4a9a-aac8-8bdfde64e332', 'ARCOZELO DAS MAIAS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('d053bb5d-f7dd-435b-bc41-117946ce8241', 'OURA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e3e66217-2a52-409b-b7ae-ddcbd76a4368', 'Casa de Santa Clara', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('189c7db6-b6b0-4a12-b00b-3188432c8997', 'MESÃO FRIO (SANTO ANDRÉ)', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('4aac84d2-9c2b-4633-97f7-cc8058444ead', 'URGEZES Av. da Igreja', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('c15a2ba6-bbb8-4878-b68d-6f326c540fa7', 'SARILHOS GRANDES', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('03e48034-74f2-4b55-b989-7c3a6cc6cc94', 'AZAMBUJA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('7e867b22-f0c9-4fe1-885f-3b1337ff7f1a', 'PRAZINS SANTO TIRSO E CORVITE', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('ab8de746-9091-44fe-88dd-bdd307da2ab9', 'Alto do Forte', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('6164c508-9948-4f6c-bc30-c8de32b9d5a7', 'ALGUEIRÃO-MEM MARTINS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('0311b9af-2fa2-4943-9f76-20c3a59c7dd7', 'MAÇÃO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('c2b748db-56e8-4373-a65d-cf09972fd662', 'Alto do Seixalinho, Santo André e Verderena', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('f5ea84bc-2dff-450f-8d7f-a5552b5a2f3c', 'Lar de Leomil', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('b9adaaf9-3ff4-47d2-97b4-4cd11e35307f', 'PERAFITA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('3856e60d-7ca2-4ddb-896e-a677d7f381a3', 'Castêlo da Maia', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('ab0bdb98-c1c4-4ea1-bdc9-108d7967cf85', 'QUELUZ', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('1089daef-30f1-4607-87ce-39f432ff45f5', 'RUA TRAVESSA DA PEREIRA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('3da64cf3-3099-46e0-970b-f5a5662f2c95', 'Sonim', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('3c603e43-5fef-4515-9d22-95f3c2ff79ba', 'Feijó', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('69cb3549-f2bd-408b-b6ce-8d22a617c137', 'ALGÉS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('bc76b384-84cb-41eb-b441-530cb451599f', 'FAFE', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('62e6d59b-3c6f-445e-8611-7a064624cf38', 'RIO MAU', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('9bedb792-3f5d-4791-b642-975072be5513', 'MOURISCAS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('d660a7e8-cb5e-43f5-996b-5279fb49d001', 'SEVER DO VOUGA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('adb3e76f-436c-4d9f-a483-8d445698a9dc', 'ALHANDRA	', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('9e0d1c20-aba2-4cbd-a600-6757d55bb7c9', 'Paço de Arcos', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('57d69c55-66d1-4d33-9c14-7ef6858e64a1', 'MOITA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('07976c13-bc53-4527-a586-ae9999a2ad5e', 'LOULÉ (SÃO CLEMENTE)', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('0de75127-e45f-4308-8aee-070e56cabce3', 'UNIÃO DAS FREGUESIAS DA SÉ E SÃO LOURENÇ', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('1b482479-c441-4830-96e8-23946f179730', 'Carregado', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e34eb533-b104-4d72-a1e0-bd3e611d82dc', 'ATALAIA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('ce2ad37d-1690-4205-a138-abb66bf5e89b', 'NAZARÉ', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('76cad9f7-79f3-4b22-8a1a-b3eba01d354a', 'MAIA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('cbe0d42a-433d-4422-a385-09fde582c074', 'OLIVEIRA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('75f270a3-9e5f-4e07-9890-cc3aa3b4ce82', 'Santa Iria de Azoia', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('6f9efee5-706c-416e-84b8-55d503eff395', 'Malvada', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('a0d69342-f71f-4656-b083-3818011a19ce', 'PONTE DE SOR', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('503ae776-8d6b-46a5-ac74-7382b1bdc039', 'SESIMBRA (SANTIAGO)', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('ad67391d-7c52-4dd7-9af4-41d92fd6c5bd', 'Herdade Farias', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('71d43b88-3880-480a-8142-e7b1e1bc294a', 'PORTIMÃO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('c6d5ee01-1292-4e12-b7a6-11762db483d9', 'Vilarinho do Bairro', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('5e1e6f41-bdf2-46f2-b00e-c0aec8401adc', 'ALGÉS, LINDA-A-VELHA E CRUZ QUEBRADA-DAF', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('bbe5bc05-a1de-4eba-8d21-fccb49ef8ab8', 'Bons Dias', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('a3a2dfc6-8c1d-408f-95a5-64f30c7d9d5e', 'RIBEIRA DE SANTARÉM', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('bf591bc7-3abb-4437-bcbb-5266785bf3c3', 'Mangualde', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('f8d7fad7-4137-46b5-bffe-56e0e493f1bc', 'ESTÔMBAR E PARCHAL', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('8e93a668-ab13-4c8c-b089-fe2da7e42dc9', 'Outeiro da Cabeça', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('01da3d67-9be6-4903-91eb-e12177ab4710', 'Sebal', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('b7e84394-b811-48c0-a8c1-5dadc22e0754', 'MISERICÓRDIA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('94ee40df-1901-4153-9aee-b0198bc40a8c', 'Alcocreiros', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('1495576d-8bcc-495e-934a-a47dd2d63d29', 'Evora', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('0a4e547f-2468-4105-a93b-6dd18f0bf2ab', 'Barca de Alva/Candedo', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('6590c388-a0c0-4c95-a2a2-cd19837469dc', 'Maladão', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('fc63a723-ceb9-4164-b391-2ed99f83fa69', 'SÃO VICENTE DO PAUL  E VALE DE FIGUEIRA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('f517690b-ed39-4ad0-9069-99ee5411cfc6', 'SANTA CLARA DE LOUREDO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e4320e5a-1e7e-4357-b2cc-3144357ce3a2', 'Rana', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('5129c667-127c-466a-b34c-39d10f8bb868', 'Bairro das Manteigas', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('3b960efc-c2b0-45c7-b3c8-63c9266e2591', 'Oliveira (Santa Maria)', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('967bf3e2-369b-48d8-b455-c1100c54ad27', 'Santo Ildefonso', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('0b3908d7-c840-4cd1-bfc6-217b1c05a32b', 'BUGALHOS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('95622841-dcbe-4426-8569-dcb176dbfd13', 'QUELUZ', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('66ce2b72-e69e-4b89-a770-4794973f6bcc', 'AVER-O-MAR', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('cf78f14d-34ee-4442-9d1e-4b43017af13c', 'Feijó', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('5b623659-7a55-4dfa-9121-a51ff3deb63e', 'GUIZANDE', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('fcf3005e-b268-4fdf-93e8-f6b2464410eb', 'Adega Cooperativa São João da Pesqueira', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('8a180662-bb3e-46d1-8158-409fa5261c9c', 'Chã ', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('32f1308e-0c93-46c7-8801-2f1cef958015', 'Manique', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('16815186-01f4-464c-9dce-089eed3d5235', 'LARGO ARCOZELO,76-ARCOZELO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('ed5e5ff6-fb18-45a9-894a-6748d027396a', 'SANDE, VILARINHO, BARROS E GOMIDE', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e323eb38-8f81-4c48-b8c5-6ee995fcb531', 'Malveira', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('d88d3be2-17e3-47bb-af42-98f6730ee0b7', 'Almada, Cova da Piedade, Pragal e Cacilhas', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('47373f9a-7dab-49d2-9df3-8417696f1c71', 'Queijada-Rua do Laborim 201', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('bbd14a1d-accd-43bf-b100-db21465c34f1', 'SILVA ESCURA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('68b8baa5-b22d-40f5-9ab0-771d4fe5140f', 'AVINTES', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('b975ccdf-ec8a-4e2b-a677-1ac8506764d5', 'Travassô', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('00ed0da5-a25b-4ddb-b494-a38c127219fb', 'Santa Marinha', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('53ee095c-98cc-4f4f-a2a8-3dbbf72e1db0', 'ALAMEDA GULHERME OLIVEIRA AGUIAR,28-1ºDRT-ARCOZELO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('9bb52d79-a9dc-40bd-85a7-392f86a53466', 'Pombal', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('32a4dc7b-a67a-493c-ad41-9fa8ad84d03b', 'Lg Barrosas Idães ', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('55a35b7a-6483-41cd-beca-e3bb86820183', 'BALEIZÃO', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('72936068-8831-4905-a0d8-3ed14e8f4533', 'Trevões e Espinhosa', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('646ed9d1-5df2-473b-be4a-584e4291082c', 'CARREIRA E FONTE COBERTA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('223d8f9f-1fe4-4518-9c37-998a9fab1990', 'Aérodromo', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('82991128-6416-4c26-b6c8-5b2592eb5edc', 'Ereira', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('4944bad0-74d7-462b-8a07-ba23c8e20c7a', 'SANTO ANTÓNIO DOS OLIVAIS', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('c9b84117-16c8-480f-90b7-e493a7f30744', 'Setúbal', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('e1e6c12f-ad5a-478d-8764-c9aeea191617', 'LAPA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('365b326f-91a7-4006-ad2b-00b68bb460e0', 'FONTE ARCADA', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('0ab84d24-c36a-4700-b0f5-b4af63310468', 'Valongo', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('4952fdfb-845f-4801-b5f4-1266b606d6d1', 'Sassoeiros', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('d3cee6c8-ce36-4d3b-84ba-02bca4b8be0e', 'Rio Tinto', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('949eb21e-74e5-4f73-aa90-c9f9aa2ce4c1', 'BOMBARRAL', 'A');
INSERT INTO "arquitetura_event"."collectors" VALUES ('3f3f6d8a-8e76-4799-993a-d2d5752b4080', 'São Miguel', 'A');

-- ----------------------------
-- Table structure for event_records
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_event"."event_records";
CREATE TABLE "arquitetura_event"."event_records" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "collector_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "event_id" text COLLATE "pg_catalog"."default" NOT NULL,
  "registration_date" timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "description" text COLLATE "pg_catalog"."default" NOT NULL,
  "status" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'O'::text,
  "close_date" timestamp(3)
)
;

-- ----------------------------
-- Records of event_records
-- ----------------------------

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS "arquitetura_event"."events";
CREATE TABLE "arquitetura_event"."events" (
  "id" text COLLATE "pg_catalog"."default" NOT NULL,
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "active" bool NOT NULL DEFAULT true
)
;

-- ----------------------------
-- Records of events
-- ----------------------------
INSERT INTO "arquitetura_event"."events" VALUES ('c0486ad4-8bba-441f-b859-5f635b171f2b', 'Contentor cheio', 't');
INSERT INTO "arquitetura_event"."events" VALUES ('025a4c9c-5d37-4587-944f-b8715b196fde', 'Contentor precisa de manutenção', 't');
INSERT INTO "arquitetura_event"."events" VALUES ('76b00a9a-eb6c-4eee-ba10-7a55dee1a6a8', 'Aviso', 't');
INSERT INTO "arquitetura_event"."events" VALUES ('709667bd-803e-473f-acde-0e588cf52bfe', 'Informação', 't');

-- ----------------------------
-- Primary Key structure for table collectors
-- ----------------------------
ALTER TABLE "arquitetura_event"."collectors" ADD CONSTRAINT "collectors_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table event_records
-- ----------------------------
ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table events
-- ----------------------------
CREATE UNIQUE INDEX "events_name_key" ON "arquitetura_event"."events" USING btree (
  "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table events
-- ----------------------------
ALTER TABLE "arquitetura_event"."events" ADD CONSTRAINT "events_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table event_records
-- ----------------------------
ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_collector_id_fkey" FOREIGN KEY ("collector_id") REFERENCES "arquitetura_event"."collectors" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "arquitetura_event"."event_records" ADD CONSTRAINT "event_records_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "arquitetura_event"."events" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;


EOSQL