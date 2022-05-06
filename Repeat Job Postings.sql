-- Given a table of job postings, write a query to retrieve the number of users        that have posted each job only once and the number of users that have posted at     least one job multiple times.

create table job_postings
(
    id 	INTEGER,
    user_id	INTEGER,
    job_id 	INTEGER,
    date_posted 	DATETIME
);

insert into job_postings values
    (1, 1, 1, '2022-01-14'), 
    (2, 2, 2, '2021-08-20'), 
    (3, 1, 1, '2021-08-11'), 
    (4, 4, 4, '2021-08-07'), 
    (5, 4, 5, '2022-02-01'), 
    (6, 6, 6, '2022-04-22'), 
    (7, 7, 7, '2021-11-20'), 
    (8, 1, 1, '2021-10-14'), 
    (9, 5, 5, '2021-07-28'), 
    (10, 10, 10, '2021-10-25'), 
    (11, 11, 11, '2021-10-28'), 
    (12, 12, 12, '2021-07-17'), 
    (13, 1, 1, '2021-06-14'), 
    (14, 14, 14, '2021-09-20'), 
    (21, 5, 5, '2021-05-07'), 
    (16, 16, 16, '2022-01-06'), 
    (17, 4, 4, '2021-12-30'), 
    (18, 6, 6, '2021-07-12'), 
    (19, 19, 4, '2022-04-10'), 
    (20, 5, 6, '2021-11-02');

    

select sum(case when job_posts = unique_job_postings then 1 else 0 end) as                 single_post,
    sum(case when job_posts <> unique_job_postings then 1 else 0 end) as                   multiple_posts
from (select user_id, count(job_id) job_posts, count(distinct job_id) unique_job_postings
        from job_postings
        group by user_id) x
            
