--Given a table of students and their SAT test scores, write a query to return the two students with the closest test scores with the score difference.

--If there are multiple students with the same minimum score difference, select the student name combination that is higher in the alphabet. 

create table scores(
    id int,
    student char,
    score int
);

insert into scores values
(1, 'ram', 15),
(2, 'raavan', 25),
(3, 'sita', 30),
(4, 'krish', 10),
(5, 'radhika', 30);


select s1.student as one_student, s2.student as other_student, abs(s1.score - s2.score) as score_diff
from scores s1
cross join scores s2
where s1.id <> s2.id and s1.id<s2.id
order by score_diff 
limit 1;