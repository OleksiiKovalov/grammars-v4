-- file:updatable_views.sql ln:1192 expect:true
explain (costs off)
insert into uv_iocu_view (a, b) values ('xyxyxy', 3)
   on conflict (a) do update set b = excluded.b where excluded.c > 0
