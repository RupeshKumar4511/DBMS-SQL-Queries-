-- To create a database 
create database Ramanujan_college;

-- To define table and  put the data into database and then to perform operation on the data 
use Ramanujan_college;

create table Student(
    Roll_No char(6) not null,
   Student_Name varchar(20) not null,
   Course varchar(10),
   DOB DATE 
);


create table Society(
    Socl_ID char(6) ,
Soc_Name varchar(20),
Mentor_Name varchar(15),
Total_Seats int unsigned
);

create table Enrollment(
Roll_No char(6) not null,
Socl_ID char(6) not null,
Date_of_Enrollment date
);





alter table Student
add (Primary key(Roll_No));

alter table Society
add (Primary key(Socl_ID));


alter table Enrollment
add(foreign key(Socl_ID)

references Society(Socl_ID)); 


alter table Enrollment
add(foreign key(Roll_No)

references Student(Roll_No)); 


alter table Enrollment
add constraint enID  Primary key(Roll_No,Socl_ID); 



insert into Student
values
(2765,"Vikash kumar","B.Voc.SD",
'2000-12-03'),
(2719,"Brajesh kumar","B.Voc.SD",
'2001-11-04'),
(2760,"Ritu Raj Verma","B.Voc.SD",
'2002-10-05'),
(2753,"Aman kumar","B.Voc.SD",
'2003-09-02');




insert into Society
values
(3045,"Educen","Ram Kumar",
60),
(3046,"Yuva Chapter","Rahul Kumar",
50),
(3047,"Tatva","Rohan Gupta",
70),
(3048,"Neev","Vishal kumar",
100);







insert into Enrollment
values
(2765,3045,'2023-12-03'),
(2719,3046,'2023-11-04'),
(2760,3047,'2023-10-05'),
(2753,3048,'2023-09-02');



alter table Student
modify Course varchar(30);


insert into Student
values (2790,"Sanjeev kumar","Computer Science",
'2000-10-21'),
(2798,"Rohit kumar","Chemistry",
'2001-12-24');


insert into Student
values ('X279',"Mehul kumar","Computer Science",
'2000-08-21');





insert into Student
values (2783,"Rakesh kumar","Computer Science",
'2000-02-21'),
(2784,"Rajeev kumar","Chemistry",
'2001-03-24');


insert into Enrollment
values
(2790,3045,'2023-10-03'),
(2798,3045,'2023-01-04'),
('X279',3045,'2023-02-05'),
(2783,3045,'2023-08-02'),
(2784,3045,'2023-09-02');


update Society
set Soc_Name = "NSS"
where Soc_Name = "Tatva";


insert into Enrollment
values
(2702,3047,'2023-10-05');


insert into Enrollment
values
(2719,'s1','2023-09-09'),
(2760,'s2','2023-08-09'),
(2753,'s3','2023-11-09');



use Ramanujan_college;
update Society
set Soc_Name = "Debating"
where Soc_Name = "NSS";


use Ramanujan_college;
update Society
set Soc_Name = "Dance"
where Soc_Name = "Educen";


use  Ramanujan_college;
update Society
set Soc_Name = "Sashakt"
where Soc_Name = "Neev";




-- que1)Retrieve name of student enrolled in any society.

select distinct Student_Name from Student a, Enrollment c
where a.Roll_No=c.Roll_No ;




-- que2)Retrieve all society name.

select Soc_Name from Society;



-- que3) Retrieve student's name starting with 'A'.

select Student_Name from Student
where Student_Name like 'A%';









-- que4)Retrieve student's details studying in computer science or chemistry.

select * from Student
where Course = "Computer Science" or 
Course = "Chemistry";







-- que5) Retrieve student's names whose roll no either starts with x or z and ends with 9.

select Student_Name from Student
where Roll_No like 'X%' or 'Z%' and '%9' ;



-- que6)find society details with more than N totalseats where N is to be input by the user. 

set @n :=50;
select * from Society
where Total_Seats>@n;



-- que7)Update society table for mentor name of a specific society


update Society
set Mentor_Name = "Ramesh kumar"
where Soc_Name = "Yuva Chapter";






-- que8)find society name in which more than five students have enrolled. 

select Soc_Name from Society,enrollment
where  Enrollment.Socl_ID=Society.Socl_ID
 group by Soc_Name
 having
count(enrollment.Socl_ID)>5;







-- que9) find the name of youngest student enrolled in society NSS.

select Student_Name from Student a,Society b, Enrollment c
where a.Roll_No=c.Roll_No and
c.Socl_ID = b.Socl_ID
and b.Soc_Name="NSS"
group by
a.Student_Name,
a.DOB
order by DOB desc 
limit 1;



-- que10)find name of most popular society (on the basis of enrolled student ).

select Soc_Name from Society,enrollment
where  Enrollment.Socl_ID=Society.Socl_ID
group by
Society.Soc_Name
order by
count(Enrollment.Socl_ID) desc
limit 1;



-- que11)find the name of two least popular socities.

select Soc_Name from Society,enrollment
where  Enrollment.Socl_ID=Society.Socl_ID
 group by 
 Society.Soc_Name
order by
count(Enrollment.Socl_ID) 
limit 2;



-- que12 find student name who are not enrolled in any society. (using subquery)


select  Student_Name from Student       
where Student.Roll_No not in (select Roll_No from Enrollment);



insert into Enrollment(Roll_No,Socl_ID,Date_of_Enrollment)
values
(2719,3048,'2023-12-04');


-- que13)find student name enrolled in at least two societies.

