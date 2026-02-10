use pubs;
/*Challenge 1 - Who Have Published What At Where?what titles each author has published at which publishers*/

select a.au_id as author_id, a.au_lname as last_name, a.au_fname as first_name, t.title, p.pub_name as publisher from publishers p
join titles t on t.pub_id = p.pub_id
join titleauthor ti on t.title_id = ti.title_id
join authors a on a.au_id = ti.au_id;

select count(au_id) from titleauthor;

/*Challenge 2 - Who Have Published How Many At Where?*/

select a.au_id as author_id, a.au_lname as last_name, a.au_fname as first_name, p.pub_name as publisher, count(t.title) as title_count  
from publishers p
join titles t on t.pub_id = p.pub_id
join titleauthor ti on t.title_id = ti.title_id
join authors a on a.au_id = ti.au_id
group by a.au_id, a.au_lname, a.au_fname, p.pub_name;

select count(au_id) from titleauthor;
select sum(title_count) from (select a.au_id as author_id, a.au_lname as last_name, a.au_fname as first_name, p.pub_name as publisher, count(t.title) as title_count  
from publishers p
join titles t on t.pub_id = p.pub_id
join titleauthor ti on t.title_id = ti.title_id
join authors a on a.au_id = ti.au_id
group by a.au_id, a.au_lname, a.au_fname, p.pub_name) as sub;

/*Challenge 3 - Best Selling Authors*/

select a.au_id as author_id, a.au_lname as last_name, a.au_fname as first_name, count(t.title) as total_num_sold
from sales s 
join titles t on s.title_id = t.title_id
join titleauthor ti on t.title_id = ti.title_id
join authors a on ti.au_id = a.au_id
group by a.au_id, a.au_lname, a.au_fname 
order by total_num_sold desc limit 3;

/*Challenge 4 - Best Selling Authors Ranking*/

select 
    a.au_id as author_id,
    a.au_lname as last_name,
    a.au_fname as first_name,
    COUNT(t.title) as total_num_sold
from authors a
left join titleauthor ti on a.au_id = ti.au_id
left join titles t on ti.title_id = t.title_id
left join sales s on t.title_id = s.title_id
group by a.au_id, a.au_lname, a.au_fname
order by total_num_sold desc;





