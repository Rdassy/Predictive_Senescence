/* Command file to read ASCII data file into SAS */
/* Note 1: change SAS library and dataset name as necessary */
LIBNAME TELO 'c:\telo\sas\';
DATA TELO.TelomeresA_R;

/* Note 2: change location of input data file to match your system */

INFILE 'c:\telo\data\TELOMERESA_R.da' LRECL = 285;
INPUT
   HHID $ 1 - 6
   PN $ 7 - 9
   PLATE  10 - 17
   WELL $ 18 - 20
   FINAL_T_S  21 - 31
   FINAL_CV  32 - 41
   NOTES $ 42 - 285
;

LABEL
   HHID = "HOUSEHOLD IDENTIFIER"
   PN = "PERSON NUMBER"
   PLATE = "PLATE"
   WELL = "WELL"
   FINAL_T_S = "FINAL_T_S"
   FINAL_CV = "FINAL_CV"
   NOTES = "NOTES"
;
run;
