--# IssueCount 0
--https://www.postgresql.org/docs/current/plpgsql-structure.html
<< outerblock >>
DECLARE
    quantity integer := 30;
BEGIN
    RAISE NOTICE 'Quantity here is %', quantity;  -- Prints 30
    quantity := 50;
    --
    -- Create a subblock
    --
    DECLARE
        quantity integer := 80;
    BEGIN
        RAISE NOTICE 'Quantity here is %', quantity;  -- Prints 80
        RAISE NOTICE 'Outer quantity here is %', outerblock.quantity;  -- Prints 50
    END;

    RAISE NOTICE 'Quantity here is %', quantity;  -- Prints 50

    RETURN quantity;
END;
--# IssueCount 0
--https://www.postgresql.org/docs/current/plpgsql-declarations.html
BEGIN
    RETURN subtotal * 0.06;
END;

--# IssueCount 0
DECLARE
    subtotal ALIAS FOR $1;
BEGIN
    RETURN subtotal * 0.06;
END;

--# IssueCount 0
DECLARE
    v_string ALIAS FOR $1;
    index ALIAS FOR $2;
BEGIN
    -- some computations using v_string and index here
	NULL;
END;
--# IssueCount 0
BEGIN
    RETURN in_t.f1 || in_t.f3 || in_t.f5 || in_t.f7;
END;
--# IssueCount 0
BEGIN
    tax := subtotal * 0.06;
END;
--# IssueCount 0
BEGIN
    sum := x + y;
    prod := x * y;
END;
--# IssueCount 0
BEGIN
    RETURN QUERY SELECT s.quantity, s.quantity * s.price FROM sales AS s
                 WHERE s.itemno = p_itemno;
END;
--# IssueCount 0
DECLARE
    result ALIAS FOR $0;
BEGIN
    result := v1 + v2 + v3;
    RETURN result;
END;
--# IssueCount 0
BEGIN
    sum := v1 + v2 + v3;
END;
--# IssueCount 0
DECLARE
    t2_row table2%ROWTYPE;
	name RECORD;
BEGIN
    SELECT * INTO t2_row FROM table2 WHERE ... ;
    RETURN t_row.f1 || t2_row.f3 || t_row.f5 || t2_row.f7;
END;
--# IssueCount 0
BEGIN
    RETURN a < b;
END;
--# IssueCount 0
DECLARE
    local_a text := a;
    local_b text := b;
    local_a text COLLATE "en_US";	
BEGIN
    RETURN local_a < local_b;
END;
--# IssueCount 0
BEGIN
    RETURN a < b COLLATE "C";
END;



--# IssueCount 0
--https://www.postgresql.org/docs/current/plpgsql-statements.html
BEGIN
    SELECT * INTO STRICT myrec FROM emp WHERE empname = myname;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE EXCEPTION 'employee % not found', myname;
        WHEN TOO_MANY_ROWS THEN
            RAISE EXCEPTION 'employee % not unique', myname;
END;
--# IssueCount 0
#print_strict_params on
DECLARE
userid int;
BEGIN
    SELECT users.userid INTO STRICT userid
        FROM users WHERE users.username = get_userid.username;
    RETURN userid;
END
--# IssueCount 0
BEGIN
IF parentid IS NULL OR parentid = ''
THEN
    RETURN fullname;
ELSE
    RETURN hp_true_filename(parentid) || '/' || fullname;
END IF;
IF v_count > 0 THEN
    INSERT INTO users_count (count) VALUES (v_count);
    RETURN 't';
ELSE
    RETURN 'f';
END IF;
IF number = 0 THEN
    result := 'zero';
ELSIF number > 0 THEN
    result := 'positive';
ELSIF number < 0 THEN
    result := 'negative';
ELSE
    -- hmm, the only other possibility is that number is null
    result := 'NULL';
END IF;
IF demo_row.sex = 'm' THEN
    pretty_sex := 'man';
ELSE
    IF demo_row.sex = 'f' THEN
        pretty_sex := 'woman';
    END IF;
END IF;
END;
--# IssueCount 0
begin
CASE x
    WHEN 1, 2 THEN
        msg := 'one or two';
    WHEN 3, 4 THEN
        msg := 'one or two';
    ELSE
        msg := 'other value than one or two';
END CASE;
CASE
    WHEN x BETWEEN 0 AND 10 THEN
        msg := 'value is between zero and ten';
    WHEN x BETWEEN 11 AND 20 THEN
        msg := 'value is between eleven and twenty';
END CASE;
end;
--# IssueCount 0
begin
LOOP
    -- some computations
    IF count > 0 THEN
        EXIT;  -- exit loop
    END IF;
