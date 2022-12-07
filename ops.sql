--JOIN construction_site and budget
SELECT * FROM construction_site
INNER JOIN Budget
ON construction_site.Site_ID = Budget.Site_ID;

--JOIN construction_site and contractor
SELECT * FROM construction_site
INNER JOIN contractors
on construction_site.Site_ID=contractors.Site_ID

--AGGREGATE total number of cost of sites
SELECT sum(Budget) FROM Budget;

--AGGREGATE total number of cost of labourers
SELECT sum(Labourers_Sal) FROM Budget;



--UNION: multiple labourers can have work in one site sites
select Site_ID from construction_site
UNION
select Site_ID from labourers


--Create trigger to check if labourer salary is 80 if yes then prevent addition.
DELIMITER $$
CREATE TRIGGER ADD_LABOURER
BEFORE INSERT
ON Budget FOR EACH ROW
BEGIN
IF NEW.Labourers_Sal>80 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='SALARY MUST BE LESSER THAN 80!';
END IF;
END;$$

--DROP TRIGGER ADD_LABOURER;
DROP TRIGGER ADD_LABOURER;

--create trigger to check if experience is <10 if yes then prevent addition.
DELIMITER $$
CREATE TRIGGER ADD_CONTRACTOR
BEFORE INSERT
ON contractors FOR EACH ROW
BEGIN
IF NEW.Experience<10 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='EXPERIENCE MUST BE GREATER THAN 10!';
END IF;
END;$$


--create trigger to check if budget is <1000 if yes then prevent addition.
DELIMITER $$
CREATE TRIGGER ADD_BUDGET_Constraint
BEFORE INSERT
ON Budget FOR EACH ROW
BEGIN
IF NEW.Budget<10000 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='BUDGET MUST BE GREATER THAN 10000!';
END IF;
END;$$

DROP trigger ADD_BUDGET;


#USE THIS
--create trigge to check if experience is >100 if yes then prevent addition.
DELIMITER $$
CREATE TRIGGER ADD_CONTRACTOR_EXP
BEFORE INSERT
ON contractors FOR EACH ROW
BEGIN
IF NEW.Experience>100 THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='EXPERIENCE MUST BE LESSER THAN 100!';
END IF;
END;$$

--drop trigger ADD_CONTRACTOR;
DROP TRIGGER ADD_CONTRACTOR_EXP;



--create procedure to filter sites with title type=A
DELIMITER $$
CREATE PROCEDURE filter_sites()
BEGIN
SELECT * FROM construction_site
WHERE Title='A';
END;$$

--call procedure
CALL filter_sites();

--drop procedure
DROP PROCEDURE filter_sites;

--create procedure to filter contractor with experience >10
DELIMITER $$
CREATE PROCEDURE filter_contractor()
BEGIN
SELECT * FROM contractors
WHERE Experience>10;
END;$$

--call procedure
CALL filter_contractor();

--drop procedure
DROP PROCEDURE filter_contractor;

###TEST DUMMY
--create procedure to filter labourers with salary >80
DELIMITER $$
CREATE PROCEDURE filter_labourers()
BEGIN
SELECT * FROM Budget
WHERE Labourers_Sal<80;
END;$$

--call procedure
CALL filter_labourers();

--drop procedure
DROP PROCEDURE filter_labourers;



--create a procedure if reserve

--CREATE A PROCEDURE TO CHECK NUMBER OF LABOURERS IN A SITE
DELIMITER $$
CREATE PROCEDURE check_labourers()
BEGIN


--create a procedure to join labourers and budget and fine where budget is between 10000 and 20000 and number of labourers is greater than 10
DELIMITER $$
CREATE PROCEDURE filter_labourers()
BEGIN

--

select site_id, count (*) from labourers group by Site_ID having count>2;

--create procedure to find total number of 

DELIMITER $$
CREATE PROCEDURE filter_budget()
BEGIN
SELECT * FROM Budget
WHERE Budget BETWEEN 10000 AND 20000 AND Labourers_Sal<100;
END;$$

--call procedure
CALL filter_budget();

--drop procedure
DROP PROCEDURE filter_budget;


--create procedure to find total number of labourers in a site and budget is between 10000 and 20000
DELIMITER $$
CREATE PROCEDURE filter_labourers()
BEGIN
SELECT * FROM t1
WHERE Budget BETWEEN 10000 AND 20000 AND count(*)>2;
END;$$



----------------------


DELIMITER $$
CREATE PROCEDURE BUDGE_LAB()
BEGIN
 create table if not exists tempo1 as select  site_id,count(*) as lab_no from labourers group by Site_ID;
 create table if not exists tempo2 select * from budget natural join temp01;
  select * from tempo2 where budget between 10000 and 200000 and lab_no>2;
END;$$

--call budge_lab()

CALL BUDGE_LAB()


CREATE FUNCTION= FUNCTION titletype(tit_type varchar(20)) returns VARCHAR(20)
deterministic
BEGIN
if tit_type='A' then return 'Good';
elseif tit_type='B' then return 'OK';
else return 'Bad';
end if;

end
-

