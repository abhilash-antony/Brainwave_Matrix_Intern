CREATE DATABASE Hospital;
USE Hospital;

-- department
CREATE TABLE Department(
Department_Name VARCHAR(20) NOT NULL UNIQUE,
Description VARCHAR(200) NOT NULL,
HOD_First_Name VARCHAR(20) NOT NULL,
HOD_Last_Name VARCHAR(20) NOT NULL,
HOD_Phone_Number VARCHAR(10) NOT NULL,
HOD_Email VARCHAR(50),
PRIMARY KEY(Department_Name)
);

INSERT INTO Department VALUES
('Internal Medicine', 'Study, diagnosis and treatment of conditions that affect the internal organs', 'Ashok', 'Augustine', 9854752615, 'ashokaugustine@stjohns.com'),
('Surgical Department', 'Administers the provision of surgical, diagnostic and therapeutic services', 'Domina', 'Sebastian', 9747982705, 'dominasebastian@gmail.com'),
('OB/GYN', 'Care women from pregnancy until after delivery and diagnosis and treatment of disorders of female reproductive tract', 'Alen', 'Blake', 6854986541, 'alenblake@stjohns.com'),
('Dermatology', 'Branch of medicine dealing with the skin', 'Ushas', 'Devasia', 8985847856, 'ushasdevasia@stjohns.com'),
('Ophthalmology', 'Field of medicine that focuses on the health of the eye', 'Arsha', 'Babu', 9365874512, 'arshapbabu@stjohns.com'),
('Orthopedics', 'Focuses on treating the musculoskeletal system', 'Jyothis', 'Devasia', 9748956325, 'jyothisdevasia@stjohns.com'),
('ENT', 'Treats a range of problems related to the ear, nose and throat', 'Rahul', 'Kesav', 8986815245, 'rahulkesav@stjohns.com'),
('Psychiatry', 'Diagnosis, treatment and prevention of mental, emotional and behavioral disorders', 'Nandhana', 'Krishna', 8680854745, 'nandhanakrishna@stjohns.com'),
('Neurology', 'Study and treatment of disorders of the nervous system', 'Thomas', 'Xavier', 8086254535, 'thomasxavier@stjohns.com'),
('Padiatrics', 'Care of infants, children and adolescents from birth up to the age of 18', 'Edwin', 'Joshy', 9594658515, 'edwinjoshy@stjohns.com');

-- doctor
CREATE TABLE Doctor(
DoctorID VARCHAR(5),
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
Specialization VARCHAR(25) NOT NULL,
Email VARCHAR(50),
Department_Name VARCHAR(20) NOT NULL,
PRIMARY KEY(DoctorID),
FOREIGN KEY(Department_Name) REFERENCES Department(Department_Name)
);

INSERT INTO Doctor VALUES
('19456', 'Shaun', 'Murphy', 'General Medicine', 'shaunmurphy@stjohns.com', 'Internal Medicine'),
('18759', 'Akshay', 'Krishna', 'General Surgen', 'akshaykrishna@stjohns.com', 'Surgical Department'),
('19237', 'Anusha', 'Shaju', 'Gynecologist', 'anushakshaju@stjohns.com', 'OB/GYN'),
('18756', 'Walter', 'White', 'Dermatologist', 'walterwhite@stjohns.com', 'Dermatology'),
('17845', 'Aleena', 'Anna', 'Obstetrics', 'aleenaanna@stjohns.com', 'OB/GYN'),
('20142', 'John', 'Justin', 'Ophthalmologist', 'johnjustin@stjohns.com', 'Ophthalmology'),
('18965', 'Adam', 'Arnold', 'Orthopedist', 'adamarnold@stjohns.com', 'Orthopedics'),
('19875', 'Jack', 'Ryan', 'Otolaryngologist', 'jackryan@stjohns.com', 'ENT'),
('18769', 'Lim', 'Nolan', 'Psychiatrist', 'limnolan@stjohns.com', 'Psychiatry'),
('19187', 'Alfy', 'Shaju', 'Neurologist', 'alfykshaju@stjohns.com','Neurology');

-- doctor phn
CREATE TABLE Doctor_Phone(
DoctorID VARCHAR(5),
Phone_No VARCHAR(10) NOT NULL,
FOREIGN KEY(DoctorID) REFERENCES Doctor(DoctorID)
);

