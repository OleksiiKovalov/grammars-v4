-- file:jsonb.sql ln:465 expect:true
select '{"a": {"b":{"c": "foo"}}}'::jsonb #> array['a','b','c']
