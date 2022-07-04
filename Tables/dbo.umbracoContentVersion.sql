CREATE TABLE [dbo].[umbracoContentVersion] (
  [id] [int] IDENTITY,
  [nodeId] [int] NOT NULL,
  [versionDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoContentVersion_versionDate] DEFAULT (getdate()),
  [userId] [int] NULL,
  [current] [bit] NOT NULL,
  [text] [nvarchar](255) NULL,
  [preventCleanup] [bit] NOT NULL CONSTRAINT [DF_umbracoContentVersion_preventCleanup] DEFAULT ('0'),
  CONSTRAINT [PK_umbracoContentVersion] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoContentVersion_Current]
  ON [dbo].[umbracoContentVersion] ([current])
  INCLUDE ([nodeId])
  ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoContentVersion_NodeId]
  ON [dbo].[umbracoContentVersion] ([nodeId], [current])
  INCLUDE ([id], [versionDate], [text], [userId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoContentVersion]
  ADD CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoContent] ([nodeId])
GO

ALTER TABLE [dbo].[umbracoContentVersion]
  ADD CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [dbo].[umbracoUser] ([id])
GO