INSERT INTO Doctor_Phone 
VALUES ('19456', '9895963625'), 
  ('18759', '9785456525'),
  ('19237', '8086574595'), 
  ('18756', '9695784515'),
  ('17845', '8685487885'), 
  ('20142', '8485896585'), 
  ('18965', '9895969475'), 
  ('19875', '9593924575'), 
  ('18769', '9096351625'), 
  ('19187', '9589952125');

-- staff
CREATE TABLE Staff(
StaffID SMALLINT UNSIGNED AUTO_INCREMENT,
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
Position VARCHAR(20) NOT NULL,
Salary INT UNSIGNED NOT NULL,
Phone_Number VARCHAR(10) NOT NULL,
Email VARCHAR(50),
Department_Name VARCHAR(20) NOT NULL,
PRIMARY KEY(StaffID),
FOREIGN KEY(Department_Name) REFERENCES Department(Department_Name)
) AUTO_INCREMENT = 4001;

INSERT INTO Staff
(First_Name, Last_Name, Position, Salary, Phone_Number, Email, Department_Name) VALUES
('Anjana', 'John', 'Physician Assistant', 30000, '9895963625', 'anjanajohn@stjohns.com', 'Internal Medicine'),
('Bibin', 'Samuel', 'Dietitian', 45000, '9784585965', 'bibinsamuel@stjohns.com', 'Internal Medicine'),
('Aaron', 'Bloke', 'Social Worker', 30000, '9794658515', 'aaronbloke@stjohns.com', 'Internal Medicine'),
('Saji', 'Jaison', 'Midwife', 20000, '9545678912', 'sajijaison@stjohns.com', 'OB/GYN'),
('Malavika', 'Biju', 'Ultrasonographer', 35000, '9897596865', 'malavikabiju@stjohns.com', 'OB/GYN'),
('Pamy', 'Sebastian', 'Dermatologic surgeon', 30000, '6832659845', 'pamysebastian@stjohns.com', 'Dermatology'),
('Celin', 'Charlie', 'Optometrist', 45000, '6865623545', 'celincharlie@stjohns.com', 'Ophthalmology'),
('Vismaya', 'Biju', 'Physiatrist', 40000, '6265784512', 'vismayabiju@stjohns.com', 'Orthopedics'),
('Jais', 'Binoy', 'Physical Therapist', 55000, '9865784512', 'jaisbinoy@stjohns.com', 'Orthopedics'),
('Daniya', 'Deepak', 'Prosthetist', 42000, '8684759625', 'daniyadeepak@stjohns.com', 'Orthopedics');

-- nurses
CREATE TABLE Nurse(
NurseID VARCHAR(5),
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
Phone_Number VARCHAR(10) NOT NULL,
Email VARCHAR(50),
Department_Name VARCHAR(20) NOT NULL,
PRIMARY KEY(NurseID),
FOREIGN KEY(Department_Name) REFERENCES Department(Department_Name)
);

INSERT INTO Nurse VALUES
('21015', 'Delbin', 'Dawn', '8956457823', 'delbindawn@stjohns.com', 'Internal Medicine'),
('20185', 'Rafeeq', 'Riyas', '8574859645', 'rafeeqriyas@stjohns.com', 'Internal Medicine'),
('20456', 'Rajesh', 'Rahul', '7538642565', 'rajeshrahul@stjohns.com', 'Internal Medicine'),
('22016', 'Rijo', 'Rajeev', '8527419635', 'rijorajeev@stjohns.com', 'Surgical Department'),
('21259', 'Namitha','Catherine', '7418526548', 'namithacatherine@stjohn.com', 'Surgical Department'),
('22865', 'Reena', 'Robin', '7539512688', 'reenarobin@stjohns.com', 'OB/GYN'),
('21963', 'Sandra', 'Johns', '9685742310', 'sandrajohns@stjohns.com', 'OB/GYN'),
('21123', 'Saniya', 'Jose', '9392524156', 'saniyakjose@stjohns.com', 'OB/GYN'),
('21563', 'Ushas', 'Thomas', '9465823545', 'ushasthomas@stjohns.com', 'Padiatrics'),
('21191', 'Fathima', 'Riyas', '9236021542', 'fathimariyas@stjohns.com', 'Padiatrics');

