-- file:arrays.sql ln:264 expect:true
SELECT array_position(ARRAY['sun','mon','tue','wed','thu','fri','sat'], NULL)
