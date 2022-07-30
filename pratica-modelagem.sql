CREATE TABLE states (
	id serial not null primary key,
	name text not null
);

CREATE TABLE cities (
	id serial not null primary key,
	name text not null ,
	"stateId" integer not null REFERENCES states(id)
);

CREATE TABLE customers (
	id serial not null primary key,
	"fullName" text not null,
	cpf varchar(11) not null unique,
	email text not null unique,
	"password" text not null
);

create type "type" as enum('landline', 'mobile');

create table "customerPhones" (
	id serial not null primary key,
	"customerId" integer not null references customers(id),
	number text not null unique,
	type "type" not null
);

create table "customerAddresses" (
	id serial not null primary key,
	"customerId" integer not null references customers(id) unique,
	street text not null,
	number integer not null,
	complement text not null,
	"postalCode" integer not null,
	"cityId" integer not null references cities(id)
);

create table "bankAccount" (
	id serial not null primary key,
	"customerId" integer not null references customers(id),
	"accountNumber" integer not null,
	agency text not null,
	"openDate" date not null default now(),
	"closeDate" date
);

create type "type_transaction" as enum('deposit', 'withdraw');

create table transactions (
	id serial not null primary key,
	"bankAccountId" integer not null references "bankAccount"(id),
	amount bigint not null,
	type "type_transaction" not null,
	"time" timestamp not null default now(),
	description text not null,
	cancelled boolean not null default false
);

create table "creditCards" (
	id serial not null primary key,
	"bankAccountId" integer not null REFERENCES "bankAccount"(id),
	name text not null,
	number integer not null,
	"securityCode" integer not null,
	"expirationMonth" integer not null,
	"expirationYear" integer not null,
	password text not null,
	"limit" integer not null
);

