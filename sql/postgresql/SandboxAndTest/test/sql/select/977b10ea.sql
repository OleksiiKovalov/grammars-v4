-- file:tstypes.sql ln:181 expect:true
SELECT ts_rank_cd(' a:1 sa:2A sb:2D g'::tsvector, 'a <-> s:* <-> sa:A')
