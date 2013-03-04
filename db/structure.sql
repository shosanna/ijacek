CREATE TABLE "activities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "description" varchar(255), "location" varchar(255), "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "activity_person_id" varchar(255));
CREATE TABLE "entries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "text" text, "author" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "person_id" integer);
CREATE TABLE "people" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "username" varchar(255), "gender" integer, "info" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "password_digest" varchar(255), "image" varchar(255), "ijacek" boolean, "time" varchar(255), "time_exchange" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130217220551');

INSERT INTO schema_migrations (version) VALUES ('20130220105844');

INSERT INTO schema_migrations (version) VALUES ('20130220110818');

INSERT INTO schema_migrations (version) VALUES ('20130220165627');

INSERT INTO schema_migrations (version) VALUES ('20130222180642');

INSERT INTO schema_migrations (version) VALUES ('20130224195354');

INSERT INTO schema_migrations (version) VALUES ('20130226230638');

INSERT INTO schema_migrations (version) VALUES ('20130227151442');

INSERT INTO schema_migrations (version) VALUES ('20130301212734');

INSERT INTO schema_migrations (version) VALUES ('20130301222155');