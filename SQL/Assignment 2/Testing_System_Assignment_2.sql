create database Testing_System_Assignment_2;
use Testing_System_Assignment_2;

create table Department(
DepartmentID int primary key auto_increment,
DepartmentName varchar(50) not null
);

create table `Position`(
   PositionID int primary key auto_increment,
   PositionName enum('Dev','Test','Scrum Master','PM')
);

create table `Account`(
AccountID int primary key auto_increment,
Email varchar(50) unique key,
Username varchar(10) not null,
FullName varchar(50) not null,
DepartmentID int,
foreign key (DepartmentID) references Department(DepartmentID),
PositionID int,
foreign key (PositionID) references `Position`(PositionID),
CreateDate datetime not null default now()
);

create table `Group`(
GroupID int primary key auto_increment,
GroupName varchar(20) not null,
CreatorID int,
foreign key (CreatorID) references `Account`(AccountID),
CreateDate datetime not null default now()
);

create table GroupAccount(
GroupID int,
foreign key (GroupID) references `Group`(GroupID),
AccountID int,
foreign key (AccountID) references `Account`(AccountID),
JoinDate datetime not null default now()
);

create table TypeQuestion(
TypeID int primary key auto_increment,
TypeName enum('Essay','Multiple-Choice')
);

create table CategoryQuestion(
CategoryID int primary key auto_increment,
CategoryName varchar(50) not null
);

create table Question(
QuestionID int primary key auto_increment,
Content varchar(100) not null,
CategoryID int,
foreign key (CategoryID) references CategoryQuestion(CategoryID),
TypeID int,
foreign key (TypeID) references TypeQuestion(TypeID),
CreatorID int not null,
CreateDate datetime not null default now()
);

create table Answer(
AnswerID int primary key auto_increment,
Content varchar(256) not null,
QuestionID int,
foreign key (QuestionID) references Question(QuestionID),
isCorrect enum('TRUE','FALSE')
);

create table Exam(
ExamID int primary key auto_increment,
`Code` int not null,
Title varchar(50) not null,
CategoryID int,
foreign key (CategoryID) references CategoryQuestion(CategoryID),
Duration time,
CreatorID int not null,
CreateDate datetime not null default now()
);

alter table Exam add foreign key (CreatorID) references `Account`(AccountID)

create table ExamQuestion(
ExamID int,
foreign key (ExamID) references Exam(ExamID),
QuestionID int,
foreign key (QuestionID) references Question(QuestionID)
);
