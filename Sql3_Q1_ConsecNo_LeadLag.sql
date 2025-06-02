with lead_lag_values as
(
    select 
        num
        , lead(num) over(order by id) as next
        , lag(num) over(order by id) as prev
    from 
        Logs
)

select 
    distinct num as ConsecutiveNums
from 
    lead_lag_values
where num = next and num = prev