--# IssueCount 5
select * from tab1 natural join tab2;
select * from tab1 natural left join tab2;
select * from tab1 natural full join tab2;
select * from tab1 natural right join tab2;
select * from tab1 natural inner join tab2;

--# IssueCount 0
select * from tab1 join tab2 on a=b;
select * from tab1 inner join tab2 on a=b;
select * from tab1 left join tab2 on a=b;
select * from tab1 right join tab2 on a=b;
select * from tab1 full join tab2 on a=b;
