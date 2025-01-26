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

-- Insert rows into table 'Podcasts' in schema '[dbo]'
INSERT INTO [dbo].[Podcasts]
( -- Columns to insert data into
 [Title]
)
VALUES
('Podcast 1'),
('Podcast 2'),
('Podcast 3'),
('Podcast 4'),
('Podcast 5')
 
GO