select Student_Name from Student , enrollment
where Student.Roll_No = Enrollment.Roll_No
group by 
Student.Student_Name
having
count(enrollment.Roll_No)>=2;


 -- que14)find society names in which maximum students are enrolled.

select Soc_Name from Society,enrollment
where  Enrollment.Socl_ID=Society.Socl_ID
group by 
Society.Soc_Name
order by
count(Enrollment.Socl_ID) desc
limit 1;


-- que15)  find name of all students who have enrolled in any society and 
society names in which at least one student has enrolled.(include -- que1)

select Soc_Name from Society,enrollment
   where  Enrollment.Socl_ID=Society.Socl_ID
    group by Soc_Name,
    Enrollment.Socl_ID
    having
    count(Enrollment.Socl_ID)>=1;






-- que16) find the names of students who are enrolled in any one of thee societies 'Debating', 'Dance', 'Sashakt'.

select distinct Student_Name from Student as s,Society as c ,Enrollment as e
where s.Roll_No = e.Roll_No 
and e.Socl_ID = c.Socl_ID
group by s.Student_Name,
c.Soc_Name
having 
c.Soc_Name = "Debating" or c.Soc_Name ="Dance" or  c.Soc_Name="Sashakt" ;
 
 
 -- que17) find the society names such that mentor name has a name with 'Gupta'in it.

select Soc_Name from Society
where Mentor_Name like '%Gupta';


-- que18) find the society name in which the number of enrolled student is only 10% of its capacity.

select Soc_Name from Society as s , Enrollment as e 
where s.Socl_ID = e.Socl_ID
group by Soc_Name,
s.Total_Seats
having count(e.Socl_ID) = 0.1 * s.Total_Seats;


-- -- que19) Display the vaccant seats of each society .

select Soc_Name,(Total_Seats - count(Enrollment.Socl_ID)) from Society,enrollment
where  Enrollment.Socl_ID=Society.Socl_ID 
group by Soc_Name,
Total_Seats;


-- -- que20) Increment Total seats of each society.

update Society
set Total_Seats = Total_Seats + 0.1 * Total_Seats;


-- -- que21) Add enrollment fees paid('Yes'/'No') field in the enrollment table.

alter table Enrollment
add enrollment_fees_paid char 
check(enrollment_fees_paid ='Yes' or enrollment_fees_paid = 'No');


-- que22) update date of Enrollment of society id 's1' to '2018-01-15' ,'s2' to current date to current date and 's3' to '2018-01-02'.


update Enrollment
set Date_of_Enrollment ='2018-01-15' 
where Date_of_Enrollment = (select Date_of_Enrollment 
where Socl_ID = 's1');


update Enrollment
set Date_of_Enrollment ='2018-01-02' 
where Date_of_Enrollment = (select Date_of_Enrollment 
where Socl_ID = 's3');



update Enrollment
set Date_of_Enrollment = current_date() 
where Date_of_Enrollment = (select Date_of_Enrollment 
where Socl_ID = 's2');

-- or 


UPDATE Enrollment
SET Enrollment_Date = CASE 
    WHEN Soc_ID = 's1' THEN '2018-01-15'
    WHEN Soc_ID = 's2' THEN CURRENT_DATE()
    WHEN Soc_ID = 's3' THEN '2018-01-02'
END
WHERE Soc_ID IN ('s1', 's2', 's3');



-- -- que23) create a view to track of society names with total number of student enrolled in it .

create view Student_Data as 
select Soc_Name,count(Enrollment.Socl_ID) from Society,enrollment
where  Enrollment.Socl_ID=Society.Socl_ID 
group by Soc_Name;
 



-- que24) find students' names enrolled in all societies.

select  Student_Name from Student,Enrollment
where Student.Roll_No = Enrollment.Roll_No
group by 
Student_Name
having
count(Enrollment.Roll_No)= (select count(Socl_ID) from Society);



-- que25) count number of societies with more than 5 students are enrolled in it.

select distinct count(Soc_Name) over() as societies from Society,enrollment
where  Enrollment.Socl_ID=Society.Socl_ID 
group by Soc_Name
having
count(Society.Socl_ID)>5;
 
 
 

-- que26) add column Mobile_No in student table with default value '9999999999'.

 alter table Student 
 add Mobile_No bigint(10) default 9999999999;


-- que27) find total number of students whose age > 20 years.

select Student_Name from Student 
where current_date() - DOB > '200000';

-- or 

select Student_Name from Student 
where YEAR(current_date()) - YEAR(DOB) > 20;



-- que28) find the names of students who are born in 2000 and enrolled in atleast one society.

select Student_Name from Student, enrollment
where Student.Roll_No = Enrollment.Roll_No
 and DOB like '2000%'
group by 
Student.Student_Name
having
count(enrollment.Roll_No)>=1;



-- que29) count all the societies whose name start with 's' and with endswith 't' and at least 5 students are enrolled in the societiy. 

select  count(distinct Soc_Name) from Society,enrollment
   where  Enrollment.Socl_ID=Society.Socl_ID
   and Soc_Name like 'S%t'
    group by Soc_Name,
    Enrollment.Socl_ID
    having
    count(Enrollment.Socl_ID)>=5;




-- que30) find the Society name, Mentor name ,Total seats , Total enrolled students in society and vaccant seats in the society.


select distinct Soc_Name, Mentor_Name, Total_Seats,count(Enrollment.Socl_ID),
 (Society.Total_Seats - count(Enrollment.Socl_ID))as vaccant_seats from Society,Enrollment
 where Society.Socl_ID= Enrollment.Socl_ID 
 group by
 Soc_Name,Mentor_Name,Total_Seats;















