with bus_pass_combination as
(
select 
    p.passenger_id
    , p.arrival_time as ptime
    , min(b.arrival_time) as btime
from 
    Passengers p inner join Buses b
on p.arrival_time <= b.arrival_time
group by 1
)
select 
    b.bus_id
    , coalesce(count(bp.btime),0) as passengers_cnt
from Buses b left join bus_pass_combination bp on b.arrival_time = bp.btime
group by 1
order by 1