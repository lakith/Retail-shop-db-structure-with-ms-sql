CREATE DATABASE 
	Singer_Mega_demo_mode_final4
GO
---------------------------------------------------------------------------------------------------------
USE 
	Singer_Mega_demo_mode_final4
Go

---------------------------------------------------------------------------------------------------------
CREATE TABLE 
	COMPANY
	(
		Company_id varchar(10) NOT NULL PRIMARY KEY,
		Company_name varchar(25) NOT NULL,
		[NO] int NOT NULL,
		Street varchar(25) NOT NULL,
		City varchar(25) NOT NULL
	)
---------------------------------------------------------------------------------------------------------
CREATE TABLE 
	[COMPANY TELEPHONE NUMBER]
	(
		Company_id varchar(10) NOT NULL ,
		Telephone_number varchar(12) NOT NULL,
		PRIMARY KEY (Company_id,Telephone_number)
	)
---------------------------------------------------------------------------------------------------------
ALTER TABLE
	 [dbo].[COMPANY TELEPHONE NUMBER]
ADD CONSTRAINT 
	 COMPANY_TELEPHONE_NUMBER_Company_id_FK
FOREIGN KEY
	 (Company_id)
REFERENCES 
	 [dbo].[COMPANY] ([Company_id])
---------------------------------------------------------------------------------------------------------
CREATE TABLE 
	[COMPANY Email Address]
	(
		Company_id varchar(10) NOT NULL FOREIGN KEY REFERENCES COMPANY(Company_id),
		E_mail varchar(25) NOT NULL
		PRIMARY KEY (Company_id,E_mail)
	)
---------------------------------------------------------------------------------------------------------
ALTER TABLE
	 [COMPANY Email Address] 
ADD CONSTRAINT 
	 COMPANY_Email_Address_Compan_id_FK
FOREIGN KEY
	 (Company_id)
REFERENCES 
	 [dbo].[COMPANY] ([Company_id])
---------------------------------------------------------------------------------------------------------	
CREATE TABLE 
	[COMPANY Fax Number]
	(
		Company_id varchar(10) NOT NULL FOREIGN KEY REFERENCES COMPANY(Company_id),
		Fax_number varchar(12) NOT NULL 
		PRIMARY KEY (Company_id,Fax_number)
	)
---------------------------------------------------------------------------------------------------------
ALTER TABLE
	 [COMPANY Fax Number] 
ADD CONSTRAINT 
	 COMPANY_Fax_Number_Compan_id_FK
FOREIGN KEY
	 (Company_id)
REFERENCES 
	 [dbo].[COMPANY] ([Company_id])
----------------------------------------------------------------------------------------------------------
CREATE TABLE 
	 WAREHOUSE
	 (
		Warehouse_Id varchar(10) NOT NULL PRIMARY KEY,
		Warehouse_Name varchar(25) NOT NULL,
		[NO] int NOT NULL,
		Street varchar(25) NOT NULL,
		City varchar(25) NOT NULL,
		Company_id varchar(10) NOT NULL,
		CONSTRAINT
			 Company_Has_warehouse_FK
	    FOREIGN KEY 
			(Company_id)
		REFERENCES 
			Company(Company_id)			
	 )
-----------------------------------------------------------------------------------------------------------
CREATE TABLE 
	 WAREHOUSE_Telephone_number
	 (
		Warehouse_Id varchar(10) NOT NULL,
		Telephone_number varchar(12) NOT NULL,
		PRIMARY KEY (Warehouse_Id,Telephone_number),
		 CONSTRAINT
			WAREHOUSE_Telephone_number_Warehouse_Id_FK
	    FOREIGN KEY 
			(Warehouse_Id)
		REFERENCES 
			WAREHOUSE(Warehouse_Id)	
	 )
-----------------------------------------------------------------------------------------------------------
CREATE TABLE 
	 Service_depot
	 (
		Service_depot_Id varchar(10) PRIMARY KEY NOT NULL,
		Service_depot_Name varchar(25) NOT NULL,
		[NO] int NOT NULL,
		Street varchar(25) NOT NULL,
		City varchar(25) NOT NULL
	 )
-----------------------------------------------------------------------------------------------------------
CREATE TABLE 
	 Service_depot_Telephone_number
	 (
		Service_depot_Id varchar(10) NOT NULL,
		Telephone_number varchar(10) NOT NULL,
		PRIMARY KEY (Service_depot_Id,Telephone_number),
		CONSTRAINT
			 Service_depot_Telephone_number_Service_depot_Id_FK
	    FOREIGN KEY 
			(Service_depot_Id)
		REFERENCES 
			Service_depot(Service_depot_Id)	
	 )
-----------------------------------------------------------------------------------------------------------
CREATE TABLE 
	 RETAIL_SHOP
	 (
		RetailShop_Id varchar(10) NOT NULL PRIMARY KEY,
		Shop_Name varchar(25) NOT NULL,
		[NO] varchar(5) NOT NULL,
		Street varchar(25) NOT NULL,
		City varchar(25) NOT NULL,
		Company_id varchar(10) NOT NULL,
		Service_depot_Id varchar(10) ,
		Warehouse_Id varchar(10) ,
		CONSTRAINT
			  RETAIL_SHOP_COMPANY_FK
	    FOREIGN KEY 
			(Company_id)
		REFERENCES 
			COMPANY(Company_id),

		CONSTRAINT
			RETAIL_SHOP_Service_depot_Id_FK
	    FOREIGN KEY 
			(Service_depot_Id)
		REFERENCES 
			Service_depot(Service_depot_Id),

		CONSTRAINT
			RETAIL_SHOP_Warehouse_Id_FK
	    FOREIGN KEY 
			(Warehouse_Id)
		REFERENCES 
			WAREHOUSE(Warehouse_Id),
	 )
