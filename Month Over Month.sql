/*

Given a table of transactions and products, write a function to get the month_over_month change in revenue for the year 2019. Make sure to round month_over_month to 2 decimal places.

*/

create table transactions(
    user_id 	INTEGER,
    created_at 	DATETIME,
    product_id 	INTEGER,
    quantity 	INTEGER
);

create table products(
    id 	INTEGER,
    name 	VARCHAR,
    price 	INTEGER
);

insert into transactions values
    (1, '2019-01-01', 125, 10),
    (1, '2019-01-01', 129, 10),
    (1, '2019-01-02', 119, 5),
    (2, '2019-02-02', 119, 70),
    (2, '2019-02-02', 119, 7),
    (2, '2019-03-03', 119, 25),
    (3, '2019-03-02', 158, 1),
    (3, '2019-04-03', 158, 52),
    (3, '2019-05-13', 158, 120),
    (4, '2019-04-03', 157, 14),
    (4, '2019-06-03', 221, 44),
    (4, '2019-08-04', 221, 30),
    (5, '2019-09-04', 145, 4),
    (5, '2019-10-05', 175,30),
    (1, '2019-11-01', 15, 7),
    (1, '2019-11-01', 12, 1),
    (1, '2019-11-02', 19, 5),
    (2, '2019-03-02', 1119, 7),
    (2, '2019-05-02', 112, 7),
    (5, '2020-01-05', 17, 57),
    (6, '2020-04-05', 19, 10),
    (1, '2020-06-05', 134, 58),
    (7, '2020-03-05', 129, 5),
    (7, '2020-08-05', 100, 8);

insert into products values
    (125,"Orbital Keys",10),
    (129,"XPress Bottle",15),
    (119,"Dried Goods",5),
    (158,"Snacks",5),
    (157,"Care Products",15),
    (221,"Swish Wallet",12),
    (145,"Onovo Supply",28),
    (175,"Sharpy Knife",3),
    (15,"Meat",6),
    (12,"Dairy",2),
    (19,"Vegetables ",4),
    (1119,"Freezer",40),
    (112,"Bread",3);

with sales as (
   select strftime('%m', t.created_at) month, sum(t.quantity * price) revenue
    from transactions t
    join products p on t.product_id = p.id
    where strftime('%Y', t.created_at) = '2019'
    group by strftime('%m', t.created_at) 
),
revenueChange as (
select  month, revenue, lag(revenue) over(order by month) as lag 
from sales
)

select month, round((revenue+0.0-lag)/lag,2) month_over_month from revenueChange
