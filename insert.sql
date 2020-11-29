
-- Hospital
 INSERT INTO `hospital`.`hospital`
(`name`,
`address`,
`contact_number`,
`city`)
VALUES
('Lamstan Hospital',
'xyz',
'15223458',
'Berlin');


-- Deparment
INSERT INTO `hospital`.`department`
(
`name`,
`dept_head`,
`Hospital_id`)
VALUES
(
'Surgical Depart',
'xyz',
1);


-- Employee 
INSERT INTO `hospital`.`employee`
(`position`,
`ssn`,
`first_name`,
`phone`,
`last_name`,
`Department_id`)
VALUES
('dummy pos',
 334,
'dave',
'324234234',
'dact',
1);

--   Doctor 
INSERT INTO `hospital`.`doctor`
(
`name`,
`position`,
`ssn`,
`speciality`,
`Employee_id`)
VALUES
('dr.smith',
'surgen',
234234,
 'surgical',
1);

-- receptionist ---
INSERT INTO `hospital`.`receptionist`
(
`NAME`,
`Employee_id`)
VALUES
(
'dani',
1
);

-- PATIENT DATA ---

INSERT INTO `hospital`.`patient`
(`first_name`,
`last_name`,
`address`,
`phone`,
`gender`,
`ssn`,
`age`,
`creator`
)
VALUES
('TomÃ¡s','Fritz','60157 Adrien Wells North Lorastad, CO 40887-9986', '1251321', 'F', 238,50,1),
('Dave','Cherry','4802 Orn Squares Lake Hoseaside, OK 79139-0709', '1251321','M', 487,30,1);

--  insurance ----

INSERT INTO `hospital`.`insurance`
(`id`,
`name`,
`plan`)
 VALUES (
1,'Kaiser Foundation',NULL),
 (
2,'Anthem Inc.',NULL);

--  Mapping patient insurance class  ----

INSERT INTO `hospital`.`patient_has_insurance`
(`Patient_id`,
`Insurance_id`)
VALUES
(1,1);



----- nurse ---
INSERT INTO `hospital`.`nurse`
(
`name`,
`Employee_id`,
`ssn`
)
VALUES
( 'kete',
 1,
'234234'
);
----- appointment ---
INSERT INTO `hospital`.`appointment`
(`start_date`,
`end_date`,
`Patient_id`,
`Doctor_idEMP`,
`Nurse_id`
)
VALUES
(
'2020-11-11 13:23:44',
'2020-12-11 13:23:44',
1,
1,
1
);

--  Visits  ---
INSERT INTO `hospital`.`visit`
(
`diagnosis`,
`treatment`,
`Patient_id`,
`Appointment_id`,
`Doctor_id`)
VALUES
(
 'test diagnosis',
'surgery',
1,
1,
1);

-- Records -- 
INSERT INTO `hospital`.`record`
(
`Patient_id`,
`Visit_id`)
VALUES
(
1,
1);


----- prescribes ---
INSERT INTO `hospital`.`prescribes`
(
`date`,
`Visit_id`,
`Doctor_id`)
VALUES
( '2020-11-11 13:23:44',
1,
1);

----- rooms ---
INSERT INTO `hospital`.`rooms`
(
`room_type`,
`room_number`,
`vacancy`)
VALUES
(
'vip',
01,
'available'
);

----- rooms ---
INSERT INTO `hospital`.`stay`
(
`start_date`,
`end_date`,
`Patient_id`,
`Rooms_id`)
VALUES
(
'2020-11-11 13:23:44',
'2020-12-11 13:23:44',
1,
1);

-- medicine

INSERT INTO `hospital`.`medicine`
(`id`,
`code`,
`price`,
`description`,
`type`)
VALUES
(1,
'002d',
'333',
'dfsdfs',
'ddfsdf');


-- --- prescrib_detail ----
INSERT INTO `hospital`.`prescrib_detail`
(`idprescrib_detail`,
`prescribes_id`,
`dose`,
`Medicine_id`)
VALUES
(1,
1,
'sdfsdf',
1);






