-- file:numeric_big.sql ln:1075 expect:true
WITH t(x, bc_result) AS (VALUES
('1.0e-1', .09531017980432486),
('1.0e-2', .009950330853168083),
('1.0e-3', .0009995003330835332),
('1.0e-4', .00009999500033330834),
('1.0e-5', .000009999950000333331),
('1.0e-6', .0000009999995000003333),
('1.0e-7', .00000009999999500000033),
('1.0e-8', .000000009999999950000000),
('1.0e-9', .0000000009999999995000000),
('1.0e-10', .00000000009999999999500000),
('1.0e-11', .000000000009999999999950000),
('1.0e-12', .0000000000009999999999995000),
('1.0e-13', .00000000000009999999999999500),
('1.0e-14', .000000000000009999999999999950),
('1.0e-15', .0000000000000009999999999999995),
('1.0e-16', .00000000000000010000000000000000),
('1.0e-17', .000000000000000010000000000000000),
('1.0e-18', .0000000000000000010000000000000000),
('1.0e-19', .00000000000000000010000000000000000),
('1.0e-20', .000000000000000000010000000000000000),
('1.0e-21', .0000000000000000000010000000000000000),
('1.0e-22', .00000000000000000000010000000000000000),
('1.0e-23', .000000000000000000000010000000000000000),
('1.0e-24', .0000000000000000000000010000000000000000),
('1.0e-25', .00000000000000000000000010000000000000000),
('1.0e-26', .000000000000000000000000010000000000000000),
('1.0e-27', .0000000000000000000000000010000000000000000),
('1.0e-28', .00000000000000000000000000010000000000000000),
('1.0e-29', .000000000000000000000000000010000000000000000),
('1.0e-30', .0000000000000000000000000000010000000000000000),
('1.0e-31', .00000000000000000000000000000010000000000000000),
('1.0e-32', .000000000000000000000000000000010000000000000000),
('1.0e-33', .0000000000000000000000000000000010000000000000000),
('1.0e-34', .00000000000000000000000000000000010000000000000000),
('1.0e-35', .000000000000000000000000000000000010000000000000000),
('1.0e-36', .0000000000000000000000000000000000010000000000000000),
('1.0e-37', .00000000000000000000000000000000000010000000000000000),
('1.0e-38', .000000000000000000000000000000000000010000000000000000),
('1.0e-39', .0000000000000000000000000000000000000010000000000000000),
('1.0e-40', .00000000000000000000000000000000000000010000000000000000))
SELECT '1+'||x, bc_result, ln(1.0+x::numeric), ln(1.0+x::numeric)-bc_result AS diff FROM t
