/*SUBQUERIES LAB*/

USE hospital;

SHOW TABLES;

SELECT * FROM appointment;
SELECT * FROM department;
SELECT * FROM doctor;
SELECT * FROM doctor_phone;
SELECT * FROM insurance;
SELECT * FROM medication;
SELECT * FROM nurse;
SELECT * FROM patient;
SELECT * FROM procedures;
SELECT * FROM room;
SELECT * FROM staff;
SELECT * FROM ward;

-- a) basic subquery
/*details of staff with the least salary*/
SELECT CONCAT(first_name, ' ', last_name) AS Name, Salary, Department_name AS Dept FROM staff
WHERE salary = (SELECT MIN(salary) FROM staff);

/*list of patients treated by Dr. Anusha*/
SELECT concat(first_name, ' ', last_name) AS Name, d_o_b, Phone_Number FROM patient p
WHERE doctorid = (SELECT doctorid FROM doctor d WHERE first_name = 'Anusha') ORDER BY Name;


-- b) multiple column subqueries
/*subqueries that return multiple columns as output to their parent query*/
SELECT procedureid, doctorid, procedure_name FROM procedures WHERE (doctorid, procedure_name) IN
(select doctorid, procedure_name from procedures where procedureid = 'MLN123');


-- c) Subqueries with having
SELECT concat(first_name, ' ', last_name) as Name, Position, Salary FROM staff WHERE salary > (SELECT AVG(salary) FROM staff
WHERE department_name = staff.department_name GROUP BY department_name having department_name = 'Ophthalmology');


-- d) correlated subqueries
select concat(first_name, ' ', last_name) as Name, Position, Salary, Department_name as Dept
from staff s where salary > (select avg(salary) from staff where department_name = s.department_name);


-- e) single row subqueries
/*subquery in where clause to print names of nurses monitoring the wards*/
select concat(first_name, ' ', last_name) as Nurse_Name, Department_Name as Department, Phone_Number
from nurse n where n.NurseID in (select head_Nurse_ID from ward w where w.head_nurse_id = n.NurseID);

/*subqueries using single row operators*/
/*A single-row subquery is a subquery that returns a single value*/
select concat(first_name, ' ', last_name) as Staff_Name, Salary from Staff where salary < any(select min(salary) from staff group by department_name);

/*Single row subqueries in having clause*/
select department_name, sum(salary) as salary from staff group by department_name having salary in (select salary from staff where salary > 35000);

/*subquery in from clause*/
select * from (select First_Name, Last_Name, Phone_Number from Patient p where p.D_O_B < '2000-01-01') as Patient_Bday;
select * from (select First_Name, Last_Name from Patient p where p.Room_No is not null) as Patient_Room;

/*subquery in select*/
select distinct First_Name as Patient_Name, (select First_Name from Doctor d where d.DoctorID = p.DoctorID) as Doctor_Name from Patient p;
select distinct First_Name as Patient_Name, (select First_Name from Nurse n where n.NurseID = p.NurseID) as Nurse_Name from Patient p;

/*single row subqueries returning more than one row*/
select salary from staff where salary > 35000;

/*single row subqueries with aggregate function on the outer query*/
SELECT concat(first_name, ' ', last_name) as Name, d_o_b, Phone_Number FROM patient p
WHERE doctorid = (SELECT doctorid FROM doctor d WHERE first_name = 'Anusha') order by Name;


-- f) multiple row subqueries
/*multiple row subqueries return more than one row of data*/
/*IN returns true if value on the left is found in the set of values returned by the subquery*/
SELECT staffID, first_name, salary, department_name FROM staff s
WHERE salary > ALL (SELECT AVG(salary) FROM staff WHERE department_name = s.department_name) order by first_name;

/*ANY returns true if the comparison is true for at least one value in the set of values returned by the subquery*/
SELECT staffID, first_name, salary, department_name FROM staff s
WHERE salary in (SELECT AVG(salary) FROM staff WHERE department_name = s.department_name);

/*ALL returns true if the comparison is true for all the values in the set of values returned by the subquery*/
SELECT staffID, first_name, salary, department_name FROM staff s
WHERE salary > Any (SELECT AVG(salary) FROM staff WHERE department_name = s.department_name);


-- g) correlated subqueries with EXISTS and NOT EXISTS
/*exists returns true if the subquery returns atleast one row*/
SELECT staffID, first_name, salary, department_name FROM staff s1
WHERE EXISTS (SELECT 1 FROM staff s2 WHERE s2.department_name = s1.department_name AND s2.salary < s1.salary);

/*not exists returns true if the subquery returns no rows*/
SELECT department_Name FROM department d
WHERE NOT EXISTS (SELECT 1 FROM staff s WHERE s.department_name = d.department_Name);


-- h) nested subqueries    
SELECT staffID, first_name, salary, department_name FROM staff s
WHERE salary > (SELECT AVG(salary) FROM staff
WHERE department_name = (SELECT department_name FROM staff GROUP BY department_name ORDER BY AVG(salary) DESC LIMIT 1)) order by first_name;