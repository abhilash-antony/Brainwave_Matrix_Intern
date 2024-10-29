/*JOINS LAB*/

USE hospital;

CREATE TABLE Patient_second(
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
Phone_Number VARCHAR(10) NOT NULL,
DoctorID VARCHAR(5),
Room_No SMALLINT UNSIGNED DEFAULT NULL,
Ward_No SMALLINT UNSIGNED DEFAULT NULL
);

INSERT INTO Patient_second(First_Name, Last_Name, Phone_Number, DoctorID, Ward_No) VALUES
('Abhilash', 'Antony',  '9876543212', '19237', 1001),
('Honey', 'Rose',  '9563214567', '17886', 1003),
('Jisna', 'Joseph',  '9012789456', '17845', 1005),
('Liya', 'Thomas',  '9127891245', '75645', 1007),
('Naveen', 'Sebastian',  '9234578564', '19237', 1010);

INSERT INTO Patient_second(First_Name, Last_Name, Phone_Number, DoctorID, Room_No) VALUES
('Hanna', 'Hamna', '9543219878', '18750', 201),
('Jeremiah', 'Buckette', '9154567856', '19237', 203),
('Kevin', 'Karthik', '9072957485', '10863', 205),
('Midhun', 'Murali', '9784562648', '19187', 207),
('Sanjoe', 'Baby', '900124512', '17777', 210);


select * from patient_second;
select * from room;

-- a) NATURAL JOIN
/*common attribute with same datatype*/
select * from patient_second natural join room ;

/*different attribute name*/
/*natural join only works on columns with the same name in two tables*/

/*same attribute name with different datatype*/
/*creating a table with different dtype*/
CREATE TABLE Room_second(
Room_No char(3),
Room_Type SET('Normal', 'Deluxe', 'Premium Deluxe'),
Rent_Per_Day SMALLINT UNSIGNED NOT NULL,
Occupancy_Status SET('Vacant', 'Occupied'),
Television BOOL DEFAULT 0,
PRIMARY KEY(Room_No)
);

INSERT INTO Room_second VALUES
('201','Normal', 1000, 'Occupied', 0),
('202','Normal', 1000, 'Occupied', 0),
('203','Deluxe', 2500, 'Occupied', 1),
('204','Deluxe', 2500, 'Vacant', 1),
('205','Deluxe', 2500, 'Occupied', 1),
('206','Premium Deluxe', 4500, 'Vacant', 1),
('207','Premium Deluxe', 4500, 'Occupied', 1),
('208','Premium Deluxe', 4500, 'Vacant', 1),
('209','Normal', 1000, 'Vacant', 0),
('210','Deluxe', 2500, 'Occupied', 1);

desc Room;
desc Room_second;
desc patient_second;
select * from patient_second  natural join room_second ;

-- b) Inner Join
/* using = with same datatype*/
select * from patient_second p inner join ward w on p.Ward_No = w.Ward_No;

/*using = but with different dtype*/
/*creating a table with different dtype*/
CREATE TABLE Ward_second(
Ward_No char(4),
Ward_Name VARCHAR(25) NOT NULL,
Gender SET('Male', 'Female', 'Other'),
Total_Beds TINYINT UNSIGNED NOT NULL,
Beds_Available TINYINT UNSIGNED NOT NULL,
Head_Nurse_ID VARCHAR(5) NOT NULL,
PRIMARY KEY(Ward_No),
FOREIGN KEY(Head_Nurse_ID) REFERENCES Nurse(NurseID)
);

INSERT INTO Ward_second VALUES
('1001','General Ward', 'Male', 150, 50, '21015'),
('1002','General Ward', 'Female', 180, 60, '20185'),
('1003','Surgical Ward', 'Other', 50, 30, '20456'),
('1004','Orthopedic Ward', 'Male', 50, 35, '22016'),
('1005','Neurology Ward', 'Female', 60, 35, '21259'),
('1006','Oncology Ward', 'Male', 50, 15, '22865'),
('1007','Pediatrics Ward', 'Female', 150, 50, '21963'),
('1008','Maternity Ward', 'Female', 100, 20, '21123'),
('1009','Postpartum Ward', 'Female', 120, 30, '21563'),
('1010','Psychiatric Ward', 'Male', 80, 60, '21191');

