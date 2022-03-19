create database Assignment2;
use Assignment2;

create table Trainee(
TraineeID int primary key auto_increment,
Full_Name varchar(50) not null,
Birth_Date date not null,
Gender enum('male', 'female', 'unknown') not null,
ET_IQ int not null,
ET_Gmath int not null,
ET_English int not null,
Training_Class int not null,
Evaluation_Notes varchar(100),
check (ET_IQ >=0 and ET_IQ <=20),
check (ET_Gmath >=0 and ET_Gmath <=20),
check (ET_English >=0 and ET_English <=50)
);

create table Nhan_vien(
ID int not null primary key auto_increment,
`Name` varchar(50),
`Code` varchar(5),
ModifiedDate datetime default now()
);

create table Nhan_vien2(
ID int not null primary key auto_increment,
`Name` varchar(50),
BirthDate date not null,
Gender enum('Male', 'Female', 'NULL')not null,
IsDeletedFlag enum('dang hoat dong', 'da xoa') not null
);