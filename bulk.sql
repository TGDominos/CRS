/*
==============================================================
2020-05-14 Cameron Smith

Script to generate OutofStockEvent data from onlineordering_stock and onlineordering_store

Note: This script pulls data from OnlineOrdering dbs to generate an OutOfStock Event in the AzureSQL RunoutToolEU AzureSQL.
Since we're crossing boundaries it couldn't be queried directly.


To Get Complete Results:
Open SQLServerManager Properties and set maximum characters received to something longer than 8k or you may not see the entire output script.
Tools > Options
Query Results > SQL Server > Results to Grid 
	Maximum Characters Retrieved - Non XML data -> 65535
Query Results > SQL Server > Results to Text
	Maximum number of characters displayed in each column -> 500


To Use:
Enter values for variables
Run query
copy results to AzureSQL connection
Connect to OnlineOrdering_Stock db in AzureSQL connection
past results of this script
run
==============================================================


*/


declare @CountryCode nvarchar(2)
declare @ComponentCode nvarchar(15)
declare @startdate datetime
declare @enddate datetime
declare @username nvarchar(15)
declare @OutputString nvarchar(max)


set @CountryCode = 'NL'
set @ComponentCode = 'Topping.MOZZA'
set @Startdate = '2020-10-13'
-- set @EndDate = '2020-05-20'
set @username ='tomasz.greiner'

set @OutputString = '
use OnlineOrdering_Stock

declare @countryCode nvarchar(2), 
@startDate datetime, 
@endDate datetime, 
@user nvarchar(50)


declare @ComponentList admin.ComponentCodeList
declare @ProductCodeList admin.ProductCodeList
declare @StoreList admin.StoreList


set @countryCode ='''+ convert(nvarchar(2), @countryCode) + '''
set @startDate ='''+coalesce(convert(nvarchar(32), @startdate,23), 'null')+'''
set @endDate=' +  iif(isDate(@enddate)=0, 'null', ''''+convert(nvarchar(32), @enddate,23)+ '''') + '
set @user = ''' + convert(nvarchar(15),@username) + '''


insert into @ComponentList (ComponentCode)
values ('''+@ComponentCode+''')



insert into @ProductCodeList (ProductCode)
values 
'


declare @outputstring2 nvarchar(max)

 select 	
	@outputstring2 = coalesce(@outputstring2+', ','') + '('''+data.ProductCode+''')' + char(13) + char(10)
	--*
from
	(
	select distinct ProductCode from
	OnlineOrdering_Content.product.productRecipeComponent prc
	where
	prc.CountryCode = @CountryCode
	and prc.Enabled = 1
	and prc.StartDate < getdate()
	and ComponentCode = @ComponentCode
	) as data
	--inner join product.product p on p.productcode = prc.productcode and p.countrycode= prc.countrycode


declare @outputstring3 nvarchar(max)


select 
	@outputstring3 = coalesce(@outputstring3+', ','') + '('''+ convert(nvarchar,StoreNo)+''')' + char(13) + char(10)
from
	OnlineOrdering_Store.dbo.Store s
where 
	s.countryCode =@CountryCode
	--and s.OnlineOrderingEnabled=1
	--and s.isClosed = 0

select @OutputString + @outputstring2 + '

insert into @StoreList (StoreNo)
values
' + @outputstring3 + '

exec [admin].[AddStockEventEU]
			@countryCode, 
			@startDate, 
			@endDate, 
			@user,
			@ComponentList,
			@ProductCodeList,
			@StoreList
'