------------------------------------------------------------------------------------------------------
CREATE TABLE
	Employee
	(
		Employee_id int NOT NULL PRIMARY KEY,
		FIRST_NAME varchar(20) NOT NULL,
		MIDDLE_NAME varchar(20),
		LAST_NAME varchar(20) NOT NULL,
		[NO] int NOT NULL,
		Street varchar(25) NOT NULL,
		City varchar(25) NOT NULL,
		Company_id varchar(10) NOT NULL,
		Salary money check (Salary > 0 ),
		Job_status varchar(15),
		Birth_date date,
		Gender CHAR(1) CHECK (Gender IN('F','M','f','m')),
		Warehouse_Id varchar(10),
		Service_depot_Id varchar(10),
		RetailShop_Id varchar(10),

		CONSTRAINT
			  Employee_Warehouse_Id_FK
	    FOREIGN KEY 
			(Warehouse_Id)
		REFERENCES 
			 WAREHOUSE(Warehouse_Id),


		CONSTRAINT
			  Employee_Service_depot_Id_FK
	    FOREIGN KEY 
			(Service_depot_Id)
		REFERENCES 
			 Service_depot(Service_depot_Id),


		CONSTRAINT
			  Employee_RetailShop_Id_FK
	    FOREIGN KEY 
			(RetailShop_Id)
		REFERENCES 
			 RETAIL_SHOP(RetailShop_Id)
	)

--------------------------------------------------------------------------------------------------------
CREATE TABLE 
	Employee_Telephone_number
	(
		Employee_id int NOT NULL ,
		Telephone_number varchar(10) NOT NULL,
		PRIMARY KEY (Employee_id,Telephone_number),

		CONSTRAINT
			  Employee_Employee_id_FK
	    FOREIGN KEY 
			(Employee_id)
		REFERENCES 
			 Employee(Employee_id)
	)
----------------------------------------------------------------------------------------------------------
CREATE TABLE 
	Manufacturer
	(
		Manufacturer_id varchar(10) NOT NULL PRIMARY KEY,
		Manufacturer_name varchar(20) NOT NULL,
		[NO] int NOT NULL,
		Street varchar(25) NOT NULL,
		City varchar(25) NOT NULL,
		bank_account_number bigint check ( bank_account_number > 0),
		Company_id varchar(10),
		CONSTRAINT
			 Manufacturer_Company_id_FK
	    FOREIGN KEY 
			(Company_id)
		REFERENCES 
			 COMPANY(Company_id)
	)

----------------------------------------------------------------------------------------------------------
CREATE TABLE 
	Manufacturer_Telephone_number
	(
		Manufacturer_id varchar(10) NOT NULL,
		Telephone_number varchar(10) NOT NULL,
		PRIMARY KEY(Manufacturer_id,Telephone_number),
		CONSTRAINT
			  Manufacturer_Telephone_number_Manufacturer_id_FK
	    FOREIGN KEY 
			(Manufacturer_id)
		REFERENCES 
			 Manufacturer(Manufacturer_id)

	)
	
----------------------------------------------------------------------------------------------------------
CREATE TABLE  
	Brand
	(
		Brand_id int NOT NULL PRIMARY KEY,
		BRAND_NAME varchar(25)  NOT NULL
	)
---------------------------------------------------------------------------------------------------------
CREATE TABLE  
	Catogory 
	(
		Catogory_id int NOT NULL PRIMARY KEY,
		Catogory_NAME varchar(25)  NOT NULL
	)
------------------------------------------------------------------------------------------------------------
CREATE TABLE  
	Stock_date
	(
		Stock_id int NOT NULL PRIMARY KEY,
		Stock_date date ,
	)
------------------------------------------------------------------------------------------------------------
CREATE TABLE 
	STOCK
	(
		Stock_id int not null,
		Catogory_id int NOT NULL,
		Manufacturer_id varchar(10) NOT NULL,
		Brand_id int NOT NULL,
		Model_number varchar(10) NOT NULL,
		Quentity int CHECK( Quentity > 0),
		PRIMARY KEY (Stock_id, Catogory_id, Manufacturer_id, Brand_id,Model_number),

		CONSTRAINT
			  STOCK_Stock_id_FK
	    FOREIGN KEY 
			(Stock_id)
		REFERENCES 
			 Stock_date(Stock_id),


	    CONSTRAINT
			  STOCK_Catogory_id_FK
	    FOREIGN KEY 
			(Catogory_id)
		REFERENCES 
			 Catogory(Catogory_id),


		CONSTRAINT
			  STOCK_Manufacturer_id_FK
	    FOREIGN KEY 
			(Manufacturer_id)
		REFERENCES 
			Manufacturer(Manufacturer_id),


		CONSTRAINT
			  STOCK_Brand_id_FK
	    FOREIGN KEY 
			(Brand_id)
		REFERENCES 
			Brand(Brand_id)			
	)

----------------------------------------------------------------------------------------------------------
CREATE TABLE 
	Equipment 
	(
		Item_Id int NOT NULL,
		Catogory_id int NOT NULL,
		Manufacturer_id varchar(10) NOT NULL,
		Brand_id int NOT NULL,
		Model_number varchar(10) NOT NULL,
		[Description] varchar(100),
		Retail_price int NOT NULL,
		Cost_Price int NOT NULL,
		PRIMARY KEY(Item_Id,Catogory_id,Manufacturer_id,Brand_id,Model_number),


	    CONSTRAINT
			 Equipment_Catogory_id_FK
	    FOREIGN KEY 
			(Catogory_id)
		REFERENCES 
			 Catogory(Catogory_id),


		CONSTRAINT
			 Equipment_Manufacturer_id_FK
	    FOREIGN KEY 
			(Manufacturer_id)
		REFERENCES 
			Manufacturer(Manufacturer_id),


		CONSTRAINT
			 Equipment_Brand_id_FK
	    FOREIGN KEY 
			(Brand_id)
		REFERENCES 
			Brand(Brand_id)			
	
	)
