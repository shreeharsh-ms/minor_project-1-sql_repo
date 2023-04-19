create database pump;                                                  
use pump;                                                                                                                          

CREATE TABLE goldusers_signup(                                                  
userid INT(2),                                                                 
gold_signup_date date                                                                 
)                                                                                  
;                                                                              


INSERT INTO goldusers_signup(userid, gold_signup_date)                          
VALUES                
(1,'2017-12-12'),                                                               
(3,'2017-12-12')                                                                
;

CREATE TABLE sales(userid integer,created_date date,product_id integer);        

INSERT INTO sales(userid,created_date,product_id)                              
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

CREATE TABLE product(product_id integer,product_name text,price integer);       
INSERT INTO product(product_id,product_name,price)                              
VALUES
(1,'p1',980),                                                                
(2,'p2',870),
(3,'p3',330);

select * from  product;                                                         
select * from  sales;
select * from  goldusers_signup;

-- ANS 1]
select s.userid, s.product_id, p.product_name, sum(p.price) total from sales s INNER JOIN product p on s.product_id = p.product_id group by s.userid;
-- ANS 2]
select s.userid, count(created_date) days from sales s INNER JOIN product p on s.product_id = p.product_id group by s.userid;
-- ANS 3]
select * from
(select userid, created_date, rank() over(partition by userid order by created_date) rnk from sales) a where rnk = 1;
-- ANS 4]
select product_id, count(product_id) sold from sales group by product_id order by sold desc LIMIT 1;
-- ANS 5]
select userid, count(product_id) times_he_bought from sales where product_id = 2 group by userid;
