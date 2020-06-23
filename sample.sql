select *

into #employees

from (

        values

        (1, 'Bob', 1)

        ,

        (2, 'Jack', 2)

        ,

        (3, 'Jane', 3)

        ,

        (4, 'Sue', 2)

        ,

        (5, 'Greg', 1)

        , 

        (6, 'Alice', null)

    ) d (id, [name], deptId)

 

select *

into #dept

from (

        values

        (1, 'Sales')

        ,

        (2, 'IT')

        ,

        (3, 'Finance')

    ) d (deptId, deptName)

 

select *

into #sales

from (

        values

        (1, 1, 5, 2020)

        ,

        (2, 1, 10, 2019)

        ,

        (3, 5, 15, 2018)

        ,

        (4, 5, 25, 2017)

        ,

        (5, 1, 1, 2019)

    ) d (saleId, empId, amount, [year])

 

-- select

--   d.deptId

--   , d.deptName

--   , e.id

--   , e.name

--   , sum(s.amount)

--   , avg(st.amount) 'top_avg_sale_amount'

-- from #employees e

-- inner join #dept d

--     on e.deptId = d.deptId

-- inner join #sales s

--     on e.id = s.empId

-- cross apply

-- (

--     select top 5 amount

--     from #sales st

--     where st.empId = e.id

--     order by amount desc

-- ) st

-- group by e.id, d.deptId, d.deptName, e.name

 

select *

from #employees e

cross join #dept d

order by e.id





drop table #employees;

drop table #dept;

drop table #sales;




;with dat as (

    select *

    from (

        values (1,null, 'parent 1')

         , (2, 1, 'child 1')

         , (3, 1, 'child 2')

         , (4, null, 'parent 2')

         , (5, 2, 'grandchild 1')

         , (6, 5, 'great-grandchild 1')

    ) d (id, parentid, name)

)

, recur as (

    select *

    from dat p

    where parentid is null

    union all 

    select c.*

    from recur r

    join dat c

        on r.id = c.parentid

)

 

select *

from recur