----------------------------------------------------------------------------------------------------------
CREATE TABLE 
	Retail_Equipment_Sell
	(
		RetailShop_Id varchar(10) NOT NULL,
		Item_Id int NOT NULL,
		Catogory_id int NOT NULL,
		Manufacturer_id varchar(10) NOT NULL,
		Brand_id int NOT NULL,
		Model_number varchar(10) NOT NULL,
		PRIMARY KEY(RetailShop_Id,Item_Id,Catogory_id,Manufacturer_id,Brand_id,Model_number),

		CONSTRAINT
			 Retail_Equipment_Equipment_id_FK
	    FOREIGN KEY 
			(Item_Id,Catogory_id,Manufacturer_id,Brand_id,Model_number)
		REFERENCES 
			Equipment(Item_Id,Catogory_id,Manufacturer_id,Brand_id,Model_number),
		
		CONSTRAINT
			 Retail_Equipment_RetailShop_Id_FK
	    FOREIGN KEY 
			(RetailShop_Id)
		REFERENCES 
			RETAIL_SHOP(RetailShop_Id)	

	)
----------------------------------------------------------------------------------------------------------

CREATE TABLE
	Customer
	(
			Customer_Id int NOT NULL PRIMARY KEY,
			FIRST_NAME varchar(25) NOT NULL,
			LAST_NAME varchar(25),
			[NO] int NOT NULL,
			Street varchar(25) NOT NULL,
			City varchar(25) NOT NULL,
			Gender CHAR(1) CHECK (Gender IN('F','M','f','m')),
			Purchases_amount int,
			recurrence int
	)
-------------------------------------------------------------------------------------------------------------
CREATE TABLE
	Customer_Telephone_number
	(
		Customer_Id int NOT NULL,
		Telephone_number varchar(10) NOT NULL,
		PRIMARY KEY (Customer_Id,Telephone_number),
		CONSTRAINT
			  Customer_Telephone_number_Customer_Id_FK
	    FOREIGN KEY 
			(Customer_Id)
		REFERENCES 
			 Customer(Customer_Id)
	)
-------------------------------------------------------------------------------------------------------------
CREATE TABLE 
		SALES
		(
			Sales_id int NOT NULL PRIMARY KEY,
			Net_Price money check(Net_Price > 0),
			Discount int ,
			[Date] date,
			warranty int NOT NULL Default 1,
			Customer_Id int,
			RetailShop_Id varchar(10),

			CONSTRAINT
				 SALES_Sales_id_FK
			FOREIGN KEY 
				(Customer_Id)
			REFERENCES 
				 Customer(Customer_Id),

			CONSTRAINT
				 SALES_RetailShop_Id_FK
			 FOREIGN KEY 
				(RetailShop_Id)
			REFERENCES 
				RETAIL_SHOP(RetailShop_Id)	
		)
	--------------------------------------------------------------------------------------------------------
CREATE TABLE 
	Service_depot_sales
	(
		Service_depot_Id varchar(10),
		Sales_id int NOT NULL ,
		PRIMARY KEY (Service_depot_Id,Sales_id),
		
		CONSTRAINT
				 Service_depot_Service_depot_Id_FK
		FOREIGN KEY 
				(Service_depot_Id)
		REFERENCES 
				 Service_depot (Service_depot_Id),

		CONSTRAINT
				 Service_depot_Sales_id_FK
		FOREIGN KEY 
				(Sales_id)
		REFERENCES 
				 SALES (Sales_id )
	)
-------------------------------------------------------------------------------------------------------------

CREATE TABLE 
	[Service]
	(
		Service_id int NOT NULL PRIMARY KEY,
		description_Of_Repair varchar(100),
		Time_and_date datetime,
		Cost_Of_replaced_parts int,
		Sales_id int NOT NULL,
		Employee_id int NOT NULL ,

		
		CONSTRAINT
				 Service_Sales_id_FK
		FOREIGN KEY 
				(Sales_id)
		REFERENCES 
				 SALES (Sales_id ),


		CONSTRAINT
				 Service_Employee_id_FK
		FOREIGN KEY 
				(Employee_id)
		REFERENCES 
				Employee(Employee_id),
	)
-------------------------------------------------------------------------------------------------------------------
CREATE TABLE
	Service_Agreement
	(
		[Availability] char(1) CHECK ([Availability] IN('Y','N','y','n')),
		TIME_PERIOD_In_Months int,
		Cost int,
		[Date] date,
		Customer_Id int,
		Item_Id int ,
		Catogory_id int,
		Manufacturer_id varchar(10) ,
		Model_number varchar(10),
		Brand_id int,
		Sales_id int ,

		CONSTRAINT
			 Service_Agreement_Equipment_id_FK
	    FOREIGN KEY 
			(Item_Id,Catogory_id,Manufacturer_id,Brand_id,Model_number)
		REFERENCES 
			Equipment(Item_Id,Catogory_id,Manufacturer_id,Brand_id,Model_number),

		CONSTRAINT
				 Service_Agreement_id_FK
		FOREIGN KEY 
				(Sales_id)
		REFERENCES 
				 SALES (Sales_id )

	)
-----------------------------------------------------------------------------------------------------------
/*Input data for company table
	[dbo].[COMPANY]

		[Company_id]
		[Company_name]
		[NO]
		[Street]
		[City]	*/

INSERT INTO 
	[dbo].[COMPANY] ([Company_id],[Company_name],[NO],[Street],[City])
VALUES
	('24948','Singer Mega','06','Nawam Mawatha','Colombo 2')
-------------------------------------------------------------------------------------------------------
/*Input data for Customer_Telephone_number table
	[dbo].[COMPANY TELEPHONE NUMBER]

		[Company_id]
		[Telephone_number] */

INSERT INTO 
	[dbo].[COMPANY TELEPHONE NUMBER] ([Company_id],[Telephone_number])
VALUES
	('24948','+94115400400')


INSERT INTO 
	[dbo].[COMPANY TELEPHONE NUMBER] ([Company_id],[Telephone_number])
VALUES
	('24948','+94112690907')


INSERT INTO 
	[dbo].[COMPANY TELEPHONE NUMBER] ([Company_id],[Telephone_number])
VALUES
	('24948','+94154087554')
---------------------------------------------------------------------------------------------
/*Input data for COMPANY Email Address table
	[dbo].[COMPANY Email Address]

		[Company_id]
		[E_mail]	*/

INSERT INTO 
	[dbo].[COMPANY Email Address] ([Company_id],[E_mail])
VALUES
	('24948','singer@singersl.com')


