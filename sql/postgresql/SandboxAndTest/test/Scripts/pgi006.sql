--# IssueCount 2

select * from tab1, tab2;
select * from tab2 inner join tab2 on a=b, tab3;

--# IssueCount 0
select * from tab2 inner join tab2 on a=b;