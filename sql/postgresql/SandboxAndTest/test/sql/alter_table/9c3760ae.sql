-- file:replica_identity.sql ln:57 expect:true
ALTER TABLE test_replica_identity REPLICA IDENTITY USING INDEX test_replica_identity_oid_idx
