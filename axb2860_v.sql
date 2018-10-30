-- Class: CSE 3330
-- Semester: Fall 2018
-- Student Name: Babu, Ashwin, axb2860
-- Student ID: 1001392860
-- Assignment: project #3


-- Flights with no assigned Pilots

DROP View if exists V1;
DROP View if exists V0;

CREATE VIEW V0 (FLNO,Seq,FDate) AS SELECT FL.FLNO,FL.Seq,F.FDate FROM FlightLeg AS FL, FlightInstance AS F WHERE FL.FLNO=F.FLNO;

CREATE VIEW V1(Flight_Number,Seq,Flight_Date) AS SELECT V0.FLNO, V0.Seq, V0.FDate FROM V0 WHERE NOT EXISTS (SELECT FLI.FLNO, FLI.Seq, FLI.FDate FROM FlightLegInstance AS FLI);

/*
mysql> SELECT * FROM V1;
Empty set (0.00 sec)
*/



--  Planes Due for Maintenace: for planes that were last maintained over 60 days ago.

DROP VIEW if exists V2;
CREATE VIEW V2 AS SELECT ID, Maker, Model, LastMaint FROM Plane  WHERE datediff(CURDATE(), LastMaint) >60;


/*
mysql> SELECT * FROM V2; 
+----+--------+-------+------------+
| ID | Maker  | Model | LastMaint  |
+----+--------+-------+------------+
|  1 | Boeing | 747   | 2015-08-12 | 
|  2 | Boeing | 777   | 2015-08-14 | 
|  3 | Boeing | 777   | 2015-09-14 | 
|  4 | Boeing | 787   | 2015-09-22 | 
|  5 | Airbus | 380   | 2015-09-27 | 
|  6 | Airbus | 380   | 2015-10-01 | 
|  7 | Airbus | 340   | 2015-10-09 | 
|  8 | Airbus | 340   | 2015-10-10 | 
+----+--------+-------+------------+
8 rows in set (0.00 sec)

*/


--  Pilot flying assignments

DROP VIEW if exists V3;
CREATE VIEW V3(PilotID, Pilot_Name, Flight_Number,From_City,To_City,Flight_Date) AS SELECT P.ID, P.Name,FLI.FLNO,FL.FromA, FL.ToA, FLI.FDate  FROM Pilot AS P, FlightLegInstance AS FLI, FlightLeg AS FL  WHERE P.ID=FLI.Pilot AND FLI.FLNO=FL.FLNO AND FLI.Seq=FL.Seq ORDER BY P.ID; 



/*

mysql> SELECT * FROM V3; 
+---------+------------+---------------+-----------+---------+-------------+
| PilotID | Pilot_Name | Flight_Number | From_City | To_City | Flight_Date |
+---------+------------+---------------+-----------+---------+-------------+
|       1 | Jones      | 100           | ORD       | DFW     | 2015-10-06  | 
|       1 | Jones      | 500           | FLL       | ORD     | 2015-10-08  | 
|       1 | Jones      | 500           | ORD       | LAX     | 2015-10-08  | 
|       2 | Smith      | 200           | SFO       | ORD     | 2015-10-06  | 
|       2 | Smith      | 200           | ORD       | LGA     | 2015-10-06  | 
|       2 | Smith      | 700           | LGA       | DFW     | 2015-10-08  | 
|       3 | Walker     | 400           | LAX       | IAH     | 2015-10-08  | 
|       3 | Walker     | 400           | IAH       | FLL     | 2015-10-08  | 
|       3 | Walker     | 600           | DFW       | BWI     | 2015-10-06  | 
|       4 | Daniel     | 100           | ORD       | DFW     | 2015-10-08  | 
|       4 | Daniel     | 500           | ORD       | LAX     | 2015-10-06  | 
|       5 | Samuel     | 400           | LAX       | IAH     | 2015-10-06  | 
|       5 | Samuel     | 400           | IAH       | FLL     | 2015-10-06  | 
|       5 | Samuel     | 600           | DFW       | BWI     | 2015-10-08  | 
|       6 | Allan      | 200           | SFO       | ORD     | 2015-10-08  | 
|       6 | Allan      | 200           | ORD       | LGA     | 2015-10-08  | 
|       6 | Allan      | 500           | FLL       | ORD     | 2015-10-06  | 
|       7 | Madison    | 300           | DFW       | JFK     | 2015-10-06  | 
|       8 | Ryan       | 300           | DFW       | JFK     | 2015-10-08  | 
|       8 | Ryan       | 700           | LGA       | DFW     | 2015-10-06  | 
+---------+------------+---------------+-----------+---------+-------------+
20 rows in set (0.01 sec)

*/







--  Pilot flight legs count for month/year (example 2015-10)

DROP VIEW if exists V4;
CREATE VIEW V4(PilotID, Pilot_Name, Month_Year,Flight_Legs_Count) AS SELECT P.ID, P.Name,EXTRACT(YEAR_MONTH FROM FLI.FDATE),Count(*) FROM Pilot AS P, FlightLegInstance AS FLI WHERE FLI.Pilot=P.ID GROUP BY P.ID,Month(FLI.FDate),Year(FLI.FDate);



/*

mysql> SELECT * FROM V4;
+---------+------------+------------+-------------------+
| PilotID | Pilot_Name | Month_Year | Flight_Legs_Count |
+---------+------------+------------+-------------------+
|       1 | Jones      |     201510 |                 3 | 
|       2 | Smith      |     201510 |                 3 | 
|       3 | Walker     |     201510 |                 3 | 
|       4 | Daniel     |     201510 |                 2 | 
|       5 | Samuel     |     201510 |                 3 | 
|       6 | Allan      |     201510 |                 3 | 
|       7 | Madison    |     201510 |                 1 | 
|       8 | Ryan       |     201510 |                 2 | 
+---------+------------+------------+-------------------+
8 rows in set (0.00 sec)


*/




