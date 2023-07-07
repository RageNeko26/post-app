CREATE TABLE "users" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "username" varchar NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "mails" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "title" varchar NOT NULL,
  "body" text NOT NULL,
  "receiver" integer NOT NULL,
  "sender" integer NOT NULL,
  "created_at" timestamp
);

CREATE TABLE "boxes" (
  "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY NOT NULL,
  "mail_id" integer NOT NULL,
  "owner" integer NOT NULL,
  "sender" integer NOT NULL
);

ALTER TABLE "mails" ADD FOREIGN KEY ("receiver") REFERENCES "users" ("id");

ALTER TABLE "mails" ADD FOREIGN KEY ("sender") REFERENCES "users" ("id");

ALTER TABLE "boxes" ADD FOREIGN KEY ("mail_id") REFERENCES "mails" ("id");

ALTER TABLE "boxes" ADD FOREIGN KEY ("owner") REFERENCES "users" ("id");

ALTER TABLE "boxes" ADD FOREIGN KEY ("sender") REFERENCES "users" ("id");