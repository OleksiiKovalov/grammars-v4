-- file:groupingsets.sql ln:91 expect:true
select sum(c) from gstest2
  group by grouping sets((), grouping sets((), grouping sets(((a, b)))))
  order by 1 desc
