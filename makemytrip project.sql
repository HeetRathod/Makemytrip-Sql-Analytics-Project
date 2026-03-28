Create database MakeMyTrip;
use MakeMyTrip;

--   Tables

Create table customers (
customer_id int primary key,
name varchar(50),
city varchar(30),
email varchar(50),
join_date date
);

insert into customers values
(101,'Aarav Sharma','Delhi','aarav@email.com','2023-01-10'),
(102,'Neha Patel','Mumbai','neha@email.com','2023-02-15'),
(103,'Rohit Mehta','Ahmedabad','rohit@email.com','2023-03-05'),
(104,'Priya Nair','Kochi','priya@email.com','2023-03-20'),
(105,'Karan Singh','Jaipur','karan@email.com','2023-04-01'),
(106,'Isha Gupta','Pune','isha@email.com','2023-04-18'),
(107,'Rahul Verma','Chandigarh','rahul@email.com','2023-05-02'),
(108,'Ananya Roy','Kolkata','ananya@email.com','2023-05-15'),
(109,'Vikram Reddy','Hyderabad','vikram@email.com','2023-06-01'),
(110,'Sneha Kulkarni','Nagpur','sneha@email.com','2023-06-10');

Create table hotels (
hotel_id int primary key,
hotel_name varchar(50),
city varchar(30),
rating decimal(2,1),
price_per_night int
);

insert into hotels values
(201,'Taj Palace','Delhi',4.8,12000),
(202,'Oberoi Mumbai','Mumbai',4.9,15000),
(203,'Lemon Tree','Ahmedabad',4.2,6000),
(204,'Le Meridien','Kochi',4.5,9000),
(205,'Radisson','Jaipur',4.3,7000),
(206,'Hyatt Pune','Pune',4.6,11000),
(207,'JW Marriott','Chandigarh',4.7,13000),
(208,'ITC Sonar','Kolkata',4.4,8000),
(209,'Novotel','Hyderabad',4.5,9500),
(210,'Tuli Imperial','Nagpur',4.1,5000);

Create table bookings (
booking_id int primary key,
customer_id int,
hotel_id int,
check_in date,
check_out date,
total_amount int,
booking_date date,
foreign key (customer_id) references customers(customer_id),
foreign key (hotel_id) references hotels(hotel_id)
);

insert into bookings values
(301,101,201,'2023-07-01','2023-07-03',24000,'2023-06-20'),
(302,102,202,'2023-07-05','2023-07-07',30000,'2023-06-22'),
(303,103,203,'2023-07-10','2023-07-12',12000,'2023-06-25'),
(304,104,204,'2023-07-15','2023-07-17',18000,'2023-06-28'),
(305,105,205,'2023-07-20','2023-07-22',14000,'2023-07-01'),
(306,106,206,'2023-07-25','2023-07-27',22000,'2023-07-05'),
(307,107,207,'2023-08-01','2023-08-03',26000,'2023-07-10'),
(308,108,208,'2023-08-05','2023-08-07',16000,'2023-07-12'),
(309,109,209,'2023-08-10','2023-08-12',19000,'2023-07-15'),
(310,110,210,'2023-08-15','2023-08-17',10000,'2023-07-18');


Create table payments (
payment_id int primary key,
booking_id int,
payment_mode varchar(20),
amount int,
payment_date date,
foreign key (booking_id) references bookings(booking_id)
);

insert into payments values
(401,301,'UPI',24000,'2023-06-20'),
(402,302,'Credit Card',30000,'2023-06-22'),
(403,303,'Debit Card',12000,'2023-06-25'),
(404,304,'Net Banking',18000,'2023-06-28'),
(405,305,'UPI',14000,'2023-07-01'),
(406,306,'Credit Card',22000,'2023-07-05'),
(407,307,'Debit Card',26000,'2023-07-10'),
(408,308,'UPI',16000,'2023-07-12'),
(409,309,'Net Banking',19000,'2023-07-15'),
(410,310,'UPI',10000,'2023-07-18');

Create table reviews (
review_id int primary key,
booking_id int,
rating int,
review_text varchar(100),
foreign key (booking_id) references bookings(booking_id)
);

insert into reviews values
(501,301,5,'Excellent stay'),
(502,302,4,'Very good'),
(503,303,3,'Average experience'),
(504,304,5,'Loved the service'),
(505,305,4,'Good hotel'),
(506,306,5,'Amazing'),
(507,307,4,'Nice place'),
(508,308,3,'Okay'),
(509,309,5,'Superb'),
(510,310,4,'Good budget stay');

Create table flights (
flight_id int primary key,
airline varchar(50),
source_city varchar(30),
destination_city varchar(30),
departure_time datetime,
arrival_time datetime,
ticket_price int
);

insert into flights values
(601,'IndiGo','Delhi','Mumbai','2023-07-01 06:30:00','2023-07-01 08:30:00',6500),
(602,'Air India','Mumbai','Delhi','2023-07-02 09:00:00','2023-07-02 11:10:00',7200),
(603,'Vistara','Delhi','Bangalore','2023-07-03 07:00:00','2023-07-03 09:40:00',8200),
(604,'IndiGo','Bangalore','Chennai','2023-07-04 10:00:00','2023-07-04 11:10:00',4200),
(605,'Air India','Mumbai','Kolkata','2023-07-05 12:30:00','2023-07-05 15:00:00',9000);