END LOOP;

LOOP
    -- some computations
    EXIT WHEN count > 0;  -- same result as previous example
END LOOP;

<<ablock>>
BEGIN
    -- some computations
    IF stocks > 100000 THEN
        EXIT ablock;  -- causes exit from the BEGIN block
    END IF;
    -- computations here will be skipped when stocks > 100000
END;
end;
--# IssueCount 0
begin
LOOP
    -- some computations
    EXIT WHEN count > 100;
    CONTINUE WHEN count < 50;
    -- some computations for count IN [50 .. 100]
END LOOP;
end;
--# IssueCount 0
begin
WHILE amount_owed > 0 AND gift_certificate_balance > 0 LOOP
    NULL;
END LOOP;

WHILE NOT done LOOP
    NULL;
END LOOP;
end;


--# IssueCount 0
begin
FOR i IN 1..10 LOOP
    NULL;
END LOOP;

FOR i IN REVERSE 10..1 LOOP
    null;
END LOOP;

FOR i IN REVERSE 10..1 BY 2 LOOP
    -- i will take on the values 10,8,6,4,2 within the loop
    null;
END LOOP;

end;
--# IssueCount 0
begin
DECLARE
    mviews RECORD;
BEGIN
    FOR mviews IN
       SELECT n.nspname AS mv_schema,
              c.relname AS mv_name,
              pg_catalog.pg_get_userbyid(c.relowner) AS owner
         FROM pg_catalog.pg_class c
    LEFT JOIN pg_catalog.pg_namespace n ON (n.oid = c.relnamespace)
        WHERE c.relkind = 'm'
     ORDER BY 1
    LOOP
        EXECUTE format('REFRESH MATERIALIZED VIEW %I.%I', mviews.mv_schema, mviews.mv_name);
    END LOOP;

    RETURN 1;
END;
end;
--# IssueCount 0
begin
    FOR mviews IN EXECUTE 'select * from table' using 1,2
    LOOP
        NULL;
    END LOOP;
end;
--# IssueCount 0
DECLARE
  x int[];
BEGIN
  FOREACH x SLICE 1 IN ARRAY $1
  LOOP
    NULL;
  END LOOP;
END;
--# IssueCount 0
BEGIN
    UPDATE mytab SET firstname = 'Joe' WHERE lastname = 'Jones';
    x := x + 1;
    y := x / 0;
EXCEPTION
    WHEN division_by_zero THEN
        RETURN x;
END;
--# IssueCount 0
BEGIN
    LOOP
        -- first try to update the key
        UPDATE db SET b = data WHERE a = key;
        IF found THEN
            RETURN;
        END IF;
        -- not there, so try to insert the key
        -- if someone else inserts the same key concurrently,
        -- we could get a unique-key failure
        BEGIN
            INSERT INTO db(a,b) VALUES (key, data);
            RETURN;
        EXCEPTION WHEN unique_violation THEN

        END;
    END LOOP;
END;
--# IssueCount 0
begin
 RAISE NOTICE 'Calling cs_create_job(%)', v_job_id;
 RAISE EXCEPTION 'Nonexistent ID --> %', user_id
      USING HINT = 'Please check your user ID'
      ,ERRCODE = 'unique_violation'
      ,ERRCODE = '23505';
       
RAISE 'Duplicate user ID: %', user_id USING ERRCODE = 'unique_violation';
RAISE 'Duplicate user ID: %', user_id USING ERRCODE = '23505';

RAISE division_by_zero;
RAISE SQLSTATE '22012';
RAISE unique_violation USING MESSAGE = 'Duplicate user ID: ' || user_id;     
end;

--# IssueCount 0
begin
assert 1=2,'OOPS!';     
end;

--# IssueCount 0
begin
select * from tabl2;
delete from tabe2;
insert into tab3 values(1);
end;

--# IssueCount 0
#print_strict_params on
DECLARE
userid int;
BEGIN
    SELECT users.userid INTO STRICT userid
        FROM users WHERE users.username = get_userid.username;
    RETURN userid;
END
--# IssueCount 0
BEGIN
    SELECT * INTO STRICT myrec FROM emp WHERE empname = myname;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE EXCEPTION 'employee % not found', myname;
        WHEN TOO_MANY_ROWS THEN
            RAISE EXCEPTION 'employee % not unique', myname;
END;
--# IssueCount 0
BEGIN
SELECT * INTO myrec FROM emp WHERE empname = myname;
IF NOT FOUND THEN
    RAISE EXCEPTION 'employee % not found', myname;
END IF;
END;

