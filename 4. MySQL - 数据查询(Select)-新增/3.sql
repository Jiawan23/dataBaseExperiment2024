-- 3) 查询购买了所有畅销理财产品的客户
--   请用一条SQL语句实现该查询：
select distinct pro_c_id
from property t1
where not exists(
	select *
  from
		(select distinct pro_pif_id
        from property
        where pro_type=1
        group by pro_pif_id
        having count(*)>2)t3
	where pro_pif_id not in
		(select distinct pro_pif_id
        from property t2
        where t1.pro_c_id = t2.pro_c_id and t2.pro_type=1)
	)
order by pro_c_id;

/*  end  of  your code  */