-- rooms
CREATE TABLE Room(
Room_No SMALLINT UNSIGNED AUTO_INCREMENT,
Room_Type SET('Normal', 'Deluxe', 'Premium Deluxe'),
Rent_Per_Day SMALLINT UNSIGNED NOT NULL,
Occupancy_Status SET('Vacant', 'Occupied'),
Television BOOL DEFAULT 0,
PRIMARY KEY(Room_No)
) AUTO_INCREMENT = 201;

INSERT INTO Room(Room_Type, Rent_Per_Day, Occupancy_Status, Television)
VALUES ('Normal', 1000, 'Occupied', 0),
  ('Normal', 1000, 'Occupied', 0),
  ('Deluxe', 2500, 'Occupied', 1),
  ('Deluxe', 2500, 'Vacant', 1),
  ('Deluxe', 2500, 'Occupied', 1),
  ('Premium Deluxe', 4500, 'Vacant', 1),
  ('Premium Deluxe', 4500, 'Occupied', 1),
  ('Premium Deluxe', 4500, 'Vacant', 1),
  ('Normal', 1000, 'Vacant', 0),
  ('Deluxe', 2500, 'Occupied', 1);

-- ward
CREATE TABLE Ward(
Ward_No SMALLINT UNSIGNED AUTO_INCREMENT,
Ward_Name VARCHAR(25) NOT NULL,
Gender SET('Male', 'Female', 'Other'),
Total_Beds TINYINT UNSIGNED NOT NULL,
Beds_Available TINYINT UNSIGNED NOT NULL,
Head_Nurse_ID VARCHAR(5) NOT NULL,
PRIMARY KEY(Ward_No),
FOREIGN KEY(Head_Nurse_ID) REFERENCES Nurse(NurseID)
) AUTO_INCREMENT = 1001;

INSERT INTO Ward(Ward_Name, Gender, Total_Beds, Beds_Available, Head_Nurse_ID)
VALUES ('General Ward', 'Male', 150, 50, '21015'),
  ('General Ward', 'Female', 180, 60, '20185'),
  ('Surgical Ward', 'Other', 50, 30, '20456'),
  ('Orthopedic Ward', 'Male', 50, 35, '22016'),
  ('Neurology Ward', 'Female', 60, 35, '21259'),
  ('Oncology Ward', 'Male', 50, 15, '22865'),
  ('Pediatrics Ward', 'Female', 150, 50, '21963'),
  ('Maternity Ward', 'Female', 100, 20, '21123'),
  ('Postpartum Ward', 'Female', 120, 30, '21563'),
  ('Psychiatric Ward', 'Male', 80, 60, '21191');

-- insurance
CREATE TABLE Insurance(
Policy_No VARCHAR(6),
Organisation VARCHAR(30) NOT NULL,
Effective_Date DATE NOT NULL,
Coverage_Amount INT UNSIGNED NOT NULL,
Premium INT,
PRIMARY KEY(Policy_No)
);

INSERT INTO Insurance VALUES ('UNH146', 'United Health', '2023-12-30', 200000, 2500),
    ('MTL785', 'MetLife', '2024-05-30', 500000, 5500),
    ('PDL456', 'Prudential', '2024-06-30', 400000, 3000),
    ('ALZ192', 'Allianz', '2024-10-30', 900000, 12500),
   ('BSH732', 'Berkshire Hathaway', '2024-08-25', 600000, 7200),
   ('CBL432', 'Chubb Limited', '2024-07-30', 500000, 3900),
   ('ZRI702', 'Zurich Insurance', '2024-02-02', 300000, 1750),
   ('LIC425', 'Life Insurance Co', '2023-12-28', 400000, 3250),
   ('SBI734', 'SBI Life', '2024-10-12', 350000, 2750),
   ('NIA025', 'New India Assurance', '2024-02-28', 600000, 4500);

-- medication
CREATE TABLE Medication(
MedicationID VARCHAR(8),
DoctorID VARCHAR(5),
Medicine_Name VARCHAR(50) NOT NULL,
Dosage SET('0-0-1', '0-1-0', '1-0-0', '1-1-0', '1-0-1', '0-1-1', '1-1-1'),
Category VARCHAR(50),
PRIMARY KEY(MedicationID),
FOREIGN KEY(DoctorID) REFERENCES Doctor(DoctorID)
);

INSERT INTO Medication VALUES
('GEN75896', '19237', 'Acetaminophen', '1-0-1', 'Pain reliever, fever reducer'),
('GNM72458', '18759','Naproxen', '1-0-1', 'Pain reliever, fever reducer, anti-inflammatory'),
('KFT72851', '18756','Aspirin', '0-0-1', 'Pain reliever, fever reducer, blood thinner'),
('ABT72586', '19237','Diphenhydramine', '1-1-1', 'Allergy reliever, sleep aid'),
('VTG46259', '17845','Hydrochlorothiazide', '1-0-1', 'Blood pressure medication'),
('FJN72583', '19456','Metformin', '1-1-1', 'Diabetes medication'),
('RFS25830', '20142','Atorvastatin', '0-0-1', 'Cholesterol-lowering medication'),
('SLM74156', '19187','Fluoxetine', '1-0-0', 'Antidepressant'),
('POS85325', '19237','Azithromycin', '1-1-1', 'Antibiotic'),
('ZOQ70203', '19456','Omeprazole', '1-0-1', 'Heartburn reliever');

-- appoitnment
CREATE TABLE Appointment(
AppointmentID VARCHAR(10),
DoctorID VARCHAR(5) NOT NULL,
Appointment_Time DATETIME NOT NULL,
Reason VARCHAR(200),
PRIMARY KEY(AppointmentID),
FOREIGN KEY(DoctorID) REFERENCES Doctor(DoctorID)
);

INSERT INTO Appointment VALUES
('231115001', '19237', '2023-11-15 14:30:00', 'Fever, Headache'),
('231014001', '18759', '2023-10-14 11:30:00', 'Accident'),
('231014002', '18756', '2023-10-14 16:00:00', 'Skin Burn'),
('231116001', '19237', '2023-11-16 10:30:00', 'Dizziness, Vomitting'),
('231120001', '17845', '2023-11-20 12:00:00', 'Mild Headache'),
('231120002', '19456', '2023-11-20 14:00:00', 'Breathing difficulty'),
('231115002', '20142', '2023-11-15 13:30:00', 'Eye sight related'),
('231115003', '19187', '2023-11-15 15:20:00', 'severe Headache'),
('231119001', '19237', '2023-11-19 14:30:00', 'Fever, Cold and Cough'),
('231115004', '19456', '2023-11-15 16:10:00', 'Constipation, Cough');

-- procedures
CREATE TABLE Procedures(
ProcedureID VARCHAR(6),
DoctorID VARCHAR(5),
Procedure_Name VARCHAR(50),
Description VARCHAR(200),
Procedure_Time DATETIME NOT NULL,
PRIMARY KEY(ProcedureID),
FOREIGN KEY(DoctorID) REFERENCES Doctor(DoctorID)
);
INSERT INTO Procedures VALUES
('MLN123', '19237', 'Biopsy', 'Removal of a small sample of tissue for examination under a microscope to diagnose a condition', '2023-11-15 14:30:00'),
('EDG789', '18759', 'Endoscopy', 'Insertion of a thin, flexible tube with a camera into the body to examine internal organs', '2023-10-14 11:30:00'),
('ASD752', '18756', 'X-Ray', 'create images of bones, internal organs, and other structures', '2023-10-14 16:00:00'),
('ERW752', '19237', 'Appendectomy', 'Removal of the appendix, a small finger-shaped organ attached to the large intestine', '2023-11-16 10:30:00'),
('QTR453', '17845', 'Cataract Surgery', 'Replacement of the clouded lens of the eye with an artificial lens to restore vision', '2023-11-20 12:00:00'),
('POI785', '19456', 'Cholecystectomy', 'Removal of the gallbladder, a small organ that stores bile','2023-11-20 14:00:00'),
('PLM702', '20142', 'CT', 'identify disease or injury within various regions of the body', '2023-11-15 13:30:00'),
('MUN901', '19187', 'MRI', 'uses radio waves and a large magnet to produce detailed images of the body organs and structures', '2023-11-15 15:20:00'),
('PAZ730', '19237', 'Ultrasound', 'uses sound waves to produce images of structures within your body', '2023-11-19 14:30:00'),
('QPR725', '19456', 'Angioplasty', 'Insertion of a balloon or stent to open up narrowed or blocked arteries', '2023-11-15 16:10:00');

