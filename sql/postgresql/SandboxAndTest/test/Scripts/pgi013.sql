--# IssueCount 2
update tabe set a=3;
update tabe set a=b;


--# IssueCount 0
update tabe set a=3 where a=2;
update tabe set a=b where current of c;
