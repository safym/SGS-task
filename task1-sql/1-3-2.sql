SELECT  Id,
	Container_number AS [Number],
	Type,
	Lenght,
	Width,
	Height,
	Weight,
	Is_empty,
	Arrival_date
FROM dbo.Container2
FOR JSON AUTO;