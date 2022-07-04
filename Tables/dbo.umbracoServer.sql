CREATE TABLE [dbo].[umbracoServer] (
  [id] [int] IDENTITY,
  [address] [nvarchar](500) NOT NULL,
  [computerName] [nvarchar](255) NOT NULL,
  [registeredDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoServer_registeredDate] DEFAULT (getdate()),
  [lastNotifiedDate] [datetime] NOT NULL,
  [isActive] [bit] NOT NULL,
  [isSchedulingPublisher] [bit] NOT NULL,
  CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_computerName]
  ON [dbo].[umbracoServer] ([computerName])
  ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoServer_isActive]
  ON [dbo].[umbracoServer] ([isActive])
  ON [PRIMARY]
GO