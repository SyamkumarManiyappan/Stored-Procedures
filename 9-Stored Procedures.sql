-- Consider the Worker table with following fields: Worker_Id INT FirstName CHAR(25), LastName CHAR(25), Salary INT(15), JoiningDate DATETIME, Department CHAR(25))

create table product.worker(Worker_Id INT ,First_Name CHAR(25), LastName CHAR(25), Salary INT(15), Joining_Date DATETIME, Department CHAR(25));
-- 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and adds a new record to the table and then invokes the procedure call. 

delimiter //
create procedure addworker(
IN P_Worker_Id int,
IN p_First_Name varchar(25),
IN p_Lastname varchar(25),
IN P_Salary int(15),
IN P_Joining_Date datetime,
IN P_Department Varchar(25))
begin
insert into worker ( Worker_Id,First_Name,Lastname,Salary,Joining_Date,Department)
values (P_Worker_Id,p_First_Name,p_Lastname,P_Salary,P_Joining_Date,P_Department);
end //
Delimiter ;

call addworker(1,'Manu','Mohan','25000','2023-10-08','IT');
-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the

delimiter //

create procedure getworker_Salary 
( IN P_worker_ID int,
OUT p_Salary int )
begin
select salary into p_Salary from worker where worker_ID =P_Worker_ID;
end //
Delimiter ;  

call getworker_Salary ( 1, @p_Salary);
select @p_Salary as Salary;
--  3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call.

delimiter $$
create procedure UPdate_worker_Department(
in	P_Worker_ID int,
in P_Department Varchar(20) )
Begin
update worker
set department = P_Department where worker_ID = P_worker_ID;
end $$
delimiter ;

call UPdate_worker_Department (1,'IT');

-- 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 


delimiter $$
create procedure get_count_worker_Department(

in P_Department varchar (20),
out P_WorkerCount int )
begin
select count(*) into P_WorkerCount from worker where department = P_Department ;
end $$
delimiter ;

call get_count_worker_Department ( 'IT',@workercount);
select @pworkercount as worker_Count;

-- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.

Delimiter //
create procedure AVGSalarybyDepartment(
in P_Department varchar(20),
out P_AVGSalary Float
)
begin
Select AVG(salary) into P_AVGSalary from worker
where Department = P_Department;
end //
Delimiter ; 

call AVGSalarybyDepartment ( 'IT', @p_avgsalary);
Select @p_avgsalary as average_Salary;


