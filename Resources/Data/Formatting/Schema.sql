-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UqwtYs
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Bird_Data_Raw" (
    "Collection_Num" int   NOT NULL,
    "BirdID" int   NOT NULL,
    "Sex" int   NOT NULL,
    "AgeY" float   NOT NULL,
    "AgeClass" varchar   NOT NULL,
    "BirthFPID" int   NOT NULL,
    "U_PlateID" varchar   NOT NULL,
    "RTL" float   NOT NULL,
    "Technician" int   NOT NULL,
    "Terr" float   NOT NULL,
    "FPID" int   NOT NULL,
    "Mum" int   NOT NULL,
    "Dad" int   NOT NULL,
    "MAC" float   NOT NULL,
    "PAC" float   NOT NULL,
    "BrF" int   NOT NULL,
    "BrM" int   NOT NULL,
    CONSTRAINT "pk_Bird_Data_Raw" PRIMARY KEY (
        "Collection_Num"
     )
);

CREATE TABLE "Human_Bio_Raw" (
    "ID" int   NOT NULL,
    "HHID" int   NOT NULL,
    "PN" int   NOT NULL,
    "LSUBHH" int   NOT NULL,
    "KSUBHH" int   NOT NULL,
    "LPN_SP" int   NOT NULL,
    "LCSR" int   NOT NULL,
    "LFAMR" int   NOT NULL,
    "LFINR" int   NOT NULL,
    "LA500" int   NOT NULL,
    "LA501" int   NOT NULL,
    "LA061" int   NOT NULL,
    "LA062" int   NOT NULL,
    "LA063" int   NOT NULL,
    "LA064" int   NOT NULL,
    "LA002" int   NOT NULL,
    "LA009" int   NOT NULL,
    "LA010" int   NOT NULL,
    "LA103" int   NOT NULL,
    "LA011" int   NOT NULL,
    "LA012" int   NOT NULL,
    "LA019" int   NOT NULL,
    "LA028" int   NOT NULL,
    "LA065" int   NOT NULL,
    "LA066" int   NOT NULL,
    "LA068M" int   NOT NULL,
    "LA099" int   NOT NULL,
    "LA100" int   NOT NULL,
    "LA101" int   NOT NULL,
    "LA106" int   NOT NULL,
    "LA113" int   NOT NULL,
    "LA116" int   NOT NULL,
    "LA117" int   NOT NULL,
    "LVDATE" int   NOT NULL,
    "LVERSION" int   NOT NULL,
    CONSTRAINT "pk_Human_Bio_Raw" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Human_Telo_Raw" (
    "Individual_Number" int   NOT NULL,
    "HHID" int   NOT NULL,
    "PN" int   NOT NULL,
    "PLATE" float   NOT NULL,
    "WELL" varchar   NOT NULL,
    "FINAL_T_S" float   NOT NULL,
    "FINAL_CV" float   NOT NULL,
    "NOTES" varchar   NOT NULL,
    CONSTRAINT "pk_Human_Telo_Raw" PRIMARY KEY (
        "Individual_Number"
     )
);

CREATE TABLE "Human_Age_vs_Telo" (
    "ID" int   NOT NULL,
    "Age" int   NOT NULL,
    "RTL" float   NOT NULL,
    CONSTRAINT "pk_Human_Age_vs_Telo" PRIMARY KEY (
        "ID"
     )
);

CREATE TABLE "Bird_Age_vs_Telo" (
    "BirdID" int   NOT NULL,
    "Age" int   NOT NULL,
    "RTL" float   NOT NULL,
    CONSTRAINT "pk_Bird_Age_vs_Telo" PRIMARY KEY (
        "BirdID"
     )
);

ALTER TABLE "Human_Telo_Raw" ADD CONSTRAINT "fk_Human_Telo_Raw_HHID_PN" FOREIGN KEY("HHID", "PN")
REFERENCES "Human_Bio_Raw" ("HHID", "PN");

ALTER TABLE "Human_Age_vs_Telo" ADD CONSTRAINT "fk_Human_Age_vs_Telo_ID" FOREIGN KEY("ID")
REFERENCES "Human_Telo_Raw" ("Individual_Number");

ALTER TABLE "Bird_Age_vs_Telo" ADD CONSTRAINT "fk_Bird_Age_vs_Telo_BirdID" FOREIGN KEY("BirdID")
REFERENCES "Bird_Data_Raw" ("BirdID");

