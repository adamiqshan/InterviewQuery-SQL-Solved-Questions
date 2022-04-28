/*

We’re given a table of product purchases. Each row in the table represents an individual user product purchase.

Write a query to get the number of customers that were upsold by purchasing additional products.

Note: If the customer purchased two things on the same day that does not count as an upsell as they were purchased within a similar timeframe.

*/


create table transactions(
    user_id 	INTEGER,
    created_at 	DATETIME,
    product_id 	INTEGER,
    quantity 	INTEGER
);

insert into transactions values
    (1, '2020-01-01', 125, 10),
    (1, '2020-01-01', 129, 10),
    (1, '2020-01-02', 119, 5),
    (2, '2020-01-02', 119, 7),
    (2, '2020-01-02', 119, 7),
    (3, '2020-01-02', 158, 12),
    (3, '2020-01-03', 158, 12),
    (4, '2020-01-03', 157, 14),
     (4, '2020-01-03', 221, 44),
    (4, '2020-01-04', 221, 2),
    (5, '2020-01-04', 145, 4),
    (5, '2020-01-05', 175, 10);


select count(1) as num_of_upsold_customers
from (select user_id, count(distinct created_at) purchase_count
        from transactions
        group by user_id) x
where x.purchase_count>1