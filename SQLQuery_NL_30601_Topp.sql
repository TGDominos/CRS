USE [OnlineOrdering_Stock];
GO
 
BEGIN TRANSACTION;
 
EXEC [admin].[DeleteStockEventAffectedComponent]
    @stockEventId = 855,
    @componentCode  = N'Option.BRW',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';

EXEC [admin].[DeleteStockEventAffectedComponent]    
    @stockEventId = 855,
    @componentCode  = N'Topping.BQK',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';
EXEC [admin].[DeleteStockEventAffectedComponent]    
    @stockEventId = 855,
    @componentCode  = N'Topping.GV',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';
EXEC [admin].[DeleteStockEventAffectedComponent]    
    @stockEventId = 855,
    @componentCode  = N'Topping.CBS',
    @sizeCode     = NULL,
    @user         = N'tomasz.greiner';	

-- ROLLBACK TRANSACTION;
COMMIT TRANSACTION