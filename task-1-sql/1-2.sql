CREATE TABLE Operation
(
	Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Container_id UNIQUEIDENTIFIER NOT NULL,
	Start_date DATETIME NOT NULL,
	End_date DATETIME,
	Operation_type VARCHAR(255),
	Operator_fullname VARCHAR(50),
	Inspection_location VARCHAR(50) ,
)