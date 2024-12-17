create table customer_nancy(
  Category_Id int,Customer_City varchar(255),Customer_Country varchar(255), Customer_Fname varchar(255)	,Customer_Id int,Customer_Lname	varchar (255),
  Custcustomer_Segment varchar(255), Customer_State varchar(255),Customer_Street varchar(255),Customer_Zipcode int	,Department_Id	int,
  Department_Name varchar(255),Order_Id int)
  ;


select * from customer_nancy;
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer table.csv" into table customer_nancy
fields terminated by ','
optionally enclosed by '"' 
lines terminated by '\r\n'
ignore 1 rows;  
show variables like "secure_file_priv";
select user from mysql.user;
show grants for root@localhost;

select * from customer_nancy;
select count(*) from customer_nancy;
create table category_nancy(Category_Id	int,Category_Name varchar(255),Customer_Id int,Order_Id int);
select * from customer_nancy;
load data infile "C:/ProgramData/MySQL\MySQL Server 8.0/Uploads/newsupplychain.csv" into table supplychain_nancy
fields terminated by ','
optionally enclosed by '"' 
lines terminated by '\r\n'
ignore 1 rows; 
create table order_nancy(Market varchar(255),Order_City char(255),Order_Country varchar(255),Order_Customer_Id varchar(255),Order_Date date	
,Order_Month varchar(25),Order_Year year,Order_Id int,Order_Item_Cardprod_Id int,Order_Item_Discount decimal,Order_Item_Discount_Rate decimal,
Order_Item_Id int,Order_Item_Product_Price decimal,Order_Item_Profit_Ratio decimal,Order_Item_Quantity int,Order_Profit_Per_Order decimal,
Order_Region varchar(255),Order_State varchar(255),Order_Status varchar(255),Category_Id int);

create table product_nancy(Product_Card_Id	int,Product_Category_Id int,Product_Name varchar(255),Product_Price decimal, Order_Id int);
select * from product_nancy;
select count(*) from order_nancy;
create table shipping_nancy(Type varchar(255),shipping_days_real int,shipment_days_scheduled int,
Sales_per_customer decimal ,Delivery_Status varchar(255),Late_delivery_risk	int, category_Id int,shipping_date date,shipping_month varchar(255),
shipping_year year,Shipping_Mode varchar(255),Product_Category_Id int);
select * from order_nancy;

create table supplychain_nancy(Type varchar(255),shipping_days_real int,shipment_days_scheduled int,
Sales_per_customer decimal ,Delivery_Status varchar(255),Late_delivery_risk	int, category_Id int,shipping_date date,shipping_month varchar(255),
shipping_year year,Shipping_Mode varchar(255),Customer_City varchar(255),Customer_Country varchar(255), Customer_Fname varchar(255)	,Customer_Id int,Customer_Lname	varchar (255),
  Custcustomer_Segment varchar(255), Customer_State varchar(255),Customer_Street varchar(255),Customer_Zipcode int	,Department_Id	int,
  Department_Name varchar(255),Market varchar(255),Order_City char(255),Order_Country varchar(255),Order_Customer_Id varchar(255),Order_Date date	
,Order_Month varchar(25),Order_Year year,Order_Id int,Order_Item_Cardprod_Id int,Order_Item_Discount decimal,Order_Item_Discount_Rate decimal,
Order_Item_Id int,Order_Item_Product_Price decimal,Order_Item_Profit_Ratio decimal,Order_Item_Quantity int,sales decimal, Order_Profit_Per_Order decimal,
Order_Region varchar(255),Order_State varchar(255),Order_Status varchar(255),Product_Card_Id int,Product_Category_Id int,Product_Name varchar(255),
Product_Price decimal);
load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Book1.csv" into table category
fields terminated by ','
optionally enclosed by '"' 
lines terminated by '\r\n'
ignore 1 rows;
GRANT ALL PRIVILEGES ON nancy.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

select * from supplychain_nancy;

select sum(sales) as revenue , concat(Customer_Fname,' ',Customer_Lname) as Customer_fullname ,count(Product_Name) as bought_product
from supplychain_nancy 
group by customer_fullname
order by revenue desc 
limit 10;

select count(distinct(Product_Name)) as total_product
from supplychain_nancy;
 select Customer_City , sum(sales) as revenue from supplychain_nancy group by Customer_City order by revenue desc limit 10 ;

select distinct(Category_name) from category;
select count(distinct(Product_Name)) from supplychain_nancy;
 
 

 

select sum(Product_Price) as revenue_after_dis , concat(Customer_Fname,' ',Customer_Lname) as Customer_fullname ,count(Product_Name) as bought_product
from supplychain_nancy 
group by customer_fullname
order by revenue_after_dis desc 
limit 10;



create table category(Category_Id int , Category_Name varchar(255));

select order_year, sum(sales) as revenue
from supplychain_nancy
group by order_year
order by revenue;

select Product_Name, sum(sales) as revenue 
from supplychain_nancy
group by Product_Name
order by revenue desc
limit  10;
select distinct(Shipping_mode) from supplychain_nancy;
 
select distinct(Department_Name) from supplychain_nancy; 

select c.Category_Name  ,s.Department_Name , sum(s.Sales_per_customer) from category as c, supplychain_nancy as s
where c.Category_Id=s.category_Id and Department_Name = 'Fitness'
 group by Category_Name,Department_Name  ;

select distinct(Category_Name) ,s.Department_Name from category as c, supplychain_nancy as s
where c.Category_Id=s.category_Id and Department_Name = 'Fan Shop';

select Product_Name ,min(Product_price) as minprice , count(Order_Id)
from supplychain_nancy where Product_Price < 100
group by Product_Name 
order by minprice ;

select count(Order_Id) as total_orders,Order_region, sum(sales) as Revenue
from supplychain_nancy
group by Order_region
order by Revenue desc
limit 10;

select count(Order_Id) as total_orders,Order_Country, sum(sales) as Revenue
from supplychain_nancy
group by Order_Country
order by Revenue desc 
limit 10;