INSERT INTO 
	[dbo].[COMPANY Email Address] ([Company_id],[E_mail])
VALUES
	('24948','singer@singerin.com')


INSERT INTO 
	[dbo].[COMPANY Email Address] ([Company_id],[E_mail])
VALUES
	('24948','singer-Mega@singersl.com')

-----------------------------------------------------------------------------------------------
/* Input data for COMPANY Fax Number table
		[dbo].[COMPANY Fax Number]

			[Company_id]
			[Fax_number]	*/


INSERT INTO 
	[dbo].[COMPANY Fax Number] ([Company_id],[Fax_number])
VALUES
	('24948','+94115400400')


INSERT INTO 
	[dbo].[COMPANY Fax Number] ([Company_id],[Fax_number])
VALUES
	('24948','+94112690907')


INSERT INTO 
	[dbo].[COMPANY Fax Number] ([Company_id],[Fax_number])
VALUES
	('24948','+94154087554')

--------------------------------------------------------------------------------------------------
/* Input data for WAREHOUSE table
		[dbo].[WAREHOUSE]

			[Warehouse_Id],
			[Warehouse_Name],
			[NO],
			[Street],
			[Street],
			[City],
			[Company_id]	*/

INSERT INTO 
	[dbo].[WAREHOUSE] ([Warehouse_Id],[Warehouse_Name],[NO],[Street],[City],[Company_id])
VALUES
	('6975','Thurstan SINGER Warehouse','38','Thurstan Road','Colombo 03','24948')

INSERT INTO 
	[dbo].[WAREHOUSE] ([Warehouse_Id],[Warehouse_Name],[NO],[Street],[City],[Company_id])
VALUES
	('4597','Horana SINGER Warehouse','33','Rathnapura Road','Horana','24948')

INSERT INTO 
	[dbo].[WAREHOUSE] ([Warehouse_Id],[Warehouse_Name],[NO],[Street],[City],[Company_id])
VALUES
	('3274','Galle SINGER Warehouse','16','Galle Road','Galle','24948')

INSERT INTO 
	[dbo].[WAREHOUSE] ([Warehouse_Id],[Warehouse_Name],[NO],[Street],[City],[Company_id])
VALUES
	('7804','Haltota SINGER Warehouse','18','Anguruvathota Road','Haltota','24948')

INSERT INTO 
	[dbo].[WAREHOUSE] ([Warehouse_Id],[Warehouse_Name],[NO],[Street],[City],[Company_id])
VALUES
	('3490','Moratuva SINGER Warehouse','21','Galle Road','Moratuva','24948')

----------------------------------------------------------------------------------------------
/* Input data for WAREHOUSE_Telephone_number table
	[dbo].[WAREHOUSE_Telephone_number]
		[Warehouse_Id]
		[Telephone_number] */

INSERT INTO 
	[dbo].[WAREHOUSE_Telephone_number] ([Warehouse_Id],[Telephone_number])
VALUES
	('6975','+94112375645')

INSERT INTO 
	[dbo].[WAREHOUSE_Telephone_number] ([Warehouse_Id],[Telephone_number])
VALUES
	('6975','+94114354645')

INSERT INTO 
	[dbo].[WAREHOUSE_Telephone_number] ([Warehouse_Id],[Telephone_number])
VALUES
	('4597','+94344567645')

INSERT INTO 
	[dbo].[WAREHOUSE_Telephone_number] ([Warehouse_Id],[Telephone_number])
VALUES
	('4597','+94309876545')

INSERT INTO 
	[dbo].[WAREHOUSE_Telephone_number] ([Warehouse_Id],[Telephone_number])
VALUES
	('3274','+94919456345')

INSERT INTO 
	[dbo].[WAREHOUSE_Telephone_number] ([Warehouse_Id],[Telephone_number])
VALUES
	('3274','+9491941234')


INSERT INTO 
	[dbo].[WAREHOUSE_Telephone_number] ([Warehouse_Id],[Telephone_number])
VALUES
	('7804','+9438947654')

INSERT INTO 
	[dbo].[WAREHOUSE_Telephone_number] ([Warehouse_Id],[Telephone_number])
VALUES
	('7804','+9438948904')

INSERT INTO 
	[dbo].[WAREHOUSE_Telephone_number] ([Warehouse_Id],[Telephone_number])
VALUES
	('7804','+9443218904')

INSERT INTO 
	[dbo].[WAREHOUSE_Telephone_number] ([Warehouse_Id],[Telephone_number])
VALUES
	('3490','+9411456909')

--------------------------------------------------------------------------------------------
/*Inser data into Service_depot table
	[dbo].[Service_depot]

		[Service_depot_Id],
		[Service_depot_Name],
		[NO],
		[Street],
		[City]	*/


INSERT INTO 
	[dbo].[Service_depot] ([Service_depot_Id],[Service_depot_Name],[NO],[Street],[City])
VALUES
	('33333','ALUTHGAMA Service depot','49','Galle Road','Aluthgama')

INSERT INTO 
	[dbo].[Service_depot] ([Service_depot_Id],[Service_depot_Name],[NO],[Street],[City])
VALUES
	('23454','AMPARA Service depot','786', 'Kalmunai Road', 'Ampara')

INSERT INTO 
	[dbo].[Service_depot] ([Service_depot_Id],[Service_depot_Name],[NO],[Street],[City])
VALUES
	('45654','BADULLA Service depot','88', 'Hunukotuwa Road','Badulla')

INSERT INTO 
	[dbo].[Service_depot] ([Service_depot_Id],[Service_depot_Name],[NO],[Street],[City])
VALUES
	('23456','COLOMBO Service depot','128', 'Dr.N.M. Perera Mawatha', 'Colombo 8')

INSERT INTO 
	[dbo].[Service_depot] ([Service_depot_Id],[Service_depot_Name],[NO],[Street],[City])
VALUES
	('26786','JAFFNA Service depot','333', 'Palaly Road','Jaffna')


INSERT INTO 
	[dbo].[Service_depot] ([Service_depot_Id],[Service_depot_Name],[NO],[Street],[City])
VALUES
	('90086','PASYALA Service depot','172', 'Kandy Road','Pasyala')

INSERT INTO 
	[dbo].[Service_depot] ([Service_depot_Id],[Service_depot_Name],[NO],[Street],[City])
VALUES
	('87686','KANDY Service depot','253', ' Katugastota Road','Kandy')

------------------------------------------------------------------------------------------
/* Input data for Service_depot_Telephone_number table
	[dbo].[Service_depot_Telephone_number]

		[Service_depot_Id]
		[Telephone_number] */

INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('33333','0342291881')
	
INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('33333','0342291882')



INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('23454','0632224467')
	
INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('23454','0632224468')



INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('45654','0552228640')
	
INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('45654','0552228650')

INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('45654','0552228655')


	
INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('23456','0112665103')
	
INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('23456','0112665779')

INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('23456','0112665105')


INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('26786','0212053844')

INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('26786','0212224577')

INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('26786','0215674577')

INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('26786','0213202324')



INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('90086','0332285592')


INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('87686','0812233169')

INSERT INTO 
	[dbo].[Service_depot_Telephone_number] ([Service_depot_Id],[Telephone_number])
VALUES
	('87686','0812234428')
----------------------------------------------------------------------------------------------
/*Insert data into RETAIL_SHOP table
 [dbo].[RETAIL_SHOP]
	[RetailShop_Id],
	[Shop_Name],
	[NO],
	[Street],
	[City],
	[Company_id],
	[Service_depot_Id],
	[Warehouse_Id] */


INSERT INTO 
	[dbo].[RETAIL_SHOP] ([RetailShop_Id],[Shop_Name],[NO],[Street],[City],[Company_id],[Service_depot_Id],[Warehouse_Id])
VALUES
	('888888','Mega - Nugegoda','4 D','Nawala Road','Nugegoda','24948','23456','6975')


INSERT INTO 
	[dbo].[RETAIL_SHOP] ([RetailShop_Id],[Shop_Name],[NO],[Street],[City],[Company_id],[Service_depot_Id],[Warehouse_Id])
VALUES
	('987654','Mega - Panadura','No585','Galle Road','Panadura','24948','33333','7804')


INSERT INTO 
	[dbo].[RETAIL_SHOP] ([RetailShop_Id],[Shop_Name],[NO],[Street],[City],[Company_id],[Service_depot_Id],[Warehouse_Id])
VALUES
	('567890','Mega - Wattala','811','Negombo Road','Wattala','24948','45654','6975')


INSERT INTO 
	[dbo].[RETAIL_SHOP] ([RetailShop_Id],[Shop_Name],[NO],[Street],[City],[Company_id],[Service_depot_Id],[Warehouse_Id])
VALUES
	('590000','Mega - Rajagiriya','227','Castle Street','Colombo-08','24948','23456','6975')


INSERT INTO 
	[dbo].[RETAIL_SHOP] ([RetailShop_Id],[Shop_Name],[NO],[Street],[City],[Company_id],[Service_depot_Id],[Warehouse_Id])
VALUES
	('594567','Mega - Negombo','220 A','Colombo Road','Negombo','24948','23456','6975')

INSERT INTO 
	[dbo].[RETAIL_SHOP] ([RetailShop_Id],[Shop_Name],[NO],[Street],[City],[Company_id],[Service_depot_Id],[Warehouse_Id])
VALUES
	('599877','Mega - Kandy','213','Peradeniya Road','Kandy','24948','90086','7804')

-----------------------------------------------------------------------------------------------------
/* Insert data into Employee table 
	[dbo].[Employee]
		[Employee_id],
		[FIRST_NAME],
		[MIDDLE_NAME],
		[LAST_NAME],
		[NO],
		[Street],
		[City],
		[Company_id],
		[Salary],
		[Job_status],
		[Birth_date],
		[Gender],
		[Warehouse_Id],
		[Service_depot_Id],
		[RetailShop_Id] */

INSERT INTO 
	[dbo].[Employee] ([Employee_id],[FIRST_NAME],[MIDDLE_NAME],[LAST_NAME],[NO],[Street],[City],[Company_id],[Salary],[Job_status],	[Birth_date],[Gender],[Warehouse_Id],[Service_depot_Id],[RetailShop_Id])
VALUES
	('30','Lakith','Udara','Muthugala','23','Haltota road','Bandaragama','24948','50000','Engineer','1995-04-25','M',NULL,'23456',NULL)


INSERT INTO 
	[dbo].[Employee] ([Employee_id],[FIRST_NAME],[MIDDLE_NAME],[LAST_NAME],[NO],[Street],[City],[Company_id],[Salary],[Job_status],	[Birth_date],[Gender],[Warehouse_Id],[Service_depot_Id],[RetailShop_Id])
VALUES
	('33','Chalana','Kalpitha','Karunarathna','26','Panadura road','Newdava','24948','55000','Maneger','1995-05-25','M',NULL,NULL,'888888')


INSERT INTO 
	[dbo].[Employee] ([Employee_id],[FIRST_NAME],[MIDDLE_NAME],[LAST_NAME],[NO],[Street],[City],[Company_id],[Salary],[Job_status],	[Birth_date],[Gender],[Warehouse_Id],[Service_depot_Id],[RetailShop_Id])
VALUES
	('36','Sachin','Nimesh','Nanayakkara','28','Panadura road','Newdava','24948','50000','Executive','1995-06-20','M','7804',NULL,NULL)

INSERT INTO 
	[dbo].[Employee] ([Employee_id],[FIRST_NAME],[MIDDLE_NAME],[LAST_NAME],[NO],[Street],[City],[Company_id],[Salary],[Job_status],	[Birth_date],[Gender],[Warehouse_Id],[Service_depot_Id],[RetailShop_Id])
VALUES
	('39','Hansi','Ayshwari','Yapa','89','Rathnapura road','Ingiriya','24948','500000','CEO','1995-06-20','M',NULL,NULL,NULL)

INSERT INTO 
	[dbo].[Employee] ([Employee_id],[FIRST_NAME],[MIDDLE_NAME],[LAST_NAME],[NO],[Street],[City],[Company_id],[Salary],[Job_status],	[Birth_date],[Gender],[Warehouse_Id],[Service_depot_Id],[RetailShop_Id])
VALUES
	('42','Dumidu','Dasun','Perera','112','Panadure road','Mahabellana','24948','50000','Executive','1995-11-20','M','7804',NULL,NULL)

------------------------------------------------------------------------------------------------------------------------------
/*Insert into Employee_Telephone_number table
	[dbo].[Employee_Telephone_number]
		[Employee_id]
		[Telephone_number] */



INSERT INTO 
	[dbo].[Employee_Telephone_number] ([Employee_id],[Telephone_number])
VALUES
	('30','0710873073')

INSERT INTO 
	[dbo].[Employee_Telephone_number] ([Employee_id],[Telephone_number])
VALUES
	('30','0342252011')


INSERT INTO 
	[dbo].[Employee_Telephone_number] ([Employee_id],[Telephone_number])
VALUES
	('33','0712134223')

INSERT INTO 
	[dbo].[Employee_Telephone_number] ([Employee_id],[Telephone_number])
VALUES
	('33','0342676223')


INSERT INTO 
	[dbo].[Employee_Telephone_number] ([Employee_id],[Telephone_number])
VALUES
	('36','0772612343')

INSERT INTO 
	[dbo].[Employee_Telephone_number] ([Employee_id],[Telephone_number])
VALUES
	('36','0380987643')


INSERT INTO 
	[dbo].[Employee_Telephone_number] ([Employee_id],[Telephone_number])
VALUES
	('39','077269876')

INSERT INTO 
	[dbo].[Employee_Telephone_number] ([Employee_id],[Telephone_number])
VALUES
	('39','0345678643')

INSERT INTO 
	[dbo].[Employee_Telephone_number] ([Employee_id],[Telephone_number])
VALUES
	('42','0713879586')

INSERT INTO 
	[dbo].[Employee_Telephone_number] ([Employee_id],[Telephone_number])
VALUES
	('42','0380000643')

----------------------------------------------------------------------------------------------------------
/*Insert data into Manufacturer table.
	[dbo].[Manufacturer]
		[Manufacturer_id],
		[Manufacturer_name],
		[NO],
		[Street],
		[City],
		[bank_account_number],
		[Company_id] */


		
INSERT INTO 
	[dbo].[Manufacturer] ([Manufacturer_id],[Manufacturer_name],[NO],[Street],[City],[bank_account_number],[Company_id])
VALUES
	('234','Samsung','443','Suwon','South Korea','2312332323123412','24948')

INSERT INTO 
	[dbo].[Manufacturer] ([Manufacturer_id],[Manufacturer_name],[NO],[Street],[City],[bank_account_number],[Company_id])
VALUES
	('235','Sony','113','Shinagawa-ku','Tokyo','23123399867867789','24948')

INSERT INTO 
	[dbo].[Manufacturer] ([Manufacturer_id],[Manufacturer_name],[NO],[Street],[City],[bank_account_number],[Company_id])
VALUES
	('236','Lenovo','29','Zizhuyuan Road','China','2312234324232145','24948')

INSERT INTO 
	[dbo].[Manufacturer] ([Manufacturer_id],[Manufacturer_name],[NO],[Street],[City],[bank_account_number],[Company_id])
VALUES
	('237','Innovax','317','Outram Rd','Singapor','31232134324232145','24948')

INSERT INTO 
	[dbo].[Manufacturer] ([Manufacturer_id],[Manufacturer_name],[NO],[Street],[City],[bank_account_number],[Company_id])
VALUES
	('238','Lenovo','29','Zizhuyuan Road','China','2312234324232145','24948')

----------------------------------------------------------------------------------------------------------

/* Inset data into Manufacturer_Telephone_number
	[dbo].[Manufacturer_Telephone_number]
		[Manufacturer_id]
		[Telephone_number] */


INSERT INTO 
	[dbo].[Manufacturer_Telephone_number]([Manufacturer_id],[Telephone_number])
VALUES
	('234','1800726786')

INSERT INTO 
	[dbo].[Manufacturer_Telephone_number]([Manufacturer_id],[Telephone_number])
VALUES
	('234','1800345786')

INSERT INTO 
	[dbo].[Manufacturer_Telephone_number]([Manufacturer_id],[Telephone_number])
VALUES
	('235','1098765432')

INSERT INTO 
	[dbo].[Manufacturer_Telephone_number]([Manufacturer_id],[Telephone_number])
VALUES
	('235','1234567890')


INSERT INTO 
	[dbo].[Manufacturer_Telephone_number]([Manufacturer_id],[Telephone_number])
VALUES
	('236','9874567890')

INSERT INTO 
	[dbo].[Manufacturer_Telephone_number]([Manufacturer_id],[Telephone_number])
VALUES
	('236','8884567890')

INSERT INTO 
	[dbo].[Manufacturer_Telephone_number]([Manufacturer_id],[Telephone_number])
VALUES
	('237','8845677890')


INSERT INTO 
	[dbo].[Manufacturer_Telephone_number]([Manufacturer_id],[Telephone_number])
VALUES
	('238','8985677890')
-------------------------------------------------------------------------------------------
/*Insert data into Brand table
	[dbo].[Brand]
		[Brand_id]
		[BRAND_NAME] */

INSERT INTO 
	[dbo].[Brand]([Brand_id],[BRAND_NAME])
VALUES
	('1','LED')

INSERT INTO 
	[dbo].[Brand]([Brand_id],[BRAND_NAME])
VALUES
	('2','LCD')

INSERT INTO 
	[dbo].[Brand]([Brand_id],[BRAND_NAME])
VALUES
	('3','Door cooling')

INSERT INTO 
	[dbo].[Brand]([Brand_id],[BRAND_NAME])
VALUES
	('4','Read/write')

INSERT INTO 
	[dbo].[Brand]([Brand_id],[BRAND_NAME])
VALUES
	('5','Bluray')

INSERT INTO 
	[dbo].[Brand]([Brand_id],[BRAND_NAME])
VALUES
	('6','eco')

INSERT INTO 
	[dbo].[Brand]([Brand_id],[BRAND_NAME])
VALUES
	('7','Manual')

INSERT INTO 
	[dbo].[Brand]([Brand_id],[BRAND_NAME])
VALUES
	('8','Full automatic')

---------------------------------------------------------------------------------------------------
/* Insert data to Catogory table
	[dbo].[Catogory]
		[Catogory_id]
		[Catogory_NAME] */


INSERT INTO 
	[dbo].[Catogory]([Catogory_id],[Catogory_NAME])
VALUES
	('1','televisions')

INSERT INTO 
	[dbo].[Catogory]([Catogory_id],[Catogory_NAME])
VALUES
	('2','washing machines')

INSERT INTO 
	[dbo].[Catogory]([Catogory_id],[Catogory_NAME])
VALUES
	('3','refrigerators')

INSERT INTO 
	[dbo].[Catogory]([Catogory_id],[Catogory_NAME])
VALUES
	('4','Video record players')

-----------------------------------------------------------------------------------------
/* Insert data to Stock_date table
	[dbo].[Stock_date]
		[Stock_id]
		[Stock_date] */


INSERT INTO 
	[dbo].[Stock_date]([Stock_id],[Stock_date])
VALUES
	('20','2016-04-25')


INSERT INTO 
	[dbo].[Stock_date]([Stock_id],[Stock_date])
VALUES
	('21','2016-04-28')

INSERT INTO 
	[dbo].[Stock_date]([Stock_id],[Stock_date])
VALUES
	('22','2016-06-28')

INSERT INTO 
	[dbo].[Stock_date]([Stock_id],[Stock_date])
VALUES
	('23','2016-06-30')

INSERT INTO 
	[dbo].[Stock_date]([Stock_id],[Stock_date])
VALUES
	('24','2016-09-10')

INSERT INTO 
	[dbo].[Stock_date]([Stock_id],[Stock_date])
VALUES
	('25','2016-09-27')
-----------------------------------------------------------------------------------------------------
/*Insert data to STOCK table
	[dbo].[STOCK]
		[Stock_id],
		[Catogory_id],
		[Manufacturer_id],
		[Brand_id],
		[Model_number],
		[Quentity] */

INSERT INTO 
	[dbo].[STOCK]([Stock_id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number],[Quentity])
VALUES
	('20','1','234','1','MA 280','100')

INSERT INTO 
	[dbo].[STOCK]([Stock_id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number],[Quentity])
VALUES
	('21','2','237','8','MV 288','50')

INSERT INTO 
	[dbo].[STOCK]([Stock_id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number],[Quentity])
VALUES
	('22','3','234','3','MR 290','75')

INSERT INTO 
	[dbo].[STOCK]([Stock_id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number],[Quentity])
VALUES
	('23','4','236','5','ME 296','120')

INSERT INTO 
	[dbo].[STOCK]([Stock_id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number],[Quentity])
VALUES
	('24','3','235','6','MQ 298','105')


INSERT INTO 
	[dbo].[STOCK]([Stock_id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number],[Quentity])
VALUES
	('25','1','238','2','MZ 300','110')

-------------------------------------------------------------------------------------------------------
/*insert data into Equipment table
	[dbo].[Equipment]
		[Item_Id],
		[Catogory_id],
		[Manufacturer_id],
		[Brand_id],
		[Model_number],
		[Description],
		[Retail_price],
		[Cost_Price]  */

INSERT INTO 
	[dbo].[Equipment]([Item_Id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number],[Description],[Retail_price],[Cost_Price])
VALUES
	('1','1','238','2','MA 280','4k Hd video ready','40000','900000')

INSERT INTO 
	[dbo].[Equipment]([Item_Id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number],[Description],[Retail_price],[Cost_Price])
VALUES
	('2','2','237','8','MV 288','Less water usage','43000','80000')

INSERT INTO 
	[dbo].[Equipment]([Item_Id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number],[Description],[Retail_price],[Cost_Price])
VALUES
	('3','3','234','3','MR 290','Less Power usage','47000','500000')

INSERT INTO 
	[dbo].[Equipment]([Item_Id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number],[Description],[Retail_price],[Cost_Price])
VALUES
	('4','4','236','5','ME 296','UsB ready','27000','1200000')

---------------------------------------------------------------------------------------------------
/*iNSERT DATA INTO Retail_Equipment_Sell TABLE.
	[dbo].[Retail_Equipment_Sell]
		[RetailShop_Id],
		[Item_Id],
		[Catogory_id],
		[Manufacturer_id],
		[Brand_id],
		[Model_number], */
INSERT INTO 
	[dbo].[Retail_Equipment_Sell]([RetailShop_Id],[Item_Id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number])
VALUES
	('888888','1','1','238','2','MA 280')

INSERT INTO 
	[dbo].[Retail_Equipment_Sell]([RetailShop_Id],[Item_Id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number])
VALUES
	('987654','2','2','237','8','MV 288')

INSERT INTO 
	[dbo].[Retail_Equipment_Sell]([RetailShop_Id],[Item_Id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number])
VALUES
	('567890','3','3','234','3','MR 290')

INSERT INTO 
	[dbo].[Retail_Equipment_Sell]([RetailShop_Id],[Item_Id],[Catogory_id],[Manufacturer_id],[Brand_id],[Model_number])
VALUES
	('590000','4','4','236','5','ME 296')

--------------------------------------------------------------------------------------------------------
/* Insert data into the Customer table

	[dbo].[Customer]
		[Customer_Id],
		[FIRST_NAME],
		[LAST_NAME],
		[NO],
		[Street],
		[City],
		[Gender],
		[Purchases_amount],
		[recurrence]   */

INSERT INTO 
	[dbo].[Customer]([Customer_Id],[FIRST_NAME],[LAST_NAME],[NO],[Street],[City],[Gender],[Purchases_amount],[recurrence])
VALUES
	('100','Dilantha','Sanjeewa','128', 'Dr.N.M. Perera Mawatha', 'Colombo 8','M','10','2')

INSERT INTO 
	[dbo].[Customer]([Customer_Id],[FIRST_NAME],[LAST_NAME],[NO],[Street],[City],[Gender],[Purchases_amount],[recurrence])
