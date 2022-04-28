/*

Given the transactions table below, write a query that finds the third purchase of every user.

Note: Sort the results by the user_id in ascending order. If a user purchases two products at the same time, the lower id field is used to determine which is the first purchase.

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
    (1, '2020-01-10', 189, 15),
    (2, '2020-01-02', 119, 7),
    (2, '2020-01-02', 119, 7),
    (3, '2020-01-02', 158, 12),
    (3, '2020-01-03', 158, 12),
    (4, '2020-01-03', 157, 14),
     (4, '2020-01-03', 221, 44),
    (4, '2020-01-04', 221, 2),
    (5, '2020-01-04', 145, 4),
    (5, '2020-01-05', 175, 10);


select x.user_id, x.created_at, x.product_id, x.quantity   from 
    (select *, row_number() over(partition by user_id order by created_at) ranks
    from transactions) x
where x.ranks = 3
order by x.user_id