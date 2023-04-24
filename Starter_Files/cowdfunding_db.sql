--Drop table if exists
DROP TABLE campaign
DROP TABLE category
DROP TABLE subcategory
DROP TABLE contacts

--------------------------------------------------------------

CREATE TABLE "contacts" (
    "contact_id" INTEGER NOT NULL,
	"email" VARCHAR(75)   NOT NULL,
    "first_name" VARCHAR(20)  NOT NULL,
    "last_name" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);
--Import data from contacts.csv
--View table to ensure all the data has been imported correctly
SELECT * FROM contacts


-------------------------------------------------------------------------------------------------
CREATE TABLE "category" (
    "category_id" VARCHAR(5)  NOT NULL,
    "category" VARCHAR(25)  NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

--Import data from contacts.csv
--View table to ensure all the data has been imported correctly
SELECT * FROM category

-------------------------------------------------------------------
CREATE TABLE "subcategory" (
    "category_id" VARCHAR(10)   NOT NULL,
    "category" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "category_id"
     )
);

--Import data from contacts.csv
--View table to ensure all the data has been imported correctly
SELECT * FROM subcategory

----------------------------------------------------------------------------
CREATE TABLE "campaign" (
    "cf_id" INTEGER   NOT NULL,
    "contact_id" INTEGER   NOT NULL,
    "company_name" VARCHAR(40)  NOT NULL,
    "description" VARCHAR(60)  NOT NULL,
    "goal" INTEGER   NOT NULL,
    "pledged" INTEGER   NOT NULL,
    "outcome" VARCHAR(15) NOT NULL,
    "backers_count" INTEGER  NOT NULL,
    "country" VARCHAR(5)   NOT NULL,
    "currency" VARCHAR(5)   NOT NULL,
    "launched_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    "category_id" VARCHAR(5)  NOT NULL,
    "subcategory_id" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "contact_id"
     )
);

--Import data from contacts.csv
--View table to ensure all the data has been imported correctly
SELECT * FROM campaign
------------------------------------------------
ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contacts_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("category_id");
