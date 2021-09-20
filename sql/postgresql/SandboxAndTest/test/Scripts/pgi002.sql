--# IssueCount 7
select *,a,b,c,d,e,f,g from tab2;
select * from tab2 union all select * from tab3;
select a from (select *from tab2 union all select * from tab3)s;
select a from (select *from tab2 union all select a from tab3)s;
select a from (select a from tab2 union all select * from tab3)s;

--# IssueCount 0
select a,b,c from taba where exists(select * from tabb);
--# IssueCount 0
select a,b,c from taba where exists(select a from tabb);
select a from (select a from tab2 union all select a from tab3)s;
