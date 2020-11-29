-- Patient Registration --
	INSERT INTO `hospital`.`patient`
	(`first_name`,
	`last_name`,
	`address`,
	`phone`,
	`gender`,
	`ssn`,
	`age`,
    `creator`,
    `create_date`
	)
	VALUES
	('Mike','Tyson','214 Ranch Driveway, CA',' 4443335555','M','23454535','45');
	('Test ','Patient','60157 Adrien Wells North Lorastad, CO 40887-9986', '1251321', 'F', 2348,50,1,1);
	('Mike','Tyson','214 Ranch Driveway, CA',' 4443335555','M','23454535','45','2');

-- update patient age  --
UPDATE `hospital`.`patient` 
SET 
    `age` = '30'
WHERE
    `id` = 1;

-- delete patient  --	
	DELETE FROM `hospital`.`patient` 
WHERE
    id = 2;
        
-- ====================   Fetching Patient Records through Patient_id =================
   
SELECT 
    *
FROM
    record
WHERE
    Patient_id = 1;
 
-- ==================== Generate Patient Report (as per user requirement we can generate patient report) =================
SELECT 
    p.*, v.*
FROM
    patient AS p
        INNER JOIN
    visit AS v ON v.Patient_id = p.id
        INNER JOIN
    record AS r ON r.Patient_id = p.id
WHERE
    p.id = 1;
    

-- ==================== Assign nerser to doctor =================
 
 SELECT d.name as Doctor, n.name as Nerser ,p.first_name as Patient FROM appointment as ap
 inner join doctor as d on d.id = ap.Doctor_idEMP
 inner join nurse as n on n.id = ap.Nurse_id 
 inner join patient as p on p.id =ap.Patient_id
 left join stay as s on s.id = p.id
 where p.id =1;

-- ==================== Check the Available Room =================
 SELECT * FROM rooms where vacancyfk_Patient_Receptionist1 = 'available';
