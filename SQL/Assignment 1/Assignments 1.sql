create database Testing_System_Assignment_1;
use Testing_System_Assignment_1;
create table Department(
DepartmentID int primary key auto_increment,
DepartmentName varchar(50)
);

create table `Position`(
   PositionID int primary key auto_increment,
   PositionName varchar(50)
);

create table Account(
AccountID int primary key auto_increment,
Email varchar(50),
Username varchar(10),
FullName varchar(50),
DepartmentID varchar(50),
PositionID varchar (20),
CreateDate date
);

create table `Group`(
GroupID int primary key auto_increment,
GroupName varchar(20),
CreatorID int,
CreateDate date
);

create table GroupAccount(
GroupID int,
AccountID int,
JoinDate date
);

create table TypeQuestion(
TypeID int primary key auto_increment,
TypeName varchar(20)
);

create table CategoryQuestion(
CategoryID int primary key auto_increment,
CategoryName varchar(30)
);

create table Question(
QuestionID int primary key auto_increment,
Content varchar(100),
CategoryID int,
TypeID int,
CreatorID int,
CreateDate date
);

create table Answer(
AnswerID int primary key auto_increment,
Content varchar(200),
QuestionID int,
isCorrect varchar(10)
);

create table Exam(
ExamID int primary key auto_increment,
`Code` varchar(20),
Title varchar(20),
CategoryID int,
Duration int,
CreatorID int,
CreateDate date
);

create table ExamQuestion(
ExamID int,
QuestionID int
);