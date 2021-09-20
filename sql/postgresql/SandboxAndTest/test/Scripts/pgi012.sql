--# IssueCount 4
UPDATE "my_table" SET "a" = 5;
UPDATE "my_table" SET U&"a" = 5;

--# IssueCount 0
UPDATE my_table SET a = 5;
uPDaTE my_TabLE SeT a = 5;
