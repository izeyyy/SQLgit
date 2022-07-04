CREATE TABLE [dbo].[umbracoLog] (
  [id] [int] IDENTITY,
  [userId] [int] NULL,
  [NodeId] [int] NOT NULL,
  [entityType] [nvarchar](50) NULL,
  [Datestamp] [datetime] NOT NULL CONSTRAINT [DF_umbracoLog_Datestamp] DEFAULT (getdate()),
  [logHeader] [nvarchar](50) NOT NULL,
  [logComment] [nvarchar](4000) NULL,
  [parameters] [nvarchar](500) NULL,
  CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoLog]
  ON [dbo].[umbracoLog] ([NodeId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoLog]
  ADD CONSTRAINT [FK_umbracoLog_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [dbo].[umbracoUser] ([id])
GO