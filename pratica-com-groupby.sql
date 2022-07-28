-- 1
select count("endDate") as experiences 
from experiences;

-- 2
select "userId" as id, count(status) as educations 
from educations 
where status = 'finished' 
group by "userId";

-- 3
select u.name as writer, count(t.message) as "testimonialCount" 
from testimonials t 
join users u on u.id = t."writerId" 
where t."writerId" = 435 
group by u.name;

-- 4
select max(j.salary) as "maximumSalary", r.name as role 
from jobs j 
join roles r on r.id = j."roleId" 
where active = true 
group by r.name 
order by maximumSalary asc;

-- bonus
select s.name as school, c.name as course, count(e."userId") as "studentsCount", e.status 
from educations e 
join schools s on s.id = e."schoolId"
join courses c on c.id = e."courseId"
where status = 'ongoing' or status = 'finished'
group by e."schoolId", e."courseId", s.name, c.name, e.status
order by "studentsCount" desc 
LIMIT 3;