-- patients
CREATE TABLE Patient(
PatientID INT NOT NULL AUTO_INCREMENT,
First_Name VARCHAR(20) NOT NULL,
Last_Name VARCHAR(20) NOT NULL,
Address VARCHAR(250) NOT NULL,
Phone_Number VARCHAR(10) NOT NULL,
Email VARCHAR(50),
D_O_B DATE,
DoctorID VARCHAR(5),
MedicationID VARCHAR(8) NOT NULL,
AppointmentID VARCHAR(10) NOT NULL,
ProcedureID VARCHAR(6) NOT NULL,
NurseID VARCHAR(5) NOT NULL,
Policy_No VARCHAR(6),
Room_No SMALLINT UNSIGNED DEFAULT NULL,
Ward_No SMALLINT UNSIGNED DEFAULT NULL,
PRIMARY KEY(PatientID),
FOREIGN KEY(DoctorID) REFERENCES Doctor(DoctorID),
FOREIGN KEY(MedicationID) REFERENCES Medication(MedicationID),
FOREIGN KEY(AppointmentID) REFERENCES Appointment(AppointmentID),
FOREIGN KEY(ProcedureID) REFERENCES Procedures(ProcedureID),
FOREIGN KEY(NurseID) REFERENCES Nurse(NurseID),
FOREIGN KEY(Policy_No) REFERENCES Insurance(Policy_No),
FOREIGN KEY(Room_No) REFERENCES Room(Room_No),
FOREIGN KEY(Ward_No) REFERENCES Ward(Ward_No)
) AUTO_INCREMENT = 23101;

/* Patients in Ward */
INSERT INTO Patient(First_Name, Last_Name, Address, Phone_Number, Email, D_O_B, DoctorID, MedicationID, AppointmentID, ProcedureID, NurseID, Policy_No, Ward_No) VALUES
('Abhilash', 'Antony', '123 Main Street, Anytown, USA', '9876543212', 'abhilashantony@gmail.com', '2000-05-31', '19237', 'GEN75896', '231115001', 'MLN123', '21015', 'UNH146', 1001),
('Honey', 'Rose', '789 Oak Street, Anytown, USA', '9563214567', 'honeyrose@gmail.com', '1996-11-25', '18756', 'KFT72851', '231014002', 'ASD752', '20456', 'PDL456', 1003),
('Jisna', 'Joseph', '1234 Pine Street, Anytown, USA', '9012789456', 'jisnajoseph@gmail.com', '1992-01-01', '17845', 'VTG46259', '231120001', 'QTR453', '21259', 'BSH732', 1005),
('Liya', 'Thomas', '9012 Birch Street, Anytown, USA', '9127891245', 'liyathomas@gmail.com', '1989-12-25', '20142', 'RFS25830', '231115002', 'PLM702', '21963', 'ZRI702', 1007),
('Naveen', 'Sebastian', '67890 Walnut Street, Anytown, USA', '9234578564', 'naveensebastian@gmail.com', '2002-11-25', '19237', 'POS85325', '231119001', 'PAZ730', '21563', 'SBI734', 1010);
/* Patients in Room */
INSERT INTO Patient(First_Name, Last_Name, Address, Phone_Number, Email, D_O_B, DoctorID, MedicationID, AppointmentID, ProcedureID, NurseID, Policy_No, Room_No) VALUES
('Hanna', 'Hamna', '456 Elm Street, Anytown, USA', '9543219878', 'hannahamna@gmail.com', '1995-10-15', '18759', 'GNM72458', '231014001', 'EDG789', '20185', 'MTL785', 201),
('Jeremiah', 'Buckette', '1011 Maple Street, Anytown, USA', '9154567856', 'jeremiahbuckette@gmail.com', '2001-03-26', '19237', 'ABT72586', '231116001', 'ERW752', '22016', 'ALZ192', 203),
('Kevin', 'Karthik', '5678 Cedar Street, Anytown, USA', '9072957485', 'kevinkarthik@gmail.com', '1999-07-18', '19456', 'FJN72583', '231120002', 'POI785', '22865', 'CBL432', 205),
('Midhun', 'Murali', '12345 Willow Street, Anytown, USA', '9784562648', 'midhunmurali@gmail.com', '1996-03-01', '19187', 'SLM74156', '231115003', 'MUN901', '21123', 'LIC425', 207),
('Sanjoe', 'Baby', '111222 Elm Street, Anytown, USA', '900124512', 'sanjoebaby@gmail.com', '2001-09-23', '19456', 'ZOQ70203', '231115004', 'QPR725', '21191', 'NIA025', 210);
