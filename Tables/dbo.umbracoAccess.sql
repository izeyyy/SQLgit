CREATE TABLE [dbo].[umbracoAccess] (
  [id] [uniqueidentifier] NOT NULL,
  [nodeId] [int] NOT NULL,
  [loginNodeId] [int] NOT NULL,
  [noAccessNodeId] [int] NOT NULL,
  [createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoAccess_createDate] DEFAULT (getdate()),
  [updateDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoAccess_updateDate] DEFAULT (getdate()),
  CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_umbracoAccess_nodeId]
  ON [dbo].[umbracoAccess] ([nodeId])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoAccess]
  ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO

ALTER TABLE [dbo].[umbracoAccess]
  ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY ([loginNodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO

ALTER TABLE [dbo].[umbracoAccess]
  ADD CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY ([noAccessNodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO