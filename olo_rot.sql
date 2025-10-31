USE[OnlineOrdering_Admin]
GO
DECLARE @countryCodeNCHAR(2)='NL'
DECLARE @productCode NVARCHAR(8)='ECBW7','TSLI','ECBW12','Option.BRW','Topping.BQK'
DECLARE @componentCode NVARCHAR(15)=''

SELECT * FROM [dbo].[Product] WHERE [CountryCode] = @countryCode AND [ProductCode] = @productCode
SELECT * FROM [dbo].[Component] WHERE [CountryCode] = @countryCode AND [ComponentCode] = @componentCode