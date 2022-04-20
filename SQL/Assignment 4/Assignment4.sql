-- câu 1
select `account`.fullname, department.department_id, department_name from `account` join department   -- lựa chọn bảng a.cột cần thông tin với bảng b.cột cần thông tin 
on `account`.department_id = department.department_id;

-- câu 2
select * from `account` where create_date > '2010-12-20';

-- câu 3
select `account`.account_id, email, fullname, position.position_id, position_name from `account` join position
on `account`.position_id = position.position_id
where position.position_name = 'Dev';

-- câu 4
select department.* from -- b2
(select count(*), department_id from `account` group by department_id having count(*) > 3) tam -- b1 tìm phòng ban 3 nv trở lên
join department on department.department_id= tam.department_id  -- b2 join vs bảng departmen để hiện phòng ban
;

-- câu 5
select question.* from (
select max(countid), question_id from   -- b2 
(select count(question_id) as countid, question_id from exam_question group by question_id) team -- b1 tìm câu hỏi có nhiều trong đề thi
) team1    -- b2
join question on question.question_id=team1.question_id;

-- câu 6
select count(category_question.category_id), category_question.category_id, category_name from category_question
join question on category_question.category_id = question.category_id
group by category_id;

-- câu 7
select count(exam_question.question_id), exam_question.question_id  from exam_question
join question on exam_question.question_id = question.question_id
group by question_id;


-- câu 8
select * from
(select max(count_id), question_id from
(select count(*) as count_id, question_id from answer group by question_id) team) team1
join question on team1.question_id= question.question_id

-- câu 9
select count(ga.account_id) as SL, g.group_name from group_account as ga
join `group` as g on ga.group_id= g.group_id
group by ga.account_id
order by SL desc;

-- câu 10
select count(*) as sl, p.position_id, p.position_name from `account` a
join position p on a.position_id = p.position_id
group by a.position_id
;

-- câu 11
select department_name, position_name, count(position.position_id) as SL from `account`
join department on account.department_id= department.department_id
join position on `account`.position_id = position.position_id
group by department_name, position_name;

-- câu 12
select q.question_id, q.content, a.fullname, t.type_name, an.content from question as q
join category_question as cq on q.category_id = cq.category_id
join type_question as t on q.type_id = t.type_id
join `account` as a on a.account_id = q.creator_id
join answer as an on q.question_id = an.question_id
order by q.question_id;

-- câu 13 
select tq.type_id, tq.type_name, count(tq.type_id) as SL from question q join type_question tq on q.type_id = tq.type_id
group by tq.type_id;

-- câu 14
select * from `group` g right join group_account ga on g.group_id = ga.account_id
where ga.account_id is null;

-- câu 15
SELECT * FROM group_account ga right join `group` g on ga.group_id = g.group_id
where g.creator_id is null;

-- câu 16
select * from question q left join answer a on q.question_id = a.question_id
where a.content is null;

