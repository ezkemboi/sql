select *    
into #tempData
from (values (1), (2), (3), (4)) d (num)


declare @n int; --value to pull from cursor
declare num_cursor cursor FOR --define cursor 
select *   
from #tempData  --populate cursor with data
open num_cursor --create cursor
fetch next from num_cursor --grab first row in result set
into @n
while @@FETCH_STATUS = 0 --run loop
begin --start body of loop
    print @n
    FETCH NEXT FROM num_cursor   -- grab next row in cursor
    INTO @n 
end --end body of loop
close num_cursor;
deallocate num_cursor;
drop table #tempData;
