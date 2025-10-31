USE [OnlineOrdering_Stock]
GO
DECLARE @countryCode  NVARCHAR(2)
DECLARE @startDate    DATETIME
DECLARE @endDate      DATETIME
DECLARE @user         NVARCHAR(50)

SET @countrycode  = 'NL'
SET @startdate    = '2025-10-24'
SET @enddate      = NULL
SET @user         = 'Tomasz.Greiner'

DECLARE @ComponentList    [admin].[ComponentCodeList]
DECLARE @ProductCodeList  [admin].[ProductCodeList]
DECLARE @StoreList        [admin].[StoreList]

BEGIN TRANSACTION
  INSERT INTO @ProductCodelist VALUES ('PBGV'),('PBCK '),('SBCK'),('XBCK'),('PBQA'),('EDMA'),('ECBW7'),('TSLI'),('ECBW12')
  --INSERT INTO @ComponentList (componentCode) VALUES ('Topping.CBS'),('Topping.GV'),('Option.BRW'),('Topping.BQK')
  INSERT INTO @StoreList (StoreNo) VALUES (32601)
  EXEC [admin].[AddStockEventEU]
    @countryCode, 
	@startDate, 
	@endDate, 
	@user,
	@ComponentList,
	@ProductCodeList,
	@StoreList

--ROLLBACK TRANSACTION
COMMIT TRANSACTION