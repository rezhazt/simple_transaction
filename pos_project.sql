/*
 Navicat Premium Data Transfer

 Source Server         : postgre_lokal_pc
 Source Server Type    : PostgreSQL
 Source Server Version : 140010 (140010)
 Source Host           : localhost:5432
 Source Catalog        : pos_project
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140010 (140010)
 File Encoding         : 65001

 Date: 27/07/2024 17:48:18
*/


-- ----------------------------
-- Sequence structure for categories_id_category_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."categories_id_category_seq";
CREATE SEQUENCE "public"."categories_id_category_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for customer_id_customer_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."customer_id_customer_seq";
CREATE SEQUENCE "public"."customer_id_customer_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for detail_price_id_detail_transaction_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."detail_price_id_detail_transaction_seq";
CREATE SEQUENCE "public"."detail_price_id_detail_transaction_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for product_id_product_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."product_id_product_seq";
CREATE SEQUENCE "public"."product_id_product_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for store_id_store_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."store_id_store_seq";
CREATE SEQUENCE "public"."store_id_store_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for transaction_id_transaction_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."transaction_id_transaction_seq";
CREATE SEQUENCE "public"."transaction_id_transaction_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS "public"."categories";
CREATE TABLE "public"."categories" (
  "id_category" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "category" varchar(255) COLLATE "pg_catalog"."default",
  "remark" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT clock_timestamp(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_at" timestamp(6),
  "updated_by" varchar COLLATE "pg_catalog"."default",
  "deleted_at" timestamp(6),
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS "public"."customer";
CREATE TABLE "public"."customer" (
  "id_customer" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "first_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "last_name" varchar(255) COLLATE "pg_catalog"."default",
  "gender" varchar(6) COLLATE "pg_catalog"."default" NOT NULL,
  "id_card" numeric NOT NULL,
  "phone_number" numeric,
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "sub-district" varchar(255) COLLATE "pg_catalog"."default",
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "province" varchar(255) COLLATE "pg_catalog"."default",
  "country" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT clock_timestamp(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_at" timestamp(6),
  "updated_by" varchar COLLATE "pg_catalog"."default",
  "deleted_at" timestamp(6),
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."customer"."gender" IS 'Male / Female';

-- ----------------------------
-- Table structure for detail_transaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."detail_transaction";
CREATE TABLE "public"."detail_transaction" (
  "id_detail_transaction" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "id_transaction" int4,
  "id_product" int4,
  "qty" int4,
  "unit_price" numeric(10,2),
  "price" numeric(10,2)
)
;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS "public"."product";
CREATE TABLE "public"."product" (
  "id_product" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "product_name" varchar(255) COLLATE "pg_catalog"."default",
  "qty" numeric,
  "id_category" int4,
  "price" numeric(10,2),
  "remark" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT clock_timestamp(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_at" timestamp(6),
  "updated_by" varchar COLLATE "pg_catalog"."default",
  "deleted_at" timestamp(6),
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS "public"."store";
CREATE TABLE "public"."store" (
  "id_store" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "store_name" varchar(255) COLLATE "pg_catalog"."default",
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "sub-district" varchar(255) COLLATE "pg_catalog"."default",
  "city" varchar(255) COLLATE "pg_catalog"."default",
  "province" varchar(255) COLLATE "pg_catalog"."default",
  "country" varchar(255) COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT clock_timestamp(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_at" timestamp(6),
  "updated_by" varchar COLLATE "pg_catalog"."default",
  "deleted_at" timestamp(6),
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS "public"."transaction";
CREATE TABLE "public"."transaction" (
  "id_transaction" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1
),
  "id_costumer" int4,
  "total_price" numeric(10,2),
  "remark" text COLLATE "pg_catalog"."default",
  "created_at" timestamp(6) DEFAULT clock_timestamp(),
  "created_by" varchar(255) COLLATE "pg_catalog"."default",
  "updated_at" timestamp(6),
  "updated_by" varchar COLLATE "pg_catalog"."default",
  "deleted_at" timestamp(6),
  "deleted_by" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Function structure for aggregation_unit_price
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."aggregation_unit_price"();
CREATE OR REPLACE FUNCTION "public"."aggregation_unit_price"()
  RETURNS "pg_catalog"."trigger" AS $BODY$BEGIN
	-- Routine body goes here...
	
	UPDATE
	detail_transaction
	set price = qty * unit_price
	WHERE id_detail_transaction=NEW.id_detail_transaction;
	
	UPDATE
	"transaction"
	SET total_price = (SELECT sum(price) from detail_transaction where id_transaction=NEW.id_transaction)
	where id_transaction=NEW.id_transaction;
	

	RETURN NEW;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."categories_id_category_seq"
OWNED BY "public"."categories"."id_category";
SELECT setval('"public"."categories_id_category_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."customer_id_customer_seq"
OWNED BY "public"."customer"."id_customer";
SELECT setval('"public"."customer_id_customer_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."detail_price_id_detail_transaction_seq"
OWNED BY "public"."detail_transaction"."id_detail_transaction";
SELECT setval('"public"."detail_price_id_detail_transaction_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."product_id_product_seq"
OWNED BY "public"."product"."id_product";
SELECT setval('"public"."product_id_product_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."store_id_store_seq"
OWNED BY "public"."store"."id_store";
SELECT setval('"public"."store_id_store_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."transaction_id_transaction_seq"
OWNED BY "public"."transaction"."id_transaction";
SELECT setval('"public"."transaction_id_transaction_seq"', 1, false);

-- ----------------------------
-- Indexes structure for table categories
-- ----------------------------
CREATE UNIQUE INDEX "categories_id_category_category_idx" ON "public"."categories" USING btree (
  "id_category" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "category" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table categories
-- ----------------------------
ALTER TABLE "public"."categories" ADD CONSTRAINT "categories_id_category_key" UNIQUE ("id_category");

-- ----------------------------
-- Indexes structure for table customer
-- ----------------------------
CREATE INDEX "customer_id_customer_first_name_gender_id_card_phone_number_idx" ON "public"."customer" USING btree (
  "id_customer" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "first_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "gender" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "id_card" "pg_catalog"."numeric_ops" ASC NULLS LAST,
  "phone_number" "pg_catalog"."numeric_ops" ASC NULLS LAST,
  "sub-district" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "city" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "province" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "country" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_id_customer_id_card_key" UNIQUE ("id_customer", "id_card");

-- ----------------------------
-- Primary Key structure for table customer
-- ----------------------------
ALTER TABLE "public"."customer" ADD CONSTRAINT "customer_pkey" PRIMARY KEY ("id_customer");

-- ----------------------------
-- Indexes structure for table detail_transaction
-- ----------------------------
CREATE INDEX "detail_price_id_detail_transaction_id_transaction_id_produc_idx" ON "public"."detail_transaction" USING btree (
  "id_detail_transaction" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id_transaction" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id_product" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Triggers structure for table detail_transaction
-- ----------------------------
CREATE TRIGGER "update_price" AFTER INSERT ON "public"."detail_transaction"
FOR EACH ROW
EXECUTE PROCEDURE "public"."aggregation_unit_price"();

-- ----------------------------
-- Primary Key structure for table detail_transaction
-- ----------------------------
ALTER TABLE "public"."detail_transaction" ADD CONSTRAINT "detail_price_pkey" PRIMARY KEY ("id_detail_transaction");

-- ----------------------------
-- Indexes structure for table product
-- ----------------------------
CREATE INDEX "product_id_product_product_name_id_category_idx" ON "public"."product" USING btree (
  "id_product" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "product_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "id_category" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table product
-- ----------------------------
ALTER TABLE "public"."product" ADD CONSTRAINT "product_pkey" PRIMARY KEY ("id_product");

-- ----------------------------
-- Indexes structure for table store
-- ----------------------------
CREATE INDEX "store_id_store_store_name_sub-district_city_province_countr_idx" ON "public"."store" USING btree (
  "id_store" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "store_name" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "sub-district" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "city" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "province" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "country" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table store
-- ----------------------------
ALTER TABLE "public"."store" ADD CONSTRAINT "store_pkey" PRIMARY KEY ("id_store");

-- ----------------------------
-- Indexes structure for table transaction
-- ----------------------------
CREATE INDEX "transaction_id_transaction_id_costumer_total_price_idx" ON "public"."transaction" USING btree (
  "id_transaction" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "id_costumer" "pg_catalog"."int4_ops" ASC NULLS LAST,
  "total_price" "pg_catalog"."numeric_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table transaction
-- ----------------------------
ALTER TABLE "public"."transaction" ADD CONSTRAINT "transaction_pkey" PRIMARY KEY ("id_transaction");

-- ----------------------------
-- Foreign Keys structure for table detail_transaction
-- ----------------------------
ALTER TABLE "public"."detail_transaction" ADD CONSTRAINT "detail_price_id_product_fkey" FOREIGN KEY ("id_product") REFERENCES "public"."product" ("id_product") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."detail_transaction" ADD CONSTRAINT "detail_price_id_transaction_fkey" FOREIGN KEY ("id_transaction") REFERENCES "public"."transaction" ("id_transaction") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table product
-- ----------------------------
ALTER TABLE "public"."product" ADD CONSTRAINT "fk_categories_product" FOREIGN KEY ("id_category") REFERENCES "public"."categories" ("id_category") ON DELETE RESTRICT ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Keys structure for table transaction
-- ----------------------------
ALTER TABLE "public"."transaction" ADD CONSTRAINT "transaction_id_costumer_fkey" FOREIGN KEY ("id_costumer") REFERENCES "public"."customer" ("id_customer") ON DELETE NO ACTION ON UPDATE NO ACTION;
