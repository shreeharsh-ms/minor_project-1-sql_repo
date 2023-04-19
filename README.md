# sql_repo
Simple hands on start with MySQL and SQL to understand basic concepts of DBMS


Why SQL is important to learn in order to solve analytics of data..??

SQL (Structured Query Language) is an important tool for working with data, particularly in the context of data analytics. Here are a few reasons why learning SQL is important for data analytics:

Data Extraction and Manipulation: SQL allows you to extract and manipulate data from relational databases. By using SQL, you can retrieve data from specific tables and columns, filter data based on certain conditions, and join data from multiple tables. This makes it easier to extract the data you need for analysis.

Data Aggregation: SQL allows you to aggregate data from different sources, allowing you to work with large datasets. You can use SQL to group data by different criteria, calculate summary statistics (such as counts, averages, and sums), and create custom calculations.

Data Cleaning and Transformation: Before you can analyze data, you often need to clean and transform it into a usable format. SQL provides powerful tools for cleaning and transforming data, such as removing duplicates, converting data types, and combining columns.

Performance: SQL is designed to work with large datasets efficiently. When used correctly, SQL can retrieve and manipulate data much faster than other tools, making it a valuable tool for large-scale data analytics.

Integration with other tools: SQL is widely used and is often integrated with other tools used in data analytics, such as Python, R, and Excel. This means that learning SQL can help you work more effectively with these other tools.

Overall, learning SQL is essential for anyone working with data analytics. It provides a powerful tool for extracting, manipulating, and analyzing data, and is widely used in the industry.

========================================================================================================================================

AS A COMPANY WE HAVE SOME QUESTIONS
1] We have to check how much money is spended by each user ?
2] How many days that specific user logged into account ?
3] When does user logged in first time ?
4] what is most sold product ?
5] How many times each user bought product 2


=================================================
[SQL PROJECT ON DATA ANALYTICS OF SELLS (SWIGGY)]
=================================================

CODE (with explaination) ===========>


create database (name_for_db);                                                  {creating a DB and naming it}

use (name_of_db);                                                               {for get that DB is use}
                                                                                 
 
select * from sales;                                                            {retriving compleat data but its empty now}

CREATE TABLE goldusers_signup(                                                  {creating another table for golduser}
userid INT(2),                                                                  (  two parameters - userid && gold_signup_date
gold_signup_date date                                                              what type of data with coloum name its gonna be               
)                                                                                  EX. int, varchar and (value length)
;                                                                               )


INSERT INTO goldusers_signup(userid, gold_signup_date)                          {inserting data into table(gold_signup_date)}
VALUES                
(1,'2017-12-12'),                                                               (!!! values should be according to specified earlier)
(3,'2017-12-12')                                                                (EX.. date should be like yyyy-mm-dd)
;

CREATE TABLE sales(userid integer,created_date date,product_id integer);        {creating another table for sales}

INSERT INTO sales(userid,created_date,product_id)                               {inserting data into table(sales)}
VALUES (1,'04-19-2017',2),
(3,'2019-8-18',1),
(2,'2020-2-20',3),
(1,'2019-3-23',2),
(1,'2018-9-19',3),
(3,'2016-2-20',2),
(1,'2016-9-12',1),
(1,'2016-2-20',3),
(2,'2017-4-24',1),
(1,'2017-1-11',2),
(1,'2016-1-11',1),
(3,'2016-1-10',1),
(3,'2017-7-07',2),
(3,'2016-5-15',2),
(2,'2017-8-08',2),
(2,'2018-1-10',3);

CREATE TABLE product(product_id integer,product_name text,price integer);       {creating another table for product details}
INSERT INTO product(product_id,product_name,price)                              {inserting data into table(product)}
VALUES
(1,'p1',980),                                                                   (parameters id, product name(p1...), price)
(2,'p2',870),
(3,'p3',330);

select * from  product;                                                         (viewing inserted data)
select * from  sales;
select * from  goldusers_signup;


=================================================
[SOLVING QUESTIONS WITH SQL QUARRIES]
=================================================


ANS 1] ====>

select s.userid, s.product_id, p.product_name, sum(p.price) total from sales s INNER JOIN product p on s.product_id = p.product_id group by s.userid;

EXPLAINATON
[s = sales & p = product] as we asign
joining two tables with inner join on basis on same values [s.product_id = p.product_id]
we want sum of price of each user [sum(p.price)  which is group for group by s.userid]

ANS 2] ====>

EXPLAINATON
select s.userid, count(created_date) days from sales s INNER JOIN product p on s.product_id = p.product_id group by s.userid;
joining two tables with [INNER JOIN] 
counting days by [count(created_date)] 
again group by[s.userid]

ANS 3] ====>

select * from
(select userid, created_date, rank() over(partition by userid order by created_date) rnk from sales) a where rnk = 1;

EXPLAINATON
select userid, created_date, rank() over(partition by userid order by created_date;
This is table in which 3 divsions are created for differnt user EX- user 1 1st div etc and every user is geting orderd by their date
like 1,2,3 etc its for every user

then we are putting it in another query to get only ranked one of each user [rank one = earliest date of that user] 


ANS 4] ====>

select product_id, count(product_id) sold from sales group by product_id order by sold desc LIMIT 1;

EXPLAINATON
We are taking product_id from sales
Counting how many times that specific [product_id] repeated (bought) naming this counted number [SOLD]
then ordering them on the basis of [sold] and limiting table to one so it will display only first entry
which is [prodcut id = 2]

only show heighest number first [desc]


ANS 5] ====>

select userid, count(product_id) times_he_bought from sales where product_id = 2 group by userid;

EXPLAINATON
taking product_id, USERID from sales
Counting how many times that specific [product_id(2)] repeated (bought) by EVERY USER
and grouping them on the basis of users

SOLVED
THANK YOU :)


FEEL FREE TO REACH ME FOR ANY KIND OF HELP
&&
DONT FORGET TO CONNECT ME ON LINKDIN 

www.linkedin.com/in/shreeharsh-shivpuje-95a397207

