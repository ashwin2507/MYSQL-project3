{\rtf1\ansi\ansicpg1252\cocoartf1671
{\fonttbl\f0\froman\fcharset0 Times-Roman;}
{\colortbl;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c0\c0\c0;}
\margl1440\margr1440\vieww16600\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl280\partightenfactor0

\f0\fs24 \cf2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 CSE 3330 \'96 Database Systems, Fall 2018\
Project 3: Description and Deliverables\
\pard\pardeftab720\sl280\partightenfactor0
\cf2 \
Create a database script airline.sql based on the given relational schema airLineDataBase.png and write query on Airline Database to create a set of SQL views. \
\
V1. Flights with no assigned Pilots UnassignedPilotFlights(Flight_Number, Seq, Flight_Date) \
\
V2. Planes Due for Maintenace: for planes that were last maintained over 60 days ago .DueForMaintenancePlanes(PlaneID, Maker, Model, LastMaintained) \
\
V3. Pilot flying assignments: PilotFlyAssignments(PilotID, Pilot_Name, Flight_Number, From_City, To_City, Flight_Date) \
\
V4. Pilot flight legs count for month/year (example 2015-10) PilotFlightLegsCount(PilotId, Pilot_Name, Month_year, Flight_Legs_Count)}