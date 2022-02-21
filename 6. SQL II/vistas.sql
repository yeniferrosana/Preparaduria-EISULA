CREATE VIEW trabajadores_clientes AS 
SELECT employee.employeeid, employee.firstname as nombre_empleado, employee.lastname as apellido_empleado,employee.title, 
	customer.customerid, customer.firstname as nombre_cliente, customer.lastname as apellido_cliente, customer.email
FROM 	employee JOIN customer  
	ON employee.reportsto = customer.supportrepid;


select * from trabajadores_clientes


CREATE VIEW TRACK_FORMATTED AS
SELECT  track.name,
	track.composer,
	(track.milliseconds/1000)/60 as minutos,
	track.bytes/(1024*1024) as megabytes,
	track.unitprice * 36000 as Bolivares
FROM
	track


select * from  TRACK_FORMATTED 
	
