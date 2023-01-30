CREATE TABLE Container
(
	Id UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	Container_number BIGINT NOT NULL,
	Container_Type VARCHAR(50),
	Lenght REAL,
	Width REAL,
	Height REAL,
	Weight REAL ,
	Is_empty REAL,
	Arrival_date DATETIME  NOT NULL
)