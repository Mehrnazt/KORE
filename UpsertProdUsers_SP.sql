
-- =============================================
-- Author:		<Author: Mehrnaz Tajfar>
-- Create date: <Create Date : 2024-04-05>
-- Description:	<Upsert Prod.Users with Stg.Users>
/*
The MERGE statement is used to perform both UPDATE and INSERT operations based on the matching condition.
When a match is found (existing userid in both prod.Users and stg.Users), it updates the corresponding row in prod.Users.
When a match is not found in prod.Users (i.e., stg.Users.userid is not found), it inserts a new row into prod.Users.
*/
-- =============================================
CREATE PROCEDURE UpsertUsers
AS
BEGIN
	
    MERGE INTO prod.Users AS target
    USING stg.Users AS source
    ON target.userid = source.userid
    WHEN MATCHED THEN
        UPDATE SET 
            target.LastLoginDate = source.LastLoginDate,
            target.PurchaseTotal = source.PurchaseTotal,
            target.RecordLastUpdated = GETDATE()
    WHEN NOT MATCHED BY TARGET THEN
        INSERT ([UserID]
		   ,[FullName]
           ,[Age]
           ,[Email]
           ,[RegistrationDate]
           ,[LastLoginDate]
           ,[PurchaseTotal]
           ,[RecordLastUpdated])
     VALUES
           (source.UserID
           ,source.FullName
           ,source.Age
           ,source.Email
           ,source.RegistrationDate
           ,source.LastLoginDate
           ,source.PurchaseTotal
           ,GETDATE());

	-- OUTPUT deleted.* , $action , inserted.* into TempMergeResults
     
END;


