CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	"cpf" int(11) NOT NULL UNIQUE,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.clothes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" double NOT NULL,
	"images" TEXT([1]) NOT NULL,
	"categoryId" int NOT NULL,
	CONSTRAINT "clothes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"size" char(1) NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"userId" int NOT NULL,
	"status" char NOT NULL,
	"date" DATE NOT NULL DEFAULT 'NOW',
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchaseItems" (
	"id" serial NOT NULL,
	"clotheId" int NOT NULL,
	"quantity" int NOT NULL,
	"purchaseId" int NOT NULL,
	CONSTRAINT "purchaseItems_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.userAddresses" (
	"id" serial NOT NULL,
	"street" TEXT NOT NULL,
	"number" int NOT NULL,
	"cep" int(8) NOT NULL,
	"city" TEXT NOT NULL,
	"state" TEXT NOT NULL,
	"userId" int NOT NULL,
	CONSTRAINT "userAddresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "clothes" ADD CONSTRAINT "clothes_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");


ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");

ALTER TABLE "purchaseItems" ADD CONSTRAINT "purchaseItems_fk0" FOREIGN KEY ("clotheId") REFERENCES "clothes"("id");
ALTER TABLE "purchaseItems" ADD CONSTRAINT "purchaseItems_fk1" FOREIGN KEY ("purchaseId") REFERENCES "purchases"("id");

ALTER TABLE "userAddresses" ADD CONSTRAINT "userAddresses_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");






