CREATE TABLE [dbo].[umbracoUserLogin] (
  [sessionId] [uniqueidentifier] NOT NULL,
  [userId] [int] NOT NULL,
  [loggedInUtc] [datetime] NOT NULL,
  [lastValidatedUtc] [datetime] NOT NULL,
  [loggedOutUtc] [datetime] NULL,
  [ipAddress] [nvarchar](255) NULL,
  CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY CLUSTERED ([sessionId])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoUserLogin_lastValidatedUtc]
  ON [dbo].[umbracoUserLogin] ([lastValidatedUtc])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoUserLogin]
  ADD CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [dbo].[umbracoUser] ([id])
GO