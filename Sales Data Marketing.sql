create database retail_marketing;

create table marketing(
age varchar(50),
gender varchar(50),
own_home varchar(50),
married varchar(50),
location varchar(50),
salary int,
children int,
repeat_order varchar(50),
amount_spent int
);

select * from marketing;

-- age group spending the most

select age, sum(amount_spent) as total_spend from marketing group by age;

-- gender divided by age group spending the most

select age, gender, sum(amount_spent) as total_spent from marketing group by age, gender order by total_spent;

-- total spent by people owning homes or renting

select own_home, count(own_home) as no_of_customers, sum(amount_spent) as total_spent from marketing group by own_home order by total_spent;

select * from marketing;

-- effect of marital status on total spent

select married, count(married) as no_of_customers, sum(amount_spent) as total_spent from marketing group by married;

-- dividing salary into quartiles

select max(salary) from marketing;

alter table marketing add salary_range varchar(50);

select * from marketing;

update marketing set salary_range =
case
when salary between 0 and 40000 then '0-40000'
when salary between 40000 and 80000 then '40000 - 80000'
when salary between 80000 and 120000 then '80000 - 120000'
else '>120000'
end;

-- dividing total spent based on salary range

select salary_range, count(salary_range) as no_of_customers, sum(amount_spent) as total_spent from marketing group by salary_range;

select * from marketing;

-- effect of number of children on total spent

select children as no_of_children, sum(amount_spent) as total_spent from marketing group by children order by children;

-- effect of repeat order on total spent

select repeat_order, sum(amount_spent) as total_spent from marketing group by repeat_order order by total_spent;