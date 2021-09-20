--# IssueCount 3
select * from table2 join table2 on a=a join table3 on b=b;

--# IssueCount 2
select * from table2 join table2 on a=a join table3 c on b=b;


--# IssueCount 1
select * from table2 join table2 b on a=a join table3 c on b=b;

--# IssueCount 0
select * from table2 a join table2 b on a=a join table3 c on b=b;
