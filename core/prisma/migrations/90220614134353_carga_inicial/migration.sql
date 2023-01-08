-- ALTER TABLE "store_categories" ADD CONSTRAINT "store_categories_store_id_fkey" FOREIGN KEY ("store_id") REFERENCES "stores" ("id");
-- ALTER TABLE "store_categories" ADD CONSTRAINT "store_categories_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

-- ALTER TABLE "event_records" ADD CONSTRAINT "event_records_event_id_fkey" FOREIGN KEY ("event_id") REFERENCES "events" ("id");
-- ALTER TABLE "event_records" ADD CONSTRAINT "event_records_collector_id_fkey" FOREIGN KEY ("collector_id") REFERENCES "collectors" ("id");

DELETE from store_categories;
DELETE from categories;
DELETE from stores;

INSERT INTO "categories" VALUES ('1ccccdaa-cf75-4f75-9dfb-3fec4a2183ce', 'Roupas');
INSERT INTO "categories" VALUES ('0461b100-b3c7-4e92-b3a2-49a6ffbad54f', 'Calçados');
INSERT INTO "categories" VALUES ('e40761c0-a564-4179-85d3-1abe2210ce9c', 'Brinquedos');
INSERT INTO "categories" VALUES ('56188422-678e-452b-996f-dfd0ee2722b3', 'Texteis do lar');

INSERT INTO "stores" VALUES ('eb1333bf-a80e-4989-89eb-700900f16173', 'Stores #1', 'Store address', 10, 10);
INSERT INTO "stores" VALUES ('ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e', 'Stores #2', 'Store address', 10, 10);
INSERT INTO "stores" VALUES ('a8d3af00-142a-4c00-a258-dba01f2ec156', 'Stores #3', 'Store address', 10, 10);
INSERT INTO "stores" VALUES ('c4c1f45d-0c5b-4c7b-97c8-9bda2cacec02', 'Stores #4', 'Store address', 10, 10);

INSERT INTO "store_categories" VALUES ('53ebe6e8-f3e6-44af-86fa-ea078fcb8a2f', '1ccccdaa-cf75-4f75-9dfb-3fec4a2183ce', 'eb1333bf-a80e-4989-89eb-700900f16173');
INSERT INTO "store_categories" VALUES ('0eff6024-d9a1-4981-aa75-163ccd200544', '0461b100-b3c7-4e92-b3a2-49a6ffbad54f', 'eb1333bf-a80e-4989-89eb-700900f16173');

INSERT INTO "store_categories" VALUES ('dedf6857-3c75-4e7f-8084-ff430352f8c7', '1ccccdaa-cf75-4f75-9dfb-3fec4a2183ce', 'ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e');
INSERT INTO "store_categories" VALUES ('dcd851e8-760b-436d-8086-3f88faabb18f', '0461b100-b3c7-4e92-b3a2-49a6ffbad54f', 'ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e');
INSERT INTO "store_categories" VALUES ('c501d3d5-0870-49fa-bb24-ec1b176c83ff', 'e40761c0-a564-4179-85d3-1abe2210ce9c', 'ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e');
INSERT INTO "store_categories" VALUES ('6584ff5c-41e2-4c07-bda9-1f238c1a8eea', '56188422-678e-452b-996f-dfd0ee2722b3', 'ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e');


DELETE from events;
DELETE from collectors;


INSERT INTO "events" VALUES ('1ccccdaa-cf75-4f75-9dfb-3fec4a2183ce', 'Event #1');
INSERT INTO "events" VALUES ('0461b100-b3c7-4e92-b3a2-49a6ffbad54f', 'Event #2');
INSERT INTO "events" VALUES ('e40761c0-a564-4179-85d3-1abe2210ce9c', 'Event #3');
INSERT INTO "events" VALUES ('56188422-678e-452b-996f-dfd0ee2722b3', 'Event #4');


INSERT INTO "collectors" VALUES ('eb1333bf-a80e-4989-89eb-700900f16173', 10, 10, 'Collector address');
INSERT INTO "collectors" VALUES ('ac56ef21-a7f3-4e25-bd6e-f8ecdea2481e', 20, 20, 'Collector address');
INSERT INTO "collectors" VALUES ('a8d3af00-142a-4c00-a258-dba01f2ec156', 30, 30, 'Collector address');
INSERT INTO "collectors" VALUES ('c4c1f45d-0c5b-4c7b-97c8-9bda2cacec02', 40, 40, 'Collector address');