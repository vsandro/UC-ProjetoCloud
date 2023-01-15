#!/bin/bash
set -e
psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    CREATE DATABASE arquitetura_authentication;
    \c arquitetura_authentication;
    CREATE SCHEMA arquitetura_authentication;
	GRANT ALL PRIVILEGES ON DATABASE arquitetura_authentication TO postgres;    
EOSQL

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "arquitetura_authentication" <<-EOSQL
    \c arquitetura_authentication; 

    DROP TABLE IF EXISTS "arquitetura_authentication"."operations";
    CREATE TABLE "arquitetura_authentication"."operations" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "method" text COLLATE "pg_catalog"."default" NOT NULL,
    "route" text COLLATE "pg_catalog"."default" NOT NULL,
    "description" text COLLATE "pg_catalog"."default" NOT NULL
    );

    INSERT INTO "arquitetura_authentication"."operations" VALUES ('e0ae632b-2717-4f80-899a-870a4b909e99', 'POST', '/user', '[authentication] create user');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('b09cd1d7-34a0-45f7-8dc6-c26ea45b92f8', 'POST', '/user/unlock', '[authentication] unlock user');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('41229250-f0b1-40a5-9c70-ffb6771cbf6f', 'POST', '/category', '[core] create category');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('31df7605-787b-4fda-8c93-f41a18fd0e6b', 'PUT', '/category', '[core] update category');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('5d6940f4-9d9c-4b12-9b21-38cf9185895b', 'DELETE', '/category', '[core] delete category');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('da2db179-9013-4615-b774-601550955042', 'GET', '/category', '[core] get all categorys');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('6bbc8766-f4c5-4b0b-8237-6795b1f21198', 'POST', '/collector', '[core] create collector');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('c3cc925b-d968-4704-9f02-79a3812d95b0', 'PUT', '/collector', '[core] update collector');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('bf70a119-4d36-4fb4-99cf-57eb8a9dcfee', 'DELETE', '/collector', '[core] delete collector');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('9d1d4679-838d-4098-bb46-5f7f0dcc7ffd', 'GET', '/collector', '[core] get all collectors');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('77580464-4183-4891-bac3-448b57325874', 'POST', '/event', '[core] create event');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('9195119f-339a-405b-ab27-09711daff37b', 'PUT', '/event', '[core] update event');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('b2a07f5e-f80d-4040-94c9-af192fec75ad', 'DELETE', '/event', '[core] delete event');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('5b7e811e-6956-4aab-87e4-e5408469ce19', 'GET', '/event', '[core] get all events');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('10adba7b-fc86-472b-a4ba-0cb95d7fd6ac', 'POST', '/store', '[core] create store');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('797b9add-790e-4e00-8429-5eb1deefe26f', 'PUT', '/store', '[core] update store');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('8a154ba0-15e0-4f52-9b5d-5ab210b031e7', 'DELETE', '/store', '[core] delete store');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('235d210e-afd3-4e98-9598-cf7e7ceb0bc7', 'GET', '/store', '[core] get all stores');

    INSERT INTO "arquitetura_authentication"."operations" VALUES ('704fd5fe-72b4-44d3-acbe-49b55be18b74', 'POST', '/item', '[core] create item');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('fb38c0a9-0352-4a8d-bb17-9019f30ea314', 'PUT', '/item', '[core] update item');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('157d905f-ec23-42cc-a1a8-7cc8cb72edce', 'DELETE', '/item', '[core] delete item');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('de132788-599c-4aef-a8be-a15c1159dfb1', 'GET', '/item', '[core] get all items');

    INSERT INTO "arquitetura_authentication"."operations" VALUES ('26a22878-6bec-4f9d-b70c-c286cc52cae0', 'POST', '/eventrecords', '[event] create event record');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('4a4ea7cd-3e43-47b6-a263-ea1c0ea145bfb', 'PUT', '/eventrecords', '[event] update event record');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('72ac6213-5581-4312-ba29-ae7fdb7533f1', 'DELETE', '/eventrecords', '[event] delete event record');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('255766dd-e7e5-4958-89b7-a4819b83d2e8', 'GET', '/eventrecords', '[event] get all event record');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('c68809ac-37d6-4839-9119-ff853bac2be8', 'GET', '/event', '[event] get all events');
    INSERT INTO "arquitetura_authentication"."operations" VALUES ('79ba7090-dcd4-452a-85f5-dc3f6388ecb7', 'GET', '/collector', '[event] get all collectors');

    DROP TABLE IF EXISTS "arquitetura_authentication"."permissions";
    CREATE TABLE "arquitetura_authentication"."permissions" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "profile_id" text COLLATE "pg_catalog"."default" NOT NULL,
    "operation_id" text COLLATE "pg_catalog"."default" NOT NULL
    );

    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('2adcf753-c440-4d57-a5db-fa126bab4b6f', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', 'e0ae632b-2717-4f80-899a-870a4b909e99');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('635cbb1e-e253-4f7f-b3ad-9546a17c5499', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', 'b09cd1d7-34a0-45f7-8dc6-c26ea45b92f8');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('d6bbed24-2f29-4dc9-8364-ac0e42eb7a49', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '6bbc8766-f4c5-4b0b-8237-6795b1f21198');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('4a2978c6-a2bd-4719-865f-17cc53c3fb28', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', 'c3cc925b-d968-4704-9f02-79a3812d95b0');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('e0caffdb-b9c6-4355-849c-c7d32c0458fe', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', 'bf70a119-4d36-4fb4-99cf-57eb8a9dcfee');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('87f96478-92a3-4b28-a1bf-8cbd7065f191', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '9d1d4679-838d-4098-bb46-5f7f0dcc7ffd');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('35d50948-7ab8-4317-afa5-237b41b010ba', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '77580464-4183-4891-bac3-448b57325874');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('40d524e2-2f06-4565-8c45-371799e5151e', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '9195119f-339a-405b-ab27-09711daff37b');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('68638e6b-d40b-4ae2-bc1a-17f03ccbc90f', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', 'b2a07f5e-f80d-4040-94c9-af192fec75ad');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('797d1077-cb41-4dab-a8d1-89892d9b7fbd', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '5b7e811e-6956-4aab-87e4-e5408469ce19');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('cce6c05f-7422-495d-b79e-d097175f5e80', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '10adba7b-fc86-472b-a4ba-0cb95d7fd6ac');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('e3dfbb3d-ecce-461a-a95f-aa77fe830d79', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '797b9add-790e-4e00-8429-5eb1deefe26f');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('15579177-4f9d-4525-871c-b25c89e44061', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '8a154ba0-15e0-4f52-9b5d-5ab210b031e7');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('93e9720f-2ef6-4f93-aeb3-04366969e5cb', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '235d210e-afd3-4e98-9598-cf7e7ceb0bc7');

    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('47afadbe-22dc-4ed1-8e22-e455a07ba331', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '704fd5fe-72b4-44d3-acbe-49b55be18b74');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('fd51b9a1-2fb8-405d-b472-e3815abd7ea5', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', 'fb38c0a9-0352-4a8d-bb17-9019f30ea314');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('c7f6412e-32df-4fd9-ab19-97b31b51ce52', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '157d905f-ec23-42cc-a1a8-7cc8cb72edce');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('c3e07ef9-cb76-4608-aef7-b77fc14af298', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', 'de132788-599c-4aef-a8be-a15c1159dfb1');

    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('8a18eaca-9f00-4c29-a850-e63846916130', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '41229250-f0b1-40a5-9c70-ffb6771cbf6f');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('8c0647f7-7683-4873-8c47-862516c05f1b', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '31df7605-787b-4fda-8c93-f41a18fd0e6b');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('20206c9e-216f-4d67-8e19-2ffdd7a7eb54', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '5d6940f4-9d9c-4b12-9b21-38cf9185895b');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('b4e9712e-d00d-473b-8cd5-2863cc4722f5', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', 'da2db179-9013-4615-b774-601550955042');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('43427ede-2a06-4b03-b265-f911748c6771', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '26a22878-6bec-4f9d-b70c-c286cc52cae0');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('dedaf36d-cf5a-4d62-a0d7-31a6595ea2fb', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '4a4ea7cd-3e43-47b6-a263-ea1c0ea145bfb');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('796e56b9-4cdf-47d7-888b-51ec6c014ae7', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '72ac6213-5581-4312-ba29-ae7fdb7533f1');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('2cf45ff3-d441-4ccc-9df1-b279dd0e134e', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '255766dd-e7e5-4958-89b7-a4819b83d2e8');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('e63ef54a-aea2-4a46-9f9d-df4089d77ded', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', 'c68809ac-37d6-4839-9119-ff853bac2be8');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('cc389bcf-9a83-4010-ba93-c7ee86271ee4', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', '79ba7090-dcd4-452a-85f5-dc3f6388ecb7');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('c0230809-552e-416e-955c-3a09d76f7e64', 'cceacd43-1647-415d-9179-76282331e3c5', 'e0ae632b-2717-4f80-899a-870a4b909e99');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('248116a0-7698-40b0-b15d-722a3dfe4fa7', 'cceacd43-1647-415d-9179-76282331e3c5', '9d1d4679-838d-4098-bb46-5f7f0dcc7ffd');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('232a31cf-5e0b-4f2a-bea5-1098ce3b7f35', 'cceacd43-1647-415d-9179-76282331e3c5', '5b7e811e-6956-4aab-87e4-e5408469ce19');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('526e320d-32e5-429e-a9f3-f059c49662bc', 'cceacd43-1647-415d-9179-76282331e3c5', '235d210e-afd3-4e98-9598-cf7e7ceb0bc7');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('6074400d-25e0-4c69-aba6-a0d4dd81243e', 'cceacd43-1647-415d-9179-76282331e3c5', 'da2db179-9013-4615-b774-601550955042');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('b973cae7-f869-4d1c-afdb-e15dbb4770fb', 'cceacd43-1647-415d-9179-76282331e3c5', '26a22878-6bec-4f9d-b70c-c286cc52cae0');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('a5b389ba-d9a4-4279-bbd8-28f27a8fbc23', 'cceacd43-1647-415d-9179-76282331e3c5', '4a4ea7cd-3e43-47b6-a263-ea1c0ea145bfb');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('58fcc700-8a2f-49f2-9a14-0b7dd730757a', 'cceacd43-1647-415d-9179-76282331e3c5', '72ac6213-5581-4312-ba29-ae7fdb7533f1');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('3142aacd-989f-49ed-9bd3-e60f75a0b53c', 'cceacd43-1647-415d-9179-76282331e3c5', '255766dd-e7e5-4958-89b7-a4819b83d2e8');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('51400360-7482-498a-b6f0-6a8cf5d3f5e0', 'cceacd43-1647-415d-9179-76282331e3c5', 'c68809ac-37d6-4839-9119-ff853bac2be8');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('66ad8018-4376-4d48-a9ae-261cb044f401', 'cceacd43-1647-415d-9179-76282331e3c5', '79ba7090-dcd4-452a-85f5-dc3f6388ecb7');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('03278e95-7c2a-43cb-acb5-273e006475ed', '0cd9f2ff-df2c-49e8-a5db-976aa757c501', '9d1d4679-838d-4098-bb46-5f7f0dcc7ffd');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('7816355b-a949-467e-84db-87caf4dc8f60', '0cd9f2ff-df2c-49e8-a5db-976aa757c501', '5b7e811e-6956-4aab-87e4-e5408469ce19');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('4b49c31b-376c-4140-9232-084a3dd3704e', '0cd9f2ff-df2c-49e8-a5db-976aa757c501', '235d210e-afd3-4e98-9598-cf7e7ceb0bc7');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('0df40d42-a3f4-464f-a681-9aa31aa87f8b', '0cd9f2ff-df2c-49e8-a5db-976aa757c501', 'da2db179-9013-4615-b774-601550955042');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('88b9ae74-ffc9-4380-836e-7e2521747b70', '0cd9f2ff-df2c-49e8-a5db-976aa757c501', '255766dd-e7e5-4958-89b7-a4819b83d2e8');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('cab4d67e-d8b6-4e74-81a5-afb56067d1fe', '0cd9f2ff-df2c-49e8-a5db-976aa757c501', 'c68809ac-37d6-4839-9119-ff853bac2be8');
    INSERT INTO "arquitetura_authentication"."permissions" VALUES ('c4dd865b-01b5-45e2-8ba1-4e293984ba2e', '0cd9f2ff-df2c-49e8-a5db-976aa757c501', '79ba7090-dcd4-452a-85f5-dc3f6388ecb7');


    DROP TABLE IF EXISTS "arquitetura_authentication"."profiles";
    CREATE TABLE "arquitetura_authentication"."profiles" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "name" text COLLATE "pg_catalog"."default" NOT NULL
    );


    INSERT INTO "arquitetura_authentication"."profiles" VALUES ('7e9d6f9c-700a-4fdb-a431-4be8357274a4', 'Administrador 1');
    INSERT INTO "arquitetura_authentication"."profiles" VALUES ('cceacd43-1647-415d-9179-76282331e3c5', 'Gestor 1');
    INSERT INTO "arquitetura_authentication"."profiles" VALUES ('0cd9f2ff-df2c-49e8-a5db-976aa757c501', 'Usuario 1');


    DROP TABLE IF EXISTS "arquitetura_authentication"."users";
    CREATE TABLE "arquitetura_authentication"."users" (
    "id" text COLLATE "pg_catalog"."default" NOT NULL,
    "profile_id" text COLLATE "pg_catalog"."default" NOT NULL,
    "username" text COLLATE "pg_catalog"."default" NOT NULL,
    "password" text COLLATE "pg_catalog"."default" NOT NULL,
    "blocked" bool NOT NULL DEFAULT false,
    "failed" int4 NOT NULL DEFAULT 0,
    "name" text COLLATE "pg_catalog"."default" NULL,
    "address" text COLLATE "pg_catalog"."default" NULL,
    "phone" text COLLATE "pg_catalog"."default" NULL,
    "email" text COLLATE "pg_catalog"."default" NULL    
    );

    INSERT INTO "arquitetura_authentication"."users" VALUES ('3bf13e38-83d7-40cf-9a3c-36980680ee7f', '7e9d6f9c-700a-4fdb-a431-4be8357274a4', 'sandro', '$2b$10$DUMv4yzurO0OtygLk4Q6T.67xT1Rid6XvkhWybnANR6KuACvqdOc2', 'f', 0, 'Sandro Vieira', 'Rua Jose, 12 Braga', '958 4558', 'vsandro@gmail.com');
    INSERT INTO "arquitetura_authentication"."users" VALUES ('8a154ba0-15e0-4f52-9b5d-5ab210b031e7', 'cceacd43-1647-415d-9179-76282331e3c5', 'jorge', '$2b$10$DUMv4yzurO0OtygLk4Q6T.67xT1Rid6XvkhWybnANR6KuACvqdOc2', 'f', 0, 'Jorge', 'Rua B, 287 Barcelos', '945 4587', 'jorge@gmail.com');
    INSERT INTO "arquitetura_authentication"."users" VALUES ('1fe8d804-ef76-4ed0-bf9a-785002e62dcf', '0cd9f2ff-df2c-49e8-a5db-976aa757c501', 'maria', '$2b$10$DUMv4yzurO0OtygLk4Q6T.67xT1Rid6XvkhWybnANR6KuACvqdOc2', 'f', 0, 'Maria', 'Rua ABC, 87 Braga', '974 2547', 'maria@gmail.com');

    update arquitetura_authentication.users set password='$2b$10$5y/IjNkmi5h7F2DbjQ2i9uJUyqRMpovEIo808v8kuHqobBvtSuyvS';
  
    ALTER TABLE "arquitetura_authentication"."operations" ADD CONSTRAINT "operations_pkey" PRIMARY KEY ("id");

    ALTER TABLE "arquitetura_authentication"."permissions" ADD CONSTRAINT "permissions_pkey" PRIMARY KEY ("id");


    CREATE UNIQUE INDEX "profiles_name_key" ON "arquitetura_authentication"."profiles" USING btree (
    "name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );

    ALTER TABLE "arquitetura_authentication"."profiles" ADD CONSTRAINT "profiles_pkey" PRIMARY KEY ("id");

    CREATE UNIQUE INDEX "users_username_key" ON "arquitetura_authentication"."users" USING btree (
    "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
    );

    ALTER TABLE "arquitetura_authentication"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");


    ALTER TABLE "arquitetura_authentication"."permissions" ADD CONSTRAINT "permissions_operation_id_fkey" FOREIGN KEY ("operation_id") REFERENCES "arquitetura_authentication"."operations" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
    ALTER TABLE "arquitetura_authentication"."permissions" ADD CONSTRAINT "permissions_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "arquitetura_authentication"."profiles" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

    ALTER TABLE "arquitetura_authentication"."users" ADD CONSTRAINT "users_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "arquitetura_authentication"."profiles" ("id") ON DELETE RESTRICT ON UPDATE CASCADE;
    
  
EOSQL


