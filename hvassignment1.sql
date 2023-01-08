			-- 08-01-2023 Sunday Assignment SQL
            
            
            
-- Consider the following tables for performing the tasks:-

-- Create a database - “order details” and create three different tables - “consumer”, “orders” and “sales manager” and insert some data in those tables(at least 5 entries). 


-- The consumer table can have columns like consumer_id, consumer_name, sales manager id, and other details of the consumer. While creating the orders table, columns like order_no, purchase amount, order date, consumer id, and sales manager id should be inserted. In the sales manager table, we can have some entries like sales manager id, name, and city.










-- Create a database - “order details”..

create database orderdetails;

-- create table consumer

create table consumer(
	consumer_id int not null primary key,
    consumer_name varchar(50) not null,
	salesmanager_id int not null
);

insert into consumer(consumer_id,consumer_name,salesmanager_id)values(101,"Reddy",201),(102,"Akhil",202),(103,"Anik",203),(104,"Manikanta",204),(105,"Teja",205);

create table orders(
	order_no int not null primary key,
    purchase_amount float not null,
    order_date date not null,
    consumer_id int not null,
    salesmanager_id int not null
);

insert into orders(order_no,purchase_amount,order_date,consumer_id,salesmanager_id)values(1001,100.05,"2001-10-22",101,201),(1002,250.0,"2020-10-18",102,202),(1003,400.09,"2022-09-23",103,203),(1004,500.0,"2021-03-01",104,204),(1005,600.04,"2022-09-19",105,205);

create table salesmanager(
	salesmanager_id int not null primary key,
    salesmanager_name varchar(50) not null,
    salesmanager_city varchar(50) not null
);

insert into salesmanager(salesmanager_id,salesmanager_name,salesmanager_city)values(201,"Sandeep","Kakinada"),(202,"Varma","Rajahmundry"),(203,"Nivesh","Hyderabad"),(204,"Kaushik","Bangalore"),(205,"Vijju","Tamilnadu");


-- Display the purchase amount from 100 to 500 from the orders table.


select purchase_amount from orders where purchase_amount between 100.0 and 500.0;


-- Change the consumer id in the orders table where order_no is equal to “1005”. 


update orders set consumer_id = 106 where order_no = 1005;



-- Return the consumer name, city, order number, order date, order amount, and sales manager name to find those consumers with a grade less than 500 and should return in ascending order of consumer id.



select consumer.consumer_name, salesmanager.salesmanager_city, orders.order_no, orders.order_date, orders.purchase_amount, salesmanager.salesmanager_name
from consumer
inner join orders on consumer.consumer_id = orders.consumer_id
inner join salesmanager on orders.salesmanager_id = salesmanager.salesmanager_id
where orders.purchase_amount < 600
order by consumer.consumer_id asc;



-- Return consumer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing consumers have placed an order or not


select consumer.consumer_name, salesmanager.salesmanager_city, orders.order_no, orders.order_date, orders.purchase_amount
from consumer 
inner join orders on consumer.consumer_id = orders.consumer_id
inner join salesmanager on orders.salesmanager_id = salesmanager.salesmanager_id
order by orders.order_date asc;



-- Fetch the consumer name, city, order number, order date, order amount, and sales manager name to find out whether any existing consumer(s) have not placed any orders or if they have placed orders through their sales manager or by themselves.             



select consumer.consumer_name, salesmanager.salesmanager_city, orders.order_no, orders.order_date, orders.purchase_amount, salesmanager.salesmanager_name
from consumer 
left join orders ON consumer.consumer_id = orders.consumer_id
left join salesmanager on orders.salesmanager_id = salesmanager.salesmanager_id;
