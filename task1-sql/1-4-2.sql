SELECT  Id,
	Container_id,
	Start_date,
	End_date,
	Operation_type,
	Operator_fullname,
	Inspection_location
FROM dbo.Operation
WHERE Id = '12345678-1234-1234-1234-123456789012'
FOR JSON AUTO;