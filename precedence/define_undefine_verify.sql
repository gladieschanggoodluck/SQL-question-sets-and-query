
## SET VERIFY OFF - NO DISPLAY AND NO RUNNING
SET VERIFY OFF;
DEFINE MY_SALARY = 140000;

SELECT * FROM employees WHERE salary >= &MY_SALARY;

UNDEFINE MY_SALARY



## SET VERIFY ON- DISPLAY AND RUNNING
SET VERIFY ON;
DEFINE MY_SALARY = 140000;

SELECT * FROM employees WHERE salary >= &MY_SALARY;

UNDEFINE MY_SALARY

SELECT * FROM employees WHERE salary >= &MY_SALARY;

UNDEFINE MY_SALARY

## Applying Rules of precedence for operators in an expression 
## Precedence rule
sal *100/5 * 25 (10+2) * 5/20

# Oracle SQL precendence rule
# () - bracket solved first
# /, * - this is the same as math
# +, -
# || Concat
# =, <, >, <=, >=
# NULL, NOT NULL
# BETWEEN 
# !=,  <>
# NOT
# AND
# OR 
