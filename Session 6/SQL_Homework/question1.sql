select name as results
from (
  select u.name, count(*) as cnt
  from users u
  join movierating mr on u.user_id = mr.user_id
  group by u.name
  order by cnt desc, u.name asc
  limit 1
) t
union all
select title as results
from (
  select m.title, avg(mr.rating) as avg_r
  from movies m
  join movierating mr on m.movie_id = mr.movie_id
  where mr.created_at between '2020-02-01' and '2020-02-29'
  group by m.title
  order by avg_r desc, m.title asc
  limit 1
) s;

