select u.id, u.name, c.name as city 
from users u, cities c 
where u."cityId" = c.id and c.name = 'Rio de Janeiro';

select u1.id, u1.name as writer, u2.name as recipient, t.message 
from users u1, users u2, testimonials t 
where u1.id = t."writerId" and u2.id = t."recipientId";

select u.id, u.name, c.name as course, s.name as school, e."endDate" 
from users u, courses c, schools s, educations e 
where c.id = e."courseId" and s.id = e."schoolId" and e."userId" = 30 and status = 'finished' and u.id = 30;

select u.id, u.name, r.name as role, c.name as company, e."startDate" 
from users u, roles r, companies c, experiences e 
where e."roleId" = r.id and e."companyId" = c.id and e."userId" = 50 and u.id = 50 and "endDate" is null;
