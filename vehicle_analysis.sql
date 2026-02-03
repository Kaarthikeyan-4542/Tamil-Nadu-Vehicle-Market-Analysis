CREATE TABLE dim_rto AS
SELECT DISTINCT 
"RTO Code" AS rto_code,
"RTO_Name" AS rto_name,
"State" AS state_name
FROM raw_registrations;


ALTER TABLE dim_rto ADD PRIMARY KEY(rto_code);

SELECT * FROM dim_rto 
LIMIT 5;



DROP TABLE IF EXISTS dim_rto;

CREATE TABLE dim_rto AS
SELECT "RTO Code" AS rto_code,
MAX("RTO_Name") AS rto_name,
MAX("State") AS state_name
FROM raw_registrations
GROUP BY rto_code;

ALTER TABLE dim_rto ADD PRIMARY KEY(rto_code);

SELECT * FROM dim_rto 
LIMIT 5;

--Budget Cars vs Luxuxry Cars--

CREATE VIEW v_luxury_analysis AS
SELECT d.rto_name,
d.state_name,
r."Vehicle_Segment",
r."Vehicle Model",
COUNT(*) AS total_vehicles
FROM raw_registrations AS r 
JOIN dim_rto AS d 
ON r."RTO Code" = d.rto_code
WHERE r."Vehicle_Type" = 'Car'
GROUP BY d.rto_name,d.state_name,r."Vehicle_Segment",r."Vehicle Model";

SELECT * FROM v_luxury_analysis
LIMIT 5;

--EV growth vs Petrol--
DROP VIEW IF EXISTS v_fuel_trends 
CREATE VIEW v_fuel_trends AS
SELECT "Registration Year" AS Reg_Year,
CASE 
     WHEN "Fuel Type" LIKE '%ELECTRIC%' THEN 'ELECTRIC'
	 WHEN "Fuel Type" LIKE '%PETROL%' THEN 'PETROL'
	 WHEN "Fuel Type" LIKE '%DIESEL%' THEN 'DIESEL'
	 WHEN "Fuel Type" LIKE '%CNG%' OR "Fuel Type" LIKE '%LPG%' OR "Fuel Type" LIKE '%GAS%' THEN 'CNG'
	 ELSE 'OTHER'
	 END AS Fuel_Category,
"Vehicle_Type",
COUNT(*) AS total_registrations
FROM raw_registrations
GROUP BY Reg_Year , 
CASE 
     WHEN "Fuel Type" LIKE '%ELECTRIC%' THEN 'ELECTRIC'
	 WHEN "Fuel Type" LIKE '%PETROL%' THEN 'PETROL'
	 WHEN "Fuel Type" LIKE '%DIESEL%' THEN 'DIESEL'
	 WHEN "Fuel Type" LIKE '%CNG%' OR "Fuel Type" LIKE '%LPG%' OR "Fuel Type" LIKE '%GAS%' THEN 'CNG'
	 ELSE 'OTHER'
	 END ,
	 "Vehicle_Type" 
ORDER BY Reg_Year DESC;
