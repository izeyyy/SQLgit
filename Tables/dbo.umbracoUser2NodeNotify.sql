CREATE TABLE [dbo].[umbracoUser2NodeNotify] (
  [userId] [int] NOT NULL,
  [nodeId] [int] NOT NULL,
  [action] [nchar](1) NOT NULL,
  CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED ([userId], [nodeId], [action])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoUser2NodeNotify]
  ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoNode] ([id])
GO

ALTER TABLE [dbo].[umbracoUser2NodeNotify]
  ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [dbo].[umbracoUser] ([id])
GO