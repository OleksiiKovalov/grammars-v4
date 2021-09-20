--# IssueCount 3

select * from tabl2 order by 1;
select * from tabl2 order by 1,b,c;
select * from tabl2 order by a,3,c;


--# IssueCount 0
select * from table2 order by a,b,c;