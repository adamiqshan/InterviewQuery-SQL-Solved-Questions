/*
Consider the events table which contains information about the phases of writing a new social media post.

The action column can have values post_enter, post_submit, or post_canceled for when a user starts to write (post_enter), ends up canceling their post (post_cancel), or posts it (post_submit).

Write a query to get the post success rate for each day in the month of January 2020.

You can assume that a single user may only make one post per day.

*/

create table events
(
    user_id int,
    created_at datetime,
    'action' char
);

insert into events values
    (123,'2020-01-01','post_enter'),
    (123,'2020-01-01', 'post_submit'),
    (456,'2020-01-02','post_enter'),
    (456,'2020-01-02', 'post_cancel');

-- find successful submissions
-- total number of posts
-- divide step (1)/(2)


select x.created_at dt, x.post_submissions/(x.post_entries+0.0) as post_success_rate
from (
    -- creating subquery to make it look better. No subsquery needed if you divide         (2) directly by (3) below
    select created_at,
    sum(case when e.action = 'post_enter' then 1 else 0 end) as post_entries,
    sum(case when e.action = 'post_submit' then 1 else 0 end) as post_submissions
    from events e
    where e.created_at like '2020-01%'
    group by created_at
) x


/*

-- query to find the overall posts sucess rate

with submissions as (
    select count(1) success
    from events e1
    join events e2 on e1.user_id = e2.user_id and e1.action <> e2.action 
    where e1.action = 'post_submit'
    order by e2.user_id
),
drafts as (
    select count(1) total_entries
    from events e1
    join events e2 on e1.user_id = e2.user_id and e1.action <> e2.action 
    where e1.action in ('post_submit', 'post_cancel')
    order by e2.user_id
)

select * from submissions

select success/(total_entries+0.0) from submissions, drafts

*/