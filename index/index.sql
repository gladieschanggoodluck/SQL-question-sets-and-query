## index
## 100,000, 000 records

## no index

SELECT COUNT(*)
FROM person;

## create index

CREATE INDEX person_first_name_idx
ON person(first_name);


SELECT COUNT(*)
FROM person
WHERE first_name = 'Julia'; 

SELECT COUNT(*)
FROM person
WHERE last_name = 'Smith'; 

## multicolumn indexes

CREATE INDEX person_first_name_last_name_idx
ON person(last_name, first_name); 

SELECT COUNT(*)
FROM person
	WHERE last_name = "Juila"
		AND first_name = "Andrew"; 

## Index is not free, use them wisely 		