USE [OnlineOrdering_Stock]
GO
DECLARE @countryCode NVARCHAR(2) = 'NL'

SELECT StoreNo FROM OnlineOrdering.dbo.Store (NOLOCK) WHERE MenuCountryCode = @countryCode AND OnlineOrderingEnabled = '1' ORDER BY StoreNo ASC