CREATE TABLE [dbo].[umbracoAudit] (
  [id] [int] IDENTITY,
  [performingUserId] [int] NOT NULL,
  [performingDetails] [nvarchar](1024) NULL,
  [performingIp] [nvarchar](64) NULL,
  [eventDateUtc] [datetime] NOT NULL CONSTRAINT [DF_umbracoAudit_eventDateUtc] DEFAULT (getdate()),
  [affectedUserId] [int] NOT NULL,
  [affectedDetails] [nvarchar](1024) NULL,
  [eventType] [nvarchar](256) NOT NULL,
  [eventDetails] [nvarchar](1024) NULL,
  CONSTRAINT [PK_umbracoAudit] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO