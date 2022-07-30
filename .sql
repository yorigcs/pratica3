CREATE TABLE "states" (
	"id" SERIAL PRIMARY KEY,
	"name" TEXT NOT NULL
);

create table "cities" (
"id" serial primary key,
"stateId" integer not null  references "states"("id")
);

create table "customers" (
"id" serial primary key,
"fullName" varchar(50) not null,
"cpf" varchar(11) not null unique,
"email" varchar(30) not null unique,
"password" varchar(20) not null
);

create table "customerAddresses" (
"id" serial primary key,
"customerId" integer not null  references "customers"("id"),
"street" text not null,
"number" text not null,
"complement" text not null,
"postalCode" integer not null,
"cityId" integer not null references "cities"("id")
);

create type screen as  enum('landline','mobile');
create table "customerPhones" (
"id" serial primary key,
"customerId" integer not null  references "customers"("id"),
"number" integer not null,
"type" screen
);


create table "bankAccount" (
"id" serial primary key,
"customerId" integer not null  references "customers"("id"),
"accountNumber" integer not null,
"agency" integer not null,
"openDate" timestamp without time zone not null,
"closeDate" timestamp without time zone
);

create type transactionType as enum('deposit','withdraw');

create table "transactions" (
"id" serial primary key,
"bankAccountId" integer not null  references "bankAccount"("id"),
"amount" integer not null,
"type" transactionType,
"time" timestamp without time zone not null,
"description" varchar(30) not null,
"cancelled" boolean default false
);

create table "creditCards" (
"id" serial primary key,
"bankAccountId" integer not null  references "bankAccount"("id"),
"name" varchar(30) not null,
"number" integer not null,
"securityCode" integer not null,
"expirationMonth" integer not null,
"expirationYear" integer not null,
"password" varchar(30) not null,
"limit" integer not null
);



