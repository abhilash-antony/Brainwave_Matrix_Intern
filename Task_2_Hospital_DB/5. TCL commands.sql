USE hospital;

SELECT * FROM Doctor;
SELECT * FROM Doctor_Phone;
SELECT StaffID, FIrst_Name, Last_Name, Position, Salary FROM Staff;
SELECT * FROM Room;
SELECT * FROM Appointment;



SET autocommit = 0;

DROP PROCEDURE monthly_changes;

delimiter $$
CREATE PROCEDURE monthly_changes()
BEGIN
	savepoint SP_1;
    UPDATE staff SET Salary = salary + salary*0.2 WHERE salary >30000;
    savepoint SP_2;
    DELETE d.*, dp.* FROM Doctor d INNER JOIN Doctor_Phone dp ON d.DoctorID = dp.DoctorID
    WHERE d.DoctorID IN ('19237', '17845', '20142', '18965');
    savepoint SP_3;
    UPDATE Room SET Occupancy_Status = 'Vacant' WHERE Room_No IN (207,202);
    savepoint SP_4;
    UPDATE Room SET Rent_Per_Day = Rent_Per_Day + 500 WHERE Room_Type IN ('Deluxe', 'Premium Deluxe');
    savepoint SP_5;
    INSERT INTO Appointment VALUES
    ('240110001', '18759', '2024-01-10 14:30:00', 'Fever, Headache'),
    ('240109001', '18759', '2024-01-09 11:30:00', 'Accident'),
    ('240110002', '19187', '2024-01-10 16:00:00', 'Fits'),
    ('240102001', '19456', '2024-01-02 10:30:00', 'Dizziness, Vomitting');
END $$
delimiter ;

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS=0;
CALL monthly_changes();

SET FOREIGN_KEY_CHECKS=1;


SELECT * FROM Doctor;
SELECT * FROM Doctor_Phone;
SELECT StaffID, FIrst_Name, Last_Name, Position, Salary FROM Staff;
SELECT * FROM Room;
SELECT * FROM Appointment;


ROLLBACK TO SAVEPOINT SP_5;
SELECT * FROM Appointment;

ROLLBACK TO SAVEPOINT SP_4;
SELECT * FROM Room;

ROLLBACK TO SAVEPOINT SP_3;
SELECT * FROM Room;

ROLLBACK TO SAVEPOINT SP_2;
SELECT * FROM Doctor;
SELECT * FROM Doctor_Phone;

ROLLBACK TO SAVEPOINT SP_1;
SELECT StaffID, FIrst_Name, Last_Name, Position, Salary FROM Staff;

ROLLBACK TO SAVEPOINT SP_5;