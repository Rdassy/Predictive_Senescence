-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Birds_Data_Raw" (
    "Collection_Num" INT   NOT NULL,
    "BirdID" INT   NOT NULL,
    "Sex" INT   NOT NULL,
    "AgeY" FLOAT   NOT NULL,
    "AgeClass" VARCHAR   NOT NULL,
    "BirthFPID" INT   NOT NULL,
    "U_PlateID" int   NOT NULL,
    "RTL" FLOAT   NOT NULL,
    "Technician" INT   NOT NULL,
    "Terr" FLOAT   NOT NULL,
    "FPID" INT   NOT NULL,
    "Mum" INT   NOT NULL,
    "Dad" INT   NOT NULL,
    "MAC" FLOAT   NOT NULL,
    "PAC" FLOAT   NOT NULL,
    "BrF" INT   NOT NULL,
    "BrM" INT   NOT NULL,
    CONSTRAINT "pk_Birds_Data_Raw" PRIMARY KEY (
        "Collection_Num"
     )
);

CREATE TABLE "Bird_Age_Vs_Telo" (
    "Bird ID" int   NOT NULL,
    "Age" float   NOT NULL,
    "rtl" float   NOT NULL,
    CONSTRAINT "pk_Bird_Age_Vs_Telo" PRIMARY KEY (
        "Bird ID"
     )
);

CREATE TABLE "Bird_Territory_Data" (
    "BirdID" int   NOT NULL,
    "Sex" int   NOT NULL,
    "Age" float   NOT NULL,
    "RTL" float   NOT NULL,
    "Territory" int   NOT NULL,
    "Dominant_Female" int   NOT NULL,
    "Dominant_Male" int   NOT NULL,
    CONSTRAINT "pk_Bird_Territory_Data" PRIMARY KEY (
        "BirdID"
     )
);

CREATE TABLE "Territory_vs_Age" (
    "Territory" int   NOT NULL,
    "Average_RTL" float   NOT NULL,
    "Average_Age" float   NOT NULL,
    CONSTRAINT "pk_Territory_vs_Age" PRIMARY KEY (
        "Territory"
     )
);

CREATE TABLE "Dominant_Female_vs_Age" (
    "Dominant_Female" int   NOT NULL,
    "Average_RTL" float   NOT NULL,
    "Average_Age" float   NOT NULL,
    CONSTRAINT "pk_Dominant_Female_vs_Age" PRIMARY KEY (
        "Dominant_Female"
     )
);

CREATE TABLE "Dominant_Male_vs_Age" (
    "Dominant_Male" int   NOT NULL,
    "Average_RTL" float   NOT NULL,
    "Average_Age" float   NOT NULL,
    CONSTRAINT "pk_Dominant_Male_vs_Age" PRIMARY KEY (
        "Dominant_Male"
     )
);

CREATE TABLE "Mum_vs_Age" (
    "Mum" int   NOT NULL,
    "Average_RTL" float   NOT NULL,
    "Average_Age" float   NOT NULL,
    CONSTRAINT "pk_Mum_vs_Age" PRIMARY KEY (
        "Mum"
     )
);

CREATE TABLE "Dad_vs_Age" (
    "Dad" int   NOT NULL,
    "Average_RTL" float   NOT NULL,
    "Average_Age" float   NOT NULL,
    CONSTRAINT "pk_Dad_vs_Age" PRIMARY KEY (
        "Dad"
     )
);

ALTER TABLE "Bird_Age_Vs_Telo" ADD CONSTRAINT "fk_Bird_Age_Vs_Telo_Bird ID" FOREIGN KEY("Bird ID")
REFERENCES "Birds_Data_Raw" ("BirdID");

ALTER TABLE "Bird_Territory_Data" ADD CONSTRAINT "fk_Bird_Territory_Data_BirdID" FOREIGN KEY("BirdID")
REFERENCES "Birds_Data_Raw" ("BirdID");

ALTER TABLE "Territory_vs_Age" ADD CONSTRAINT "fk_Territory_vs_Age_Territory" FOREIGN KEY("Territory")
REFERENCES "Bird_Territory_Data" ("Territory");

ALTER TABLE "Dominant_Female_vs_Age" ADD CONSTRAINT "fk_Dominant_Female_vs_Age_Dominant_Female" FOREIGN KEY("Dominant_Female")
REFERENCES "Bird_Territory_Data" ("Dominant_Female");

ALTER TABLE "Dominant_Male_vs_Age" ADD CONSTRAINT "fk_Dominant_Male_vs_Age_Dominant_Male" FOREIGN KEY("Dominant_Male")
REFERENCES "Bird_Territory_Data" ("Dominant_Male");

ALTER TABLE "Mum_vs_Age" ADD CONSTRAINT "fk_Mum_vs_Age_Mum" FOREIGN KEY("Mum")
REFERENCES "Birds_Data_Raw" ("Mum");

ALTER TABLE "Dad_vs_Age" ADD CONSTRAINT "fk_Dad_vs_Age_Dad" FOREIGN KEY("Dad")
REFERENCES "Birds_Data_Raw" ("Dad");