desc ward;
desc ward_second;
select * from patient_second p inner join ward w on p.Ward_No = w.Ward_No;

/*without = */
select * from patient_second p inner join ward w using(Ward_No);

-- c) Outer Join
/*Left Outer Join*/

CREATE TABLE Doctor_second(
DoctorID VARCHAR(5),
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
Department_name VARCHAR(25) NOT NULL,
PRIMARY KEY(DoctorID)
);

INSERT INTO Doctor_second VALUES
('19456', 'Shaun', 'Murphy', 'Internal Medicine'),
('18759', 'Akshay', 'Krishna', 'General Surgery'),
('19237', 'Anusha', 'Shaju', 'Gynecology'),
('18756', 'Walter', 'White', 'Dermatology'),
('17845', 'Aleena', 'Anna', 'Obstetrics'),
('20142', 'John', 'Justin', 'Ophthalmology'),
('18965', 'Adam', 'Arnold', 'Orthopedics'),
('19875', 'Jack', 'Ryan', 'Otolaryngology'),
('18769', 'Lim', 'Nolan', 'Geriatrics'),
('19187', 'Alfy', 'Shaju', 'Physiology');

select*from patient_second;
select*from doctor_second;

select * from patient_second p left outer join doctor_second d using(doctorid);

/*Right Outer Join*/

CREATE TABLE Department_second(
Department_Name VARCHAR(20) NOT NULL UNIQUE,
HOD_First_Name VARCHAR(20) NOT NULL,
HOD_Last_Name VARCHAR(20) NOT NULL,
HOD_Phone_Number VARCHAR(10) NOT NULL,
PRIMARY KEY(Department_Name)
);

INSERT INTO Department_second VALUES
('Internal Medicine','Ashok', 'Augustine', 9854752615),
('Surgical Department', 'Domina', 'Sebastian', 9747982705),
('OB/GYN', 'Alen', 'Blake', 6854986541),
('Dermatology', 'Ushas', 'Devasia', 8985847856),
('Ophthalmology', 'Arsha', 'Babu', 9365874512),
('Orthopedics', 'Jyothis', 'Devasia', 9748956325),
('ENT', 'Rahul', 'Kesav', 8986815245),
('Psychiatry', 'Nandhana', 'Krishna', 8680854745),
('Neurology', 'Thomas', 'Xavier', 8086254535),
('Padiatrics', 'Edwin', 'Joshy', 9594658515);

select * from doctor_second;
select * from department_second;

select * from doctor_second right outer join department_second using(department_name);

/*Full outer join*/
select * from doctor_second doc left outer join department_second dep on doc.department_name = dep.department_name
UNION
select * from doctor_second doc right outer join department_second dep on doc.department_name = dep.department_name;


-- d) SELF JOIN

CREATE TABLE Nurse_second(
NurseID VARCHAR(5),
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
Phone_Number VARCHAR(10) NOT NULL,
Head_Nurse VARCHAR(5),
PRIMARY KEY(NurseID)
);

INSERT INTO Nurse_second VALUES
('21015', 'Delbin', 'Dawn', '8956457823', '20185'),
('20185', 'Rafeeq', 'Riyas', '8574859645', '20185'),
('20456', 'Rajesh', 'Rahul', '7538642565', '20185'),
('22016', 'Rijo', 'Rajeev', '8527419635', '21123'),
('21259', 'Namitha', 'Catherine', '7418526548', '21123'),
('22865', 'Reena', 'Robin', '7539512688', '21123'),
('21963', 'Sandra', 'Johns', '9685742310', '21563'),
('21123', 'Saniya', 'Jose', '9392524156', '21123'),
('21563', 'Ushas', 'Thomas', '9465823545', '21563'),
('21191', 'Fathima', 'Riyas', '9236021542', '21563');

select * from nurse_second;

/*self join uing inner join*/
select a.first_name as Emp_Name, b.first_name as Head_Name from Nurse_second a join Nurse_second b on b.nurseID=a.Head_nurse;
