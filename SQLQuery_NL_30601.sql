USE [OnlineOrdering_Stock];
GO
 
BEGIN TRANSACTION;
 
EXEC [admin].[DeleteStockEventAffectedProduct]
    @stockEventId = 855,
    @productCode  = N'PBGV',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';
EXEC [admin].[DeleteStockEventAffectedProduct]
    @stockEventId = 855,
    @productCode  = N'PBCK',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';
EXEC [admin].[DeleteStockEventAffectedProduct]
    @stockEventId = 855,
    @productCode  = N'SBCK',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';
EXEC [admin].[DeleteStockEventAffectedProduct]
    @stockEventId = 855,
    @productCode  = N'XBCK',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';
EXEC [admin].[DeleteStockEventAffectedProduct]
    @stockEventId = 855,
    @productCode  = N'PBQA',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';
EXEC [admin].[DeleteStockEventAffectedProduct]
    @stockEventId = 855,
    @productCode  = N'EDMA',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';
EXEC [admin].[DeleteStockEventAffectedProduct]
    @stockEventId = 855,
    @productCode  = N'ECBW7',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';	
EXEC [admin].[DeleteStockEventAffectedProduct]
    @stockEventId = 855,
    @productCode  = N'TSLI',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';
EXEC [admin].[DeleteStockEventAffectedProduct]
    @stockEventId = 855,
    @productCode  = N'ECBW12',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';
--ROLLBACK TRANSACTION;
COMMIT TRANSACTION;
