CREATE DATABASE podcasts
GO

Use [podcasts]
GO

-- Create a new table called '[PodCasts]' in schema '[dbo]'
-- Drop the table if it already exists
IF OBJECT_ID('[dbo].[PodCasts]', 'U') IS NOT NULL
DROP TABLE [dbo].[PodCasts]
GO
-- Create the table in the specified schema
CREATE TABLE [dbo].[Podcasts]
(
    [Id] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWID(), -- Primary Key column
    [TItle] NVARCHAR(MAX) NOT NULL,
);
GO