Create table flight_bookings (
fb_id int primary key,
customer_id int,
flight_id int,
booking_date date,
ticket_amount int,
foreign key (customer_id) references customers(customer_id),
foreign key (flight_id) references flights(flight_id)
);

insert into flight_bookings values
(701,101,601,'2023-06-20',6500),
(702,102,602,'2023-06-22',7200),
(703,103,603,'2023-06-25',8200),
(704,104,604,'2023-06-28',4200),
(705,105,605,'2023-07-01',9000);

Create table cancellations (
cancel_id int primary key,
booking_type ENUM('HOTEL','FLIGHT'),
booking_id int,
cancel_date date,
reason varchar(100)
);

insert into cancellations values
(801,'HOTEL',305,'2023-07-02','Personal reasons'),
(802,'FLIGHT',703,'2023-06-27','Schedule change');

Create table refunds (
refund_id int primary key,
cancel_id int,
refund_amount int,
refund_status varchar(20),
refund_date date,
foreign key (cancel_id) references cancellations(cancel_id)
);

insert into refunds values
(901,801,12000,'PROCESSED','2023-07-05'),
(902,802,6000,'PENDING','2023-07-06');

select * from customers;
select * from hotels;
select * from bookings;
select * from payments;
select * from reviews;
select * from flights;
select * from flights_booking;
select * from cancellations;
select * from refunds;																																							

--  QUERIES

-- 1)Total Revenue per Hotel
select h.hotel_name, sum(b.total_amount) as total_revenue
from bookings b
join hotels h on b.hotel_id = h.hotel_id
group by h.hotel_name
order by total_revenue desc;


-- 2)Top 3 Customers by Spending
with customer_spend as (
select c.customer_id, c.name, sum(b.total_amount) as total_spent
from bookings b
join customers c on b.customer_id = c.customer_id
group by c.customer_id, c.name
)
select *, rank() over (order by total_spent desc) as spend_rank
from customer_spend
limit 3;

-- 3)Running Revenue Over Time
select booking_date,
sum(total_amount) over (order by booking_date) as running_revenue
from bookings;

-- 4)View for Business Reporting
create view v_booking_summary as
select b.booking_id, c.name, h.hotel_name, b.total_amount, b.booking_date
from bookings b
join customers c on b.customer_id = c.customer_id
join hotels h on b.hotel_id = h.hotel_id;

select * from v_booking_summary;

-- 5)Index for Performance
create index idx_booking_date on bookings(booking_date);
create index idx_customer_id on bookings(customer_id);

-- 6)Trigger: Auto-Log New Booking
create table booking_audit (
log_id int auto_increment primary key,
booking_id int,
action varchar(20),
action_date timestamp default current_timestamp
);

delimiter $$
create trigger trg_after_booking_insert
after insert on bookings
for each row
begin
insert into booking_audit(booking_id, action)
values (new.booking_id, 'BOOKING_CREATED');
end$$
delimiter ;

-- 7)Test Trigger
insert into bookings values (311,101,201,'2023-09-01','2023-09-03',25000,'2023-08-20');
select * from booking_audit;

-- 8)Average Rating per Hotel
select h.hotel_name, avg(r.rating) as avg_rating
from reviews r
join bookings b on r.booking_id = b.booking_id
join hotels h on b.hotel_id = h.hotel_id
group by h.hotel_name
order by avg_rating desc;

-- 9)Get Total Revenue by Date Range
delimiter $$
create procedure sp_revenue_by_date(in start_date date, in end_date date)
begin
select sum(total_amount) as total_revenue
from bookings
where booking_date between start_date and end_date;
end$$
delimiter ;
call sp_revenue_by_date('2023-06-20','2023-07-20');


-- 10)Get Customer Booking History
delimiter $$
create procedure sp_customer_history(in cid int)
begin
select b.booking_id, h.hotel_name, b.check_in, b.check_out, b.total_amount
from bookings b
join hotels h on b.hotel_id = h.hotel_id
where b.customer_id = cid;
end$$
delimiter ;
call sp_customer_history(101);

-- 11)Flight Revenue Report
delimiter $$
create procedure sp_flight_revenue()
begin
select f.airline, count(fb.fb_id) as total_bookings,
sum(fb.ticket_amount) as revenue
from flight_bookings fb
join flights f on fb.flight_id = f.flight_id
group by f.airline;
end$$
delimiter ;

-- 12)Customer Churn Indicator (No booking in last 60 days)
with last_booking as (
select customer_id, max(booking_date) as last_date
from bookings
group by customer_id
)
select c.customer_id, c.name,
case when datediff(curdate(), lb.last_date) > 60 then 'CHURN_RISK'
else 'ACTIVE' end as status
from customers c
left join last_booking lb on c.customer_id = lb.customer_id;

