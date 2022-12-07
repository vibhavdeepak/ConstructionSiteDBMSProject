CREATE TABLE Construction_Site
(
  Site_ID INT NOT NULL,
  Plot_Size INT NOT NULL,
  City CHAR(255) NOT NULL,
  Location CHAR(255) NOT NULL,
  Title_Type CHAR(255) NOT NULL,
  Fname CHAR(255) NOT NULL,
  Lname CHAR(255) NOT NULL,
  PRIMARY KEY (Site_ID)
);

CREATE TABLE Budget
(
  Budget INT NOT NULL,
  Reserve_Fund INT NOT NULL,
  Labourers_Sal INT NOT NULL,
  Architect_Sal INT NOT NULL,
  Designer_Sal INT NOT NULL,
  Contractor_Sal INT NOT NULL,
  Site_ID INT NOT NULL,
  FOREIGN KEY (Site_ID) REFERENCES Construction_Site(Site_ID) ON DELETE CASCADE
);
CREATE TABLE Architect
(
  AID INT NOT NULL,
  Fname CHAR(255) NOT NULL,
  Lname CHAR(255) NOT NULL,
  Site_ID INT NOT NULL,
  FOREIGN KEY (Site_ID) REFERENCES Construction_Site(Site_ID) ON DELETE CASCADE,
  UNIQUE (AID)
);

CREATE TABLE Labourers
(
  LID INT NOT NULL,
  DID INT NOT NULL,
  Fname CHAR(255) NOT NULL,
  Lname CHAR(255) NOT NULL,
  Dep_Name CHAR(255) NOT NULL,
  Site_ID INT NOT NULL,
  FOREIGN KEY (Site_ID) REFERENCES Construction_Site(Site_ID) ON DELETE CASCADE,
  UNIQUE (LID)
);

CREATE TABLE Contractors
(
  Fname CHAR(255) NOT NULL,
  Lname CHAR(255) NOT NULL,
  Contact_Name CHAR(255) NOT NULL,
  Experience INT NOT NULL,
  CID INT NOT NULL,
  Site_ID INT NOT NULL,
  FOREIGN KEY (Site_ID) REFERENCES Construction_Site(Site_ID) ON DELETE CASCADE,
  UNIQUE (CID)
);


insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (1, 6894, 'Nāṟay', 'North', 'B', 'Arni', 'Winman');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (2, 7233, 'Tanggungrejo', 'Golf View', 'A', 'Dorothee', 'Enderlein');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (3, 9885, 'Kingersheim', 'Sherman', 'A', 'Katerine', 'Baudinot');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (4, 4855, 'Whitegate', 'Katie', 'B', 'Flor', 'Sparks');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (5, 2551, 'Wudian', 'Brown', 'B', 'Scottie', 'Alvey');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (6, 2544, 'Albacete', 'Ronald Regan', 'B', 'Minna', 'Betterton');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (7, 5115, 'Paris 13', 'Carioca', 'B', 'Maggee', 'Caddick');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (8, 6306, 'Xirikxiy', 'Browning', 'C', 'Lyell', 'Querrard');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (9, 2635, 'Kosonsoy', 'Jackson', 'B', 'Edgardo', 'Szymczyk');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (10, 9908, 'Wugui', 'Forest Run', 'B', 'Sydney', 'Fost');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (11, 5814, 'Xiaoruo', 'Anzinger', 'C', 'Aline', 'Rojahn');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (12, 9244, 'Brooklyn', 'Mcguire', 'A', 'Shelden', 'Farlane');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (13, 2834, 'Hanzhong', 'Farwell', 'A', 'Torrance', 'Harker');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (14, 5061, 'Donggong', 'Moose', 'B', 'Nikolai', 'Knowlson');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (15, 2751, 'Cojata', 'Petterle', 'B', 'Cleavland', 'Grigaut');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (16, 9032, 'Dzüünbulag', 'Victoria', 'C', 'Stevana', 'Lampard');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (17, 5019, 'Sangmélima', 'Dixon', 'A', 'Tiler', 'Uman');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (18, 6462, 'Bīrganj', 'Talmadge', 'B', 'Delphine', 'Rayment');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (19, 8578, 'Caohe', 'Schlimgen', 'B', 'Gabriel', 'Stable');
insert into Construction_Site (Site_ID, Plot_Size, City, Location, Title_Type, Fname, Lname) values (20, 1918, 'Tuofeng', 'Grover', 'A', 'Lillis', 'Illidge');

insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (794733, 143029, 148, 383, 154, 225, 1);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (162057, 84913, 82, 228, 197, 145, 2);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (779276, 22006, 97, 372, 201, 111, 3);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (841139, 62070, 140, 356, 247, 188, 4);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (930800, 197758, 120, 329, 162, 111, 5);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (179746, 138432, 95, 333, 294, 189, 6);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (861164, 147825, 149, 373, 277, 237, 7);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (354448, 49622, 83, 205, 243, 158, 8);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (292364, 37888, 96, 388, 264, 184, 9);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (135562, 59022, 100, 316, 156, 187, 10);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (382381, 142000, 148, 313, 175, 149, 11);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (573916, 130936, 102, 287, 189, 132, 12);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (640700, 108280, 137, 388, 200, 199, 13);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (927237, 136483, 109, 391, 268, 216, 14);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (259033, 177678, 110, 252, 217, 112, 15);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (821579, 137029, 123, 202, 169, 164, 16);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (944715, 127047, 88, 330, 291, 142, 17);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (935257, 77168, 81, 241, 297, 247, 18);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (459047, 65081, 81, 303, 167, 189, 19);
insert into Budget (Budget, Reserve_Fund, Labourers_Sal, Architect_Sal, Designer_Sal, Contractor_Sal, Site_ID) values (147032, 16981, 116, 396, 194, 219, 20);

insert into Architect (AID, Fname, Lname, Site_ID) values (1, 'Riley', 'Pallent', 1);
insert into Architect (AID, Fname, Lname, Site_ID) values (2, 'Royal', 'Macknish', 2);
insert into Architect (AID, Fname, Lname, Site_ID) values (3, 'Yard', 'Joder', 3);
insert into Architect (AID, Fname, Lname, Site_ID) values (4, 'Iorgos', 'De Brett', 4);
insert into Architect (AID, Fname, Lname, Site_ID) values (5, 'Henry', 'Choupin', 5);
insert into Architect (AID, Fname, Lname, Site_ID) values (6, 'Bartram', 'Sproul', 6);
insert into Architect (AID, Fname, Lname, Site_ID) values (7, 'Stefan', 'Luberti', 7);
insert into Architect (AID, Fname, Lname, Site_ID) values (8, 'Kev', 'Oley', 8);
insert into Architect (AID, Fname, Lname, Site_ID) values (9, 'Henrik', 'Scoggin', 9);
insert into Architect (AID, Fname, Lname, Site_ID) values (10, 'Mordy', 'Steynor', 10);
insert into Architect (AID, Fname, Lname, Site_ID) values (11, 'Borden', 'Hover', 11);
insert into Architect (AID, Fname, Lname, Site_ID) values (12, 'Cross', 'McGarrity', 12);
insert into Architect (AID, Fname, Lname, Site_ID) values (13, 'Richy', 'Blondel', 13);
insert into Architect (AID, Fname, Lname, Site_ID) values (14, 'Martainn', 'Erdis', 14);
insert into Architect (AID, Fname, Lname, Site_ID) values (15, 'Curran', 'Glavis', 15);
insert into Architect (AID, Fname, Lname, Site_ID) values (16, 'Basile', 'Primo', 16);
insert into Architect (AID, Fname, Lname, Site_ID) values (17, 'Bryan', 'Whitwham', 17);
insert into Architect (AID, Fname, Lname, Site_ID) values (18, 'Edwin', 'Rillett', 18);
insert into Architect (AID, Fname, Lname, Site_ID) values (19, 'Hobie', 'Huxley', 19);
insert into Architect (AID, Fname, Lname, Site_ID) values (20, 'Fransisco', 'Tebbutt', 20);

insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (1, 1, 'Laurene', 'Zotto', 'Kristan', 1);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (2, 2, 'Sim', 'Gibby', 'Gussi', 2);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (3, 3, 'Cthrine', 'Peasey', 'Chantal', 3);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (4, 4, 'Gannon', 'Kehoe', 'Tatiania', 4);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (5, 5, 'Peyter', 'McFarlan', 'Othella', 5);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (6, 6, 'Charlene', 'Jaquemar', 'Carlita', 6);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (7, 7, 'Siward', 'Walker', 'Ariela', 7);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (8, 8, 'Nadeen', 'Ramey', 'Max', 8);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (9, 9, 'Estele', 'Caccavella', 'Waneta', 9);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (10, 10, 'Britney', 'Blackesland', 'Emmalynn', 10);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (11, 11, 'Giffard', 'Gilliat', 'Alida', 11);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (12, 12, 'Michail', 'Longhi', 'Brenn', 12);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (13, 13, 'Avivah', 'Belchamp', 'Lona', 13);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (14, 14, 'Wes', 'Durning', 'Ashley', 14);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (15, 15, 'Tymothy', 'Miere', 'Hinda', 15);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (16, 16, 'Nels', 'Davenhall', 'Sheela', 16);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (17, 17, 'Henrietta', 'Fillan', 'Tiffi', 17);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (18, 18, 'Jody', 'Mellon', 'Merrielle', 18);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (19, 19, 'Conchita', 'Danet', 'Hildagarde', 19);
insert into Labourers (LID, DID, Fname, Lname, Dep_Name, Site_ID) values (20, 20, 'Goddard', 'Gregori', 'Caressa', 20);


insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Jaimie', 'Blaylock', 'Feest, Barton and Auer', 2016, 1, 1);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Denise', 'Braisted', 'Lesch, Will and Gaylord', 2018, 2, 2);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Shay', 'Toleman', 'Legros, Emard and Langosh', 1984, 3, 3);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Anatollo', 'Coffelt', 'Crooks, Blanda and McKenzie', 2019, 4, 4);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Annice', 'Perrin', 'Adams, Barton and Kunze', 2002, 5, 5);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Eduino', 'Lamboll', 'Kiehn Inc', 2018, 6, 6);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Sari', 'Aitchinson', 'Larson-Olson', 1983, 7, 7);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Sherry', 'Tongs', 'Hartmann LLC', 2002, 8, 8);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Gabrielle', 'Cawthorne', 'Gleason, Braun and O''Kon', 2019, 9, 9);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Baillie', 'Hallard', 'Wisoky-Lubowitz', 2001, 10, 10);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Artur', 'Dominelli', 'Ullrich, Volkman and Herzog', 1986, 11, 11);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Kellen', 'Eliasson', 'Sanford-Willms', 1986, 12, 12);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Marys', 'Liversidge', 'Streich Group', 1984, 13, 13);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Kalle', 'Skeldinge', 'Mills Group', 1993, 14, 14);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Ellie', 'Statham', 'Adams LLC', 1994, 15, 15);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Coriss', 'Dainty', 'Gusikowski Inc', 2017, 16, 16);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Barnett', 'Wakeman', 'Kuhn-Wiza', 1988, 17, 17);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Sibley', 'Semonin', 'Ruecker LLC', 1982, 18, 18);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Constantine', 'Thridgould', 'Schumm, Ruecker and Jerde', 2006, 19, 19);
insert into Contractors (Fname, Lname, Contact_Name, Experience, CID, Site_ID) values ('Nadia', 'McLane', 'Durgan, Heathcote and Johnston', 1987, 20, 20);



--JOIN construction_site and budget
SELECT * FROM construction_site
INNER JOIN Budget
ON construction_site.Site_ID = Budget.Site_ID;

--JOIN construction_site and contractor
SELECT * FROM construction_site
INNER JOIN contractors
on construction_site.Site_ID=contractors.Site_ID

--Join construction_site and labourers
SELECT * FROM construction_site
INNER JOIN labourers
on construction_site.Site_ID=labourers.Site_ID

--join construction_site and budget and contractor
SELECT * FROM construction_site
INNER JOIN budget
on construction_site.Site_ID=budget.Site_ID
INNER JOIN contractors
on construction_site.Site_ID=contractors.Site_ID

--AGGREGATE total number of cost of sites
SELECT sum(Budget) FROM Budget;

--AGGREGATE total number of cost of labourers
SELECT sum(Labourers_Sal) FROM Budget;

--aggregate total number of cost of contractors
SELECT sum(Contractor_Sal) FROM Budget;

--aggregate total reserve cost of sites
SELECT sum(Reserve) FROM Budget;


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

--Set the default value of the column
ALTER TABLE construction_site
MODIFY Title_Type VARCHAR(20) DEFAULT 'A';

--set the default value of the column
alter table budget
MODIFY Reserve_Fund INT(20) DEFAULT 0;

--set the default value of the column
alter table contractors
MODIFY Experience INT(20) DEFAULT 0;

--set the default value of the column
alter table labourers
MODIFY DID INT(20) DEFAULT 0;
