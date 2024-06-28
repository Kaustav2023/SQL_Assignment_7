-- Create Database Assignment_7 
--Studies Table
CREATE TABLE Studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
-- Insertion
INSERT INTO Studies values
('ANAND','SABHARI','PGDCA',4500),
('ALTAF','COIT','DCA',7200),
('JULIANA','BDPS','MCA',22000),
('KAMALA','PRAGATHI','DCA',5000),
('MARY','SABHARI','PGDCA ',4500),
('NELSON','PRAGATHI','DAP',6200),
('PATRICK','PRAGATHI','DCAP',5200),
('QADIR','APPLE','HDCA',14000),
('RAMESH','SABHARI','PGDCA',4500),
('REBECCA','BRILLIANT','DCAP',11000),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000),
('VIJAYA','BDPS','DCA',48000);
-- View
select * from Studies

-- Software Table
CREATE TABLE Software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

-- Insertion
INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6);

 -- View
 select * from Software

 -- Programmer Table
 CREATE TABLE Programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
 -- Insert
INSERT INTO Programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800),
('QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700),
('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);
-- View
select * from Programmer

--1. Find out the selling cost average for packages developed in Pascal.

Select Developin,AVG(Scost) AS [Average Selling Cost] from software where Developin='PASCAL' group by Developin

--2. Display the names and ages of all programmers.

 select PName,Datediff(yyyy,DOB,DOJ) AS [AGE] from Programmer

--3. Display the names of those who have done the DAP Course.

 Select PName from Studies where Course='DAP'

--4. Display the names and date of birth of all programmers born in January.

 Select PName,DOB from programmer where format(dob,'MMMMM')='JANUARY'

--5. What is the highest number of copies sold by a package?
 
 Select TOP 1 Developin,SUM(Sold) AS [MAX COPIES SOLD] from Software group by Developin order by SUM(SOLD) Desc

--6. Display lowest course fee.
 
 Select Min(Course_Fee) [Lowest Course Fee] from Studies

--7. How many programmers have done the PGDCA Course?

 Select PName from Studies where Course='PGDCA'

--8. How much revenue has been earned through sales of packages developed in C?

 Select Developin,Sum(Sold*SCost) AS [SALES] from Software where Developin='C' group by Developin

--9. Display the details of the software developed by Ramesh.

 Select * from Software where Pname='Ramesh'

--10. How many programmers studied at Sabhari?

 Select Institute,Count(*) AS [No. Of Programmer] from studies where Institute='SABHARI' group by Institute

--11. Display details of packages whose sales crossed the 2000 mark.

Select * from software where developin=ANY(select Developin from software group by developin having SUM(Scost*sold)>2000)

--12. Display the details of packages for which development costs have been recovered.

Select * from Software where Developin=Any (Select Developin
from software group by developin HAVING SUM(DCOST)<SUM(SCost *Sold))

--13. What is the cost of the costliest software development in Basic?
 
 Select TITLE,Max(DCOST) from software where developin='BASIC' group by TITLE

--14. How many packages have been developed in dBase?

Select Count(Title)AS[No. of Packages] from software where developin='DBase'

--15. How many programmers studied in Pragathi?

select Count(Pname) AS [Total Programmers] from studies where Institute='Pragathi'

--16. How many programmers paid 5000 to 10000 for their course?

select * from studies 
select Count(Pname) AS [Total Programmers] from studies where Course_Fee Between 5000 and 10000

--17. What is the average course fee?

select Course,Avg(Course_fee) AS [Average Course Fee] from studies group by Course

--18. Display the details of the programmers knowing C.

Select * from Programmer
Select Pname from Programmer where prof1='C' or Prof2='C'


--19. How many programmers know either COBOL or Pascal?

Select Pname from programmer where prof1='COBOL' or prof1='PASCAL' or prof2='COBOL' or prof2='PASCAL'

--20. How many programmers don�t know Pascal and C?

Select Pname from programmer where prof1 Not in ('PASCAL','C') AND prof2 NOT in('PASCAL','C')
select * from Programmer

--21. How old is the oldest male programmer?
select * from programmer 
Select TOP 1 Datediff(yyyy,DOB,DOJ) AS [Oldest Programmer] from Programmer where  Gender='M' order by Datediff(yyyy,DOB,DOJ) DESC

--22. What is the average age of female programmers?

Select AVG(datediff(yyyy,DOB,DOJ)) AS [Average Age of Female Programmer] from programmer where Gender='F' 

--23. Calculate the experience in years for each programmer and display with their names in descending order.

select * from Programmer 
Select * from Software
select * from studies

Select PName,Datediff(yyyy,DOJ,getdate()) AS [Experience ] from programmer order by Pname DESC

--24. Who are the programmers who celebrate their birthdays during the current month?

Select PName from programmer where month(dob)=month(getdate())
select * from Programmer

--25. How many female programmers are there?

Select Count(*) AS [No. Of Female Programmer] from programmer where gender='F'

--26. What are the languages studied by male programmers?

Select DISTINCT Prof1 from programmer where gender ='M' 
Union 
Select Distinct Prof2 from programmer where gender='M'

--27. What is the average salary?

Select AVG(salary) as [ AVERAGE SALARY ] from programmer 

--28. How many people draw a salary between 2000 to 4000?

Select Count(*) AS[Total Number of Player] from programmer where salary between 2000 and 4000 

--29. Display the details of those who don�t know Clipper, COBOL or Pascal.

Select * from programmer where Prof1 Not in ('Cobol','Clipper','Pascal') AND prof2 Not in ('Cobol','Clipper','Pascal')

--30. Display the cost of packages developed by each programmer.

select PName,Sum(DCOST) AS [Cost Of Development] from Software group by PName


--31. Display the sales value of the packages developed by each programmer.

Select PName,Title,SUM(SCost*sold) AS [Sales] From software group by PName,Title
Select PName,SUM(SCost*sold) AS [Sales] From software group by PName

--32. Display the number of packages sold by each programmer.

Select PName,Sum(Sold) AS [Total Number Packages Sold] from software group by PName Order By Sum(Sold) DESC

--33. Display the sales cost of the packages developed by each programmer language wise.

Select * From Programmer
Select * from Software

Select PName,Developin, Sum(Scost*Sold) AS [Sales By Programmer] from Software group by PName, Developin

--34. Display each language name with the average development cost, average selling cost and average price per copy.


Select Developin,Avg(DCost) AS [Average Dev Cost] ,Avg(SCost)AS [Average Sell Cost],Avg(Scost*sold) AS[Average Price Per Copy] from Software group by Developin

--35. Display each programmer�s name and the costliest and cheapest packages developed by him or her.

Select PName, Max(DCost)AS [Costliest Development], Min(DCost) AS [Cheapest Development] from Software group by PName

--36. Display each institute�s name with the number of courses and the average cost per course.

Select Institute,Count(Distinct Course) AS [No. Of Courses],Avg(Course_fee) AS [Average Course Fee] from Studies
group by institute

--37. Display each institute�s name with the number of students.

select * from studies
Select Institute, Count(PNAME) AS[ No. Of Students] from Studies Group By Institute

--38. Display names of male and female programmers along with their gender.

Select PName,Gender from Programmer 

--39. Display the name of programmers and their packages.

Select PName,Prof1,Prof2 from Programmer
Select PName,Title from software

--40. Display the number of packages in each language except C and C++.

Select Developin,Count(Title) AS [No. Of Packages] 
From Software where Developin Not In ('C','CPP') group by Developin

--41. Display the number of packages in each language for which development cost is less than 1000.

Select Developin,Count(DISTINCT Title) AS [No. Of Packages] 
From Software where DCOST<1000
Group By Developin

--42. Display the average difference between SCOST and DCOST for each package.

Select Title,Avg(Dcost-Scost)AS [Average Diff d/w Scost and Dcost] from Software group by Title

--43. Display the total SCOST, DCOST and the amount to be recovered for each programmer whose cost has not yet been recovered.


SELECT
    Title,
    SUM(SCOST*Sold) AS total_SCOST,
    SUM(DCOST*Sold) AS total_DCOST,
    SUM((DCOST*SOLD)-(SCOST*SOLD) AS total_amount_recovered  
FROM
    Software
GROUP BY
    Title
Having Sum((DCOST*SOLD)-(SCOST*SOLD))<0

--44. Display the highest, lowest and average salaries for those earning more than 2000.


Select Max(Salary) AS [Maximum Salary] ,Min(Salary) AS [Minimum Salary], Avg(Salary) AS [Average Salary] 
from Programmer 
Select Pname from Programmer Where Salary>2000
 
--45. Who is the highest paid C programmer?
 
Select Top 1 PName,Max(Salary)AS [Salary] From Programmer where prof1='C' or prof2='C' group by Pname Order By Max(salary) Desc
--OR
Select Top 1 PName,Max(SCost*Sold) AS [Sales] From Software where developin='C' group by Pname Order By Max(SCost*Sold) DESC

--46. Who is the highest paid female COBOL programmer?

Select Top 1 PName, Max(Salary) AS[ Max Salary ] from programmer where gender='F' and (Prof1='COBOL' or Prof2='COBOL') Group By Pname

--47. Display the names of the highest paid programmers for each language.

Select Developin,MAX(SCost*Sold) From Software Group By Developin Order By Max(SCost*Sold) Desc

--48. Who is the least experienced programmer?

Select TOP 1 Pname,Datediff(yyyy,doj,getdate()) AS [LEAST EXPERIENCED] From Programmer Order by Datediff(yyyy,doj,getdate()) ASC

--49. Who is the most experienced male programmer knowing PASCAL?

Select TOP 1 PName,Datediff(yyyy,doj,getdate()) AS [LEAST EXPERIENCED] From Programmer Where gender='M'Order by Datediff(yyyy,doj,getdate()) DESC

--50. Which language is known by only one programmer?

Select * from software
Select Developin AS [Language] From Software where Developin= ANY( Select Developin from software 
group by Developin
Having Count(Developin)=1)


--51. Who is the above programmer referred in 50?

Select PName AS [Programmer] From Software where Developin= ANY( Select Developin from software 
group by Developin
Having Count(Developin)=1)

--52. Who is the youngest programmer knowing dBase?

Select top 1 PName, Datediff(yyyy,Dob,getdate()) from Programmer 
where Prof1='dBase' Or Prof2='dBase' 
order by Datediff(yyyy,Dob,getdate()) ASC


--53. Which female programmer earning more than 3000 does not know C, C++, Oracle or dBase?

Select PName from programmer 
where salary>3000 and Prof1 not in('C','Cpp','Oracle','dBase') and Prof2 not in('C','Cpp','Oracle','dBase') and Gender='F'

--54. Which institute has the most number of students?

Select TOP 1 Institute, COUNT(PNAME) AS [No. Of Students] from Studies 
group by Institute 
order by Count(PName) Desc 

--55. What is the costliest course?

Select * from Studies
Select TOP 1 Course,Course_Fee From Studies order by Course_Fee DESC

--56. Which course has been done by the most number of students?

Select * from studies
SELECT TOP 1 Course,COUNT(PNAME)AS [No. Of Students] from Studies 
group by Course
order by Count(PName) DESC

--57. Which institute conducts the costliest course?

Select * from Studies
Select TOP 1 Institute,Course_Fee from Studies order by Course_Fee DESC

--58. Display the name of the institute and the course which has below average course fee.

 Select Institute, Course from Studies 
 where Course_Fee<(Select Avg(Course_fee) from Studies )

 

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the average fee.

SELECT Course
FROM Studies
WHERE course_fee BETWEEN (SELECT AVG(course_fee) - 1000 FROM Studies)
                    AND (SELECT AVG(course_fee) + 1000 FROM Studies);

--60. Which package has the highest development cost?

SELECT TOP 1 TITLE from Software order by DCOST DESC

--61. Which course has below average number of students?

SELECT Course,Count(PName)
FROM Studies
group by Course 
Having Count(PName)< Count(PName)/Count(Course);

--62. Which package has the lowest selling cost?

Select Top 1 Title From Software order By SCOST ASC

--63. Who developed the package that has sold the least number of copies?

Select  TOP 1 PNAME, Title,SUM(Sold) AS [Copies Sold] from Software group by TITLE, PName  order by Sum(Sold) 
Select * from Software

--64. Which language has been used to develop the package which has the highest sales amount?

Select TOP 1 Developin from software 
where title=(SELECT TOP 1 Title from Software Group by Title Order by SUM(SOLD) DESC)


--65. How many copies of the package that has the least difference between development and selling cost were sold?

SELECT SUM(Sold)
FROM Software
WHERE (DCOST - SCOST) = (
SELECT MIN(DCOST - SCOST)
FROM Software
)

--66. Which is the costliest package developed in Pascal?

Select * from Software
Select Top 1 TITLE, MAX(DCOST) AS [DEVELOPMENT COST] From Software Where Developin='PASCAL' Group by Title order by MAX(DCOST) DESC

--67. Which language was used to develop the most number of packages?

Select Top 1 Developin, COUNT(TITLE) from software group by Developin Order By Count(TITLE) DESC
--OR
Select Top 1 Developin from software group by Developin Order By Count(TITLE) DESC

--68. Which programmer has developed the highest number of packages?

Select Top 1 PName, Count(TITLE) from Software group by PName order by count(TITLE) Desc
--OR
Select Top 1 PName, Count(TITLE) from Software group by PName order by count(TITLE) Desc

--69. Who is the author of the costliest package?

Select TOP 1 PNAME AS AUTHOR , MAX(DCOST)AS [ Costliest Package]  from software group by PNAME order by MAX(DCOST) DESC

--70. Display the names of the packages which have sold less than the average number of copies.

Select TITLE from software where SOLD < (Select (SUM(SOLD)/count(Title)) from software)

--71. Who are the authors of the packages which have recovered more than double the development cost?

SELECT PNAME
from Software
WHERE ((SCOST*SOLD) - DCOST) > (2 * DCOST)
;

--72. Display the programmer names and the cheapest packages developed by them in each language.

SELECT PNAME,DEVELOPIN,MIN(DCOST)AS[Cheapest Package] From Software Group By PNAME,DEVELOPIN order by MIN(DCOST)

--73. Display the language used by each programmer to develop the highest selling and lowest selling package.

Select PNAME,DEVELOPIN,MAX(SCOST*SOLD)AS[Highest Selling],MIN(SCOST*SOLD)AS[Lowest Selling]
from software group by Pname,Developin

--74. Who is the youngest male programmer born in 1965?

Select * from programmer
Select TOP 1 PNAME,Datediff(yyyy,DOB,DOJ) from Programmer where Gender='M' AND year(dob)=1965 order by Datediff(yyyy,DOB,DOJ)

--75. Who is the oldest female programmer who joined in 1992?

Select TOP 1 PNAME,Datediff(yyyy,DOB,DOJ) from Programmer where Gender='F' AND year(dob)=1992 order by Datediff(yyyy,DOB,DOJ) DESC

--76. In which year was the most number of programmers born?

Select top 1 year(DOB),Count(year(Dob)) AS [Most No. Of Programmer] From Programmer group by year(DOB) order by Count(year(Dob)) DESC

--77. In which month did the most number of programmers join?

Select TOP 1 Format(DOJ,'MMMMM'),Count(month(DOJ)) as [MOST NO. JOINING] from Programmer group by Format(DOJ,'MMMMM')
order by Count(Month(DOJ)) DESC

--78. In which language are most of the programmer�s proficient?
select TOP 1 Prof1,Count(PName) from programmer group by Prof1 order by Count(PName) DESC
select TOP 1 Prof2,Count(PName) from programmer group by Prof2 order by Count(PName) DESC

--79. Who are the male programmers earning below the average salary of female programmers?

Select PNAME from programmer where salary<(select AVG(Salary) from Programmer where Gender='F')

--80. Who are the female programmers earning more than the highest paid?

SELECT TOP 1 PNAME from programmer where Gender='F' order by salary DESC

--81. Which language has been stated as the proficiency by most of the programmers?

Create table #Temp1 (LANGUAGE varchar(10))
insert into #Temp1(LANGUAGE)
select TOP 1 Prof1 from programmer group by Prof1 order by Count(PName) DESC
 Select * from #Temp1
Create table #Temp2 (LANGUAGE varchar(10))
insert into #Temp2(LANGUAGE)
select TOP 1 Prof2 from programmer group by Prof2 order by Count(PName) DESC

Select * from #Temp1
Union
Select * from #Temp2


--82. Display the details of those who are drawing the same salary.


SELECT PNAME,DOB,DOJ,GENDER,PROF1,PROF2,SALARY
FROM Programmer
WHERE salary IN (
    SELECT salary
    FROM Programmer
    GROUP BY salary
    HAVING COUNT(*) > 1
)


--83. Display the details of the software developed by the male programmers earning more than 3000.

Select Title from Software where Pname IN(
Select Pname from Programmer 
where Gender ='M' AND Salary>3000)

--84. Display the details of the packages developed in Pascal by the female programmers.

Select * from Software where PName in (
Select PName from Programmer where Gender='F')

--85. Display the details of the programmers who joined before 1990.

Select * from Programmer where PName IN ( 
Select PName from Programmer where Year(DOJ)<1990
)

--86. Display the details of the software developed in C by the female programmers at Pragathi.

Select * from Software where PNAME IN 
(Select PNAME from Software Where PNAME IN (
Select PNAME from Studies where Institute='Pragathi'))

--87. Display the number of packages, number of copies sold and sales value of each programmer institute wise.

Select Software.PName,COUNT(Title)AS[No. Of Package],SUM(SOLD)AS[No. Of Copies Sold],SUM(SOLD*SCOST)AS [Sales] 
from Software Group By PName


create table #temp6(Programmer varchar(30),No_Of_Package int,No_Of_Copies_Sold int,Sales decimal(10,2),Institute Varchar(30))

Insert Into #temp6(Programmer,No_Of_Package,No_Of_Copies_Sold,Sales)
Select PName,COUNT(Title)AS[No. Of Package],SUM(SOLD)AS[No. Of Copies Sold],SUM(SOLD*SCOST)AS [Sales] 
from Software group by PNAME

Update #temp6 
Set Institute = (Select TOP 10 Institute From Studies where PNAME IN ( Select PNAME from #Temp6 ))
select * from #temp6

-- Give me the Solution for these question set I really do not know how to solve this 

--88. Display the details of the software developed in dBase by male programmers who belong to the institute in which the most number of programmers studied.

Select TITLE From Software where Developin='dBase' And PNAME IN
       (Select PNAME from Programmer Where Gender='M' AND PName IN (Select PName From Studies where PName IN 
              (Select Top 1 PName From Studies group by PNAME order by COUNT(Institute) DESC)))

--89. Display the details of the software developed by the male programmersborn before 1965 and female programmers born after 1975.

Select TITLE from Software Where PName IN (
Select PNAME from Programmer where GENDER='M' AND Year(Dob)<1965)
UNION
Select TITLE from Software Where PName IN (
Select PNAME from Programmer where GENDER='F' AND Year(Dob)>1975)


--90. Display the details of the software that has been developed in the language which is neither the first nor the second proficiency of theprogrammers.

SELECT v

--91. Display the details of the software developed by the male students at Sabhari. 

SELECT * From Studies
Select * from Software

SELECT TITLE FROM SOFTWARE WHERE PNAME IN (SELECT PNAME FROM PROGRAMMER where GENDER='M' AND PNAME IN(
SELECT PNAME from STUDIES 
Where Institute='SABHARI'))

--92. Display the names of the programmers who have not developed any packages.

Select PNAME from PROGRAMMER where PNAME NOT IN
( SELECT PNAME FROM SOFTWARE )

--93. What is the total cost of the software developed by the programmers of Apple?

SELECT * from Studies
SELECT * from Programmer
SELECT SUM(DCOST)AS [TOTAL COST OF SOFTWARE] from Software where PNAME IN (SELECT PNAME from STUDIES
Where Institute='APPLE')

--94. Who are the programmers who joined on the same day?

SELECT PNAME From programmer group by PNAME having COUNT(DOJ)>1

--95. Who are the programmers who have the same Prof2?

Select PNAME,PROF2 From Programmer where PROF2 IN(SELECT PROF2 from Programmer Group by PROF2 HAVING COUNT(PROF2)>1)
order by Prof2

--96. Display the total sales value of the software institute wise.

SELECT * from studies 
Select * from Software

Select SUM(SCOST*SOLD )AS[SALES] from software Group by TITLE

--97. In which institute does the person who developed the costliest package
study?

SELECT INSTITUTE from studies where PNAME IN (SELECT TOP 1 PNAME from software order by DCOST DESC)

--98. Which language listed in Prof1, Prof2 has not been used to develop any package?

Select Prof1 AS LANGUAGE from Programmer where PROF1 NOT IN (SELECT Prof1 from Programmer )
UNION
SELECT Prof2 AS LANGUAGE from Programmer Where PROF2 NOT IN (SELECT Prof2 From Programmer )


--99. How much does the person who developed the highest selling packageearn and what course did he/she undergo?

Select Salary from Programmer where PNAME in 
(Select TOP 1 PNAME from software group by PNAME,TITLE order by SUM(SOLD) DESC)


create table #temp7 (PNAME Varchar(30))
Insert into #temp7
Select TOP 1 PNAME from software group by PNAME,TITLE order by SUM(SOLD) DESC
 
Select PNAME,COURSE From Studies Where PNAME IN(Select PName from #temp7)

--100. What is the average salary for those whose software sales is more than 50,000?

Select PNAME AS [SALES] from Software where (SCOST*SOLD) > 50000 

Create Table #temp8 (PNAME Varchar(30))

Insert Into #temp8 
Select PNAME AS [SALES] from Software where (SCOST*SOLD) > 50000 

Select (SUM(Salary)/COUNT(*))AS [Average Salary] from Programmer where PNAME in(Select * from #temp8)


--101. How many packages were developed by students who studied in institutes that charge the lowest course fee?

SELECT COUNT(TITLE) AS [No. Of Packages Developed] From Software where PNAME IN 
(SELECT PNAME from Studies where INSTITUTE IN ( 
SELECT TOP 1 INSTITUTE from studies order by Course_Fee ASC))

--102. How many packages were developed by the person who developed the cheapest package? Where did he/she study?

Select COUNT(Title) As [No. Of Packages] 
From Software Where PName IN(
select TOP 1 PNAME from Software Order by DCOST ASC)

Select PNAME,INSTITUTE From Studies 
where PNAME in (select TOP 1 PNAME from Software Order by DCOST ASC)


--103. How many packages were developed by female programmers earning more than the highest paid male programmer?

SELECT PNAME,COUNT(TITLE) from software where PNAME IN(
SELECT PNAME from Programmer where Gender ='F' AND Salary<(
SELECT TOP 1 SALARY from programmer where Gender='M' order by SALARY DESC) ) group by PNAME

--104. How many packages are developed by the most experienced
--programmers from BDPS?

SELECT * from Studies 
Select * from Programmer


Select COUNT(TITLE)AS[No Of Packages Developed] From Software where PNAME IN (Select TOP 1 PNAME from Programmer
where PNAME IN(Select PNAME from Studies Where INSTITUTE='BDPS')
Order By Datediff(yyyy,dob,getdate()))

--105. List the programmers (from the software table) and the institutes they
--studied at.

Select PNAME, INSTITUTE from Studies where PNAME IN(Select PNAME from Software)


--106. List each PROF with the number of programmers having that PROF
--and the number of the packages in that PROF.



--107. List the programmer names (from the programmer table) and the
--number of packages each has 

Select PNAME,COUNT(TITLE) from Software where PNAME IN (Select PNAME From Programmer) group by PNAME

