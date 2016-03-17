DECLARE @FolderPath AS VARCHAR(50) = 'D:\21v\Backups\'

DECLARE @StagingdbPath AS varchar(50) = @FolderPath + 'Stagingdb.' + CONVERT(varchar(30),GETDATE(),102)
BACKUP DATABASE Stagingdb TO DISK= @StagingdbPath

DECLARE @Incident21vProductiondb AS varchar(50) = @FolderPath +'Incident21vProductiondb' +  CONVERT(varchar(30),GETDATE(),102)
BACKUP DATABASE Incident21vProductiondb TO DISK=@Incident21vProductiondb

DECLARE @Velocity AS varchar(50) = @FolderPath +'Velocity' +  CONVERT(varchar(30),GETDATE(),102)
BACKUP DATABASE Velocity TO DISK=@Velocity

DECLARE @icmchina AS varchar(50) = @FolderPath +'icmchina' +  CONVERT(varchar(30),GETDATE(),102)
BACKUP DATABASE icmchina TO DISK=@icmchina

DECLARE @ccic AS varchar(50) = @FolderPath +'ccic' +  CONVERT(varchar(30),GETDATE(),102)
BACKUP DATABASE ccic TO DISK=@ccic

DECLARE @ai AS varchar(50) = @FolderPath +'ai_Mooncake' +  CONVERT(varchar(30),GETDATE(),102)
BACKUP DATABASE ai_Mooncake TO DISK=@ai

