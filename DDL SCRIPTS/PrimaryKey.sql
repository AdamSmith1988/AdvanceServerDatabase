CREATE TABLE [dbo].[Salon](
	[SalonID] [int] NOT NULL, 
	[SalonName] [nvarchar](50) NOT NULL, 
	[S_Address] [nvarchar](50) NOT NULL, 
	[PostCode] [nvarchar](20) NOT NULL, 
	[PhoneNumber] [nvarchar](20) NOT NULL, 
	[EmailAddress] [nvarchar](100) NOT NULL, 
	[Website] [nvarchar](100) NOT NULL, 
	[NewColumn] [int] NULL, 
	PRIMARY KEY (SalonID)
)