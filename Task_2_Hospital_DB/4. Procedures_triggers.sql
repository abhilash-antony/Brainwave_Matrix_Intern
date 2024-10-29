-- a) Procedure

use hospital;

drop procedure doctor_details;

delimiter $$
create procedure doctor_details(IN x INT)
begin
	select * from patient_second where DoctorID = x;
    select (select concat(d.First_Name,' ', d.Last_Name) from doctor d
    where doctorID = x) as Doctor_Name, count(a.doctorID) as No_of_appointments
    from appointment a where a.doctorID = x;
    select concat(d.First_Name,' ', d.Last_Name) as Doctor, p.Procedure_Name, p.Procedure_Time
    from doctor d, procedures p where d.DoctorID = x and p.DoctorID = x;
end  $$
delimiter ;

call doctor_details(19237);



-- b) trigger

-- table staff and salary_expense before
select * from staff;
select * from salary_expense;

SET SQL_SAFE_UPDATES = 0;

delimiter $$
create trigger salary_update after insert on staff
for each row
begin
	delete from salary_expense;
    insert into salary_expense select sum(salary), count(*), sum(salary)/count(*) from staff;
end $$
delimiter ;

INSERT INTO Staff(First_Name, Last_Name, Position, Salary, Phone_Number, Email, Department_Name)
VALUES
('Angel', 'anna', 'Radiologist', 250000, '9895754625', 'angelanna@stjohns.com', 'Radiology');

-- after the insertion
select * from staff;
select * from salary_expense;