VALUES
	('101','lashan','Ediriweera','585','Galle Road','Panadura','M','5','2')

INSERT INTO 
	[dbo].[Customer]([Customer_Id],[FIRST_NAME],[LAST_NAME],[NO],[Street],[City],[Gender],[Purchases_amount],[recurrence])
VALUES
	('102','Rohan','Muthugala','220','Colombo Road','Negombo','M','25','1')

INSERT INTO 
	[dbo].[Customer]([Customer_Id],[FIRST_NAME],[LAST_NAME],[NO],[Street],[City],[Gender],[Purchases_amount],[recurrence])
VALUES
	('103','Kamani','Gunathilaka','220','Colombo Road','Negombo','F','10','3')

---------------------------------------------------------------------------------------------------
/*Issert data to Customer_Telephone_number table
	[dbo].[Customer_Telephone_number]
		[Customer_Id]
		[Telephone_number] */

INSERT INTO 
	[dbo].[Customer_Telephone_number]([Customer_Id],[Telephone_number])
VALUES
	('100','0713243432')

INSERT INTO 
	[dbo].[Customer_Telephone_number]([Customer_Id],[Telephone_number])
VALUES
	('100','0713234542')

INSERT INTO 
	[dbo].[Customer_Telephone_number]([Customer_Id],[Telephone_number])
VALUES
	('101','0786325632')

INSERT INTO 
	[dbo].[Customer_Telephone_number]([Customer_Id],[Telephone_number])
VALUES
	('101','0726325632')

INSERT INTO 
	[dbo].[Customer_Telephone_number]([Customer_Id],[Telephone_number])
VALUES
	('102','0776388832')

INSERT INTO 
	[dbo].[Customer_Telephone_number]([Customer_Id],[Telephone_number])
VALUES
	('102','0756788832')

INSERT INTO 
	[dbo].[Customer_Telephone_number]([Customer_Id],[Telephone_number])
VALUES
	('103','0778788832')

-----------------------------------------------------------------------------------
/* Insert data to the sales table 
	[dbo].[SALES]
		[Sales_id],
		[Net_Price],
		[Discount],
		[Date],
		[warranty],
		[Customer_Id],
		[RetailShop_Id]*/

INSERT INTO 
	[dbo].[SALES]([Sales_id],[Net_Price],[Discount],[Date],[warranty],[Customer_Id],[RetailShop_Id])
VALUES
	('200','100000',NULL,'2016-08-25','1','100','888888')

INSERT INTO 
	[dbo].[SALES]([Sales_id],[Net_Price],[Discount],[Date],[warranty],[Customer_Id],[RetailShop_Id])
VALUES
	('201','150000',NULL,'2016-08-30','1','101','987654')

INSERT INTO 
	[dbo].[SALES]([Sales_id],[Net_Price],[Discount],[Date],[warranty],[Customer_Id],[RetailShop_Id])
VALUES
	('202','180000',NULL,'2016-09-05','1','102','987654')

INSERT INTO 
	[dbo].[SALES]([Sales_id],[Net_Price],[Discount],[Date],[warranty],[Customer_Id],[RetailShop_Id])
VALUES
	('203','220000',NULL,'2016-09-10','1','103','599877')

-----------------------------------------------------------------------------------------------
/*insert data in to the serviece depot table
	[dbo].[Service_depot_sales]
		[Service_depot_Id]
		[Sales_id]   */

INSERT INTO 
	[dbo].[Service_depot_sales]([Service_depot_Id],[Sales_id])
VALUES
	('26786','200')

INSERT INTO 
	[dbo].[Service_depot_sales]([Service_depot_Id],[Sales_id])
VALUES
	('90086','201')

INSERT INTO 
	[dbo].[Service_depot_sales]([Service_depot_Id],[Sales_id])
VALUES
	('87686','202')

---------------------------------------------------------------------
/*insert data in to the Service table
	[dbo].[Service]
		[Service_id],
		[description_Of_Repair],
		[Time_and_date],
		[Cost_Of_replaced_parts],
		[Sales_id],
		[Employee_id]    */


INSERT INTO 
	[dbo].[Service]([Service_id],[description_Of_Repair],[Time_and_date],[Cost_Of_replaced_parts],[Sales_id],[Employee_id] )
VALUES
	('10','Damaged by the user','2016-04-25 05:23:00','10000','200','30')
	
INSERT INTO 
	[dbo].[Service]([Service_id],[description_Of_Repair],[Time_and_date],[Cost_Of_replaced_parts],[Sales_id],[Employee_id] )
VALUES
	('11','Over heat problem','2016-05-25 05:23:00','10000','201','30')

INSERT INTO 
	[dbo].[Service]([Service_id],[description_Of_Repair],[Time_and_date],[Cost_Of_replaced_parts],[Sales_id],[Employee_id] )
VALUES
	('12','damaged by high voltage','2016-06-25 05:23:00','10500','202','30')

-------------------------------------------------------------------------------------------
/* insert data to the service argumant table 

	[dbo].[Service_Agreement]
		[Availability],
		[TIME_PERIOD_In_Months],
		[Cost],
		[Date],
		[Customer_Id],
		[Item_Id],
		[Catogory_id],
		[Manufacturer_id],
		[Model_number],
		[Brand_id],
		[Sales_id]  */

INSERT INTO 
	[dbo].[Service_Agreement]([Availability],[TIME_PERIOD_In_Months],[Cost],[Date],[Customer_Id],[Item_Id],[Catogory_id],[Manufacturer_id],[Model_number],[Brand_id],[Sales_id])
VALUES
	('Y','36','5000','2016-04-25','100','1','1','238','MA 280','2','200')

INSERT INTO 
	[dbo].[Service_Agreement]([Availability],[TIME_PERIOD_In_Months],[Cost],[Date],[Customer_Id],[Item_Id],[Catogory_id],[Manufacturer_id],[Model_number],[Brand_id],[Sales_id])
VALUES
	('N',NULL,NULL,'2016-04-25','100','1','1','238','MA 280','2','201')