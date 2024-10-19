CREATE TABLE "EmploymentWage_Table" (
    "area" int   NOT NULL,
    "occ_code" varchar(10)   NOT NULL,
    "tot_emp" numeric(12,2)   NOT NULL,
    "emp_prse" numeric(12,2)   NOT NULL,
    "jobs_1000" numeric(12,2)   NOT NULL,
    "loc_quotient" numeric(12,2)   NOT NULL,
    "h_mean" numeric(12,2)   NOT NULL,
    "a_mean" numeric(12,2)   NOT NULL,
    "mean_prse" numeric(12,2)   NOT NULL,
    "h_pct25" numeric(12,2)   NOT NULL,
    "h_median" numeric(12,2)   NOT NULL,
    "h_pct75" numeric(12,2)   NOT NULL,
    "a_pct25" numeric(12,2)   NOT NULL,
    "a_median" numeric(12,2)   NOT NULL,
    "a_pct75" numeric(12,2)   NOT NULL,
    CONSTRAINT "pk_EmploymentWage_Table" PRIMARY KEY (
        "area","occ_code"
     )
);

CREATE TABLE "Occupation_Table" (
    "occ_code" varchar(20)   NOT NULL,
    "occ_title" varchar(200)   NOT NULL,
    "o_group" varchar(40)   NOT NULL,
    CONSTRAINT "pk_Occupation_Table" PRIMARY KEY (
        "occ_code"
     )
);

CREATE TABLE "State_Table" (
    "area" int   NOT NULL,
    "area_title" varchar(30)   NOT NULL,
    "prim_state" varchar(30)   NOT NULL,
    CONSTRAINT "pk_State_Table" PRIMARY KEY (
        "area"
     )
);

ALTER TABLE "EmploymentWage_Table" ADD CONSTRAINT "fk_EmploymentWage_Table_area" FOREIGN KEY("area")
REFERENCES "State_Table" ("area");

ALTER TABLE "EmploymentWage_Table" ADD CONSTRAINT "fk_EmploymentWage_Table_occ_code" FOREIGN KEY("occ_code")
REFERENCES "Occupation_Table" ("occ_code");

