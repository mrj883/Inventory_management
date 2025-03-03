Create Database Inventory_management
use Inventory_management

-- Creating Table with 1 unique Primary Key and 1 Foriegn Key with some named constraints
Create Table Product
(
PID Varchar(30) Primary Key,
PDESC varchar(100) ,
Price Decimal(10,2),
Category Varchar(2),
SID Varchar(30) not null,


Constraint ck_Pr Check (Price >8.00),
Constraint ck_cat Check ( Category in ('IT','HA','HC'))
)

--adding the default contraint not null on colum Supplier table 

Alter table Product
alter column PDESC Varchar(100) not null

-- Creating Supplier Table


Create Table Supplier
(
SID varchar(30) Primary Key,
SNAME Varchar(60) not null,
SADD Varchar(150) not null,
SCITY varchar(30),
SPHONE Varchar(15) Unique,

Constraint ck_city Check (SCITY in ('Delhi')),
-- adding cosntraint to check phone number
Constraint Ck_phone Check (SPHONE like'[%0-9]' and len (SPHONE) between 10 and 15)

)

-- adding Forigen Key Contraint to Products table
-- modifying the Range


--Alter table Supplier
--Alter Column SID Varchar(30) 


-- didnt work so Droppting table
-- Drop table Supplier


Alter Table PRODUCT
add Constraint fk_Prod Foreign Key (SID) References Supplier(SID)

-- Creating Orders table
Create Table ORDERS
(
OID varchar(30) Primary Key,
ODATE varchar(30),
CID varchar (30) ,
PID varchar(30) ,
Constraint fk_Product Foreign key (PID) references PRODUCT(PID),
Oqty Int
)
--Creating Stock table -adds stocks


Create Table STOCK
(
PID Varchar(30),
SQTY Int,-- Stock Quantitiy
ROL INT,--Reorder level
MOQ INT, --Maximum order QUatity
Constraint fk_Product_STOCK Foreign key (PID) References  PRODUCT(PID),
Constraint SQTY_check CHECK (SQTY >= 0 ),
Constraint ROL_check CHECK (SQTY >0 ),
Constraint MOQ_Check Check (MOQ >= 5)
)

-- Creating Customer Table -- register of customers

Create Table Customer 
(
CID VArchar(30) Primary Key,
CNAME Varchar(60) not null,
ADDRESS Varchar(150) not null,
CITY Varchar(20) not null,
PHONE Varchar(15) not null,
EMAIL Varchar(40) not null,
DOB Varchar(30),





)



