 câu 1
insert into department(department_id, department_name)
values (5, 'RuBy'),
		(6, 'Giam Doc'),
        (7, 'Pho Giam Doc'),
        (8, 'Truong Phong'),
        (9, 'To Truong'),
        (10, 'Nhan Vien')
;

insert into `Account`(account_id, email, username, fullname, department_id, position_id)
values (1017, 'nguyentienmanh@gmail.com', 'manh.nguyentien', 'Nguyễn Tiến Mạnh', 4, 100),
	   (1018, 'tranquangtoan@gmail.com', 'toan.tranquang', 'Trần Quang Toản', 4, 103),
	   (1019, 'daotrunghieu@gmail.com', 'hieu.daotrung', 'Đào Trung Hiếu', 3, 102),
       (1020, 'nguyenhuuhao@gmail.com', 'hao.nguyenhuu', 'Nguyễn Hữu Hảo', 1, 101),
       (1021, 'duongvantuyen@gmail.com', 'tuyen.duongvan', 'Dương Văn Tuyên', 2, 101)
;

insert into `group`(group_id, group_name, creator_id, create_date)
values  (211, 'CLB Bóng chuyền', 1011, '2014-12-29'),
		(212, 'One Piece', 1012, '1999-01-01'),
        (213, 'Naruto', 1013, '2015-11-13'),
        (214, 'Dragon Ball', 1014 , '2020-04-30'),
        (215, 'Akasuki', 1015, '2018-01-21')
;

insert into question(question_id, content)
values  (10004, 'sáng mai bạn ăn gì'),
		(10005, 'hôm nay bạn thế nào'),
		(10006, 'mấy giờ vào lớp'),
		(10007, 'cuộc sống bạn có ổn không')
;

insert into answer(answer_id, content, question_id, is_correct)
values  (20012, 'sáng nay tôi ăn cơm', 10004, true),
        (20013, 'tôi vui', 10006, false),
		(20014, 'tôi hài lòng về cuộc sống này', 10007, true),
		(20015, '9h sáng mai bắt đầu vào lớp', 10005, false)
;

insert into exam(`code`, duration, create_date)
values 	('H123', '00:30:00', '2022-10-14'),
		('H234', '00:45:00', '2018-03-09'),
        ('H345', '00:15:00', '2014-06-06'),
        ('H456', '02:00:00', '2020-10-10'),
        ('H567', '00:10:00', '2021-11-11')
;

câu 2 
select * from department;
câu 3
select department_id from department where department_name = 'Sale';
câu 4
select max(length(fullname)) from account -- ( công thức tìm người có nhiều kí tự nhất)
select * from `account` where length(fullname) = (select max(length(fullname)) from `account`); -- (kiểm tra trên bảng account xem số kí tự ấy thuộc về ai)

câu 5
select max(length(fullname)) from `account` where department_id = 3;

câu 6
select group_name from `group` where create_date <'2019-12-20';

câu 7
select question_id, count(question_id) from answer group by question_id  having count(question_id) >=4;

câu 8
select `code` from exam where duration >= '01:00:00' and create_date <= '2019/12/19';

câu 9
select * from `group` order by create_date desc limit 5;

câu 10
select count(department_id) from `account` where department_id =2;

câu 11
select fullname from `account` where fullname like'D%' '%o';

câu 12
delete from exam where create_date <'2019-12-20';

câu 13
delete from question where content like 'câu hỏi%';

câu 14
update `account` set fullname = 'Nguyễn Qúy Trường', email = 'truong.nguyenquy@vti.com.vn'
where account_id = 1004;

câu 15
update group_account set account_id =5 where group_id = 4;