--# IssueCount 0
BEGIN
EXECUTE 'SELECT count(*) FROM mytable WHERE inserted_by = $1 AND inserted <= $2'
   INTO STRICT c
   USING checked_user, checked_date;
EXECUTE 'SELECT count(*) FROM '
    || quote_ident(tabname)
    || ' WHERE inserted_by = $1 AND inserted <= $2'
   INTO c
   USING checked_user, checked_date;
    
END;

--# IssueCount 0
BEGIN
EXECUTE format('SELECT count(*) FROM %I WHERE inserted_by = $1 AND inserted <= $2', tabname)
   INTO c
   USING checked_user, checked_date;    
END;

--# IssueCount 0
BEGIN
PERFORM create_mv('cs_session_page_requests_mv', my_query);           
select * from tab;                 
END;

--# IssueCount 0
BEGIN
CALL triple(myvar);             
END;

--# IssueCount 0
BEGIN
 OPEN curs1 FOR SELECT * FROM foo WHERE key = mykey;
 OPEN curs1 SCROLL FOR SELECT * FROM foo WHERE key = mykey;
 OPEN curs1 NO SCROLL FOR SELECT * FROM foo WHERE key = mykey;
END;

--# IssueCount 0
BEGIN
 OPEN curs1 FOR SELECT * FROM foo WHERE key = mykey;
 OPEN curs1 SCROLL FOR SELECT * FROM foo WHERE key = mykey;
 OPEN curs1 NO SCROLL FOR SELECT * FROM foo WHERE key = mykey;

 OPEN curs1 FOR EXECUTE format('SELECT * FROM %I WHERE col1 = $1',tabname) USING keyvalue,222;
 
OPEN curs2;
OPEN curs3(42);
OPEN curs3(key := 42); 
END;


--# IssueCount 0
BEGIN
FETCH curs1 INTO rowvar,b;
FETCH curs2 INTO foo, bar, baz;
FETCH LAST FROM curs3 INTO x,y;
FETCH RELATIVE -2 FROM curs4 INTO x,y,z;
FETCH NEXT FROM curs4 INTO x,y,z;
FETCH PRIOR FROM curs4 INTO x,y,z;
FETCH FIRST FROM curs4 INTO x,y,z;
FETCH ABSOLUTE 1 FROM curs4 INTO x,y,z;
FETCH FORWARD FROM curs4 INTO x,y,z;
FETCH BACKWARD FROM curs4 INTO x,y,z;

END;


--# IssueCount 0
BEGIN
MOVE curs1;
MOVE LAST FROM curs3;
MOVE RELATIVE -2 FROM curs4;
MOVE FORWARD 2 FROM curs4;
END;
--# IssueCount 0
BEGIN
CLOSE curs1;
END;
--# IssueCount 0
#OPTION DUMP
#VARIABLE_CONFLICT ERROR
#VARIABLE_CONFLICT USE_VARIABLE
#VARIABLE_CONFLICT USE_COLUMN
BEGIN
NULL;
END;
--# IssueCount 0
DECLARE
    quantity integer := 30;
    user_id integer;
    quantity numeric(5);
    url varchar;
    myrow tablename%ROWTYPE;
    myfield tablename.columnname%TYPE;
    arow RECORD;
    quantity integer DEFAULT 32;
    url varchar := 'http://mysite.com';
    user_id CONSTANT integer := 10;
DECLARE
    v_string ALIAS FOR $1;
    index ALIAS FOR $2;    
DECLARE
  prior ALIAS FOR old;
  updated ALIAS FOR new;
user_id users.user_id%TYPE;
 t2_row table2%ROWTYPE;
DECLARE
    local_a text COLLATE "en_US";       
DECLARE
    result ALIAS FOR $0;    
BEGIN
END;
--# IssueCount 0
DECLARE
    curs1 refcursor;
    curs2 CURSOR FOR SELECT * FROM tenk1;
    curs3 CURSOR (key integer) FOR SELECT * FROM tenk1 WHERE unique1 = key;
BEGIN
 NULL;
END;
--# IssueCount 0
BEGIN
CLOSE curs1;
END;
--# IssueCount 0
BEGIN
COMMIT;
ROLLBACK;
COMMIT AND CHAIN;
COMMIT AND NO CHAIN;
ROLLBACK AND CHAIN;
ROLLBACK AND NO CHAIN;
END;
--# IssueCount 0
BEGIN
set aaa to default;
reset bbb;
reset all;

END;
--# IssueCount 0
--# IssueCount 0
--# IssueCount 0
--# IssueCount 0
--# IssueCount 0
--# IssueCount 0
--# IssueCount 0
--# IssueCount 0
--# IssueCount 0
--# IssueCount 0
