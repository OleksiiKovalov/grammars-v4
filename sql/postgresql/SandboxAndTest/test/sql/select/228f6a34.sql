-- file:timestamptz.sql ln:221 expect:true
SELECT '' AS to_char_2, to_char(d1, 'FMDAY FMDay FMday FMMONTH FMMonth FMmonth FMRM')
   FROM TIMESTAMPTZ_TBL
