--# IssueCount 1
delete  from tabl2;

--# IssueCount 0
delete from tabk where a=b;
delete from tabk where current of a;
DELETE FROM films USING producers
 WHERE producer_id = producers.id AND producers.name = 'foo';
DELETE FROM films
  WHERE producer_id IN (SELECT id FROM producers WHERE name = 'foo');
DELETE FROM films WHERE kind <> 'Musical';
DELETE FROM tasks WHERE status = 'DONE' RETURNING *;
